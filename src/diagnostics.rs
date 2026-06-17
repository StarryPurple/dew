// Diagnostic system for the Dew compiler.
//
// Diagnostics use bracketed codes: [E###] for errors (compilation stops),
// [W###] for warnings (compilation continues).
//
// Error codes:
//   [E001] File/System — file not found, I/O error
//   [E002] Parse — syntax error
//   [E003] Type — type mismatch
//   [E004] Affine — use-after-consume, double use
//   [E005] Exhaustiveness — non-exhaustive match
//   [E006] Effect — IO function in pure context
//   [E007] Name — unbound variable, import conflict
//   [E008] Layout — struct self-recursion, infinite layout
//
// Warning codes:
//   [W001] Shadow — redefining main
//   [W002] Shadow — redefining standard library name
//   [W003] Effect — main is pure (no IO)
//   [W004] Affine — struct contains affine field but not declared affine
//   [W005] Recursion — enum recursion without a base case

use crate::ast::Span;

/// Severity of a diagnostic.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Severity {
    Error,
    Warning,
}

/// A single diagnostic message.
#[derive(Debug, Clone)]
pub struct Diagnostic {
    pub severity: Severity,
    pub code: String,       // e.g., "E002", "W004"
    pub message: String,
    pub span: Option<Span>,
    pub help: Option<String>,
}

/// Collects diagnostics during compilation.
/// Errors prevent code generation; warnings do not.
#[derive(Debug, Default)]
pub struct DiagnosticCollector {
    diagnostics: Vec<Diagnostic>,
}

impl DiagnosticCollector {
    pub fn new() -> Self {
        Self { diagnostics: Vec::new() }
    }

    /// Report an error. Compilation should stop after error collection.
    pub fn error(&mut self, code: &str, message: impl Into<String>, span: Option<Span>) {
        self.diagnostics.push(Diagnostic {
            severity: Severity::Error,
            code: code.to_string(),
            message: message.into(),
            span,
            help: None,
        });
    }

    /// Report a warning. Compilation may continue.
    pub fn warn(&mut self, code: &str, message: impl Into<String>, span: Option<Span>) {
        self.diagnostics.push(Diagnostic {
            severity: Severity::Warning,
            code: code.to_string(),
            message: message.into(),
            span,
            help: None,
        });
    }

    /// Report an error with a help hint.
    pub fn error_with_help(
        &mut self,
        code: &str,
        message: impl Into<String>,
        span: Option<Span>,
        help: impl Into<String>,
    ) {
        self.diagnostics.push(Diagnostic {
            severity: Severity::Error,
            code: code.to_string(),
            message: message.into(),
            span,
            help: Some(help.into()),
        });
    }

    /// Returns true if any errors have been recorded.
    pub fn has_errors(&self) -> bool {
        self.diagnostics.iter().any(|d| d.severity == Severity::Error)
    }

    /// Returns true if any warnings have been recorded.
    pub fn has_warnings(&self) -> bool {
        self.diagnostics.iter().any(|d| d.severity == Severity::Warning)
    }

    /// Returns all diagnostics.
    pub fn all(&self) -> &[Diagnostic] {
        &self.diagnostics
    }

    /// Returns only errors.
    pub fn errors(&self) -> Vec<&Diagnostic> {
        self.diagnostics.iter().filter(|d| d.severity == Severity::Error).collect()
    }

    /// Print all diagnostics to stderr in a human-readable format.
    pub fn emit_all(&self, source: &str) {
        for diag in &self.diagnostics {
            let label = match diag.severity {
                Severity::Error => "error",
                Severity::Warning => "warning",
            };
            eprint!("[{}] {}: {}", diag.code, label, diag.message);
            if let Some(span) = &diag.span {
                eprint!(" at line {}, col {}", span.line + 1, span.col + 1);
                // Show the source line
                if let Some(line) = source.lines().nth(span.line) {
                    eprint!("\n  {}", line);
                    eprint!("\n  {}^", " ".repeat(span.col));
                }
            }
            if let Some(help) = &diag.help {
                eprint!("\n  help: {}", help);
            }
            eprintln!();
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn empty_collector_has_no_errors() {
        let dc = DiagnosticCollector::new();
        assert!(!dc.has_errors());
    }

    #[test]
    fn error_makes_has_errors_true() {
        let mut dc = DiagnosticCollector::new();
        dc.error("E002", "unexpected token", None);
        assert!(dc.has_errors());
    }

    #[test]
    fn warning_does_not_make_has_errors_true() {
        let mut dc = DiagnosticCollector::new();
        dc.warn("W003", "main is pure", None);
        assert!(!dc.has_errors());
    }

    #[test]
    fn mixed_errors_and_warnings() {
        let mut dc = DiagnosticCollector::new();
        dc.warn("W001", "redefining main", None);
        dc.error("E003", "type mismatch", None);
        dc.warn("W003", "main is pure", None);
        assert!(dc.has_errors());
        assert_eq!(dc.errors().len(), 1);
        assert_eq!(dc.all().len(), 3);
    }
}
