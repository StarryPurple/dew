// Rx → Dew source translator.
// Uses rx_parser to parse .rx files, then emits Dew source text
// using the new Dew native while/if borrow syntax.

use crate::rx_parser::*;
use std::collections::HashMap;

pub fn translate_rx_to_dew(src: &str) -> Result<String, String> {
    let mut parser = Parser::new(src);
    let prog = parser.parse_program()?;
    let mut out = String::new();
    let mut ctx = Ctx::new();
    ctx.emit_program(&prog, &mut out);
    Ok(out)
}

/// Collects metadata from declarations before emitting.
struct Ctx {
    struct_field_order: HashMap<String, Vec<String>>,  // struct_name → ordered field names
    method_map: HashMap<String, String>,               // method_name → struct_name
    const_values: HashMap<String, String>,             // const_name → parsed value string
    var_types: HashMap<String, String>,                // variable → type string (tracked during emit)
    in_while: bool,                                     // true when emitting inside a while body
}

impl Ctx {
    fn new() -> Self {
        Self {
            struct_field_order: HashMap::new(),
            method_map: HashMap::new(),
            const_values: HashMap::new(),
            var_types: HashMap::new(),
            in_while: false,
        }
    }

    fn map_type(&self, t: &str) -> String {
        match t.trim() {
            "i32" | "u32" | "i64" | "u64" | "i8" | "u8" | "isize" | "usize" | "Int" => "Int".into(),
            "bool" | "Bool" => "Bool".into(),
            "()" | "Unit" => "Unit".into(),
            "char" | "Char" => "Char".into(),
            other => other.to_string(),
        }
    }

    fn emit_program(&mut self, prog: &Program, out: &mut String) {
        // Pass 0: collect const values, struct fields, method mappings
        for decl in &prog.decls {
            match decl {
                Decl::Const { name, value } => {
                    self.const_values.insert(name.clone(), value.clone());
                }
                Decl::Struct { name, fields } => {
                    let order: Vec<String> = fields.iter().map(|(n, _)| n.clone()).collect();
                    self.struct_field_order.insert(name.clone(), order);
                }
                Decl::Impl { struct_name, methods } => {
                    for m in methods {
                        self.method_map.insert(m.name.clone(), struct_name.clone());
                    }
                }
                _ => {}
            }
        }

        // Pass 1: emit struct declarations (with const propagation in types)
        for decl in &prog.decls {
            if let Decl::Struct { name, fields } = decl {
                out.push_str(&format!("struct {} {{\n", name));
                for (fname, ftype) in fields {
                    let mt = self.const_propagate_type(ftype);
                    out.push_str(&format!("  {}: {},\n", fname, self.map_type(&mt)));
                }
                out.push_str("}\n\n");
            }
        }

        // Pass 2: emit impl methods as standalone functions
        for decl in &prog.decls {
            if let Decl::Impl { struct_name, methods } = decl {
                for m in methods {
                    self.emit_impl_method(struct_name, m, out);
                }
            }
        }

        // Pass 3: emit standalone functions
        // (const declarations are removed — values are propagated in expressions)
        for decl in &prog.decls {
            if let Decl::Fn(fd) = decl {
                if fd.name != "main" && !self.method_map.contains_key(&fd.name) {
                    self.emit_fn(fd, out);
                }
            }
        }

        // Pass 4: emit main function last (entry point)
        for decl in &prog.decls {
            if let Decl::Fn(fd) = decl {
                if fd.name == "main" {
                    out.push_str("def main = fn {\n");
                    self.var_types.clear();
                    self.emit_body(&fd.body, 0, out, 1);
                    out.push_str("};\n");
                }
            }
        }
    }

    fn const_propagate_type(&self, t: &str) -> String {
        let mut result = t.to_string();
        for (name, val) in &self.const_values {
            result = result.replace(name, val);
        }
        result
    }

    fn const_propagate_expr_str(&self, s: &str) -> String {
        let mut result = s.to_string();
        for (name, val) in &self.const_values {
            result = result.replace(name, val);
        }
        result
    }

    fn emit_impl_method(&mut self, sname: &str, m: &FnDecl, out: &mut String) {
        self.var_types.clear();
        if m.has_self {
            self.var_types.insert("self".into(), sname.into());
        }
        for (n, t) in &m.params {
            let mt = self.const_propagate_type(t);
            self.var_types.insert(n.clone(), self.map_type(&mt).to_string());
        }

        let func_name = format!("{}_{}", sname, m.name);
        let mut params = Vec::new();
        if m.has_self {
            params.push(format!("&self: {}", sname));
        }
        for (pname, ptype) in &m.params {
            let mt = self.const_propagate_type(ptype);
            let is_borrow = mt.starts_with("&mut ") || mt.starts_with("&");
            let clean_ty = mt.trim_start_matches("&mut ").trim_start_matches("&").trim().to_string();
            let mapped = self.map_type(&clean_ty).to_string();
            if is_borrow {
                params.push(format!("&{}: {}", pname, mapped));
            } else {
                params.push(format!("{}: {}", pname, mapped));
            }
        }

        let ret = self.map_type(&self.const_propagate_type(&m.ret_type));
        let ret_anno = if ret == "Unit" { String::new() } else { format!(" -> {}", ret) };
        out.push_str(&format!("def {} = fn({}){} {{\n", func_name, params.join(", "), ret_anno));

        let prev = self.count_let_mut(&m.body);
        self.emit_body(&m.body, prev, out, 1);
        out.push_str("}\n\n");
    }

    fn emit_fn(&mut self, fd: &FnDecl, out: &mut String) {
        self.var_types.clear();
        for (n, t) in &fd.params {
            let mt = self.const_propagate_type(t);
            self.var_types.insert(n.clone(), self.map_type(&mt).to_string());
        }
        let mut params = Vec::new();
        for (pname, ptype) in &fd.params {
            let mt = self.const_propagate_type(ptype);
            let is_borrow = mt.starts_with("&mut ") || mt.starts_with("&");
            let clean_ty = mt.trim_start_matches("&mut ").trim_start_matches("&").trim().to_string();
            let mapped = self.map_type(&clean_ty).to_string();
            if is_borrow {
                params.push(format!("&{}: {}", pname, mapped));
            } else {
                params.push(format!("{}: {}", pname, mapped));
            }
        }
        let ret = self.map_type(&self.const_propagate_type(&fd.ret_type));
        let ret_anno = if ret == "Unit" { String::new() } else { format!(" -> {}", ret) };
        out.push_str(&format!("def {} = fn({}){} {{\n", fd.name, params.join(", "), ret_anno));

        let prev = self.count_let_mut(&fd.body);
        self.emit_body(&fd.body, prev, out, 1);
        out.push_str("}\n\n");
    }

    fn count_let_mut(&self, body: &[Stmt]) -> usize {
        body.iter().filter(|s| matches!(s, Stmt::Let { mutable: true, .. })).count()
    }

    fn emit_body(&mut self, body: &[Stmt], _prev_let_muts: usize, out: &mut String, indent: usize) {
        let pad = "  ".repeat(indent);
        let last_idx = body.len().saturating_sub(1);
        for (idx, stmt) in body.iter().enumerate() {
            let is_last = idx == last_idx;
            match stmt {
                Stmt::Let { name, mutable: _, ty, init } => {
                    let dew_ty = if ty.is_empty() { "Int".into() } else { self.map_type(ty).to_string() };
                    if let Some(init_expr) = init {
                        // Check if this is stdin read: let x: T = getInt()
                        if let Expr::Call { func, .. } = init_expr {
                            if let Expr::Ident(fname) = func.as_ref() {
                                if fname == "getInt" {
                                    // &x -> stdin with type annotation
                                    if dew_ty != "Int" {
                                        out.push_str(&format!("{}def {}: {};\n  {}&{} -> stdin;\n", pad, name, dew_ty, pad, name));
                                    } else {
                                        out.push_str(&format!("{}def {}: {};\n  {}&{} -> stdin;\n", pad, name, dew_ty, pad, name));
                                    }
                                    self.var_types.insert(name.clone(), dew_ty);
                                    continue;
                                }
                            }
                        }
                        let rhs = self.emit_expr(init_expr);
                        out.push_str(&format!("{}def {} = {};\n", pad, name, rhs));
                    } else {
                        out.push_str(&format!("{}def {}: {};\n", pad, name, dew_ty));
                    }
                    self.var_types.insert(name.clone(), dew_ty);
                }
                Stmt::Assign { lhs, op, rhs } => {
                    let lhs_str = self.emit_expr(lhs);
                    let rhs_str = self.emit_expr(rhs);
                    let assign_str = match op {
                        AssignOp::Plain => format!("&{} = {}", lhs_str, rhs_str),
                        AssignOp::Plus => format!("&{} = {} + {}", lhs_str, lhs_str, rhs_str),
                        AssignOp::Minus => format!("&{} = {} - {}", lhs_str, lhs_str, rhs_str),
                        AssignOp::Star => format!("&{} = {} * {}", lhs_str, lhs_str, rhs_str),
                        AssignOp::Slash => format!("&{} = {} / {}", lhs_str, lhs_str, rhs_str),
                        AssignOp::Percent => format!("&{} = {} % {}", lhs_str, lhs_str, rhs_str),
                    };
                    out.push_str(&format!("{}{};\n", pad, assign_str));
                }
                Stmt::While { cond, body } => {
                    let cond_str = self.emit_expr(cond);
                    // Detect loop-carried variables
                    let mut carried = Vec::new();
                    self.collect_loop_carried(body, &mut carried);
                    let prev_in_while = self.in_while;
                    self.in_while = true;
                    if !carried.is_empty() {
                        let borrow_list: Vec<String> = carried.iter().map(|v| format!("&{}", v)).collect();
                        out.push_str(&format!("{}while ({}; {}) {{\n", pad, borrow_list.join(", "), cond_str));
                        // Emit body, then Continue at end
                        self.emit_body(body, 0, out, indent + 1);
                        let tuple_elems: Vec<String> = carried.iter().map(|v| v.clone()).collect();
                        out.push_str(&format!("{}  Continue(({}))\n", pad, tuple_elems.join(", ")));
                        out.push_str(&format!("{}}};\n", pad));
                    } else {
                        out.push_str(&format!("{}while ({}) {{\n", pad, cond_str));
                        self.emit_body(body, 0, out, indent + 1);
                        out.push_str(&format!("{}}};\n", pad));
                    }
                    self.in_while = prev_in_while;
                }
                Stmt::If { cond, then_body, else_body } => {
                    let cond_str = self.emit_expr(cond);
                    // Check if branches contain assignments → use if-borrow
                    let mut borrow_vars = Vec::new();
                    self.collect_if_borrow(then_body, else_body.as_deref(), &mut borrow_vars);
                    if !borrow_vars.is_empty() {
                        let blist: Vec<String> = borrow_vars.iter().map(|v| format!("&{}", v)).collect();
                        out.push_str(&format!("{}if ({}; {}) {{\n", pad, blist.join(", "), cond_str));
                        self.emit_body(then_body, 0, out, indent + 1);
                        if let Some(eb) = else_body {
                            out.push_str(&format!("{}}} else {{\n", pad));
                            self.emit_body(eb, 0, out, indent + 1);
                            out.push_str(&format!("{}}};\n", pad));
                        } else {
                            out.push_str(&format!("{}}};\n", pad));
                        }
                    } else if let Some(eb) = else_body {
                        out.push_str(&format!("{}if ({}) {{\n", pad, cond_str));
                        self.emit_body(then_body, 0, out, indent + 1);
                        // Detect if the else is `else if (next_cond)`
                        if eb.len() == 1 && matches!(&eb[0], Stmt::If { .. }) {
                            out.push_str(&format!("{}}} else ", pad));
                            // else if handled by recursing
                            if let Stmt::If { cond, then_body, else_body } = &eb[0] {
                                self.emit_if_else_if(cond, then_body, else_body.as_deref(), out, indent + 1);
                            }
                        } else {
                            out.push_str(&format!("{}}} else {{\n", pad));
                            self.emit_body(eb, 0, out, indent + 1);
                            out.push_str(&format!("{}}};\n", pad));
                        }
                    } else {
                        out.push_str(&format!("{}if ({}) {{\n", pad, cond_str));
                        self.emit_body(then_body, 0, out, indent + 1);
                        out.push_str(&format!("{}}};\n", pad));
                    }
                }
                Stmt::Return(Some(expr)) => {
                    if self.in_while {
                        let val = self.emit_expr(expr);
                        out.push_str(&format!("{}Done(({},))\n", pad, val));
                    } else {
                        let val = self.emit_expr(expr);
                        out.push_str(&format!("{}{}\n", pad, val));
                    }
                }
                Stmt::Return(None) => {
                    if self.in_while {
                        out.push_str(&format!("{}Done((Unit,))\n", pad));
                    } else {
                        // return; in function level → Unit in tail position
                        // The surrounding if-else chain handles this naturally
                    }
                }
                Stmt::Continue => {
                    // continue is only valid inside while loop
                    // The Continue((...)) is handled at the while level
                }
                Stmt::Expr(e) => {
                    let expr_str = self.emit_expr(e);
                    // Skip exit(0) — no Dew equivalent
                    if is_exit_call(e) { continue; }
                    // Detect method calls and convert to standalone fn calls
                    out.push_str(&format!("{}{};\n", pad, expr_str));
                }
                Stmt::FnDecl(fd) => {
                    self.emit_fn(fd, out);
                }
                Stmt::Empty => {}
            }
        }
    }

    fn emit_if_else_if(&mut self, cond: &Expr, then_body: &[Stmt], else_body: Option<&[Stmt]>, out: &mut String, indent: usize) {
        let pad = "  ".repeat(indent);
        let cond_str = self.emit_expr(cond);
        out.push_str(&format!("{}if ({}) {{\n", pad, cond_str));
        self.emit_body(then_body, 0, out, indent + 1);
        if let Some(eb) = else_body {
            if eb.len() == 1 && matches!(&eb[0], Stmt::If { .. }) {
                out.push_str(&format!("{}}} else ", pad));
                if let Stmt::If { cond, then_body, else_body } = &eb[0] {
                    self.emit_if_else_if(cond, then_body, else_body.as_deref(), out, indent + 1);
                }
            } else {
                out.push_str(&format!("{}}} else {{\n", pad));
                self.emit_body(eb, 0, out, indent + 1);
                out.push_str(&format!("{}}};\n", pad));
            }
        } else {
            out.push_str(&format!("{}}};\n", pad));
        }
    }

    fn collect_loop_carried(&mut self, stmts: &[Stmt], acc: &mut Vec<String>) {
        for stmt in stmts {
            match stmt {
                Stmt::Assign { lhs, .. } => {
                    if let Some(root) = extract_root(lhs) {
                        if !acc.contains(&root) && self.var_types.contains_key(&root) {
                            acc.push(root);
                        }
                    }
                }
                Stmt::If { then_body, else_body, .. } => {
                    self.collect_loop_carried(then_body, acc);
                    if let Some(eb) = else_body {
                        self.collect_loop_carried(eb, acc);
                    }
                }
                Stmt::While { body, .. } => {
                    self.collect_loop_carried(body, acc);
                }
                _ => {}
            }
        }
    }

    fn collect_if_borrow(&mut self, then_body: &[Stmt], else_body: Option<&[Stmt]>, acc: &mut Vec<String>) {
        let check = |stmts: &[Stmt], acc: &mut Vec<String>| {
            for stmt in stmts {
                if let Stmt::Assign { lhs, .. } = stmt {
                    if let Some(root) = extract_root(lhs) {
                        if !acc.contains(&root) && self.var_types.contains_key(&root) {
                            acc.push(root);
                        }
                    }
                }
            }
        };
        check(then_body, acc);
        if let Some(eb) = else_body { check(eb, acc); }
    }

    fn emit_expr(&self, expr: &Expr) -> String {
        match expr {
            Expr::Int(n) => n.to_string(),
            Expr::Bool(b) => if *b { "true".into() } else { "false".into() },
            Expr::Ident(s) => {
                // Check for builtin method calls (handled by caller)
                s.clone()
            }
            Expr::Str(s) => format!("\"{}\"", s),
            Expr::Binary(l, op, r) => {
                let l = self.emit_expr(l);
                let r = self.emit_expr(r);
                let op_str = match op {
                    BinOp::Add => "+", BinOp::Sub => "-", BinOp::Mul => "*",
                    BinOp::Div => "/", BinOp::Rem => "%",
                    BinOp::Eq => "==", BinOp::Ne => "!=",
                    BinOp::Lt => "<", BinOp::Gt => ">",
                    BinOp::Le => "<=", BinOp::Ge => ">=",
                    BinOp::And => "&&", BinOp::Or => "||",
                    BinOp::BitAnd => "&", BinOp::BitOr => "|",
                    BinOp::BitXor => "^", BinOp::Shl => "<<", BinOp::Shr => ">>",
                };
                format!("({} {} {})", l, op_str, r)
            }
            Expr::Unary(op, e) => {
                let e = self.emit_expr(e);
                match op {
                    UnOp::Neg => format!("(-{})", e),
                    UnOp::Not => format!("(!{})", e),
                }
            }
            Expr::Call { func, args } => {
                let func_str = self.emit_expr(func);
                let args_str: Vec<String> = args.iter().map(|a| self.emit_expr(a)).collect();
                // Check for getInt() — handled in let binding, not here
                if func_str == "getInt" { return "stdin(0)".into(); }
                if func_str == "printlnInt" {
                    if let Some(arg) = args.first() {
                        return format!("{} -> stdout", self.emit_expr(arg));
                    }
                }
                if func_str == "exit" { return "0".into(); }
                // Method call x.foo(args) → Type__foo(&x, args)
                if let Expr::Field(obj, method) = func.as_ref() {
                    let obj_str = self.emit_expr(obj);
                    if let Some(sname) = self.method_map.get(method) {
                        let all_args: Vec<String> = std::iter::once(obj_str)
                            .chain(args_str.into_iter()).collect();
                        return format!("{}_{}({})", sname, method, all_args.join(", "));
                    }
                }
                format!("{}({})", func_str, args_str.join(", "))
            }
            Expr::Field(obj, field) => {
                format!("{}.{}", self.emit_expr(obj), field)
            }
            Expr::Index(arr, idx) => {
                format!("{}[{}]", self.emit_expr(arr), self.emit_expr(idx))
            }
            Expr::StructLit { name, fields } => {
                // Rx uses named fields, Dew uses named fields — map field order
                let field_strs: Vec<String> = fields.iter().map(|(fname, fexpr)| {
                    format!("{}: {}", fname, self.emit_expr(fexpr))
                }).collect();
                format!("{} {{ {} }}", name, field_strs.join(", "))
            }
            Expr::ArrayLit { elements, repeat } => {
                if let Some(repeat_expr) = repeat {
                    format!("[{}; {}]", self.emit_expr(&elements[0]), self.emit_expr(repeat_expr))
                } else {
                    let elems: Vec<String> = elements.iter().map(|e| self.emit_expr(e)).collect();
                    format!("[{}]", elems.join(", "))
                }
            }
            Expr::Cast(e, t) => {
                let mapped = self.map_type(&self.const_propagate_type(t));
                format!("({} as {})", self.emit_expr(e), mapped)
            }
            Expr::Ref(e) => self.emit_expr(e), // type erasure
            Expr::Deref(e) => self.emit_expr(e), // type erasure
            Expr::Group(e) => format!("({})", self.emit_expr(e)),
            Expr::If { cond, then_body, else_body } => {
                let cond_str = self.emit_expr(cond);
                let mut result = format!("if ({}) {{\n", cond_str);
                for s in then_body {
                    let stmt_str = self.stmt_to_expr_str(s);
                    result.push_str(&format!("    {};\n", stmt_str));
                }
                result.push_str("  } else {\n");
                for s in else_body {
                    let stmt_str = self.stmt_to_expr_str(s);
                    result.push_str(&format!("    {};\n", stmt_str));
                }
                result.push_str("  }");
                result
            }
            Expr::Block(stmts) => {
                let mut result = "{\n".to_string();
                for s in stmts {
                    let stmt_str = self.stmt_to_expr_str(s);
                    result.push_str(&format!("    {};\n", stmt_str));
                }
                result.push_str("  }");
                result
            }
        }
    }

    fn stmt_to_expr_str(&self, stmt: &Stmt) -> String {
        match stmt {
            Stmt::Expr(e) => self.emit_expr(e),
            Stmt::Let { name, init, .. } => {
                if let Some(init_expr) = init {
                    format!("def {} = {}", name, self.emit_expr(init_expr))
                } else {
                    format!("def {}: Int", name)
                }
            }
            Stmt::Return(Some(e)) => self.emit_expr(e),
            Stmt::Return(None) => "Unit".into(),
            Stmt::Assign { lhs, rhs, .. } => {
                format!("&{} = {}", self.emit_expr(lhs), self.emit_expr(rhs))
            }
            Stmt::If { cond, then_body, else_body: Some(eb) } => {
                format!("if ({}) {{ ... }} else {{ ... }}", self.emit_expr(cond))
            }
            _ => "Unit".into(),
        }
    }
}

fn extract_root(expr: &Expr) -> Option<String> {
    match expr {
        Expr::Ident(name) => Some(name.clone()),
        Expr::Index(obj, _) => extract_root(obj),
        Expr::Field(obj, _) => extract_root(obj),
        Expr::Deref(inner) => extract_root(inner),
        _ => None,
    }
}

fn is_exit_call(expr: &Expr) -> bool {
    if let Expr::Call { func, .. } = expr {
        if let Expr::Ident(name) = func.as_ref() {
            return name == "exit";
        }
    }
    false
}
