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
        "rx2dew" => {
            let path = args.get(2).ok_or("expected .rx file path after rx2dew")?;
            let src = fs::read_to_string(path).map_err(|e| format!("cannot read {}: {}", path, e))?;
            let dew = dew::rx2dew_ir::translate_rx_to_dew(&src)?;
            println!("{}", dew);
            Ok(0)
        }
        "lsp" => {
            dew::lsp::run().map_err(|e| format!("LSP error: {}", e))?;
            Ok(0)
        }
        path => {
            let emit_text = args.iter().any(|a| a == "--emit=text");
            let emit_json = args.iter().any(|a| a == "--emit=json");
            let emit_llvm = args.iter().any(|a| a == "--emit=llvm");
            let use_llvm = args.iter().any(|a| a == "--backend=llvm");
            run_file(path, emit_text, emit_json, emit_llvm, use_llvm)
        }
    }
}

/// Full compilation pipeline: lex, parse, expand imports, desugar, type-check, IR gen.
/// Uses the given DiagnosticCollector (which may have source files pre-registered).
fn compile_with_diag(src: &str, diag: &mut DiagnosticCollector) -> Result<dew::ir::module::Module, String> {
    let mut lexer = Lexer::new(src);
    let tokens = lexer.lex_all();
    let mut parser = Parser::new(tokens, diag, &src);
    let prog = parser.parse_program();
    let prog = expand_imports(prog, diag)?;
    let prog = desugar_program(&prog, diag);
    let mut resolver = NameResolver::new(diag);
    resolver.resolve(&prog);
    let mut tc = TypeChecker::new(diag);
    tc.check(&prog);
    strictness::analyze(&prog);
    let irgen = IrGenerator::new(diag);
    let module = irgen.generate(&prog);
    Ok(module)
}

/// Convenience wrapper that creates its own DiagnosticCollector.
fn compile(src: &str) -> Result<(dew::ir::module::Module, DiagnosticCollector), String> {
    let mut diag = DiagnosticCollector::new();
    let module = compile_with_diag(src, &mut diag)?;
    Ok((module, diag))
}

fn run_file(path: &str, emit_text: bool, emit_json: bool, emit_llvm: bool, use_llvm: bool) -> Result<i32, String> {
    let user_src = fs::read_to_string(path).map_err(|e| format!("cannot read {}: {}", path, e))?;
    let mut diag = DiagnosticCollector::new();
    // Register both source files so error display can look up the right one
    diag.register_source(path.to_string(), user_src.clone());
    let stdlib = load_stdlib()?;
    if !stdlib.is_empty() {
        diag.register_source("<stdlib>".into(), stdlib.clone());
    }
    let combined = if stdlib.is_empty() { user_src.clone() } else { format!("{}\n{}", stdlib, user_src) };
    diag.stdlib_lines = if stdlib.is_empty() { 0 } else { stdlib.matches('\n').count() + 1 };
    let module = compile_with_diag(&combined, &mut diag)?;

    if diag.has_errors() {
        diag.emit_all(&combined);
        return Ok(1);
    }
    if diag.has_warnings() {
        diag.emit_all(&combined);
    }

    if emit_json {
        println!("{}", serde_json::to_string_pretty(&module).map_err(|e| format!("json: {}", e))?);
        return Ok(0);
    }

    if emit_text || (!use_llvm && !emit_llvm) {
        let ir_text = display::display(&module);
        if emit_text {
            println!("{}", ir_text);
            return Ok(0);
        }
    }

    if emit_llvm || use_llvm {
        let llvm_ir = backend::llvm::generate(&module)?;
        if emit_llvm {
            println!("{}", llvm_ir);
            return Ok(0);
        }
        // Compile LLVM IR to executable and run
        return run_llvm(&llvm_ir);
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

fn run_llvm(llvm_ir: &str) -> Result<i32, String> {
    use std::process::Command;
    let dir = std::env::temp_dir();
    let ir_path = dir.join("dew_llvm.ll");
    let exe_path = dir.join("dew_llvm_out");
    fs::write(&ir_path, llvm_ir).map_err(|e| format!("write IR: {}", e))?;
    let compile = Command::new("clang")
        .arg("-x").arg("ir")
        .arg(&ir_path)
        .arg("-o").arg(&exe_path)
        .arg("-Wno-override-module")
        .status()
        .map_err(|e| format!("clang not found or failed: {}", e))?;
    if !compile.success() {
        // Fallback: try cc
        let cc = Command::new("cc")
            .arg("-x").arg("c")
            .arg("-")
            .arg("-o").arg(&exe_path)
            .status();
        if cc.is_err() || !cc.unwrap().success() {
            let _ = fs::remove_file(&ir_path);
            return Err("LLVM compilation failed (install clang)".into());
        }
    }
    let run = Command::new(&exe_path)
        .output()
        .map_err(|e| format!("run exe: {}", e))?;
    let _ = fs::remove_file(&ir_path);
    let _ = fs::remove_file(&exe_path);
    io::stdout().write_all(&run.stdout).ok();
    io::stderr().write_all(&run.stderr).ok();
    Ok(run.status.code().unwrap_or(0))
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



