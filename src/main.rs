// Dew CLI
use clap::{Parser, Subcommand};
use std::{fs, process};
use dew::parser::parse_program;
use dew::ir_gen::GenCtx;
use dew::eval::Evaluator;
use dew::diagnostics::DiagnosticCollector;

#[derive(Parser)]
#[command(name = "dew")]
struct Cli {
  #[command(subcommand)]
  command: Option<Command>,
  file: Option<String>,
  #[arg(long)]
  emit: Option<String>,
  #[arg(long)]
  trace: bool,
}

#[derive(Subcommand)]
enum Command {
  Lsp,
}

fn main() {
  let cli = Cli::parse();
  if let Some(Command::Lsp) = cli.command {
    dew::lsp::run();
    return;
  }
  let file = cli.file.unwrap_or_else(|| { eprintln!("[E001] no file specified"); process::exit(1); });
  let source = fs::read_to_string(&file).unwrap_or_else(|e| { eprintln!("[E001] cannot read {file}: {e}"); process::exit(1); });
  let decls = parse_program(&source).unwrap_or_else(|e| { eprintln!("[E002] parse error: {e}"); process::exit(1); });
  let mut gen_ctx = GenCtx::new();
  let module = gen_ctx.compile_program(&decls);
  if let Some(_) = cli.emit { print!("{module}"); return; }
  let mut diag = DiagnosticCollector::new();
  let mut eval = Evaluator::new(&mut diag);

  // Register struct definitions
  for decl in &decls {
    if let dew::ast::Decl::Struct { name, fields, .. } = decl {
      eval.register_struct(name.clone(), fields.iter().map(|(n, _, _)| n.clone()).collect());
    }
  }
  // Register builtin Affine struct (stdlib)
  eval.register_struct("Affine".into(), vec!["data".into()]);
  if let Err(e) = eval.eval_module(&module) { diag.error(format!("eval: {e}")); diag.report(); process::exit(1); }
  match eval.call_main() {
    Ok(dew::value::Value::Int(n)) => { println!("=> {n}"); process::exit(n as i32); }
    Ok(v) => { println!("=> {v}"); }
    Err(e) => { diag.error(format!("eval: {e}")); diag.report(); process::exit(1); }
  }
}
