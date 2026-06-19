//! Language Server Protocol for Dew (.dew) and DewIR (.dewir).
//!
//! JSON-RPC over stdin/stdout. Supports:
//! - initialize: registers .dew and .dewir extensions + semantic tokens
//! - textDocument/didOpen, didChange: re-parses and publishes diagnostics
//! - textDocument/semanticTokens/full: returns semantic highlighting tokens
//!
//! Zero external dependencies — raw JSON over stdio.

use crate::diagnostics::DiagnosticCollector;
use crate::desugar::desugar_program;
use crate::lexer::Lexer;
use crate::nameres::NameResolver;
use crate::parser::Parser;
use crate::semantic_tokens;
use crate::typeck::TypeChecker;
use std::io::{self, BufRead, Read, Write};

pub fn run() -> Result<(), String> {
    let stdin = io::stdin();
    let mut stdout = io::stdout();

    let mut documents: std::collections::HashMap<String, String> = std::collections::HashMap::new();
    let mut buf = String::new();

    loop {
        buf.clear();
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
        let body_str = String::from_utf8_lossy(&mut body).to_string();

        let id = extract_field(&body_str, "\"id\"");
        let method = extract_field(&body_str, "\"method\"");

        match method.as_str() {
            "initialize" => {
                let (token_types, token_modifiers) = semantic_tokens::semantic_tokens_legend();
                let tt_json: Vec<String> = token_types.iter().map(|t| format!("\"{}\"", t)).collect();
                let tm_json: Vec<String> = token_modifiers.iter().map(|m| format!("\"{}\"", m)).collect();
                let result = format!(
                    "{{\"capabilities\":{{\"textDocumentSync\":{{\"openClose\":true,\"change\":1}},\"semanticTokensProvider\":{{\"legend\":{{\"tokenTypes\":[{}],\"tokenModifiers\":[{}]}},\"range\":false,\"full\":true}},\"diagnosticProvider\":{{\"interFileDependencies\":false,\"workspaceDiagnostics\":false}}}},\"serverInfo\":{{\"name\":\"dew-lsp\",\"version\":\"0.2.0\"}}}}",
                    tt_json.join(","),
                    tm_json.join(",")
                );
                send_response(&mut stdout, &id, &result);
            }
            "initialized" => {}
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
                send_notification(&mut stdout, "textDocument/publishDiagnostics",
                    &format!("{{\"uri\":\"{}\",\"diagnostics\":[]}}", uri));
            }
            "textDocument/semanticTokens/full" => {
                let uri = extract_field(&body_str, "\"uri\"");
                let text = documents.get(&uri);
                let data = if let Some(src) = text {
                    if uri.ends_with(".dewir") {
                        Vec::new()
                    } else {
                        let tokens = semantic_tokens::extract_semantic_tokens(src);
                        semantic_tokens::encode_tokens(&tokens, src)
                    }
                } else {
                    Vec::new()
                };
                let data_json: Vec<String> = data.iter().map(|n| n.to_string()).collect();
                let result = format!("{{\"data\":[{}]}}", data_json.join(","));
                send_response(&mut stdout, &id, &result);
            }
            "shutdown" => {
                send_response(&mut stdout, &id, "null");
                return Ok(());
            }
            "exit" => {
                return Ok(());
            }
            _ => {}
        }
    }
}

fn extract_field(json: &str, field: &str) -> String {
    // Find the field as a JSON key: "field":
    let needle = format!("{}:", field);
    if let Some(pos) = json.find(&needle) {
        let rest = &json[pos + needle.len()..];
        let rest = rest.trim_start();
        // Value can be a string "..." or a number
        if rest.starts_with('"') {
            let after_open = &rest[1..];
            if let Some(close) = after_open.find('"') {
                return after_open[..close].to_string();
            }
        } else {
            // Numeric or other token — read until comma or } or ]
            let end = rest.find(|c: char| c == ',' || c == '}' || c == ']').unwrap_or(rest.len());
            return rest[..end].trim().to_string();
        }
    }
    String::new()
}

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
    severity: u8,
    message: String,
}

/// Full pipeline parse → desugar → nameres → typeck, return diagnostics.
fn parse_dew(text: &str) -> Vec<Diag> {
    let mut diag = DiagnosticCollector::new();
    let mut lexer = Lexer::new(text);
    let tokens = lexer.lex_all();
    let mut parser = Parser::new(tokens, &mut diag, text);
    let prog = parser.parse_program();
    let desugared = desugar_program(&prog, &mut diag);
    let mut resolver = NameResolver::new(&mut diag);
    resolver.resolve(&desugared);
    let mut tc = TypeChecker::new(&mut diag);
    tc.check(&desugared);

    let mut result = Vec::new();
    for d in diag.all() {
        let sev = match d.severity {
            crate::diagnostics::Severity::Error => 1,
            crate::diagnostics::Severity::Warning => 2,
        };
        let (line, start_col, end_col) = match &d.span {
            Some(s) => {
                let (sl, sc) = crate::semantic_tokens::byte_offset_to_line_col(text, s.start);
                let (_el, ec) = crate::semantic_tokens::byte_offset_to_line_col(text, s.end);
                (sl, sc, ec)
            }
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

fn parse_dewir(text: &str) -> Vec<Diag> {
    let mut diags = Vec::new();
    for (i, line) in text.lines().enumerate() {
        let trimmed = line.trim();
        if trimmed.is_empty() || trimmed.starts_with("//") {
            continue;
        }
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
