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
use std::sync::Arc;

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

const PLAYGROUND_HTML: &str = include_str!("../assets/playground.html");

async fn handle_index() -> Html<&'static str> {
    Html(PLAYGROUND_HTML)
}

pub async fn run_serve(port: u16) {
    let state = Arc::new(AppState {});

    let app = Router::new()
        .route("/", get(handle_index))
        .route("/api/run", post(handle_run))
        .with_state(state);

    let addr = format!("0.0.0.0:{port}");
    println!("Dew playground: http://localhost:{port}");
    let listener = tokio::net::TcpListener::bind(&addr).await.unwrap();
    axum::serve(listener, app).await.unwrap();
}
