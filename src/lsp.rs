//! Minimal Language Server Protocol for Dew (.dew) and DewIR (.dewir).
//!
//! JSON-RPC over stdin/stdout. Supports:
//! - initialize: registers .dew and .dewir extensions
//! - textDocument/didOpen, didChange: re-parses and publishes diagnostics
//!
//! Zero external dependencies — raw JSON over stdio.

use crate::diagnostics::DiagnosticCollector;
use crate::lexer::Lexer;
use crate::parser::Parser;
use std::io::{self, BufRead, Read, Write};

pub fn run() -> Result<(), String> {
    let stdin = io::stdin();
    let mut stdout = io::stdout();

    let mut documents: std::collections::HashMap<String, String> = std::collections::HashMap::new();
    let mut buf = String::new();

    loop {
        buf.clear();
        // Read Content-Length header
        let mut content_length: usize = 0;
        loop {
            let mut line = String::new();
            if stdin.lock().read_line(&mut line).is_err() { return Ok(()); }
            if line == "\r\n" || line == "\n" { break; }
            let line = line.trim();
            if let Some(len_str) = line.strip_prefix("Content-Length: ") {
                content_length = len_str.parse().unwrap_or(0);
            }
        }

        if content_length == 0 { continue; }
        let mut body = vec![0u8; content_length];
        if stdin.lock().read_exact(&mut body).is_err() { return Ok(()); }
        let body_str = String::from_utf8_lossy(&body).to_string();

        // Parse JSON-RPC message (minimal parser — only handle what we need)
        let id = extract_field(&body_str, "\"id\"");
        let method = extract_field(&body_str, "\"method\"");

        match method.as_str() {
            "initialize" => {
                // Send capabilities
                let result = format!(
                    "{{\"capabilities\":{{\"textDocumentSync\":{{\"openClose\":true,\"change\":1}},\"diagnosticProvider\":{{\"interFileDependencies\":false,\"workspaceDiagnostics\":false}}}},\"serverInfo\":{{\"name\":\"dew-lsp\",\"version\":\"0.1.0\"}}}}"
                );
                send_response(&mut stdout, &id, &result);
            }
            "initialized" => {
                // No response needed
            }
            "textDocument/didOpen" | "textDocument/didChange" => {
                let uri = extract_field(&body_str, "\"uri\"");
                let text = extract_text_field(&body_str);
                if !text.is_empty() {
                    documents.insert(uri.clone(), text.clone());
                    publish_diagnostics(&mut stdout, &uri, &text);
                }
            }
            "textDocument/didClose" => {
                let uri = extract_field(&body_str, "\"uri\"");
                documents.remove(&uri);
                // Clear diagnostics
                send_notification(&mut stdout, "textDocument/publishDiagnostics",
                    &format!("{{\"uri\":\"{}\",\"diagnostics\":[]}}", uri));
            }
            "shutdown" => {
                send_response(&mut stdout, &id, "null");
                return Ok(());
            }
            "exit" => {
                return Ok(());
            }
            _ => {
                // Ignore unknown methods
            }
        }
    }
}

/// Extract a string field value from JSON (very hacky but works for LSP messages).
fn extract_field(json: &str, field: &str) -> String {
    if let Some(pos) = json.find(field) {
        let rest = &json[pos + field.len()..];
        // Find the first " after the field
        if let Some(open) = rest.find('"') {
            let after_open = &rest[open + 1..];
            if let Some(close) = after_open.find('"') {
                return after_open[..close].to_string();
            }
        }
    }
    String::new()
}

/// Extract the text field content from a didOpen/didChange notification.
fn extract_text_field(json: &str) -> String {
    if let Some(pos) = json.find("\"text\"") {
        let rest = &json[pos + 6..];
        if let Some(open) = rest.find('"') {
            let after_open = &rest[open + 1..];
            let mut result = String::new();
            let mut chars = after_open.chars().peekable();
            while let Some(c) = chars.next() {
                if c == '\\' {
                    match chars.next() {
                        Some('n') => result.push('\n'),
                        Some('t') => result.push('\t'),
                        Some('r') => result.push('\r'),
                        Some('"') => result.push('"'),
                        Some('\\') => result.push('\\'),
                        Some(c2) => { result.push('\\'); result.push(c2); }
                        None => break,
                    }
                } else if c == '"' {
                    break;
                } else {
                    result.push(c);
                }
            }
            return result;
        }
    }
    String::new()
}

/// Parse a .dew or .dewir file and publish diagnostics.
fn publish_diagnostics(stdout: &mut impl Write, uri: &str, text: &str) {
    let diagnostics = if uri.ends_with(".dewir") {
        parse_dewir(text)
    } else {
        parse_dew(text)
    };

    let diag_json: Vec<String> = diagnostics.iter().map(|d| {
        format!(
            "{{\"range\":{{\"start\":{{\"line\":{},\"character\":{}}},\"end\":{{\"line\":{},\"character\":{}}}}},\"severity\":{},\"source\":\"dew\",\"message\":\"{}\"}}",
            d.line, d.start_col, d.line, d.end_col, d.severity, d.message.replace('\\', "\\\\").replace('"', "\\\"")
        )
    }).collect();

    send_notification(stdout, "textDocument/publishDiagnostics",
        &format!("{{\"uri\":\"{}\",\"diagnostics\":[{}]}}", uri, diag_json.join(",")));
}

struct Diag {
    line: usize,
    start_col: usize,
    end_col: usize,
    severity: u8, // 1=error, 2=warning
    message: String,
}

/// Parse Dew source and return diagnostics.
fn parse_dew(text: &str) -> Vec<Diag> {
    let mut diag = DiagnosticCollector::new();
    let mut lexer = Lexer::new(text);
    let tokens = lexer.lex_all();
    let mut parser = Parser::new(tokens, &mut diag, text);
    parser.parse_program();
    let mut result = Vec::new();
    for d in diag.all() {
        let sev = match d.severity {
            crate::diagnostics::Severity::Error => 1,
            crate::diagnostics::Severity::Warning => 2,
        };
        let (line, start_col, end_col) = match &d.span {
            Some(s) => (s.line, s.col, s.col + 1),
            None => (0, 0, 0),
        };
        result.push(Diag {
            line,
            start_col,
            end_col,
            severity: sev,
            message: format!("[{}] {}", d.code, d.message),
        });
    }
    result
}

/// Parse DewIR text and return diagnostics (basic syntax checking).
fn parse_dewir(text: &str) -> Vec<Diag> {
    let mut diags = Vec::new();
    for (i, line) in text.lines().enumerate() {
        let trimmed = line.trim();
        if trimmed.is_empty() || trimmed.starts_with("//") {
            continue;
        }
        // Check for obviously malformed lines
        if trimmed.contains("->") && !trimmed.contains("->") {
            // This doesn't catch anything useful — just a placeholder
        }
        // Check for unmatched braces (simple heuristic)
        let open = line.matches('{').count();
        let close = line.matches('}').count();
        if close > open && !trimmed.starts_with('}') {
            diags.push(Diag {
                line: i,
                start_col: 0,
                end_col: trimmed.len(),
                severity: 2,
                message: "possible unmatched '}'".into(),
            });
        }
    }
    diags
}

/// Try to extract line/column from error message.
fn extract_position(err: &str) -> (usize, usize) {
    // Look for "at line N, col M" pattern
    for part in err.split(" at ") {
        let rest = part.trim().strip_prefix("line ").unwrap_or(part);
        if let Some(comma) = rest.find(',') {
            let line_str = &rest[..comma].trim();
            let col_str = rest[comma + 1..].trim().strip_prefix("col ").unwrap_or("");
            if let (Ok(l), Ok(c)) = (line_str.parse::<usize>(), col_str.parse::<usize>()) {
                return (l, c);
            }
        }
    }
    (1, 1)
}

fn send_response(stdout: &mut impl Write, id: &str, result: &str) {
    let body = format!("{{\"jsonrpc\":\"2.0\",\"id\":{},\"result\":{}}}", id, result);
    write_lsp_message(stdout, &body);
}

fn send_notification(stdout: &mut impl Write, method: &str, params: &str) {
    let body = format!("{{\"jsonrpc\":\"2.0\",\"method\":\"{}\",\"params\":{}}}", method, params);
    write_lsp_message(stdout, &body);
}

fn write_lsp_message(stdout: &mut impl Write, body: &str) {
    let header = format!("Content-Length: {}\r\n\r\n", body.len());
    let _ = stdout.write_all(header.as_bytes());
    let _ = stdout.write_all(body.as_bytes());
    let _ = stdout.flush();
}
