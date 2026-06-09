/// Dew: A minimal functional language with affine types and implicit laziness.
///
/// Usage: dew [OPTIONS] <FILE>

use clap::Parser as ClapParser;
use dew::diagnostics::DiagnosticCollector;
use dew::eval::Evaluator;
use dew::ir_gen;
use dew::lower;
use dew::parser;
use dew::typeck::TypeChecker;
use std::fs;
use std::path::PathBuf;

#[derive(ClapParser)]
#[command(name = "dew", about = "A minimal lazy functional language with affine types")]
struct Args {
    /// Input .dew source file
    file: PathBuf,

    /// Output format for IR: json (default) or text
    #[arg(long, default_value = "json")]
    emit: String,

    /// Print evaluation trace
    #[arg(long, default_value_t = false)]
    trace: bool,
}

fn main() {
    let args = Args::parse();

    let source = match fs::read_to_string(&args.file) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("Error reading {}: {e}", args.file.display());
            std::process::exit(1);
        }
    };

    // --- Parse ---
    let ast = match parser::parse(&source) {
        Ok(ast) => ast,
        Err(errs) => {
            for e in errs {
                eprintln!("Parse error: {e}");
            }
            std::process::exit(1);
        }
    };

    // --- Type check ---
    let mut diag = DiagnosticCollector::new();
    let mut typeck = TypeChecker::new(&mut diag);
    match typeck.check(&ast) {
        Ok(_ty) => {}
        Err(err) => {
            eprintln!("Type error: {err}");
            std::process::exit(1);
        }
    }

    // --- Compile to IR ---
    let ir = ir_gen::compile(&ast);

    // --- Emit IR ---
    match args.emit.as_str() {
        "text" => println!("{ir}"),
        "flat" => {
            let module = lower::lower(&ir);
            println!("{module}");
        }
        "flat-json" => {
            let module = lower::lower(&ir);
            let json = serde_json::to_string_pretty(&module).unwrap_or_else(|e| format!("serialization error: {e}"));
            println!("{json}");
        }
        _ => {
            let json = serde_json::to_string_pretty(&ir).unwrap_or_else(|e| format!("serialization error: {e}"));
            println!("{json}");
        }
    }

    // --- Evaluate ---
    let mut evaluator = Evaluator::new(&mut diag);
    let exit_code = match evaluator.eval(&ir) {
        Ok(value) => {
            if args.trace {
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

    // --- Diagnostics ---
    let diag_json = diag.to_json();
    eprintln!("\n;; Diagnostics:\n{diag_json}");

    std::process::exit(exit_code);
}
