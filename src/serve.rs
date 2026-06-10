/// Web playground server for Dew.
/// GET  /          — playground HTML page
/// POST /api/run   — compile and run Dew source, return results

use axum::{
    extract::State,
    response::{Html, IntoResponse, Json},
    routing::{get, post},
    Router,
};
use serde::{Deserialize, Serialize};
use std::collections::HashSet;
use std::sync::Arc;

use crate::ast::Expr;
use crate::diagnostics::DiagnosticCollector;
use crate::eval::Evaluator;
use crate::ir_gen;
use crate::lower;
use crate::parser;
use crate::typeck::TypeChecker;

#[derive(Clone)]
struct AppState {
    // Could add document store here
}

#[derive(Deserialize)]
struct RunRequest {
    source: String,
}

#[derive(Serialize)]
struct RunResponse {
    success: bool,
    result: Option<String>,
    ir_json: Option<serde_json::Value>,
    ir_text: Option<String>,
    flat_ir: Option<String>,
    diagnostics: Option<serde_json::Value>,
    error: Option<String>,
    error_code: Option<String>,
}

async fn handle_run(
    State(_state): State<Arc<AppState>>,
    Json(req): Json<RunRequest>,
) -> impl IntoResponse {
    let mut diag = DiagnosticCollector::new();

    // Parse
    let ast = match parser::parse(&req.source) {
        Ok(a) => a,
        Err(errs) => {
            return Json(RunResponse {
                success: false,
                result: None,
                ir_json: None,
                ir_text: None,
                flat_ir: None,
                diagnostics: None,
                error: Some(errs.join("; ")),
                error_code: Some("PARSE".into()),
            });
        }
    };

    // Type check
    {
        let mut typeck = TypeChecker::new(&mut diag);
        if let Err(err) = typeck.check(&ast) {
            return Json(RunResponse {
                success: false,
                result: None,
                ir_json: None,
                ir_text: None,
                flat_ir: None,
                diagnostics: Some(serde_json::to_value(diag.to_report()).unwrap_or_default()),
                error: Some(err.detailed()),
                error_code: Some(err.code().into()),
            });
        }
    }

    // Compile to IR
    let ir = ir_gen::compile(&ast);

    // IR outputs
    let ir_text = format!("{ir}");
    let ir_json = serde_json::to_value(&ir).ok();
    let flat_module = lower::lower(&ir);
    let flat_ir = format!("{flat_module}");

    // Evaluate
    let mut evaluator = Evaluator::new(&mut diag);
    let (result_val, error) = match evaluator.eval(&ir) {
        Ok(value) => (Some(format!("{value:?}")), None),
        Err(err) => (None, Some(err)),
    };

    let exit_code = result_val
        .as_ref()
        .and_then(|v| v.parse::<i64>().ok())
        .or_else(|| {
            result_val
                .as_ref()
                .and_then(|v| {
                    if let Some(n) = v.strip_prefix("Int(").and_then(|s| s.strip_suffix(')')) {
                        n.parse().ok()
                    } else {
                        None
                    }
                })
        });

    Json(RunResponse {
        success: error.is_none(),
        result: exit_code.map(|n| n.to_string()),
        ir_json,
        ir_text: Some(ir_text),
        flat_ir: Some(flat_ir),
        diagnostics: Some(serde_json::to_value(diag.to_report()).unwrap_or_default()),
        error,
        error_code: None,
    })
}

// ── Completion endpoint ──────────────────────────────────────────────

const KEYWORDS: &[(&str, &str)] = &[
    ("fn", "Lambda/function expression"),
    ("def", "Let binding (variable definition)"),
    ("if", "Conditional expression"),
    ("else", "Alternative branch of if"),
    ("fix", "Fixed-point combinator (recursion)"),
    ("dup", "Duplicate a normal (copyable) value"),
    ("box", "Allocate a linear box (affine resource)"),
    ("unbox", "Deallocate a box, consuming it"),
    ("nil", "Empty list"),
    ("cons", "List constructor (head, tail)"),
    ("head", "Get first element of a list"),
    ("tail", "Get rest of list (forces lazy tail)"),
    ("isnil", "Test if list is empty"),
    ("true", "Boolean literal"),
    ("false", "Boolean literal"),
];

const TYPE_KEYWORDS: &[(&str, &str)] = &[
    ("Int", "64-bit signed integer type"),
    ("Bool", "Boolean type"),
    ("()", "Unit/void type"),
    ("Box(", "Linear box type constructor"),
    ("List(", "List type constructor"),
];

#[derive(Deserialize)]
struct CompleteRequest {
    source: String,
    line: usize,
    column: usize,
}

#[derive(Serialize)]
struct CompleteItem {
    label: String,
    kind: String,
    detail: String,
    insert: String,
}

#[derive(Serialize)]
struct CompleteResponse {
    completions: Vec<CompleteItem>,
}

fn collect_names(expr: &Expr, names: &mut HashSet<String>) {
    match expr {
        Expr::Let(name, bind, body, _) => { names.insert(name.clone()); collect_names(bind, names); collect_names(body, names); }
        Expr::Lam(param, _, body, _) => { names.insert(param.clone()); collect_names(body, names); }
        Expr::Fix(name, _, body, _) => { names.insert(name.clone()); collect_names(body, names); }
        Expr::BinOp(_, l, r, _) => { collect_names(l, names); collect_names(r, names); }
        Expr::If(c, t, e, _) => { collect_names(c, names); collect_names(t, names); collect_names(e, names); }
        Expr::App(f, a, _) => { collect_names(f, names); collect_names(a, names); }
        Expr::Dup(i, _) => { collect_names(i, names); }
        Expr::Box(i, _) => { collect_names(i, names); }
        Expr::Unbox(i, _) => { collect_names(i, names); }
        Expr::ForceStrict(i, _) => { collect_names(i, names); }
        Expr::Cons(h, t, _) => { collect_names(h, names); collect_names(t, names); }
        Expr::Head(i, _) => { collect_names(i, names); }
        Expr::Tail(i, _) => { collect_names(i, names); }
        Expr::IsNil(i, _) => { collect_names(i, names); }
        Expr::Pipe(l, r, _) => { collect_names(l, names); collect_names(r, names); }
        _ => {}
    }
}

fn get_prefix_at_cursor(source: &str, line: usize, column: usize) -> String {
    let lines: Vec<&str> = source.lines().collect();
    if line == 0 || line > lines.len() {
        return String::new();
    }
    let target = lines[line - 1];
    if column > target.len() {
        return String::new();
    }
    let before = &target[..column];
    // Walk backwards from cursor to find the start of the current word
    before.chars().rev().take_while(|c| c.is_alphanumeric() || *c == '_').collect::<String>().chars().rev().collect()
}

fn is_in_type_position(source: &str, line: usize, column: usize) -> bool {
    let lines: Vec<&str> = source.lines().collect();
    if line == 0 || line > lines.len() { return false; }
    let target = lines[line - 1];
    if column > target.len() { return false; }
    let before = &target[..column];
    // Check if we're after a ':' (type annotation position)
    before.trim_end().ends_with(':')
}

async fn handle_complete(
    State(_state): State<Arc<AppState>>,
    Json(req): Json<CompleteRequest>,
) -> impl IntoResponse {
    let prefix = get_prefix_at_cursor(&req.source, req.line, req.column);
    let in_type_pos = is_in_type_position(&req.source, req.line, req.column);

    let mut completions: Vec<CompleteItem> = Vec::new();

    if in_type_pos {
        // Type position: only type keywords
        for (kw, detail) in TYPE_KEYWORDS {
            if kw.starts_with(&prefix) || prefix.is_empty() {
                completions.push(CompleteItem {
                    label: kw.to_string(),
                    kind: "type".into(),
                    detail: detail.to_string(),
                    insert: kw.to_string(),
                });
            }
        }
    } else {
        // Expression position: keywords + user-defined names
        for (kw, detail) in KEYWORDS {
            if kw.starts_with(&prefix) || prefix.is_empty() {
                completions.push(CompleteItem {
                    label: kw.to_string(),
                    kind: "keyword".into(),
                    detail: detail.to_string(),
                    insert: kw.to_string(),
                });
            }
        }

        // Try to parse and collect user-defined names
        if let Ok(ast) = crate::parser::parse(&req.source) {
            let mut names = HashSet::new();
            collect_names(&ast, &mut names);
            let mut sorted: Vec<_> = names.into_iter().filter(|n| n.starts_with(&prefix) || prefix.is_empty()).collect();
            sorted.sort();
            for name in sorted {
                if !name.starts_with('_') { // Skip auto-generated names
                    completions.push(CompleteItem {
                        label: name.clone(),
                        kind: "variable".into(),
                        detail: "user-defined".into(),
                        insert: name,
                    });
                }
            }
        }
    }

    Json(CompleteResponse { completions })
}

const PLAYGROUND_HTML: &str = include_str!("../assets/playground.html");

async fn handle_index() -> Html<&'static str> {
    Html(PLAYGROUND_HTML)
}

pub async fn run_serve(port: u16) {
    let state = Arc::new(AppState {});

    let app = Router::new()
        .route("/", get(handle_index))
        .route("/api/run", post(handle_run))
        .route("/api/complete", post(handle_complete))
        .with_state(state);

    let addr = format!("0.0.0.0:{port}");
    println!("Dew playground: http://localhost:{port}");
    let listener = tokio::net::TcpListener::bind(&addr).await.unwrap();
    axum::serve(listener, app).await.unwrap();
}
