use std::fs;
use std::io::{self, Write, BufRead};
use std::path::Path;
use std::process;

use dew::diagnostics::DiagnosticCollector;
use dew::lexer::Lexer;
use dew::parser::Parser;
use dew::desugar::desugar_program;
use dew::nameres::NameResolver;
use dew::typeck::TypeChecker;
use dew::strictness;
use dew::ir::display;
use dew::ir_gen::IrGenerator;
use dew::backend;
use dew::ast::{Decl, Program};

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let result = run(&args);
    match result {
        Ok(code) => process::exit(code),
        Err(msg) => {
            eprintln!("dew: {}", msg);
            process::exit(1);
        }
    }
}

fn run(args: &[String]) -> Result<i32, String> {
    if args.len() < 2 {
        return run_repl();
    }

    match args[1].as_str() {
        "-e" => {
            let expr = args.get(2).ok_or("expected expression after -e")?;
            run_eval(expr)
        }
        "lsp" => {
            eprintln!("LSP not yet implemented");
            Ok(0)
        }
        path => {
            let emit = args.iter().any(|a| a == "--emit=text");
            let emit_json = args.iter().any(|a| a == "--emit=json");
            let use_llvm = args.iter().any(|a| a == "--backend=llvm");
            run_file(path, emit, emit_json, use_llvm)
        }
    }
}

fn run_file(path: &str, emit_text: bool, emit_json: bool, use_llvm: bool) -> Result<i32, String> {
    let stdlib = load_stdlib()?;
    let user_src = fs::read_to_string(path).map_err(|e| format!("cannot read {}: {}", path, e))?;
    let src = format!("{}\n{}", stdlib, user_src);
    let (module, diag) = compile(&src)?;

    if diag.has_errors() {
        diag.emit_all(&src);
        return Ok(1);
    }

    if emit_json {
        println!("{}", serde_json::to_string_pretty(&module).map_err(|e| format!("json: {}", e))?);
        return Ok(0);
    }

    if emit_text || !use_llvm {
        let ir_text = display::display(&module);
        if emit_text {
            println!("{}", ir_text);
            return Ok(0);
        }
    }

    if use_llvm {
        let llvm_ir = backend::llvm::generate(&module)?;
        println!("{}", llvm_ir);
        return Ok(0);
    }

    // Default: evaluate
    match backend::eval::run(&module) {
        Ok(val) => {
            match val {
                dew::value::Value::Int(n) if !emit_text => {} // already printed by stdout
                _ => {}
            }
            Ok(0)
        }
        Err(e) => Err(format!("evaluation error: {}", e)),
    }
}

fn run_eval(expr: &str) -> Result<i32, String> {
    let stdlib = load_stdlib()?;
    let src = format!("{}ndef main = fn {{ {} -> stdout; }};", stdlib, expr);
    let (module, diag) = compile(&src)?;
    if diag.has_errors() {
        diag.emit_all(&src);
        return Ok(1);
    }
    if diag.has_warnings() {
        diag.emit_all(&src);
    }
    backend::eval::run(&module).map_err(|e| format!("eval: {}", e))?;
    Ok(0)
}

fn run_repl() -> Result<i32, String> {
    println!("Dew REPL v0.1.0");
    println!("Type :q to quit, :t <expr> for type");
    let stdin = io::stdin();
    let mut line = String::new();
    let stdlib = load_stdlib()?;
    let mut env_src = stdlib;
    loop {
        print!("dew> ");
        io::stdout().flush().ok();
        line.clear();
        stdin.lock().read_line(&mut line).map_err(|e| format!("read: {}", e))?;
        let trimmed = line.trim();
        if trimmed.is_empty() { continue; }
        if trimmed == ":q" { break; }

        if let Some(rest) = trimmed.strip_prefix(":t ") {
            println!("{}", rest); // simplified
            continue;
        }

        let src = if trimmed.contains("def ") {
            env_src.push_str(trimmed);
            env_src.push('\n');
            continue;
        } else {
            format!("{}\ndef main = fn {{ {} -> stdout; }};", env_src, trimmed)
        };

        let (module, diag) = compile(&src)?;
    if diag.has_errors() {
        diag.emit_all(&src);
        return Ok(1);
    }
    if diag.has_warnings() {
        diag.emit_all(&src);
    }
        backend::eval::run(&module).map_err(|e| format!("eval: {}", e))?;
    }
    Ok(0)
}

fn load_stdlib() -> Result<String, String> {
    let stdlib_dir = Path::new("stdlib");
    if !stdlib_dir.is_dir() {
        return Ok(String::new());
    }
    let mut src = String::new();
    let entries = fs::read_dir(stdlib_dir).map_err(|e| format!("stdlib: {}", e))?;
    let mut paths: Vec<_> = entries.filter_map(|e| e.ok()).map(|e| e.path()).collect();
    paths.sort();
    for path in paths {
        if path.extension().map_or(false, |ext| ext == "dew") {
            let content = fs::read_to_string(&path)
                .map_err(|e| format!("cannot read {}: {}", path.display(), e))?;
            src.push_str(&content);
            src.push('\n');
        }
    }
    Ok(src)
}

fn expand_imports(prog: Program, diag: &mut DiagnosticCollector) -> Result<Program, String> {
    use std::collections::HashSet;
    let mut expanded = Vec::new();
    let mut visited: HashSet<String> = HashSet::new();
    expand_decls(&prog.decls, &mut expanded, &mut visited, diag)?;
    Ok(Program { decls: expanded, span: prog.span })
}

fn expand_decls(
    decls: &[Decl],
    out: &mut Vec<Decl>,
    visited: &mut std::collections::HashSet<String>,
    diag: &mut DiagnosticCollector,
) -> Result<(), String> {
    use std::path::Path;
    for decl in decls {
        if let Decl::Import(imp) = decl {
            let path = Path::new(&imp.path);
            let canonical = path.canonicalize()
                .map(|p| p.to_string_lossy().to_string())
                .unwrap_or_else(|_| imp.path.clone());
            if visited.contains(&canonical) {
                diag.warn("W007", format!("circular import detected: {}", imp.path), Some(imp.span));
                continue;
            }
            visited.insert(canonical.clone());
            let content = fs::read_to_string(path)
                .map_err(|e| format!("cannot import {}: {}", imp.path, e))?;
            let mut lexer = Lexer::new(&content);
            let tokens = lexer.lex_all();
            let mut parser = Parser::new(tokens, diag, &content);
            let imported = parser.parse_program();
            expand_decls(&imported.decls, out, visited, diag)?;
            visited.remove(&canonical);
        } else {
            out.push(decl.clone());
        }
    }
    Ok(())
}

fn compile(src: &str) -> Result<(dew::ir::module::Module, DiagnosticCollector), String> {
    let mut lexer = Lexer::new(src);
    let tokens = lexer.lex_all();
    let mut diag = DiagnosticCollector::new();
    let mut parser = Parser::new(tokens, &mut diag, src);
    let prog = parser.parse_program();
    let prog = expand_imports(prog, &mut diag)?;
    let prog = desugar_program(&prog, &mut diag);
    let mut resolver = NameResolver::new(&mut diag);
    resolver.resolve(&prog);
    let mut tc = TypeChecker::new(&mut diag);
    tc.check(&prog);
    strictness::analyze(&prog);
    let irgen = IrGenerator::new(&mut diag);
    let module = irgen.generate(&prog);
    Ok((module, diag))
}

