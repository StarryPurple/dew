// Diagnostic collector with error/warning codes
// Format: [E###] / [W###] prefixes

pub struct DiagnosticCollector {
  pub diagnostics: Vec<String>,
  error_count: usize,
  warning_count: usize,
}

impl DiagnosticCollector {
  pub fn new() -> Self { Self { diagnostics: vec![], error_count: 1, warning_count: 1 } }
  pub fn error(&mut self, msg: impl Into<String>) { let id = self.error_count; self.error_count += 1; self.diagnostics.push(format!("[E{:03}] {}", id, msg.into())); }
  pub fn warning(&mut self, msg: impl Into<String>) { let id = self.warning_count; self.warning_count += 1; self.diagnostics.push(format!("[W{:03}] {}", id, msg.into())); }
  pub fn has_errors(&self) -> bool { self.error_count > 1 }
  pub fn report(&self) { for d in &self.diagnostics { eprintln!("{d}"); } }
  pub fn to_json(&self) -> String { serde_json::to_string_pretty(&self.diagnostics).unwrap_or("[]".into()) }
}
