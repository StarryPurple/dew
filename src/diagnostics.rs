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

/// A source file registered with the diagnostic system.
#[derive(Debug, Clone)]
pub struct SourceFile {
    pub path: String,
    pub source: String,
}

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
#[derive(Debug, Default)]
pub struct DiagnosticCollector {
    diagnostics: Vec<Diagnostic>,
    pub source_files: Vec<SourceFile>,
    /// When the combined source (stdlib + user) is used for lookups, this stores
    /// the number of lines in the stdlib prefix so we can display user-relative line numbers.
    pub stdlib_lines: usize,
}

impl DiagnosticCollector {
    pub fn new() -> Self {
        Self { diagnostics: Vec::new(), source_files: Vec::new(), stdlib_lines: 0 }
    }

    pub fn register_source(&mut self, path: String, source: String) -> usize {
        let idx = self.source_files.len();
        self.source_files.push(SourceFile { path, source });
        idx
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

    /// Subtract a line offset from all diagnostic spans.
    /// Used when stdlib is prepended to user source — adjusts line numbers
    /// so they point to the user's original file, not the combined text.
    pub fn shift_origin(&mut self, line_offset: usize, byte_offset: usize) {
        for d in &mut self.diagnostics {
            if let Some(ref mut span) = d.span {
                span.line = span.line.saturating_sub(line_offset);
                span.col = span.col.saturating_sub(byte_offset);
                span.start = span.start.saturating_sub(byte_offset);
                span.end = span.end.saturating_sub(byte_offset);
            }
        }
    }

    /// Print all diagnostics to stderr.
    /// Line numbers are adjusted by `stdlib_lines` so they point to the user's original file.
    pub fn emit_all(&self, combined_source: &str) {
        let display_path = self.source_files.first().map(|sf| &sf.path[..]).unwrap_or("<input>");
        for diag in &self.diagnostics {
            let label = match diag.severity {
                Severity::Error => "error",
                Severity::Warning => "warning",
            };
            eprint!("[{}] {}: {}", diag.code, label, diag.message);
            if let Some(span) = &diag.span {
                let (actual_line, actual_col) = if span.line > 0 && combined_source.lines().count() > span.line {
                    let line_start = combined_source.lines().take(span.line).collect::<Vec<_>>().join("\n").len() + 1;
                    (span.line, span.col.saturating_sub(line_start))
                } else if span.col > 0 && span.col <= combined_source.len() {
                    let ln = combined_source[..span.col].matches('\n').count();
                    let ls = combined_source[..span.col].rfind('\n').map(|p| p + 1).unwrap_or(0);
                    (ln, span.col - ls)
                } else { (0, 0) };
                if actual_line > 0 {
                    let user_line = actual_line + 1 - self.stdlib_lines.min(actual_line + 1);
                    eprint!(" at {}:{}:{}", display_path, user_line, actual_col + 1);
                }
                if let Some(line) = combined_source.lines().nth(actual_line) {
                    let cc = if actual_col <= line.len() { line[..actual_col].chars().count() } else { line.len() };
                    eprint!("\n  {}", line);
                    eprint!("\n  {}^", " ".repeat(cc.min(120)));
                }
            }
            if let Some(help) = &diag.help { eprint!("\n  help: {}", help); }
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
