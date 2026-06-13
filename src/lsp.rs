// LSP server: JSON-RPC over stdin/stdout for diagnostics, hover, go-to-definition
// Implements a minimal Language Server Protocol for Cursor/VS Code integration

use crate::parser::parse_program;
use std::io::Read;
use serde::{Deserialize, Serialize};
use std::io::{self, BufRead, Write};

#[derive(Debug, Deserialize)]
#[serde(untagged)]
enum LspMessage {
  Request {
    jsonrpc: String,
    id: serde_json::Value,
    method: String,
    params: serde_json::Value,
  },
  Notification {
    jsonrpc: String,
    method: String,
    params: serde_json::Value,
  },
}

#[derive(Debug, Serialize)]
struct LspResponse {
  jsonrpc: &'static str,
  #[serde(skip_serializing_if = "Option::is_none")]
  id: Option<serde_json::Value>,
  #[serde(skip_serializing_if = "Option::is_none")]
  result: Option<serde_json::Value>,
  #[serde(skip_serializing_if = "Option::is_none")]
  error: Option<LspError>,
  #[serde(skip_serializing_if = "Option::is_none")]
  method: Option<String>,
  #[serde(skip_serializing_if = "Option::is_none")]
  params: Option<serde_json::Value>,
}

#[derive(Debug, Serialize)]
struct LspError {
  code: i32,
  message: String,
}

pub fn run() {
  eprintln!("dew LSP server started");
  let stdin = io::stdin();
  let mut stdout = io::stdout();

  let mut documents: std::collections::HashMap<String, String> = std::collections::HashMap::new();

  for line in stdin.lock().lines() {
    let line = match line {
      Ok(l) => l,
      Err(_) => break,
    };
    if line.is_empty() { continue; }

    // Parse Content-Length header
    let content_len = if let Some(rest) = line.strip_prefix("Content-Length: ") {
      let len: usize = rest.trim().parse().unwrap_or(0);
      // Read the empty line after header
      let mut blank = String::new();
      stdin.lock().read_line(&mut blank).ok();
      len
    } else {
      continue;
    };

    // Read the JSON body
    let mut body = vec![0u8; content_len];
    if stdin.lock().read_exact(&mut body).is_err() { break; }
    let body_str = String::from_utf8_lossy(&body);

    let msg: LspMessage = match serde_json::from_str(&body_str) {
      Ok(m) => m,
      Err(_) => continue,
    };

    match msg {
      LspMessage::Request { id, method, params, .. } => {
        let result = handle_request(&method, &params, &documents);
        let response = LspResponse {
          jsonrpc: "2.0",
          id: Some(id),
          result,
          error: None,
          method: None,
          params: None,
        };
        send_message(&mut stdout, &response);
      }
      LspMessage::Notification { method, params, .. } => {
        if method == "textDocument/didOpen" || method == "textDocument/didChange" {
          if let Some(uri) = params["textDocument"]["uri"].as_str() {
            if let Some(text) = params["textDocument"]["text"].as_str() {
              documents.insert(uri.to_string(), text.to_string());
            }
          }
          if method == "textDocument/didChange" {
            if let Some(changes) = params["contentChanges"].as_array() {
              if let Some(last) = changes.last() {
                if let Some(text) = last["text"].as_str() {
                  if let Some(uri) = params["textDocument"]["uri"].as_str() {
                    documents.insert(uri.to_string(), text.to_string());
                  }
                }
              }
            }
          }
          // Send diagnostics
        }
      }
    }
  }
}

fn handle_request(
  method: &str,
  params: &serde_json::Value,
  documents: &std::collections::HashMap<String, String>,
) -> Option<serde_json::Value> {
  match method {
    "initialize" => {
      Some(serde_json::json!({
        "capabilities": {
          "textDocumentSync": 1, // full sync
          "hoverProvider": true,
          "definitionProvider": true,
        },
        "serverInfo": { "name": "dew", "version": "0.1.0" }
      }))
    }
    "textDocument/hover" => {
      let uri = params["textDocument"]["uri"].as_str()?;
      let pos = &params["position"];
      let _line: usize = pos["line"].as_u64()? as usize;
      let _char: usize = pos["character"].as_u64()? as usize;
      let source = documents.get(uri)?;
      let _decls = parse_program(source).ok()?;
      // Simple hover: if under an ident, show inferred type
      // For now, return a placeholder
      Some(serde_json::json!({
        "contents": { "kind": "markdown", "value": "Dew expression" }
      }))
    }
    "textDocument/definition" => {
      // For now, return null (no location)
      None
    }
    "shutdown" => Some(serde_json::json!(null)),
    _ => None,
  }
}

fn send_message(stdout: &mut io::Stdout, response: &LspResponse) {
  let json = serde_json::to_string(response).unwrap_or_default();
  let header = format!("Content-Length: {}\r\n\r\n", json.len());
  write!(stdout, "{header}{json}").ok();
  stdout.flush().ok();
}
