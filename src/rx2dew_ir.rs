// Rx → Dew source translator
// Uses the Rx parser to parse .rx files, then emits Dew source text.

use crate::rx_parser::*;
use std::collections::HashMap;

pub fn translate_rx_to_dew(src: &str) -> Result<String, String> {
    let mut parser = Parser::new(src);
    let prog = parser.parse_program()?;
    let mut out = String::new();
    let mut emitter = DewEmitter::new();
    emitter.emit_program(&prog, &mut out);
    Ok(out)
}

struct DewEmitter {
    impls: Vec<(String, Vec<FnDecl>)>, // (struct_name, methods)
    // method_name → struct_name for method call translation
    method_to_struct: HashMap<String, String>,
}

impl DewEmitter {
    fn new() -> Self {
        Self { impls: vec![], method_to_struct: HashMap::new() }
    }

    fn emit_program(&mut self, prog: &Program, out: &mut String) {
        // First pass: collect structs and impls, build method name map
        for decl in &prog.decls {
            match decl {
                Decl::Struct { name, fields } => {
                    out.push_str(&format!("struct {} {{\n", name));
                    for (fname, _) in fields {
                        out.push_str(&format!("  {}: Int,\n", fname));
                    }
                    out.push_str("}\n\n");
                }
                Decl::Impl { struct_name, methods } => {
                    self.impls.push((struct_name.clone(), methods.clone()));
                    for m in methods {
                        self.method_to_struct.insert(m.name.clone(), struct_name.clone());
                    }
                }
                _ => {}
            }
        }

        // Emit impl methods as standalone functions
        for (sname, methods) in &self.impls {
            for m in methods {
                self.emit_impl_method(sname, m, out);
            }
        }

        // Emit regular functions and const declarations
        for decl in &prog.decls {
            match decl {
                Decl::Fn(fn_decl) => self.emit_fn(fn_decl, out),
                Decl::Const { name, value } => {
                    out.push_str(&format!("def {} = {};\n\n", name, value));
                }
                _ => {}
            }
        }
    }

    fn emit_impl_method(&self, sname: &str, m: &FnDecl, out: &mut String) {
        let mut params = vec![format!("self: {}", sname)];
        for (pname, ptype) in &m.params {
            params.push(format!("{}: {}", pname, self.map_type(ptype)));
        }
        let rtype = self.map_type(&m.ret_type);
        let ret_anno = if rtype == "Unit" { String::new() } else { format!(" -> {}", rtype) };
        out.push_str(&format!("def {}__{} = fn({}){} {{\n",
            sname, m.name,
            params.join(", "),
            ret_anno));

        let prev = self.count_let_mut(&m.body);
        self.emit_body(&m.body, prev, out, 1);
        out.push_str("}\n\n");
    }

    fn emit_fn(&self, fn_decl: &FnDecl, out: &mut String) {
        let params: Vec<String> = fn_decl.params.iter()
            .map(|(n, t)| format!("{}: {}", n, self.map_type(t)))
            .collect();
        let rtype = self.map_type(&fn_decl.ret_type);
        let ret_anno = if rtype == "Unit" { String::new() } else { format!(" -> {}", rtype) };
        out.push_str(&format!("def {} = fn({}){} {{\n",
            fn_decl.name,
            params.join(", "),
            ret_anno));

        let prev = self.count_let_mut(&fn_decl.body);
        self.emit_body(&fn_decl.body, prev, out, 1);
        out.push_str("}\n\n");
    }

    fn count_let_mut(&self, body: &[Stmt]) -> usize {
        body.iter().filter(|s| matches!(s, Stmt::Let { mutable: true, .. })).count()
    }

    fn collect_loop_vars(stmts: &[Stmt]) -> Vec<String> {
        fn extract_root(expr: &Expr) -> Option<String> {
            match expr {
                Expr::Ident(name) => Some(name.clone()),
                Expr::Index(obj, _) => extract_root(obj),
                Expr::Field(obj, _) => extract_root(obj),
                Expr::Deref(inner) => extract_root(inner),
                _ => None,
            }
        }
        let mut vars = Vec::new();
        for stmt in stmts {
            match stmt {
                Stmt::Assign { lhs, .. } => {
                    if let Some(v) = extract_root(lhs) {
                        vars.push(v);
                    }
                }
                Stmt::If { then_body, else_body, .. } => {
                    vars.extend(Self::collect_loop_vars(then_body));
                    if let Some(eb) = else_body {
                        vars.extend(Self::collect_loop_vars(eb));
                    }
                }
                Stmt::While { body, .. } => {
                    vars.extend(Self::collect_loop_vars(body));
                }
                _ => {}
            }
        }
        vars.sort();
        vars.dedup();
        vars
    }

    fn emit_body(&self, body: &[Stmt], _prev_let_muts: usize, out: &mut String, indent: usize) {
        let pad = "  ".repeat(indent);
        // Phase 1: all def bindings (Dew requires def before any expressions in a block)
        for stmt in body {
            if let Stmt::Let { name, mutable: _, ty: _, init } = stmt {
                if let Some(expr) = init {
                    out.push_str(&format!("{}def {} = {};\n", pad, name, self.emit_expr(expr)));
                } else {
                    out.push_str(&format!("{}def {} = 0;\n", pad, name));
                }
            }
        }
        // Phase 2: all expression statements
        for stmt in body {
            match stmt {
                Stmt::Let { .. } | Stmt::Empty => {}
                Stmt::Assign { lhs, op, rhs } => {
                    let rhs_str = match op {
                        AssignOp::Plain => self.emit_expr(rhs),
                        AssignOp::Plus => format!("{} + {}", self.emit_expr(lhs), self.emit_expr(rhs)),
                        AssignOp::Minus => format!("{} - {}", self.emit_expr(lhs), self.emit_expr(rhs)),
                        AssignOp::Star => format!("{} * {}", self.emit_expr(lhs), self.emit_expr(rhs)),
                        AssignOp::Slash => format!("{} / {}", self.emit_expr(lhs), self.emit_expr(rhs)),
                        AssignOp::Percent => format!("{} % {}", self.emit_expr(lhs), self.emit_expr(rhs)),
                    };
                    out.push_str(&format!("{}&{} = {};\n", pad, self.emit_expr(lhs), rhs_str));
                }
                Stmt::While { cond, body } => {
                    let cond_str = format!("({})", self.emit_expr(cond));
                    let vars = Self::collect_loop_vars(body);
                    let params: Vec<String> = vars.iter().map(|v| format!("&{}: Int", v)).collect();
                    let call_args: Vec<String> = vars.iter().map(|v| format!("&{}", v)).collect();
                    let ret_var = vars.last().cloned().unwrap_or_default();

                    if vars.is_empty() {
                        out.push_str(&format!("{}fix loop {{ fn() -> Unit {{\n", pad));
                        out.push_str(&format!("{}  if {} {{\n", pad, cond_str));
                        self.emit_body(body, 0, out, indent + 2);
                        out.push_str(&format!("{}    loop()\n", pad));
                        out.push_str(&format!("{}  }} else {{ Unit }}\n", pad));
                        out.push_str(&format!("{}  }} }}();\n", pad));
                    } else {
                        out.push_str(&format!("{}fix loop {{\n", pad));
                        out.push_str(&format!("{}  fn({}) -> Int {{\n", pad, params.join(", ")));
                        out.push_str(&format!("{}    if {} {{\n", pad, cond_str));
                        self.emit_body(body, 0, out, indent + 3);
                        out.push_str(&format!("{}      loop({})\n", pad, call_args.join(", ")));
                        out.push_str(&format!("{}    }} else {{ {} }}\n", pad, ret_var));
                        out.push_str(&format!("{}  }}\n", pad));
                        out.push_str(&format!("{}}}({});\n", pad, call_args.join(", ")));
                    }
                }
                Stmt::If { cond, then_body, else_body } => {
                    let cond_str = format!("({})", self.emit_expr(cond));
                    out.push_str(&format!("{}if {} {{\n", pad, cond_str));
                    self.emit_body(then_body, 0, out, indent + 1);
                    out.push_str(&format!("{}}} ", pad));
                    match else_body {
                        Some(else_b) => {
                            out.push_str(&format!("else {{\n"));
                            self.emit_body(else_b, 0, out, indent + 1);
                            out.push_str(&format!("{}}};", pad));
                        }
                        None => {
                            out.push_str(&format!("else {{ Unit }};"));
                        }
                    }
                    out.push_str("\n");
                }
                Stmt::Return(Some(expr)) => {
                    out.push_str(&format!("{}{}\n", pad, self.emit_expr(expr)));
                }
                Stmt::Return(None) => {
                    out.push_str(&format!("{}Unit\n", pad));
                }
                Stmt::Continue => {
                    out.push_str(&format!("{}// continue\n", pad));
                }
                Stmt::Empty => {}
                Stmt::Expr(expr) => {
                    // printlnInt(x) → x -> stdout; 10 -> stdout (add newline)
                    if let Expr::Call { func, .. } = expr {
                        if let Expr::Ident(name) = func.as_ref() {
                            if name == "printlnInt" {
                                out.push_str(&format!("{}{};\n", pad, self.emit_expr(expr)));
                                out.push_str(&format!("{}'\\n' -> stdout;\n", pad));
                                continue;
                            }
                        }
                    }
                    out.push_str(&format!("{}{};\n", pad, self.emit_expr(expr)));
                }
            }
        }
    }

    fn emit_expr(&self, expr: &Expr) -> String {
        match expr {
            Expr::Int(n) => n.to_string(),
            Expr::Bool(b) => if *b { "true".into() } else { "false".into() },
            Expr::Str(s) => format!("\"{}\"", s),
            Expr::Ident(name) => {
                match name.as_str() {
                    "getInt" => "stdin(0)".into(),
                    "exit" => "0".into(),
                    _ => name.replace("::", "__"),
                }
            }
            Expr::Binary(left, op, right) => {
                let op_str = match op {
                    BinOp::Add => "+", BinOp::Sub => "-", BinOp::Mul => "*", BinOp::Div => "/", BinOp::Rem => "%",
                    BinOp::Eq => "==", BinOp::Ne => "!=", BinOp::Lt => "<", BinOp::Gt => ">",
                    BinOp::Le => "<=", BinOp::Ge => ">=", BinOp::And => "&&", BinOp::Or => "||",
                    BinOp::BitAnd => "&", BinOp::BitOr => "|", BinOp::BitXor => "^",
                    BinOp::Shl => "<<", BinOp::Shr => ">>",
                };
                format!("{} {} {}", self.emit_expr(left), op_str, self.emit_expr(right))
            }
            Expr::Unary(op, expr) => {
                let inner = self.emit_expr(expr);
                match op {
                    UnOp::Neg => format!("-{}", inner),
                    UnOp::Not => format!("(not {})", inner),
                }
            }
            Expr::Call { func, args } => {
                let func_str = self.emit_expr(func);
                let args_str: Vec<String> = args.iter().map(|a| self.emit_expr(a)).collect();

                // Handle printlnInt(x) → x -> Stdout
                if func_str == "printlnInt" || func_str == "printInt" {
                    if let Some(arg) = args_str.first() {
                        return format!("{} -> stdout", arg);
                    }
                }
                // Handle method calls: obj.method(args) → Struct__method(self, args)
                if func_str.contains('.') {
                    let parts: Vec<&str> = func_str.split('.').collect();
                    if parts.len() == 2 {
                        let method = parts[1];
                        let self_expr = parts[0];
                        // Look up struct name from method name
                        let fn_name = if let Some(sname) = self.method_to_struct.get(method) {
                            format!("{}__{}", sname, method)
                        } else {
                            method.to_string()
                        };
                        let all_args = if args_str.is_empty() {
                            self_expr.to_string()
                        } else {
                            format!("{}, {}", self_expr, args_str.join(", "))
                        };
                        return format!("{}({})", fn_name, all_args);
                    }
                }
                format!("{}({})", func_str, args_str.join(", "))
            }
            Expr::Field(obj, field) => {
                format!("{}.{}", self.emit_expr(obj), field)
            }
            Expr::Index(obj, idx) => {
                format!("{}[{}]", self.emit_expr(obj), self.emit_expr(idx))
            }
            Expr::StructLit { name, fields } => {
                let args: Vec<String> = fields.iter()
                    .map(|(f, v)| format!("{}: {}", f, self.emit_expr(v)))
                    .collect();
                format!("{} {{ {} }}", name, args.join(", "))
            }
            Expr::ArrayLit { elements, repeat: None } => {
                let elems: Vec<String> = elements.iter().map(|e| self.emit_expr(e)).collect();
                format!("[{}]", elems.join(", "))
            }
            Expr::ArrayLit { elements, repeat: Some(count) } => {
                let elem = if elements.is_empty() { "0".into() } else { self.emit_expr(&elements[0]) };
                let cnt = self.emit_expr(count);
                // Dew requires literal integer for array fill count; use 0 for variables
                let cnt = match count.as_ref() {
                    Expr::Int(_) => cnt,
                    _ => "0".to_string(),
                };
                format!("[{}; {}]", elem, cnt)
            }
            Expr::Cast(expr, _) => self.emit_expr(expr),
            Expr::Ref(expr) => self.emit_expr(expr),
            Expr::Deref(expr) => self.emit_expr(expr),
            Expr::If { cond, then_body, else_body } => {
                let then_s = self.emit_stmts(then_body);
                let else_s = self.emit_stmts(else_body);
                format!("if ({}) {{ {} }} else {{ {} }}", self.emit_expr(cond), then_s, else_s)
            }
            Expr::Block(stmts) => {
                let s = self.emit_stmts(stmts);
                format!("{{ {} }}", s)
            }
        }
    }

    fn emit_stmts(&self, stmts: &[Stmt]) -> String {
        let buf = &mut String::new();
        self.emit_body(stmts, 0, buf, 0);
        buf.trim_end().to_string()
    }

    fn map_type(&self, t: &str) -> String {
        let t = t.replace("i32", "Int").replace("usize", "Int")
            .replace("bool", "Bool").replace("()", "Unit");
        // Simplify reference types
        let t = t.replace("&mut ", "").replace("&", "");
        // Simplify array types
        if t.contains('[') { "Int".into() } else { t }
    }
}
