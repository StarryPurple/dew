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
    tmp_counter: RefCell<usize>,          // counter for __tmpN temp variable names
    var_override: RefCell<HashMap<String, String>>, // SSA variable name override for if branches
    in_while_body: RefCell<bool>,                 // true when emitting inside a while-loop body
    in_if_body: RefCell<bool>,                    // true when emitting inside an SSA if-then/else body
    seen_return: RefCell<bool>,                   // true when a Stmt::Return was emitted in current body
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
            tmp_counter: RefCell::new(0),
            var_override: RefCell::new(HashMap::new()),
            in_while_body: RefCell::new(false),
            in_if_body: RefCell::new(false),
            seen_return: RefCell::new(false),
        }
    }

    fn emit_program(&mut self, prog: &Program, out: &mut String) {
        // Emit ControlFlow enum for return/break/continue propagation
        out.push_str("enum ControlFlow(T) {\n");
        out.push_str("  Return(T),\n");
        out.push_str("  Normal(T),\n");
        out.push_str("  Break,\n");
        out.push_str("  Continue,\n");
        out.push_str("}\n\n");

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

        // Emit regular functions (const values are propagated/inlined via const_values)
        for decl in &prog.decls {
            match decl {
                Decl::Fn(fn_decl) => self.emit_fn(fn_decl, out),
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
        let mut seen_return_local = false;
        for (idx, stmt) in body.iter().enumerate() {
            if seen_return_local { break; }
            *self.seen_return.borrow_mut() = seen_return_local;
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
                    // Simple identifier: use &x = rhs to mutate the outer binding.
                    // This ensures the modification escapes if/while branches
                    // (unlike def x = rhs which creates a scoped shadow).
                    // Compound lvalue (arr[k], x.f): also uses & for borrow syntax.
                    if let Expr::Ident(name) = lhs {
                        out.push_str(&format!("{}&{} = {};\n", pad, name, rhs_str));
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
                        *self.in_while_body.borrow_mut() = true;
                        let had_return = *self.seen_return.borrow();
                        *self.seen_return.borrow_mut() = false;
                        self.emit_body(body, 0, out, indent + 2);
                        *self.seen_return.borrow_mut() = had_return;
                        *self.in_while_body.borrow_mut() = false;
                        while out.ends_with('\n') { out.pop(); }
                        if !out.ends_with(';') { out.push_str(";"); }
                        if !*self.seen_return.borrow() {
                            out.push_str(&format!("\n{}    __while_loop()\n", pad));
                        } else {
                            out.push_str("\n");
                        }
                        out.push_str(&format!("{}  }} else {{ Unit }}\n", pad));
                        out.push_str(&format!("{}  }} }}();\n", pad));
                    } else {
                        let ret_anno = if ret_var_ty.is_empty() { String::new() } else { format!(" -> {}", ret_var_ty) };
                        out.push_str(&format!("{}fix __while_loop {{\n", pad));
                        out.push_str(&format!("{}  fn({}){} {{\n", pad, params.join(", "), ret_anno));
                        out.push_str(&format!("{}    if {} {{\n", pad, cond_str));
                        *self.in_while_body.borrow_mut() = true;
                        let had_return = *self.seen_return.borrow();
                        *self.seen_return.borrow_mut() = false;
                        self.emit_body(body, 0, out, indent + 3);
                        *self.seen_return.borrow_mut() = had_return || *self.seen_return.borrow();
                        *self.in_while_body.borrow_mut() = false;
                        while out.ends_with('\n') { out.pop(); }
                        if !out.ends_with(';') { out.push_str(";"); }
                        if *self.seen_return.borrow() {
                            // Return inside while: skip the recursive call so the return
                            // value becomes the if's final expression (and thus the fn's return)
                            out.push_str("\n");
                        } else {
                            out.push_str(&format!("\n{}      __while_loop({})\n", pad, call_args.join(", ")));
                        }
                        out.push_str(&format!("{}    }} else {{ {} }}\n", pad, ret_var));
                        out.push_str(&format!("{}  }}\n", pad));
                        out.push_str(&format!("{}}}({});\n", pad, call_args.join(", ")));
                    }
                    *self.while_ctx.borrow_mut() = saved_ctx;
                }
                Stmt::If { cond, then_body, else_body } => {
                    // Skip SSA IIFE mode inside while-loop bodies or nested if-bodies —
                    // parent contexts already handle state propagation.
                    if *self.in_while_body.borrow() || *self.in_if_body.borrow() {
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
                            None => { out.push_str(&format!(" else {{ Unit }}")); }
                        }
                        if !is_last { out.push_str(";"); }
                        out.push_str("\n");
                        return;
                    }
                    // Collect variables mutated by assignment in this if's branches.
                    // If the last statement is a regular assignment (not compound op),
                    // switch to IIFE mode: def var = if (cond) { SSA body } else { var };
                    let mutated: Vec<String> = Self::collect_mutated_vars(then_body);
                    let else_mutated = else_body.as_ref().map(|b| Self::collect_mutated_vars(b))
                        .unwrap_or_default();
                    let all_mutated: Vec<String> = {
                        let mut all: Vec<String> = mutated.clone();
                        for v in &else_mutated {
                            if !all.contains(v) { all.push(v.clone()); }
                        }
                        all
                    };

                    if all_mutated.is_empty() {
                        // ── Non-IIFE path (existing behavior) ──
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
                            None => { out.push_str(&format!(" else {{ Unit }}")); }
                        }
                        if !is_last { out.push_str(";"); }
                        out.push_str("\n");
                    } else {
                        // ── IIFE path: def var = if (cond) { SSA body } else { var }; ──
                        let cond_str = format!("({})", self.emit_expr(cond));
                        let indent_lv = indent + 1;
                        let inner_pad = "  ".repeat(indent_lv);

                    // Emit def = if (cond) { ... }
                    // For single var: def x = if ...;
                    // For multi var: def __tmp_r = if ...; def x = __tmp_r.0; def y = __tmp_r.1;
                    let is_multi = all_mutated.len() > 1;
                    let result_var = if is_multi {
                        format!("__tmp_r{}", {
                            let mut c = self.tmp_counter.borrow_mut();
                            let n = *c; *c += 1; n
                        })
                    } else {
                        all_mutated[0].clone()
                    };
                    out.push_str(&format!("{}def {} = if {} {{\n", pad, result_var, cond_str));

                        // ── then branch (SSA mode) ──
                        *self.in_if_body.borrow_mut() = true;
                        self.emit_ssa_block(then_body, &all_mutated, out, indent_lv);
                        *self.in_if_body.borrow_mut() = false;

                        // Final value of then branch: tuple of latest SSA names
                        out.push_str(&format!("{}{}",
                            inner_pad, Self::final_ssa_value(&all_mutated, &self.var_override.borrow())));

                        out.push_str(&format!("\n{}}}", pad));

                        // ── else branch ──
                        match else_body {
                            Some(else_b) if !else_mutated.is_empty() => {
                                // else branch also has SSA assignments.
                                self.var_override.borrow_mut().clear();
                                out.push_str(&format!(" else {{\n"));
                                *self.in_if_body.borrow_mut() = true;
                                self.emit_ssa_block(else_b, &all_mutated, out, indent_lv);
                                *self.in_if_body.borrow_mut() = false;
                                out.push_str(&format!("{}{}\n",
                                    inner_pad, Self::final_ssa_value(&all_mutated, &self.var_override.borrow())));
                                out.push_str(&format!("{}}}", pad));
                            }
                            Some(else_b) => {
                                // else branch has no SSA assignments
                                let saved = self.var_override.borrow().clone();
                                self.var_override.borrow_mut().clear();
                                out.push_str(&format!(" else {{\n"));
                                self.emit_body(else_b, 0, out, indent_lv);
                                // Final value: original variable names
                                if all_mutated.len() == 1 {
                                    out.push_str(&format!("{}{}", inner_pad, all_mutated[0]));
                                } else {
                                    out.push_str(&format!("{}({})", inner_pad, all_mutated.join(", ")));
                                }
                                out.push_str(&format!("\n{}}}", pad));
                                *self.var_override.borrow_mut() = saved;
                            }
                            None => {
                                // No else: return original values on separate lines
                                out.push_str(&format!(" else {{\n"));
                                if all_mutated.len() == 1 {
                                    out.push_str(&format!("{}{}\n", inner_pad, all_mutated[0]));
                                } else {
                                    out.push_str(&format!("{}({})\n", inner_pad, all_mutated.join(", ")));
                                }
                                out.push_str(&format!("{}}}", pad));
                            }
                        }
                        out.push_str(";\n");
                        // Multi-variable: destructure the tuple result
                        if is_multi {
                            for (idx, var) in all_mutated.iter().enumerate() {
                                out.push_str(&format!("{}def {} = {}.{};\n", pad, var, result_var, idx));
                            }
                        }
                        self.var_override.borrow_mut().clear();
                    }
                }
                Stmt::Return(Some(expr)) => {
                    out.push_str(&format!("{}{}\n", pad, self.emit_expr(expr)));
                    seen_return_local = true;
                    *self.seen_return.borrow_mut() = true;
                }
                Stmt::Return(None) => {
                    out.push_str(&format!("{}Unit\n", pad));
                    seen_return_local = true;
                    *self.seen_return.borrow_mut() = true;
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

    /// Scan a body for all variables assigned via `Stmt::Assign { lhs: Expr::Ident }`.
    fn collect_mutated_vars(body: &[Stmt]) -> Vec<String> {
        let mut vars: Vec<String> = Vec::new();
        for stmt in body {
            if let Stmt::Assign { lhs: Expr::Ident(name), .. } = stmt {
                if !vars.contains(name) {
                    vars.push(name.clone());
                }
            }
        }
        vars
    }

    /// Build the final SSA value expression: `(x__0, y__1)` or `x__0` for single.
    fn final_ssa_value(mutated: &[String], overrides: &HashMap<String, String>) -> String {
        let values: Vec<String> = mutated.iter()
            .map(|v| overrides.get(v).cloned().unwrap_or_else(|| v.clone()))
            .collect();
        if values.len() == 1 {
            values[0].clone()
        } else {
            format!("({})", values.join(", "))
        }
    }

    /// Emit a body in SSA mode: every `x = rhs` becomes `def x__N = rhs_ssa`
    /// where rhs uses latest SSA names for mutated variables.
    fn emit_ssa_block(&self, body: &[Stmt], mutated: &[String], out: &mut String, indent: usize) {
        let pad = "  ".repeat(indent);
        let mut ssa_counts: HashMap<String, usize> = HashMap::new();
        for v in mutated {
            ssa_counts.entry(v.clone()).or_insert(0);
        }

        let last_idx = body.len().saturating_sub(1);
        for (idx, stmt) in body.iter().enumerate() {
            match stmt {
                Stmt::Assign { lhs: Expr::Ident(name), op: AssignOp::Plain, rhs } => {
                    let count = ssa_counts.get_mut(name).unwrap();
                    let ssa_name = format!("{}__{}", name, count);
                    *count += 1;

                    // Build override: apply all current SSA mappings EXCEPT this var itself
                    // (RHS should use the previous version of this var)
                    let mut override_map = self.var_override.borrow().clone();
                    override_map.remove(name);
                    *self.var_override.borrow_mut() = override_map.clone();
                    let rhs_str = self.emit_expr(rhs);

                    out.push_str(&format!("{}def {} = {};\n", pad, ssa_name, rhs_str));

                    // After this def, all references to `name` use the new SSA name
                    override_map.insert(name.clone(), ssa_name);
                    *self.var_override.borrow_mut() = override_map;
                }
                _ => {
                    // Non-assignment statements: emit with current overrides
                    self.emit_ssa_stmt(stmt, out, indent, idx == last_idx);
                }
            }
        }
    }

    /// Emit a single statement in SSA mode (with variable overrides active).
    fn emit_ssa_stmt(&self, stmt: &Stmt, out: &mut String, indent: usize, is_last: bool) {
        let pad = "  ".repeat(indent);
        match stmt {
            Stmt::Let { name, mutable: _, ty, init } => {
                let dew_ty = if ty.is_empty() { "Int".into() } else { self.map_type(ty) };
                if let Some(expr) = init {
                    if is_getint_call(expr) {
                        out.push_str(&format!("{}def {}: {};\n", pad, name, dew_ty));
                        out.push_str(&format!("{}&{} -> stdin;\n", pad, name));
                    } else {
                        out.push_str(&format!("{}def {} = {};\n", pad, name, self.emit_expr(expr)));
                    }
                } else {
                    out.push_str(&format!("{}def {}: {};\n", pad, name, dew_ty));
                }
            }
            Stmt::Assign { lhs, op, rhs } => {
                // Non-ident assignment: use & syntax
                let rhs_str = match op {
                    AssignOp::Plain => self.emit_expr(rhs),
                    AssignOp::Plus => format!("{} + {}", self.emit_expr(lhs), self.emit_expr(rhs)),
                    _ => self.emit_expr(rhs),
                };
                out.push_str(&format!("{}&{} = {};\n", pad, self.emit_expr(lhs), rhs_str));
            }
            Stmt::Expr(expr) => {
                if let Expr::Ident(name) = expr {
                    if name == "break" {
                        out.push_str(&format!("{}{};\n", pad, name));
                        return;
                    }
                }
                if let Expr::Call { func, .. } = expr {
                    if let Expr::Ident(name) = func.as_ref() {
                        if name == "printlnInt" {
                            out.push_str(&format!("{}{};\n", pad, self.emit_expr(expr)));
                            out.push_str(&format!("{}'\\n' -> stdout;\n", pad));
                            return;
                        }
                    }
                }
                let sep = if is_last { "" } else { ";" };
                out.push_str(&format!("{}{}{}\n", pad, self.emit_expr(expr), sep));
            }
            Stmt::If { cond, then_body, else_body } => {
                // Recursive if inside SSA block: emit with current overrides
                let cond_str = format!("({})", self.emit_expr(cond));
                out.push_str(&format!("{}if {} {{\n", pad, cond_str));
                // Collect mutated vars in this nested if's branches
                let inner_mutated = Self::collect_mutated_vars(then_body);
                let else_inner = else_body.as_ref().map(|b| Self::collect_mutated_vars(b)).unwrap_or_default();
                let all_inner: Vec<String> = {
                    let mut a = inner_mutated.clone();
                    for v in &else_inner { if !a.contains(v) { a.push(v.clone()); } }
                    a
                };
                let inner_indent = indent + 1;
                if all_inner.is_empty() {
                    // Nested if has no SSA assignments — emit bodies directly
                    for s in then_body { self.emit_ssa_stmt(s, out, indent + 1, false); }
                    out.push_str(&format!("{}}}", pad));
                    if let Some(eb) = else_body {
                        out.push_str(&format!(" else {{\n"));
                        for s in eb { self.emit_ssa_stmt(s, out, indent + 1, true); }
                        out.push_str(&format!("{}}}", pad));
                    }
                    if !is_last { out.push_str(";"); }
                    out.push_str("\n");
                } else {
                    self.emit_ssa_block(then_body, &all_inner, out, inner_indent);
                    let final_val = Self::final_ssa_value(&all_inner, &self.var_override.borrow());
                    out.push_str(&format!("{}  {}\n", pad, final_val));
                    out.push_str(&format!("{}}}", pad));
                    match else_body {
                        Some(eb) if !else_inner.is_empty() => {
                            out.push_str(&format!(" else {{\n"));
                            self.emit_ssa_block(eb, &all_inner, out, inner_indent);
                            out.push_str(&format!("{}  {}\n", pad, Self::final_ssa_value(&all_inner, &self.var_override.borrow())));
                            out.push_str(&format!("{}}}", pad));
                        }
                        Some(eb) => {
                            let saved = self.var_override.borrow().clone();
                        self.var_override.borrow_mut().clear();
                            out.push_str(&format!(" else {{\n"));
                            for s in eb { self.emit_ssa_stmt(s, out, indent + 1, true); }
                            out.push_str(&format!("{}}}", pad));
                            *self.var_override.borrow_mut() = saved;
                        }
                        None => {
                            out.push_str(&format!(" else {{ Unit }}"));
                        }
                    }
                }
                if !is_last { out.push_str(";"); }
                out.push_str("\n");
            }
            Stmt::Return(Some(e)) => {
                out.push_str(&format!("{}{}\n", pad, self.emit_expr(e)));
            }
            Stmt::Return(None) => {
                out.push_str(&format!("{}Unit\n", pad));
            }
            Stmt::Empty => {}
            Stmt::FnDecl(fd) => {
                self.nested_fns.borrow_mut().push(fd.clone());
            }
            Stmt::While { cond, body } => {
                let cond_str = format!("({})", self.emit_expr(cond));
                let vars = self.collect_loop_vars(body);
                let params: Vec<String> = vars.iter().map(|(n, t)| format!("&{}: {}", n, t)).collect();
                let call_args: Vec<String> = vars.iter().map(|(n, _)| format!("&{}", n)).collect();
                let (ret_var, ret_var_ty) = vars.last().map(|(n, t)| (n.clone(), t.clone())).unwrap_or_default();
                if vars.is_empty() {
                    out.push_str(&format!("{}fix __while_loop {{ fn() -> Unit {{\n", pad));
                    out.push_str(&format!("{}  if {} {{\n", pad, cond_str));
                    // For the while body, recursively use SSA mode
                    let body_mutated = Self::collect_mutated_vars(body);
                    if body_mutated.is_empty() {
                        self.emit_body(body, 0, out, indent + 2);
                    } else {
                        self.emit_ssa_block(body, &body_mutated, out, indent + 2);
                    }
                    while out.ends_with('\n') { out.pop(); }
                    if !out.ends_with(';') { out.push_str(";"); }
                    out.push_str(&format!("\n{}    __while_loop()\n", pad));
                    out.push_str(&format!("{}  }} else {{ Unit }}\n", pad));
                    out.push_str(&format!("{}  }} }}();\n", pad));
                } else {
                    let ret_anno = if ret_var_ty.is_empty() { String::new() } else { format!(" -> {}", ret_var_ty) };
                    let saved = self.var_override.borrow().clone();
                    self.var_override.borrow_mut().clear();
                    out.push_str(&format!("{}fix __while_loop {{\n", pad));
                    out.push_str(&format!("{}  fn({}){} {{\n", pad, params.join(", "), ret_anno));
                    out.push_str(&format!("{}    if {} {{\n", pad, cond_str));
                    self.emit_body(body, 0, out, indent + 3);
                    while out.ends_with('\n') { out.pop(); }
                    if !out.ends_with(';') { out.push_str(";"); }
                    out.push_str(&format!("\n{}      __while_loop({})\n", pad, call_args.join(", ")));
                    out.push_str(&format!("{}    }} else {{ {} }}\n", pad, ret_var));
                    out.push_str(&format!("{}  }}\n", pad));
                    out.push_str(&format!("{}}}({});\n", pad, call_args.join(", ")));
                    *self.var_override.borrow_mut() = saved;
                }
            }
            Stmt::Continue => {
                out.push_str(&format!("{}__while_loop();\n", pad));
            }
        }
    }

    fn emit_expr(&self, expr: &Expr) -> String {
        match expr {
            Expr::Int(n) => n.to_string(),
            Expr::Bool(b) => if *b { "true".into() } else { "false".into() },
            Expr::Str(s) => format!("\"{}\"", s),
            Expr::Ident(name) => {
                // Check SSA variable override first (used in if-branch IIFE mode)
                if let Some(override_name) = self.var_override.borrow().get(name.as_str()) {
                    return override_name.clone();
                }
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
                        let has_borrow_self = self.impls.iter().any(|(_, methods)| {
                            methods.iter().any(|m| m.name == method && m.has_self)
                        });
                        let can_borrow = !self_expr.contains('(')
                            && !self_expr.contains(')');
                        let self_arg = if has_borrow_self && can_borrow {
                            format!("&{}", self_expr)
                        } else if has_borrow_self && !can_borrow {
                            // Self expression is a function call result — can't & it directly.
                            // Wrap in a block with a temp variable:
                            //   { def __tmpN = inner_call; Struct__method(&__tmpN, args) }
                            let tmp_idx = {
                                let mut c = self.tmp_counter.borrow_mut();
                                let n = *c;
                                *c += 1;
                                n
                            };
                            let tmp_name = format!("__tmp{}", tmp_idx);
                            let call_args = if args_str.is_empty() {
                                format!("&{}", tmp_name)
                            } else {
                                format!("&{}, {}", tmp_name, args_str.join(", "))
                            };
                            return format!("{{ def {} = {}; {}({}) }}",
                                tmp_name, self_expr, fn_name, call_args);
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
