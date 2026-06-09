/// Diagnostics collector.
///
/// Tracks affine violations, resource leaks, thunk metrics, closure
/// classifications, and emits a structured JSON report.

use crate::ast::Span;
use serde::Serialize;
use std::collections::HashMap;

#[derive(Debug, Clone, Serialize)]
pub struct AffineViolation {
    pub var: String,
    pub reason: String,
}

#[derive(Debug, Clone, Serialize)]
pub struct ResourceLeak {
    pub var: String,
    pub reason: String,
}

#[derive(Debug, Clone, Serialize)]
pub struct ClosureClass {
    pub param: String,
    pub affinity: String,
    pub affine_captures: Vec<String>,
}

#[derive(Debug, Clone, Serialize)]
pub struct ThunkDiagnostics {
    pub total_created: usize,
    pub total_forced: usize,
    pub immediately_forced: usize,
    pub never_forced: Vec<String>,
    pub forced_multiple_times: Vec<String>,
    pub force_counts: HashMap<String, usize>,
    pub sources: HashMap<String, String>,
}

#[derive(Debug, Clone, Serialize)]
pub struct ClosureDiagnostics {
    pub captures_per_thunk: HashMap<String, usize>,
    pub max_captures: usize,
    pub total_captures: usize,
}

#[derive(Debug, Clone, Serialize)]
pub struct DiagnosticReport {
    pub affine: AffineDiagnostics,
    pub closures: ClosureClassifications,
    pub thunks: ThunkDiagnostics,
    pub captures: ClosureDiagnostics,
    pub ir_node_count: usize,
}

#[derive(Debug, Clone, Serialize)]
pub struct AffineDiagnostics {
    pub violations: Vec<AffineViolation>,
    pub leaks: Vec<ResourceLeak>,
}

#[derive(Debug, Clone, Serialize)]
pub struct ClosureClassifications {
    pub classes: Vec<ClosureClass>,
}

impl Default for AffineDiagnostics {
    fn default() -> Self {
        AffineDiagnostics { violations: Vec::new(), leaks: Vec::new() }
    }
}

impl Default for ClosureClassifications {
    fn default() -> Self {
        ClosureClassifications { classes: Vec::new() }
    }
}

#[derive(Debug, Clone)]
pub struct DiagnosticCollector {
    pub affine: AffineDiagnostics,
    pub closures: ClosureClassifications,
    pub thunks: ThunkDiagnostics,
    pub captures: ClosureDiagnostics,
    pub ir_node_count: usize,
    pub(crate) thunks_created_this_step: Vec<String>,
}

impl DiagnosticCollector {
    pub fn new() -> Self {
        DiagnosticCollector {
            affine: AffineDiagnostics::default(),
            closures: ClosureClassifications::default(),
            thunks: ThunkDiagnostics {
                total_created: 0, total_forced: 0, immediately_forced: 0,
                never_forced: Vec::new(), forced_multiple_times: Vec::new(),
                force_counts: HashMap::new(),
                sources: HashMap::new(),
            },
            captures: ClosureDiagnostics {
                captures_per_thunk: HashMap::new(),
                max_captures: 0, total_captures: 0,
            },
            ir_node_count: 0,
            thunks_created_this_step: Vec::new(),
        }
    }

    pub fn record_thunk_create(&mut self, name: &str, capture_count: usize, source: Option<&str>) {
        self.thunks.total_created += 1;
        self.thunks_created_this_step.push(name.to_string());
        self.captures.captures_per_thunk.insert(name.to_string(), capture_count);
        self.captures.total_captures += capture_count;
        if capture_count > self.captures.max_captures {
            self.captures.max_captures = capture_count;
        }
        self.thunks.force_counts.insert(name.to_string(), 0);
        if let Some(src) = source {
            self.thunks.sources.insert(name.to_string(), src.to_string());
        }
    }

    pub fn record_thunk_force(&mut self, name: &str) {
        self.thunks.total_forced += 1;
        let count = self.thunks.force_counts.entry(name.to_string()).or_insert(0);
        *count += 1;
        if self.thunks_created_this_step.contains(&name.to_string()) {
            self.thunks.immediately_forced += 1;
        }
    }

    pub fn record_affine_violation(&mut self, var: &str, first: Span, second: Span) {
        self.affine.violations.push(AffineViolation {
            var: var.to_string(),
            reason: format!("used at {:?} and then at {:?}", first, second),
        });
    }

    pub fn record_unused_variable(&mut self, _var: &str) {
        // Tracked via record_resource_leak for affine types.
    }

    pub fn record_resource_leak(&mut self, var: &str) {
        self.affine.leaks.push(ResourceLeak {
            var: var.to_string(),
            reason: "affine resource defined but never consumed".to_string(),
        });
    }

    pub fn record_closure_classification(&mut self, param: &str, captures: &[String]) {
        self.closures.classes.push(ClosureClass {
            param: param.to_string(),
            affinity: if captures.is_empty() { "Fn".to_string() } else { "FnOnce".to_string() },
            affine_captures: captures.to_vec(),
        });
    }

    pub fn step_complete(&mut self) {
        self.thunks_created_this_step.clear();
    }

    pub fn finalize(&mut self) {
        for (name, &count) in &self.thunks.force_counts {
            if count == 0 {
                self.thunks.never_forced.push(name.clone());
            } else if count > 1 {
                self.thunks.forced_multiple_times.push(name.clone());
            }
        }
    }

    pub fn to_json(&self) -> String {
        let report = self.to_report();
        serde_json::to_string_pretty(&report).unwrap_or_else(|e| format!("{{ \"error\": \"{e}\" }}"))
    }

    pub fn to_report(&self) -> DiagnosticReport {
        DiagnosticReport {
            affine: self.affine.clone(),
            closures: self.closures.clone(),
            thunks: self.thunks.clone(),
            captures: self.captures.clone(),
            ir_node_count: self.ir_node_count,
        }
    }
}

impl Default for DiagnosticCollector {
    fn default() -> Self { Self::new() }
}
