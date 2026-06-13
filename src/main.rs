// Dew CLI — compiler + evaluator
use clap::Parser;
use std::{fs, process};
use dew::parser::parse_program;
use dew::ir_gen::GenCtx;
use dew::eval::Evaluator;
use dew::diagnostics::DiagnosticCollector;

#[derive(Parser)]
#[command(name = "dew")]
struct Cli {
  file: String,
  #[arg(long)]
  emit: Option<String>,
  #[arg(long)]
  trace: bool,
}

fn main() {
  let cli = Cli::parse();
  let source = fs::read_to_string(&cli.file).unwrap_or_else(|e| { eprintln!("[E001] cannot read {}: {e}", cli.file); process::exit(1); });
  let decls = parse_program(&source).unwrap_or_else(|e| { eprintln!("[E002] parse error: {e}"); process::exit(1); });
  let mut gen_ctx = GenCtx::new();
  let module = gen_ctx.compile_program(&decls);
  if let Some(_) = cli.emit { print!("{module}"); return; }
  let mut diag = DiagnosticCollector::new();
  let mut eval = Evaluator::new(&mut diag);
  if let Err(e) = eval.eval_module(&module) { diag.error(format!("eval: {e}")); diag.report(); process::exit(1); }
  match eval.call_main() {
    Ok(dew::value::Value::Int(n)) => { println!("=> {n}"); process::exit(n as i32); }
    Ok(v) => { println!("=> {v}"); }
    Err(e) => { diag.error(format!("eval: {e}")); diag.report(); process::exit(1); }
  }
}
