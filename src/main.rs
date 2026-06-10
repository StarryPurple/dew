/// Dew: A minimal functional language with affine types and implicit laziness.
///
/// Usage: dew [OPTIONS] <FILE>
///        dew lint <FILE>
///        dew complete <FILE> --prefix <PREFIX>

use clap::{Parser as ClapParser, Subcommand};
use dew::ast::Expr;
use dew::diagnostics::DiagnosticCollector;
use dew::eval::Evaluator;
use dew::ir_gen;
use dew::lower;
use dew::parser;
use dew::typeck::TypeChecker;
use std::collections::HashSet;
use std::fs;
use std::path::PathBuf;

#[derive(ClapParser)]
#[command(name = "dew", about = "A minimal lazy functional language with affine types")]
struct Args {
    #[command(subcommand)]
    command: Option<Command>,

    /// Input .dew source file (for default run command)
    file: Option<PathBuf>,

    /// Output format for IR: json (default) or text
    #[arg(long, default_value = "json")]
    emit: String,

    /// Print evaluation trace
    #[arg(long, default_value_t = false)]
    trace: bool,

    /// Completion prefix for tab-completion
    #[arg(long)]
    prefix: Option<String>,
}

#[derive(Subcommand)]
enum Command {
    /// Lint: check for warnings and issues without running
    Lint {
        file: PathBuf,
    },
    /// Tab-completion: list matching keywords and defined names
    Complete {
        file: PathBuf,
        #[arg(long)]
        prefix: String,
    },
    /// Start LSP server (for editor integration)
    Lsp,
    /// Start web playground server
    Serve {
        #[arg(long, default_value = "8080")]
        port: u16,
    },
}

const KEYWORDS: &[&str] = &[
    "fn", "def", "if", "else", "fix", "dup",
    "box", "unbox", "nil", "cons", "head", "tail", "isnil",
    "true", "false", "Int", "Bool", "Box", "List",
];

fn main() {
    let args = Args::parse();

    match args.command {
        Some(Command::Lint { file }) => cmd_lint(&file),
        Some(Command::Complete { file, prefix }) => cmd_complete(&file, &prefix),
        Some(Command::Lsp) => {
            let rt = tokio::runtime::Runtime::new().unwrap();
            rt.block_on(dew::lsp::run_lsp());
        }
        Some(Command::Serve { port }) => {
            let rt = tokio::runtime::Runtime::new().unwrap();
            rt.block_on(dew::serve::run_serve(port));
        }
        None => {
            let file = args.file.as_ref().expect("FILE required");
            cmd_run(file, &args.emit, args.trace);
        }
    }
}

fn read_source(file: &PathBuf) -> String {
    let raw = match fs::read_to_string(file) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("Error reading {}: {e}", file.display());
            std::process::exit(1);
        }
    };
    // Preprocess: expand include directives
    let base_dir = file.parent().unwrap_or(std::path::Path::new("."));
    match dew::include::preprocess(&raw, base_dir) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("Include error: {e}");
            std::process::exit(1);
        }
    }
}

fn parse_source(source: &str) -> Expr {
    match parser::parse(source) {
        Ok(ast) => ast,
        Err(errs) => {
            for e in errs {
                eprintln!("Parse error: {e}");
            }
            std::process::exit(1);
        }
    }
}

fn collect_defs(expr: &Expr, names: &mut HashSet<String>) {
    match expr {
        Expr::Let(name, bind, body, _) => {
            names.insert(name.clone());
            collect_defs(bind, names);
            collect_defs(body, names);
        }
        Expr::Lam(param, _, body, _) => {
            names.insert(param.clone());
            collect_defs(body, names);
        }
        Expr::Fix(name, _, body, _) => {
            names.insert(name.clone());
            collect_defs(body, names);
        }
        Expr::BinOp(_, left, right, _) => { collect_defs(left, names); collect_defs(right, names); }
        Expr::If(cond, then, els, _) => { collect_defs(cond, names); collect_defs(then, names); collect_defs(els, names); }
        Expr::App(f, a, _) => { collect_defs(f, names); collect_defs(a, names); }
        Expr::Dup(inner, _) => { collect_defs(inner, names); }
        Expr::Box(inner, _) => { collect_defs(inner, names); }
        Expr::Unbox(inner, _) => { collect_defs(inner, names); }
        Expr::Cons(h, t, _) => { collect_defs(h, names); collect_defs(t, names); }
        Expr::Head(inner, _) => { collect_defs(inner, names); }
        Expr::Tail(inner, _) => { collect_defs(inner, names); }
        Expr::IsNil(inner, _) => { collect_defs(inner, names); }
        Expr::ForceStrict(inner, _) => { collect_defs(inner, names); }
        Expr::Pipe(l, r, _) => { collect_defs(l, names); collect_defs(r, names); }
        _ => {}
    }
}

// ── Default run command ─────────────────────────────────────────────

fn cmd_run(file: &PathBuf, emit: &str, trace: bool) {
    let source = read_source(file);
    let ast = parse_source(&source);

    let mut diag = DiagnosticCollector::new();
    let mut typeck = TypeChecker::new(&mut diag);
    match typeck.check(&ast) {
        Ok(_ty) => {}
        Err(err) => {
            eprintln!("Type error: {err}");
            std::process::exit(1);
        }
    }

    let ir = ir_gen::compile(&ast);

    match emit {
        "text" => println!("{ir}"),
        "flat" => {
            let module = lower::lower(&ir);
            println!("{module}");
        }
        "flat-json" => {
            let module = lower::lower(&ir);
            let json = serde_json::to_string_pretty(&module)
                .unwrap_or_else(|e| format!("serialization error: {e}"));
            println!("{json}");
        }
        _ => {
            let json = serde_json::to_string_pretty(&ir)
                .unwrap_or_else(|e| format!("serialization error: {e}"));
            println!("{json}");
        }
    }

    let mut evaluator = Evaluator::new(&mut diag);
    let exit_code = match evaluator.eval(&ir) {
        Ok(value) => {
            if trace {
                println!("\n;; Evaluation trace:\n{}", evaluator.trace());
            }
            match value.as_int() {
                Some(n) => {
                    println!("\n;; Result: {n}");
                    n as i32
                }
                None => {
                    println!("\n;; Result: {value:?}");
                    0
                }
            }
        }
        Err(err) => {
            eprintln!("Runtime error: {err}");
            1
        }
    };

    let diag_json = diag.to_json();
    eprintln!("\n;; Diagnostics:\n{diag_json}");

    std::process::exit(exit_code);
}

// ── Lint command ────────────────────────────────────────────────────

fn cmd_lint(file: &PathBuf) {
    let source = read_source(file);
    let ast = match parser::parse(&source) {
        Ok(a) => a,
        Err(errs) => {
            for e in &errs {
                eprintln!("error: {e}");
            }
            std::process::exit(1);
        }
    };

    let mut diag = DiagnosticCollector::new();
    let mut typeck = TypeChecker::new(&mut diag);
    let mut has_errors = false;

    match typeck.check(&ast) {
        Ok(_) => {}
        Err(err) => {
            eprintln!("error [{}]: {}", err.code(), err.detailed());
            has_errors = true;
        }
    }

    let report = diag.to_report();

    // Affine leaks → warnings
    if !report.affine.leaks.is_empty() {
        for leak in &report.affine.leaks {
            eprintln!("warning [W001]: affine variable '{}' — {}", leak.var, leak.reason);
        }
    }

    // Thunk diagnostics
    if !report.thunks.never_forced.is_empty() {
        for thunk in &report.thunks.never_forced {
            if let Some(src) = report.thunks.sources.get(thunk) {
                eprintln!("warning [W002]: thunk {thunk} ({src}) is never forced — potential dead code");
            } else {
                eprintln!("warning [W002]: thunk {thunk} is never forced — potential dead code");
            }
        }
    }

    let issue_count = report.affine.leaks.len()
        + report.thunks.never_forced.len()
        + if has_errors { 1 } else { 0 };

    if issue_count > 0 {
        eprintln!("\n{} issue(s) found.", issue_count);
        std::process::exit(1);
    } else {
        eprintln!("No issues found.");
    }
}

// ── Complete command ────────────────────────────────────────────────

fn cmd_complete(file: &PathBuf, prefix: &str) {
    let source = read_source(file);
    let ast = match parser::parse(&source) {
        Ok(a) => a,
        Err(_) => {
            // Still complete keywords even if parse fails
            for kw in KEYWORDS {
                if kw.starts_with(prefix) {
                    println!("{kw}");
                }
            }
            return;
        }
    };

    let mut names = HashSet::new();
    collect_defs(&ast, &mut names);

    // Output matching keywords and defined names
    for kw in KEYWORDS {
        if kw.starts_with(prefix) {
            println!("{kw}");
        }
    }
    let mut sorted: Vec<_> = names.iter().filter(|n| n.starts_with(prefix)).collect();
    sorted.sort();
    for name in &sorted {
        println!("{name}");
    }
}
