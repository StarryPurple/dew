// Diagnostic collector: threaded through typeck and eval
// Produces JSON diagnostic reports

use serde::Serialize;

/// Severity level for a diagnostic
#[derive(Debug, Clone, Copy, PartialEq, Serialize)]
pub enum Severity {
    Error,
    Warning,
    Note,
}

/// A single diagnostic message
#[derive(Debug, Clone, Serialize)]
pub struct Diagnostic {
    pub severity: Severity,
    pub message: String,
    pub span: Option<(usize, usize)>,
    pub file: Option<String>,
}

/// Collector for diagnostics during compilation/evaluation
#[derive(Debug, Clone, Default, Serialize)]
pub struct DiagnosticCollector {
    diagnostics: Vec<Diagnostic>,
}

impl DiagnosticCollector {
    pub fn new() -> Self {
        Self {
            diagnostics: vec![],
        }
    }

    pub fn error(&mut self, message: impl Into<String>) {
        self.diagnostics.push(Diagnostic {
            severity: Severity::Error,
            message: message.into(),
            span: None,
            file: None,
        });
    }

    pub fn warning(&mut self, message: impl Into<String>) {
        self.diagnostics.push(Diagnostic {
            severity: Severity::Warning,
            message: message.into(),
            span: None,
            file: None,
        });
    }

    pub fn note(&mut self, message: impl Into<String>) {
        self.diagnostics.push(Diagnostic {
            severity: Severity::Note,
            message: message.into(),
            span: None,
            file: None,
        });
    }

    pub fn has_errors(&self) -> bool {
        self.diagnostics.iter().any(|d| d.severity == Severity::Error)
    }

    pub fn is_empty(&self) -> bool {
        self.diagnostics.is_empty()
    }

    /// Serialize diagnostics to JSON
    pub fn to_json(&self) -> String {
        serde_json::to_string_pretty(&self.diagnostics).unwrap_or_else(|_| "[]".to_string())
    }

    /// Print diagnostics to stderr (human readable)
    pub fn report(&self) {
        for d in &self.diagnostics {
            let prefix = match d.severity {
                Severity::Error => "error",
                Severity::Warning => "warning",
                Severity::Note => "note",
            };
            eprintln!("{prefix}: {}", d.message);
        }
    }
}
