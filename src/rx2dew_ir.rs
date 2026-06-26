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

struct Ctx {
    const_values: HashMap<String, String>,
    var_types: HashMap<String, String>,
    in_func_ret_ty: String,
    in_while: bool,
    /// For each function name, which params are borrow (&).
    fn_borrow_params: HashMap<String, Vec<bool>>,
    /// Maps method name → struct name for destructurization.
    method_map: HashMap<String, String>,
}

impl Ctx {
    fn new() -> Self {
        Self { const_values: HashMap::new(), var_types: HashMap::new(), in_func_ret_ty: String::new(), in_while: false, fn_borrow_params: HashMap::new(), method_map: HashMap::new() }
    }

    fn map_type(&self, t: &str) -> String {
        // Handle array types [T; N] recursively
        let t = t.trim();
        if let Some(inner) = t.strip_prefix('[') {
            if let Some(semi_pos) = inner.rfind("; ") {
                let elem = &inner[..semi_pos];
                let size_str = inner[semi_pos + 2..].trim_end_matches(']');
                let size = self.eval_const_expr(&self.const_propagate_str(size_str));
                return format!("[{}; {}]", self.map_type(elem.trim()), size);
            }
        }
        match t {
            "i32" | "u32" | "i64" | "u64" | "i8" | "u8" | "isize" | "usize" | "Int" => "Int".into(),
            "bool" | "Bool" => "Bool".into(),
            "()" | "Unit" => "Unit".into(),
            "char" | "Char" => "Char".into(),
            other => other.to_string(),
        }
    }

    /// Evaluate simple integer expressions like "200+1" → "201"
    fn eval_const_expr(&self, s: &str) -> String {
        let s = s.trim();
        if let Ok(n) = s.parse::<i64>() { return n.to_string(); }
        // Try simple binary ops: a OP b
        for op_str in ["+", "-", "*", "/"] {
            if let Some(pos) = s.find(op_str) {
                let left = s[..pos].trim();
                let right = s[pos+1..].trim();
                if let (Ok(a), Ok(b)) = (left.parse::<i64>(), right.parse::<i64>()) {
                    return match op_str {
                        "+" => (a + b).to_string(),
                        "-" => (a - b).to_string(),
                        "*" => (a * b).to_string(),
                        "/" => (a / b).to_string(),
                        _ => continue,
                    };
                }
            }
        }
        s.to_string()
    }

    fn const_propagate_str(&self, s: &str) -> String {
        let mut r = s.to_string();
        let mut pairs: Vec<(&String, &String)> = self.const_values.iter().collect();
        pairs.sort_by(|a, b| b.0.len().cmp(&a.0.len())); // longest name first
        for (name, val) in &pairs { r = r.replace(name.as_str(), val.as_str()); }
        r
    }

    fn emit_program(&mut self, prog: &Program, out: &mut String) {
        // Collect consts
        for d in &prog.decls { if let Decl::Const { name, value } = d { self.const_values.insert(name.clone(), value.clone()); } }
        // Emit structs
        for d in &prog.decls {
            if let Decl::Struct { name, fields } = d {
                out.push_str(&format!("struct {} {{\n", name));
                for (fn_, ft) in fields {
                    let t = self.map_type(&self.const_propagate_str(ft));
                    out.push_str(&format!("  {}: {},\n", fn_, t));
                }
                out.push_str("}\n\n");
            }
        }
        // Collect method mappings and emit impl methods
        for d in &prog.decls {
            if let Decl::Impl { struct_name, methods } = d {
                for m in methods {
                    self.method_map.insert(m.name.clone(), struct_name.clone());
                    self.emit_fn_decl(struct_name, m, out);
                }
            }
        }
        // Emit standalone fns (non-main, non-method)
        for d in &prog.decls {
            if let Decl::Fn(fd) = d {
                if fd.name != "main" { self.emit_fn_decl("", fd, out); }
            }
        }
        // Emit main
        for d in &prog.decls {
            if let Decl::Fn(fd) = d {
                if fd.name == "main" {
                    out.push_str("def main = fn {\n");
                    self.var_types.clear();
                    self.in_func_ret_ty = "Unit".into();
                    self.emit_stmts(&fd.body, out, 1);
                    out.push_str("};\n");
                }
            }
        }
    }

    fn emit_fn_decl(&mut self, struct_name: &str, fd: &FnDecl, out: &mut String) {
        self.var_types.clear();
        let name = if struct_name.is_empty() { fd.name.clone() } else { format!("{}_{}", struct_name, fd.name) };
        // Self param
        let mut params = Vec::new();
        if fd.has_self {
            let sname = if struct_name.is_empty() { "Self".into() } else { struct_name.to_string() };
            params.push(format!("&self: {}", sname));
            self.var_types.insert("self".into(), sname);
        }
        for (pn, pt) in &fd.params {
            let mt = self.const_propagate_str(pt);
            if mt.starts_with("&") || mt.starts_with("&mut ") {
                let ct = mt.trim_start_matches("&mut ").trim_start_matches("&");
                params.push(format!("&{}: {}", pn, self.map_type(ct)));
            } else {
                params.push(format!("{}: {}", pn, self.map_type(&mt)));
            }
            self.var_types.insert(pn.clone(), self.map_type(&mt));
        }
        // Track borrow params for call-site & emission
        let mut borrow_flags = Vec::new();
        if fd.has_self { borrow_flags.push(true); }
        for (pn, pt) in &fd.params {
            let mt = self.const_propagate_str(pt);
            borrow_flags.push(mt.starts_with("&mut ") || mt.starts_with("&"));
        }
        self.fn_borrow_params.insert(name.clone(), borrow_flags);

        let ret = self.map_type(&self.const_propagate_str(&fd.ret_type));
        self.in_func_ret_ty = ret.clone();
        let ret_anno = if ret == "Unit" { String::new() } else { format!(" -> {}", ret) };
        out.push_str(&format!("def {} = fn({}){} {{\n", name, params.join(", "), ret_anno));
        self.emit_stmts(&fd.body, out, 1);
        out.push_str("}\n\n");
    }

    fn emit_stmts(&mut self, stmts: &[Stmt], out: &mut String, indent: usize) {
        let pad = "  ".repeat(indent);
        // Handle return chains: when an `if (c) { .. return e; }` is followed by more stmts,
        // the if becomes the condition, return value is the then-branch, rest goes in else.
        let mut i = 0;
        while i < stmts.len() {
            if i + 1 < stmts.len() {
                if let Stmt::If { cond, then_body, .. } = &stmts[i] {
                    if let Some(ret_pos) = then_body.iter().position(|s| matches!(s, Stmt::Return(Some(_)))) {
                        // if body has a return — transform to if-else chain
                        let mut then_without_ret: Vec<Stmt> = then_body[..ret_pos].to_vec();
                        if let Stmt::Return(Some(ret_expr)) = &then_body[ret_pos] {
                            // The statements before return in the if body
                            let cs = self.emit_expr(cond);
                            out.push_str(&format!("{}if ({}) {{\n", pad, cs));
                            for s in &then_without_ret { self.emit_one_stmt(s, out, indent + 1, false); }
                            out.push_str(&format!("{}  {}\n", pad, self.emit_expr(ret_expr)));
                            // Everything after this if goes in else
                            let remaining: Vec<&Stmt> = stmts[i+1..].iter().collect();
                            if !remaining.is_empty() {
                                out.push_str(&format!("{}}} else {{\n", pad));
                                for s in remaining { self.emit_one_stmt(s, out, indent + 1, false); }
                                out.push_str(&format!("{}}};\n", pad));
                            } else {
                                out.push_str(&format!("{}}};\n", pad));
                            }
                            return;
                        }
                    }
                }
            }
            let is_last = i == stmts.len() - 1;
            let is_tail_expr = is_last && matches!(&stmts[i], Stmt::Expr(_));
            self.emit_one_stmt(&stmts[i], out, indent, is_tail_expr);
            i += 1;
        }
    }

    fn emit_one_stmt(&mut self, stmt: &Stmt, out: &mut String, indent: usize, is_tail_expr: bool) {
        let pad = "  ".repeat(indent);
        match stmt {
            Stmt::Let { name, ty, init, .. } => {
                let dew_ty = if ty.is_empty() { "Int".into() } else { self.map_type(ty) };
                if let Some(init_expr) = init {
                    if is_get_int(init_expr) {
                        out.push_str(&format!("{}def {}: {};\n{}&{} -> stdin;\n", pad, name, dew_ty, pad, name));
                    } else {
                        let rhs = self.emit_expr(init_expr);
                        out.push_str(&format!("{}def {} = {};\n", pad, name, rhs));
                    }
                } else {
                    out.push_str(&format!("{}def {}: {};\n", pad, name, dew_ty));
                }
                self.var_types.insert(name.clone(), dew_ty);
            }
            Stmt::Assign { lhs, op, rhs } => {
                let ls = self.emit_expr(lhs);
                let rs = self.emit_expr(rhs);
                let s = match op {
                    AssignOp::Plain => format!("&{} = {}", ls, rs),
                    AssignOp::Plus => format!("&{} = {} + {}", ls, ls, rs),
                    AssignOp::Minus => format!("&{} = {} - {}", ls, ls, rs),
                    AssignOp::Star => format!("&{} = {} * {}", ls, ls, rs),
                    AssignOp::Slash => format!("&{} = {} / {}", ls, ls, rs),
                    AssignOp::Percent => format!("&{} = {} % {}", ls, ls, rs),
                };
                out.push_str(&format!("{}{};\n", pad, s));
            }
            Stmt::While { cond, body } => {
                let cs = self.emit_expr(cond);
                let mut carried = Vec::new();
                self.collect_carried(body, &mut carried);
                let prev = self.in_while;
                self.in_while = true;
                if !carried.is_empty() {
                    let bl: Vec<String> = carried.iter().map(|v| format!("&{}", v)).collect();
                    out.push_str(&format!("{}while ({}; {}) {{\n", pad, bl.join(", "), cs));
                    self.emit_stmts(body, out, indent + 1);
                    let tv: Vec<String> = carried.iter().map(|v| v.clone()).collect();
                    out.push_str(&format!("{}Continue(({}))\n", pad, tv.join(", ")));
                    out.push_str(&format!("{}}};\n", pad));
                } else {
                    out.push_str(&format!("{}while ({}) {{\n", pad, cs));
                    self.emit_stmts(body, out, indent + 1);
                    out.push_str(&format!("{}}};\n", pad));
                }
                self.in_while = prev;
            }
            Stmt::If { cond, then_body, else_body } => {
                let cs = self.emit_expr(cond);
                let mut bv = Vec::new();
                self.collect_assignments(then_body, &mut bv);
                if let Some(eb) = else_body { self.collect_assignments(eb, &mut bv); }
                if !bv.is_empty() {
                    let bl: Vec<String> = bv.iter().map(|v| format!("&{}", v)).collect();
                    out.push_str(&format!("{}if ({}; {}) {{\n", pad, bl.join(", "), cs));
                    self.emit_stmts(then_body, out, indent + 1);
                    if let Some(eb) = else_body {
                        out.push_str(&format!("{}}} else {{\n", pad));
                        self.emit_stmts(eb, out, indent + 1);
                        out.push_str(&format!("{}}};\n", pad));
                    } else { out.push_str(&format!("{}}};\n", pad)); }
                } else if let Some(eb) = else_body {
                    if eb.len() == 1 && matches!(&eb[0], Stmt::If { .. }) {
                        out.push_str(&format!("{}if ({}) {{\n", pad, cs));
                        self.emit_stmts(then_body, out, indent + 1);
                        out.push_str(&format!("{}}} else ", pad));
                        if let Stmt::If { cond, then_body, else_body } = &eb[0] {
                            let cs2 = self.emit_expr(cond);
                            out.push_str(&format!("if ({}) {{\n", cs2));
                            self.emit_stmts(then_body, out, indent + 1);
                            if let Some(eb2) = else_body {
                                out.push_str(&format!("{}}} else {{\n", pad));
                                self.emit_stmts(eb2, out, indent + 1);
                                out.push_str(&format!("{}}};\n", pad));
                            } else { out.push_str(&format!("{}}};\n", pad)); }
                        }
                    } else {
                        out.push_str(&format!("{}if ({}) {{\n", pad, cs));
                        self.emit_stmts(then_body, out, indent + 1);
                        out.push_str(&format!("{}}} else {{\n", pad));
                        self.emit_stmts(eb, out, indent + 1);
                        out.push_str(&format!("{}}};\n", pad));
                    }
                } else {
                    out.push_str(&format!("{}if ({}) {{\n", pad, cs));
                    self.emit_stmts(then_body, out, indent + 1);
                    out.push_str(&format!("{}}};\n", pad));
                }
            }
            Stmt::Return(Some(e)) => {
                if self.in_while {
                    out.push_str(&format!("{}Done(({},))\n", pad, self.emit_expr(e)));
                }
                // function-level return handled by emit_stmts return-chain
            }
            Stmt::Return(None) => {
                if self.in_while {
                    out.push_str(&format!("{}Done((Unit,))\n", pad));
                }
            }
            Stmt::Continue => {}
            Stmt::Expr(e) => {
                if is_exit_call(e) { return; }
                let es = self.emit_expr(e);
                if is_tail_expr {
                    out.push_str(&format!("{}{}\n", pad, es));
                } else {
                    out.push_str(&format!("{}{};\n", pad, es));
                }
            }
            Stmt::FnDecl(fd) => { self.emit_fn_decl("", fd, out); }
            Stmt::Empty => {}
        }
    }

    fn emit_if_chain(&mut self, stmts: &[Stmt], out: &mut String, indent: usize) {
        if stmts.len() == 1 {
            if let Stmt::If { cond, then_body, else_body } = &stmts[0] {
                let cs = self.emit_expr(cond);
                let pad = "  ".repeat(indent);
                out.push_str(&format!("{}if ({}) {{\n", pad, cs));
                self.emit_stmts(then_body, out, indent + 1);
                if let Some(eb) = else_body {
                    if eb.len() == 1 && matches!(&eb[0], Stmt::If { .. }) {
                        out.push_str(&format!("{}}} else ", pad));
                        self.emit_if_chain(eb, out, indent);
                    } else {
                        out.push_str(&format!("{}}} else {{\n", pad));
                        self.emit_stmts(eb, out, indent + 1);
                        out.push_str(&format!("{}}};\n", pad));
                    }
                } else {
                    out.push_str(&format!("{}}};\n", pad));
                }
            }
        }
    }

    fn collect_carried(&self, stmts: &[Stmt], acc: &mut Vec<String>) {
        for s in stmts {
            match s {
                Stmt::Assign { lhs, .. } => {
                    if let Some(r) = extract_root(lhs) { if !acc.contains(&r) && self.var_types.contains_key(&r) { acc.push(r); } }
                }
                Stmt::Expr(e) => {
                    // Also capture variables that are referenced in the body,
                    // especially borrow params that need to be in the fix fn scope
                    for v in self.collect_var_refs(e) {
                        if !acc.contains(&v) && self.var_types.contains_key(&v) { acc.push(v); }
                    }
                }
                Stmt::If { then_body, else_body, .. } => {
                    self.collect_carried(then_body, acc);
                    if let Some(eb) = else_body { self.collect_carried(eb, acc); }
                }
                _ => {}
            }
        }
    }

    fn collect_var_refs(&self, expr: &Expr) -> Vec<String> {
        let mut vars = Vec::new();
        self.collect_var_refs_inner(expr, &mut vars);
        vars
    }
    fn collect_var_refs_inner(&self, expr: &Expr, acc: &mut Vec<String>) {
        match expr {
            Expr::Ident(s) => { if !acc.contains(s) { acc.push(s.clone()); } }
            Expr::Binary(l, _, r) => { self.collect_var_refs_inner(l, acc); self.collect_var_refs_inner(r, acc); }
            Expr::Unary(_, e) => self.collect_var_refs_inner(e, acc),
            Expr::Call { func, args } => {
                self.collect_var_refs_inner(func, acc);
                for a in args { self.collect_var_refs_inner(a, acc); }
            }
            Expr::Field(obj, _) => self.collect_var_refs_inner(obj, acc),
            Expr::Index(arr, idx) => { self.collect_var_refs_inner(arr, acc); self.collect_var_refs_inner(idx, acc); }
            Expr::Cast(e, _) => self.collect_var_refs_inner(e, acc),
            Expr::Ref(e) | Expr::Deref(e) | Expr::Group(e) => self.collect_var_refs_inner(e, acc),
            Expr::StructLit { fields, .. } => for (_, f) in fields { self.collect_var_refs_inner(f, acc); }
            Expr::ArrayLit { elements, repeat } => {
                for e in elements { self.collect_var_refs_inner(e, acc); }
                if let Some(r) = repeat { self.collect_var_refs_inner(r, acc); }
            }
            _ => {}
        }
    }

    fn collect_assignments(&self, stmts: &[Stmt], acc: &mut Vec<String>) {
        for s in stmts {
            if let Stmt::Assign { lhs, .. } = s {
                if let Some(r) = extract_root(lhs) { if !acc.contains(&r) && self.var_types.contains_key(&r) { acc.push(r); } }
            }
        }
    }

    fn emit_expr(&self, expr: &Expr) -> String {
        match expr {
            Expr::Int(n) => n.to_string(),
            Expr::Bool(b) => b.to_string(),
            Expr::Ident(s) => {
                if s == "getInt" { return "stdin(0)".into(); }
                // Const propagate if this ident matches a const name
                if self.const_values.contains_key(s) {
                    return self.const_values[s].clone();
                }
                s.clone()
            },
            Expr::Str(s) => format!("\"{}\"", s),
            Expr::Binary(l, op, r) => {
                let l = self.emit_expr(l);
                let r = self.emit_expr(r);
                let os = match op {
                    BinOp::Add => "+", BinOp::Sub => "-", BinOp::Mul => "*",
                    BinOp::Div => "/", BinOp::Rem => "%",
                    BinOp::Eq => "==", BinOp::Ne => "!=",
                    BinOp::Lt => "<", BinOp::Gt => ">",
                    BinOp::Le => "<=", BinOp::Ge => ">=",
                    BinOp::And => "&&", BinOp::Or => "||",
                    BinOp::BitAnd => "&", BinOp::BitOr => "|",
                    BinOp::BitXor => "^", BinOp::Shl => "<<", BinOp::Shr => ">>",
                };
                format!("{} {} {}", l, os, r)
            }
            Expr::Unary(op, e) => {
                let e = self.emit_expr(e);
                match op { UnOp::Neg => format!("-{}", e), UnOp::Not => format!("not {}", e) }
            }
            Expr::Call { func, args } => {
                // Handle `getInt()` builtin
                if let Expr::Ident(s) = func.as_ref() {
                    if s == "getInt" { return "(stdin(0) as Int)".into(); }
                    if s == "printlnInt" { if let Some(a) = args.first() { return format!("{} -> stdout", self.emit_expr(a)); } }
                    if s == "exit" { return String::new(); }
                    // Direct function call — add & for borrow params
                    let borrow_info = self.fn_borrow_params.get(s);
                    let mut as_ = Vec::new();
                    for (i, a) in args.iter().enumerate() {
                        let is_brw = borrow_info.map_or(false, |bi| i < bi.len() && bi[i]);
                        if is_brw { as_.push(format!("&{}", self.emit_expr(a))); }
                        else { as_.push(self.emit_expr(a)); }
                    }
                    return format!("{}({})", s, as_.join(", "));
                }
                // Method call: x.foo(args) → Type__foo(&x, args)
                if let Expr::Field(obj, method) = func.as_ref() {
                    let obj_str = self.emit_expr(obj);
                    // Look up which struct this method belongs to
                    if let Some(sname) = self.method_map.get(method) {
                        let func_name = format!("{}_{}", sname, method);
                        let borrow_info = self.fn_borrow_params.get(&func_name);
                        let mut all_args = vec![format!("&{}", obj_str)]; // self is always borrow
                        for (i, a) in args.iter().enumerate() {
                            let is_brw = borrow_info.map_or(false, |bi| (i + 1) < bi.len() && bi[i + 1]);
                            if is_brw { all_args.push(format!("&{}", self.emit_expr(a))); }
                            else { all_args.push(self.emit_expr(a)); }
                        }
                        return format!("{}({})", func_name, all_args.join(", "));
                    }
                    // Not a method — emit as regular field access + call
                    let as_: Vec<String> = args.iter().map(|a| self.emit_expr(a)).collect();
                    return format!("{}.{}({})", obj_str, method, as_.join(", "));
                }
                // Fallback: unknown function call
                let fs = self.emit_expr(func);
                let as_: Vec<String> = args.iter().map(|a| self.emit_expr(a)).collect();
                format!("{}({})", fs, as_.join(", "))
            }
            Expr::Field(obj, field) => {
                format!("{}.{}", self.emit_expr(obj), field)
            }
            Expr::Index(arr, idx) => format!("{}[{}]", self.emit_expr(arr), self.emit_expr(idx)),
            Expr::StructLit { name, fields } => {
                let fs: Vec<String> = fields.iter().map(|(fn_, fe)| format!("{}: {}", fn_, self.emit_expr(fe))).collect();
                format!("{} {{ {} }}", name, fs.join(", "))
            }
            Expr::ArrayLit { elements, repeat } => {
                let elems: Vec<String> = elements.iter().map(|e| self.emit_expr(e)).collect();
                if let Some(r) = repeat {
                    let size_str = self.emit_expr(r);
                    let size_eval = self.eval_const_expr(&self.const_propagate_str(&size_str));
                    format!("[{}; {}]", elems[0], size_eval)
                } else { format!("[{}]", elems.join(", ")) }
            }
            Expr::Cast(e, t) => format!("({} as {})", self.emit_expr(e), self.map_type(&self.const_propagate_str(t))),
            Expr::Ref(e) => format!("&{}", self.emit_expr(e)),
            Expr::Deref(e) => self.emit_expr(e),
            Expr::Group(e) => format!("({})", self.emit_expr(e)),
            Expr::If { cond, then_body, else_body } => {
                let mut r = format!("if ({}) {{\n", self.emit_expr(cond));
                for (i, s) in then_body.iter().enumerate() {
                    let is_last = i == then_body.len() - 1;
                    if is_last && matches!(s, Stmt::Expr(_)) {
                        r.push_str(&format!("    {}\n", self.emit_expr(&stmt_to_expr(s))));
                    } else {
                        r.push_str(&format!("    {};\n", self.emit_expr(&stmt_to_expr(s))));
                    }
                }
                r.push_str("  } else {\n");
                for (i, s) in else_body.iter().enumerate() {
                    let is_last = i == else_body.len() - 1;
                    if is_last && matches!(s, Stmt::Expr(_)) {
                        r.push_str(&format!("    {}\n", self.emit_expr(&stmt_to_expr(s))));
                    } else {
                        r.push_str(&format!("    {};\n", self.emit_expr(&stmt_to_expr(s))));
                    }
                }
                r.push_str("  }");
                r
            }
            Expr::Block(stmts) => {
                let mut r = "{\n".to_string();
                for s in stmts {
                    r.push_str(&format!("    {};\n", self.emit_expr(&stmt_to_expr(s))));
                }
                r.push_str("  }");
                r
            }
        }
    }

}

fn stmt_to_expr(stmt: &Stmt) -> Expr {
    match stmt {
        Stmt::Expr(e) | Stmt::Return(Some(e)) => e.clone(),
        _ => Expr::Int(0),
    }
}

fn is_get_int(expr: &Expr) -> bool {
    match expr {
        Expr::Call { func, .. } if matches!(func.as_ref(), Expr::Ident(s) if s == "getInt") => true,
        Expr::Ident(s) if s == "getInt" => true,  // Rx parser: getInt() → Ident
        Expr::Cast(inner, _) => is_get_int(inner),
        _ => false,
    }
}

fn extract_root(expr: &Expr) -> Option<String> {
    match expr {
        Expr::Ident(n) => Some(n.clone()),
        Expr::Index(obj, _) | Expr::Field(obj, _) | Expr::Deref(obj) => extract_root(obj),
        _ => None,
    }
}

fn is_exit_call(expr: &Expr) -> bool {
    matches!(expr, Expr::Ident(s) if s == "exit")
        || matches!(expr, Expr::Call { func, .. } if matches!(func.as_ref(), Expr::Ident(s) if s == "exit"))
}
