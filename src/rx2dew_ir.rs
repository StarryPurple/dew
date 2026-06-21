// Rx → Dew source translator
// Uses the Rx parser to parse .rx files, then emits Dew source text.

use crate::rx_parser::*;
use std::cell::RefCell;
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
    method_to_struct: HashMap<String, String>,
    const_values: HashMap<String, String>, // const_name → resolved value
    var_types: RefCell<HashMap<String, String>>, // variable_name → Dew type string
    while_ctx: RefCell<Option<WhileCtx>>, // current while loop context for break/continue
    nested_fns: RefCell<Vec<FnDecl>>,     // fn declarations nested inside function bodies
}

/// Context for translating break/continue inside a while loop.
struct WhileCtx {
    loop_fn: String,    // e.g., "__while_loop"
    accumulator: String, // variable to return on break (last mutable var)
    call_args: Vec<String>, // borrow args for recursive call
}

impl DewEmitter {
    fn new() -> Self {
        Self {
            impls: vec![], method_to_struct: HashMap::new(),
            const_values: HashMap::new(), var_types: RefCell::new(HashMap::new()),
            while_ctx: RefCell::new(None),
            nested_fns: RefCell::new(vec![]),
        }
    }

    fn emit_program(&mut self, prog: &Program, out: &mut String) {
        // First pass: collect structs, impls, and const values
        for decl in &prog.decls {
            match decl {
                Decl::Struct { name, fields } => {
                    out.push_str(&format!("struct {} {{\n", name));
                    for (fname, ftype) in fields {
                        out.push_str(&format!("  {}: {},\n", fname, self.map_type(ftype)));
                    }
                    out.push_str("}\n\n");
                }
                Decl::Impl { struct_name, methods } => {
                    self.impls.push((struct_name.clone(), methods.clone()));
                    for m in methods {
                        self.method_to_struct.insert(m.name.clone(), struct_name.clone());
                    }
                }
                Decl::Const { name, value } => {
                    self.const_values.insert(name.clone(), value.clone());
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
        self.var_types.borrow_mut().clear();
        if m.has_self {
            self.var_types.borrow_mut().insert("self".into(), sname.into());
        }
        for (n, t) in &m.params {
            self.var_types.borrow_mut().insert(n.clone(), self.map_type(t));
        }
        let mut params = if m.has_self {
            vec![format!("self: {}", sname)]
        } else {
            vec![]
        };
        for (pname, ptype) in &m.params {
            params.push(format!("{}: {}", pname, self.map_type(ptype)));
        }
        let rtype = self.map_type(&m.ret_type);
        let has_io = has_io_in_stmts(&m.body);
        let ret_anno = if rtype == "Unit" {
            if has_io { " -> IO Unit".into() } else { String::new() }
        } else {
            if has_io { format!(" -> IO {}", rtype) } else { format!(" -> {}", rtype) }
        };
        out.push_str(&format!("def {}__{} = fn({}){} {{\n",
            sname, m.name,
            params.join(", "),
            ret_anno));

        let prev = self.count_let_mut(&m.body);
        self.emit_body(&m.body, prev, out, 1);
        out.push_str("}\n\n");

        loop {
            let fns = self.nested_fns.borrow_mut().drain(..).collect::<Vec<_>>();
            if fns.is_empty() { break; }
            for fd in fns {
                self.emit_fn(&fd, out);
            }
        }
    }

    fn emit_fn(&self, fn_decl: &FnDecl, out: &mut String) {
        // Set up variable types for the function scope
        self.var_types.borrow_mut().clear();
        for (n, t) in &fn_decl.params {
            self.var_types.borrow_mut().insert(n.clone(), self.map_type(t));
        }
        let params: Vec<String> = fn_decl.params.iter()
            .map(|(n, t)| format!("{}: {}", n, self.map_type(t)))
            .collect();
        let mut rtype = self.map_type(&fn_decl.ret_type);
        let has_io = has_io_in_stmts(&fn_decl.body);
        let ret_anno = if rtype == "Unit" {
            if has_io { " -> IO Unit".into() } else { String::new() }
        } else {
            if has_io { format!(" -> IO {}", rtype) } else { format!(" -> {}", rtype) }
        };
        out.push_str(&format!("def {} = fn({}){} {{\n",
            fn_decl.name,
            params.join(", "),
            ret_anno));

        let prev = self.count_let_mut(&fn_decl.body);
        self.emit_body(&fn_decl.body, prev, out, 1);
        out.push_str("}\n\n");

        // Emit any nested fn declarations collected during emit_body
        loop {
            let fns = self.nested_fns.borrow_mut().drain(..).collect::<Vec<_>>();
            if fns.is_empty() { break; }
            for fd in fns {
                self.emit_fn(&fd, out);
            }
        }
    }

    fn count_let_mut(&self, body: &[Stmt]) -> usize {
        body.iter().filter(|s| matches!(s, Stmt::Let { mutable: true, .. })).count()
    }

    fn collect_loop_vars(&self, stmts: &[Stmt]) -> Vec<(String, String)> {
        // First pass: collect variables defined inside this scope (from Stmt::Let)
        fn collect_locals(stmts: &[Stmt]) -> std::collections::HashSet<String> {
            let mut locals = std::collections::HashSet::new();
            for stmt in stmts {
                match stmt {
                    Stmt::Let { name, .. } => { locals.insert(name.clone()); }
                    Stmt::If { then_body, else_body, .. } => {
                        locals.extend(collect_locals(then_body));
                        if let Some(eb) = else_body { locals.extend(collect_locals(eb)); }
                    }
                    Stmt::While { body, .. } => { locals.extend(collect_locals(body)); }
                    _ => {}
                }
            }
            locals
        }
        let locals = collect_locals(stmts);
        fn extract_root(expr: &Expr) -> Option<String> {
            match expr {
                Expr::Ident(name) => Some(name.clone()),
                Expr::Index(obj, _) => extract_root(obj),
                Expr::Field(obj, _) => extract_root(obj),
                Expr::Deref(inner) => extract_root(inner),
                _ => None,
            }
        }
        // Filter recursively collected vars against outer locals
        let filter_locals = |v: &[(String, String)]| -> Vec<(String, String)> {
            v.iter().filter(|(n, _)| !locals.contains(n)).cloned().collect()
        };
        let mut vars = Vec::new();
        for stmt in stmts {
            match stmt {
                Stmt::Assign { lhs, .. } => {
                    if let Some(v) = extract_root(lhs) {
                        if !locals.contains(&v) {
                            let ty = self.var_types.borrow().get(&v)
                                .cloned().unwrap_or_else(|| "Int".into());
                            vars.push((v, ty));
                        }
                    }
                }
                Stmt::If { then_body, else_body, .. } => {
                    vars.extend(filter_locals(&self.collect_loop_vars(then_body)));
                    if let Some(eb) = else_body {
                        vars.extend(filter_locals(&self.collect_loop_vars(eb)));
                    }
                }
                Stmt::While { body, .. } => {
                    vars.extend(filter_locals(&self.collect_loop_vars(body)));
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
        let last_idx = body.len().saturating_sub(1);
        let mut seen_return = false;
        for (idx, stmt) in body.iter().enumerate() {
            if seen_return { break; }
            let is_last = idx == last_idx;
            match stmt {
                Stmt::Let { name, mutable: _, ty, init } => {
                    let dew_ty = if ty.is_empty() { "Int".into() } else { self.map_type(ty) };
                    let dew_ty_str = dew_ty.clone();
                    self.var_types.borrow_mut().insert(name.clone(), dew_ty);
                    if let Some(expr) = init {
                        if is_getint_call(expr) {
                            out.push_str(&format!("{}def {}: {};\n", pad, name, dew_ty_str));
                            out.push_str(&format!("{}&{} -> stdin;\n", pad, name));
                        } else {
                            out.push_str(&format!("{}def {} = {};\n", pad, name, self.emit_expr(expr)));
                        }
                    } else {
                        out.push_str(&format!("{}def {}: {};\n", pad, name, dew_ty_str));
                    }
                }
                Stmt::Assign { lhs, op, rhs } => {
                    let rhs_str = match op {
                        AssignOp::Plain => self.emit_expr(rhs),
                        AssignOp::Plus => format!("{} + {}", self.emit_expr(lhs), self.emit_expr(rhs)),
                        AssignOp::Minus => format!("{} - {}", self.emit_expr(lhs), self.emit_expr(rhs)),
                        AssignOp::Star => format!("{} * {}", self.emit_expr(lhs), self.emit_expr(rhs)),
                        AssignOp::Slash => format!("{} / {}", self.emit_expr(lhs), self.emit_expr(rhs)),
                        AssignOp::Percent => format!("{} % {}", self.emit_expr(lhs), self.emit_expr(rhs)),
                    };
                    // Simple identifier: def x = rhs (works inline now that parser supports it).
                    // Compound lvalue (arr[k], x.f): still needs & for borrow syntax.
                    if let Expr::Ident(name) = lhs {
                        out.push_str(&format!("{}def {} = {};\n", pad, name, rhs_str));
                    } else {
                        out.push_str(&format!("{}&{} = {};\n", pad, self.emit_expr(lhs), rhs_str));
                    }
                }
                Stmt::While { cond, body } => {
                    let cond_str = format!("({})", self.emit_expr(cond));
                    let vars = self.collect_loop_vars(body);
                    let params: Vec<String> = vars.iter().map(|(n, t)| format!("&{}: {}", n, t)).collect();
                    let call_args: Vec<String> = vars.iter().map(|(n, _)| format!("&{}", n)).collect();
                    let (ret_var, ret_var_ty) = vars.last().map(|(n, t)| (n.clone(), t.clone())).unwrap_or_default();

                    let saved_ctx = self.while_ctx.borrow_mut().replace(WhileCtx {
                        loop_fn: "__while_loop".into(),
                        accumulator: ret_var.clone(),
                        call_args: call_args.clone(),
                    });

                    if vars.is_empty() {
                        out.push_str(&format!("{}fix __while_loop {{ fn() -> Unit {{\n", pad));
                        out.push_str(&format!("{}  if {} {{\n", pad, cond_str));
                        self.emit_body(body, 0, out, indent + 2);
                        // Ensure the last body statement has a semicolon before __while_loop
                        while out.ends_with('\n') { out.pop(); }
                        if !out.ends_with(';') { out.push_str(";"); }
                        out.push_str(&format!("\n{}    __while_loop()\n", pad));
                        out.push_str(&format!("{}  }} else {{ Unit }}\n", pad));
                        out.push_str(&format!("{}  }} }}();\n", pad));
                    } else {
                        let ret_anno = if ret_var_ty.is_empty() { String::new() } else { format!(" -> {}", ret_var_ty) };
                        out.push_str(&format!("{}fix __while_loop {{\n", pad));
                        out.push_str(&format!("{}  fn({}){} {{\n", pad, params.join(", "), ret_anno));
                        out.push_str(&format!("{}    if {} {{\n", pad, cond_str));
                        self.emit_body(body, 0, out, indent + 3);
                        // Ensure the last body statement has a semicolon before __while_loop
                        while out.ends_with('\n') { out.pop(); }
                        if !out.ends_with(';') { out.push_str(";"); }
                        out.push_str(&format!("\n{}      __while_loop({})\n", pad, call_args.join(", ")));
                        out.push_str(&format!("{}    }} else {{ {} }}\n", pad, ret_var));
                        out.push_str(&format!("{}  }}\n", pad));
                        out.push_str(&format!("{}}}({});\n", pad, call_args.join(", ")));
                    }
                    *self.while_ctx.borrow_mut() = saved_ctx;
                }
                Stmt::If { cond, then_body, else_body } => {
                    let cond_str = format!("({})", self.emit_expr(cond));
                    out.push_str(&format!("{}if {} {{\n", pad, cond_str));
                    self.emit_body(then_body, 0, out, indent + 1);
                    out.push_str(&format!("{}}}", pad));
                    match else_body {
                        Some(else_b) => {
                            out.push_str(&format!(" else {{\n"));
                            self.emit_body(else_b, 0, out, indent + 1);
                            out.push_str(&format!("{}}}", pad));
                        }
                        None => {
                            out.push_str(&format!(" else {{ Unit }}"));
                        }
                    }
                    if !is_last { out.push_str(";"); }
                    out.push_str("\n");
                }
                Stmt::Return(Some(expr)) => {
                    out.push_str(&format!("{}{}\n", pad, self.emit_expr(expr)));
                    seen_return = true;
                }
                Stmt::Return(None) => {
                    out.push_str(&format!("{}Unit\n", pad));
                    seen_return = true;
                }
                Stmt::Continue => {
                    let ctx = self.while_ctx.borrow();
                    if let Some(ctx) = ctx.as_ref() {
                        out.push_str(&format!("{}__while_loop({});\n", pad, ctx.call_args.join(", ")));
                    }
                }
                Stmt::Empty => {}
                Stmt::FnDecl(fd) => {
                    self.nested_fns.borrow_mut().push(fd.clone());
                }
                Stmt::Expr(expr) => {
                    if let Expr::Ident(name) = expr {
                        if name == "break" {
                            let ctx = self.while_ctx.borrow();
                            if let Some(ctx) = ctx.as_ref() {
                                out.push_str(&format!("{}{};\n", pad, ctx.accumulator));
                            }
                            continue;
                        }
                    }
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
                    let sep = if is_last { "" } else { ";" };
                    out.push_str(&format!("{}{}{}\n", pad, self.emit_expr(expr), sep));
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
                // Resolve const references to their values
                if let Some(val) = self.const_values.get(name.as_str()) {
                    return val.clone();
                }
                match name.as_str() {
                    "getInt" => "stdin(0)".into(),
                    "exit" => "Unit".into(),
                    _ => name.replace("::", "__"),
                }
            }
            Expr::Binary(left, op, right) => {
                // Try to evaluate constant expressions at translation time
                if let Some(val) = self.eval_const_expr(expr) {
                    return val.to_string();
                }
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
                        // Resolve method: prefer var_types of self_expr (disambiguates
                        // duplicate method names like AVLTree.search vs HashTable.search),
                        // then fall back to method_to_struct.
                        let fn_name = if let Some(obj_type) = self.var_types.borrow().get(self_expr) {
                            let candidate = format!("{}__{}", obj_type, method);
                            // Only use candidate if the struct actually has this method
                            if self.impls.iter().any(|(sname, methods)| {
                                sname == obj_type && methods.iter().any(|m| m.name == method)
                            }) {
                                candidate
                            } else if let Some(sname) = self.method_to_struct.get(method) {
                                format!("{}__{}", sname, method)
                            } else {
                                method.to_string()
                            }
                        } else if let Some(sname) = self.method_to_struct.get(method) {
                            format!("{}__{}", sname, method)
                        } else {
                            method.to_string()
                        };
                        // Check if the target method has borrow self (&self).
                        // If so, pass self_expr as &self_expr so mutations persist.
                        // Only add & when self_expr is a simple variable, field access,
                        // or index — NOT when it contains a function call (has '('),
                        // since &(expr()) is not valid Dew syntax.
                        let has_borrow_self = self.impls.iter().any(|(_, methods)| {
                            methods.iter().any(|m| m.name == method && m.has_self)
                        });
                        let can_borrow = !self_expr.contains('(')
                            && !self_expr.contains(')');
                        let self_arg = if has_borrow_self && can_borrow {
                            format!("&{}", self_expr)
                        } else {
                            self_expr.to_string()
                        };
                        let all_args = if args_str.is_empty() {
                            self_arg
                        } else {
                            format!("{}, {}", self_arg, args_str.join(", "))
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
                let cnt = match self.eval_const_expr(count) {
                    Some(n) => n.to_string(),
                    None => "0".to_string(),
                };
                format!("[{}; {}]", elem, cnt)
            }
            Expr::Group(inner) => format!("({})", self.emit_expr(inner)),
            Expr::Cast(expr, ty) => format!("{} as {}", self.emit_expr(expr), self.map_type(ty)),
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
            .replace("isize", "Int").replace("i64", "Int").replace("i8", "Int")
            .replace("u32", "Int").replace("u64", "Int").replace("u8", "Int")
            .replace("bool", "Bool").replace("()", "Unit");
        // Simplify reference types
        let t = t.replace("&mut ", "").replace("&", "");
        // Resolve const references in array types: [SegT; MAXSEG] → Array(SegT, 2000)
        if t.starts_with('[') && t.contains(';') {
            let semi_pos = t.find(';').unwrap();
            let elem = t[1..semi_pos].trim();
            let size_str = t[semi_pos+1..].trim_end_matches(']').trim();
            // Resolve const names and evaluate expressions in size
            let resolved = self.resolve_and_eval(size_str);
            return format!("[{}; {}]", elem, resolved);
        }
        t
    }

    /// Resolve const names in an expression and evaluate it
    fn resolve_and_eval(&self, s: &str) -> String {
        // First try to evaluate as a simple integer expression
        // by resolving const references
        let mut result = String::new();
        let mut buf = String::new();
        for c in s.chars() {
            if c.is_alphanumeric() || c == '_' {
                buf.push(c);
            } else {
                if !buf.is_empty() {
                    if let Some(val) = self.const_values.get(&buf) {
                        result.push_str(val);
                    } else {
                        result.push_str(&buf);
                    }
                    buf.clear();
                }
                result.push(c);
            }
        }
        if !buf.is_empty() {
            if let Some(val) = self.const_values.get(&buf) {
                result.push_str(val);
            } else {
                result.push_str(&buf);
            }
        }
        // Try to evaluate the expression
        if let Ok(val) = self.eval_simple_expr(&result) {
            return val.to_string();
        }
        result
    }

    /// Evaluate simple integer expressions left-to-right: 200+1, 10*5, etc.
    fn eval_simple_expr(&self, s: &str) -> Result<i64, ()> {
        let s = s.trim();
        if let Ok(n) = s.parse::<i64>() { return Ok(n); }
        let mut acc: i64 = 0;
        let mut op = '+';
        let mut i = 0;
        let chars: Vec<char> = s.chars().collect();
        while i < chars.len() {
            if chars[i].is_whitespace() { i += 1; continue; }
            if chars[i] == '+' || chars[i] == '-' || chars[i] == '*' { op = chars[i]; i += 1; continue; }
            let start = i;
            while i < chars.len() && chars[i].is_ascii_digit() { i += 1; }
            if start == i { return Err(()); }
            let n: i64 = s[start..i].parse().map_err(|_| ())?;
            match op {
                '+' => acc += n,
                '-' => acc -= n,
                '*' => acc *= n,
                _ => return Err(()),
            }
        }
        Ok(acc)
    }

    /// Evaluate a const expression (const refs + simple arithmetic).
    fn eval_const_expr(&self, expr: &Expr) -> Option<i64> {
        match expr {
            Expr::Int(n) => Some(*n),
            Expr::Ident(name) => {
                self.const_values.get(name.as_str())?.parse::<i64>().ok()
            }
            Expr::Binary(l, BinOp::Add, r) => {
                Some(self.eval_const_expr(l)? + self.eval_const_expr(r)?)
            }
            Expr::Binary(l, BinOp::Sub, r) => {
                Some(self.eval_const_expr(l)? - self.eval_const_expr(r)?)
            }
            Expr::Binary(l, BinOp::Mul, r) => {
                Some(self.eval_const_expr(l)? * self.eval_const_expr(r)?)
            }
            _ => None,
        }
    }
}
fn has_io_in_stmts(stmts: &[Stmt]) -> bool {
    fn has_io_in_expr(expr: &Expr) -> bool {
        match expr {
            Expr::Ident(name) => {
                matches!(name.as_str(), "stdout" | "stdin" | "getInt" | "printlnInt" | "printInt" | "exit")
            }
            Expr::Call { func, args } => {
                if let Expr::Ident(name) = func.as_ref() {
                    if matches!(name.as_str(), "printlnInt" | "printInt" | "getInt") {
                        return true;
                    }
                }
                has_io_in_expr(func) || args.iter().any(|a| has_io_in_expr(a))
            }
            Expr::Binary(l, _, r) => has_io_in_expr(l) || has_io_in_expr(r),
            Expr::Unary(_, e) => has_io_in_expr(e),
            Expr::Field(e, _) => has_io_in_expr(e),
            Expr::Index(e, i) => has_io_in_expr(e) || has_io_in_expr(i),
            Expr::StructLit { fields, .. } => fields.iter().any(|(_, v)| has_io_in_expr(v)),
            Expr::ArrayLit { elements, repeat, .. } => {
                elements.iter().any(|e| has_io_in_expr(e))
                    || repeat.as_ref().map_or(false, |r| has_io_in_expr(r))
            }
            Expr::Cast(e, _) => has_io_in_expr(e),
            Expr::Ref(e) => has_io_in_expr(e),
            Expr::Deref(e) => has_io_in_expr(e),
            Expr::If { cond, then_body, else_body } => {
                has_io_in_expr(cond)
                    || has_io_in_stmts(then_body)
                    || has_io_in_stmts(else_body)
            }
            Expr::Block(stmts) => has_io_in_stmts(stmts),
            Expr::Group(inner) => has_io_in_expr(inner),
            _ => false,
        }
    }
    stmts.iter().any(|s| match s {
        Stmt::Let { init, .. } => init.as_ref().map_or(false, |e| has_io_in_expr(e)),
        Stmt::Assign { lhs, rhs, .. } => has_io_in_expr(lhs) || has_io_in_expr(rhs),
        Stmt::While { cond, body } => has_io_in_expr(cond) || has_io_in_stmts(body),
        Stmt::If { cond, then_body, else_body } => {
            has_io_in_expr(cond)
                || has_io_in_stmts(then_body)
                || else_body.as_ref().map_or(false, |b| has_io_in_stmts(b))
        }
        Stmt::FnDecl(fd) => has_io_in_stmts(&fd.body),
        Stmt::Return(Some(e)) => has_io_in_expr(e),
        Stmt::Expr(e) => has_io_in_expr(e),
        _ => false,
    })
}

/// Check if an expression is a direct call to getInt().
fn is_getint_call(expr: &Expr) -> bool {
    matches!(expr, Expr::Ident(s) if s == "getInt")
        || matches!(expr, Expr::Call { func, .. } if matches!(func.as_ref(), Expr::Ident(s) if s == "getInt"))
}
