// Type Checker: walks the AST and performs Hindley-Milner type inference.
//
// Also handles:
//   - Affine type checking (use-at-most-once)
//   - IO effect inference
//   - Type table construction for IR generation
//
// The type checker sees the desugared form (no & sugar, no pipeline, no if/else).

use crate::ast::*;
use crate::diagnostics::DiagnosticCollector;
use crate::types::*;
use std::collections::HashMap;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Effect {
    Pure,
    IO,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Affinity {
    Normal,
    Affine,
}

pub struct TypeChecker<'a> {
    diag: &'a mut DiagnosticCollector,
    tvg: TypeVarGen,
    env: TypeEnv,
    current_effect: Effect,
    fn_effects: HashMap<String, Effect>,
    last_fn_effect: Option<Effect>,
    affine_types: HashMap<String, Affinity>,
    consumed: HashMap<String, bool>,
    var_affine_hint: HashMap<String, bool>,
    enum_variants: HashMap<String, Vec<String>>,
    fn_once_closures: HashMap<String, bool>,
    fn_once_called: HashMap<String, bool>,
}

impl<'a> TypeChecker<'a> {
    pub fn new(diag: &'a mut DiagnosticCollector) -> Self {
        TypeChecker {
            diag,
            tvg: TypeVarGen::new(),
            env: TypeEnv::new(),
            current_effect: Effect::Pure,
            fn_effects: HashMap::new(),
            last_fn_effect: None,
            affine_types: HashMap::new(),
            consumed: HashMap::new(),
            var_affine_hint: HashMap::new(),
            enum_variants: HashMap::new(),
            fn_once_closures: HashMap::new(),
            fn_once_called: HashMap::new(),
        }
    }

    pub fn check(&mut self, prog: &Program) {
        // Register built-in functions with polymorphic types
        self.register_builtins();

        // First pass: register struct/enum declarations
        for decl in &prog.decls {
            match decl {
                Decl::Struct(s) => self.register_struct(s),
                Decl::Enum(e) => self.register_enum(e),
                _ => {}
            }
        }

        // Check affine auto-derivation: structs with affine fields but no affine keyword
        for decl in &prog.decls {
            match decl {
                Decl::Struct(s) if !s.attrs.iter().any(|a| matches!(a, Attr::Affine)) => {
                    self.check_affine_auto_derive_struct(s);
                }
                Decl::Enum(e) if !e.attrs.iter().any(|a| matches!(a, Attr::Affine)) => {
                    self.check_affine_auto_derive_enum(e);
                }
                _ => {}
            }
        }

        // Second pass: pre-register all def names (forward reference support)
        for decl in &prog.decls {
            if let Decl::Def(d) = decl {
                self.env.insert(d.name.name.clone(),
                    Scheme { vars: vec![], ty: self.tvg.fresh_ty() });
            }
        }

        // Third pass: infer types for def bindings
        for decl in &prog.decls {
            if let Decl::Def(d) = decl {
                self.infer_def(d);
            }
        }

        // W006: detect def rec that never references itself
        for decl in &prog.decls {
            if let Decl::Def(d) = decl {
                if d.rec && !self.expr_mentions_name(&d.value, &d.name.name) {
                    self.diag.warn("W006",
                        format!("'def rec {}' is declared recursive but never references itself", d.name.name),
                        Some(d.span));
                }
            }
        }

        // Post-check: verify main is IO
        if let Some(&effect) = self.fn_effects.get("main") {
            if effect == Effect::Pure {
                self.diag.warn("W003",
                    "main has no IO side effects — program produces no visible output",
                    None);
            }
        }
    }

    fn infer_def(&mut self, def: &DefDecl) {
        self.last_fn_effect = None;
        self.current_effect = Effect::Pure;
        let ty = self.infer_expr(&def.value);

        // Track affine struct construction for consumption checking
        match &def.value {
            Expr::StructLit(sl) => {
                if self.affine_types.contains_key(&sl.name.name) {
                    self.var_affine_hint.insert(def.name.name.clone(), true);
                }
            }
            Expr::EnumLit(el) => {
                if self.affine_types.contains_key(&el.name.name) {
                    self.var_affine_hint.insert(def.name.name.clone(), true);
                }
            }
            _ => {}
        }

        // Store inferred IO effect
        if let Some(effect) = self.last_fn_effect.take() {
            self.fn_effects.insert(def.name.name.clone(), effect);
        }

        // Generalize: let-polymorphism for top-level defs
        let scheme = self.tvg.generalize(&self.env, ty);
        self.env.insert(def.name.name.clone(), scheme);
    }

    fn infer_expr(&mut self, expr: &Expr) -> Ty {
        match expr {
            Expr::IntLit(_) => Ty::Int,
            Expr::BoolLit(_) => Ty::Bool,
            Expr::CharLit(_) => Ty::Char,
            Expr::UnitLit(_) => Ty::Unit,
            Expr::Var(ident) => self.infer_var(ident),

            Expr::Binary(b) => self.infer_binary(b),
            Expr::Unary(u) => self.infer_unary(u),
            Expr::Fn(f) => self.infer_fn(f),
            Expr::Call(c) => self.infer_call(c),
            Expr::Match(m) => self.infer_match(m),
            Expr::Block(b) => self.infer_block(b),
            Expr::TupleLit(t) => self.infer_tuple(t),
            Expr::StructLit(s) => self.infer_struct_lit(s),
            Expr::EnumLit(e) => self.infer_enum_lit(e),
            Expr::ArrayLit(a) => self.infer_array_lit(a),
            Expr::ArrayFill(a) => self.infer_array_fill(a),
            Expr::Field(field) => self.infer_field(field),
            Expr::Subscript(sub) => self.infer_subscript(sub),
            Expr::Update(up) => self.infer_update(up),
            Expr::Force(force) => self.infer_expr(&force.expr),

            // Desugared forms that shouldn't appear:
            Expr::If(_) => {
                self.diag.error("E003", "if/else should be desugared before type checking", None);
                Ty::Unit
            }
            Expr::Pipeline(_) => {
                self.diag.error("E003", "pipeline should be desugared before type checking", None);
                Ty::Unit
            }
            Expr::Borrow(_) => {
                self.diag.error("E003", "borrow should be desugared before type checking", None);
                Ty::Unit
            }
            Expr::Fix(fix) => {
                let scheme = Scheme { vars: vec![], ty: self.tvg.fresh_ty() };
                self.env.insert(fix.loop_var.name.clone(), scheme);
                self.infer_expr(&fix.body)
            }
            Expr::While(_) | Expr::Loop(_) | Expr::ForIn(_) => {
                self.diag.error("E003", "loop should be desugared before type checking", None);
                Ty::Unit
            }
        }
    }

    fn infer_var(&mut self, ident: &Ident) -> Ty {
        // Check affine consumption: if variable was already consumed, error
        if self.consumed.get(&ident.name) == Some(&true) {
            self.diag.error("E004",
                format!("variable '{}' already consumed (affine type used more than once)", ident.name),
                Some(ident.span));
        }
        if let Some(scheme) = self.env.lookup(&ident.name) {
            self.tvg.instantiate(scheme)
        } else {
            self.diag.error("E007",
                format!("unbound variable '{}'", ident.name),
                Some(ident.span));
            Ty::Unit
        }
    }

    fn infer_binary(&mut self, b: &BinaryExpr) -> Ty {
        let left = self.infer_expr(&b.left);
        let right = self.infer_expr(&b.right);

        match b.op {
            BinaryOp::Add | BinaryOp::Sub | BinaryOp::Mul | BinaryOp::Div | BinaryOp::Rem => {
                unify_with_type(&left, &Ty::Int, b.span, self.diag, "arithmetic");
                unify_with_type(&right, &Ty::Int, b.span, self.diag, "arithmetic");
                Ty::Int
            }
            BinaryOp::Lt | BinaryOp::Gt | BinaryOp::Le | BinaryOp::Ge => {
                unify_with_type(&left, &Ty::Int, b.span, self.diag, "comparison");
                unify_with_type(&right, &Ty::Int, b.span, self.diag, "comparison");
                Ty::Bool
            }
            BinaryOp::Eq | BinaryOp::Ne => {
                unify_expr(&left, &right, b.span, self.diag, "equality");
                Ty::Bool
            }
            BinaryOp::And | BinaryOp::Or => {
                unify_with_type(&left, &Ty::Bool, b.span, self.diag, "logic");
                unify_with_type(&right, &Ty::Bool, b.span, self.diag, "logic");
                Ty::Bool
            }
        }
    }

    fn infer_unary(&mut self, u: &UnaryExpr) -> Ty {
        let inner = self.infer_expr(&u.expr);
        match u.op {
            UnaryOp::Neg => {
                unify_with_type(&inner, &Ty::Int, u.span, self.diag, "negation");
                Ty::Int
            }
            UnaryOp::Not => {
                unify_with_type(&inner, &Ty::Bool, u.span, self.diag, "logical not");
                Ty::Bool
            }
        }
    }

    fn infer_fn(&mut self, f: &FnExpr) -> Ty {
        let mut param_tys = Vec::new();
        for param in &f.params {
            let pty = param.ty.as_ref()
                .map(|t| self.ast_type_to_ty(t))
                .unwrap_or_else(|| self.tvg.fresh_ty());
            param_tys.push(pty);
        }

        // Strip IO wrapper from return type annotation to get actual return type
        let (annotated_effect, inner_ret_ty) = match &f.return_ty {
            Some(ty) if is_io_type(ty) => {
                let inner = io_inner_type(ty).map(|t| self.ast_type_to_ty(&t));
                (Some(Effect::IO), inner)
            }
            other => (None, other.as_ref().map(|t| self.ast_type_to_ty(t))),
        };

        // Add params to typing scope and infer body
        let saved_env = self.env.clone();
        let saved_effect = self.current_effect;
        self.current_effect = Effect::Pure;
        for (param, pty) in f.params.iter().zip(param_tys.iter()) {
            self.env.insert(param.name.name.clone(),
                Scheme { vars: vec![], ty: pty.clone() });
        }

        let body_ty = self.infer_expr(&f.body);
        self.env = saved_env;

        let ret_ty = inner_ret_ty.unwrap_or_else(|| body_ty.clone());
        unify_expr(&body_ty, &ret_ty, f.span, self.diag, "function return");

        // Verify IO annotation against inferred effect
        let inferred_effect = self.current_effect;
        if let Some(Effect::IO) = annotated_effect {
            if inferred_effect == Effect::Pure {
                self.diag.warn("W004",
                    "function return type overapproximates: declared IO but body has no side effects",
                    Some(f.span));
            }
        }
        if annotated_effect.is_none() && f.return_ty.is_some() && inferred_effect == Effect::IO {
            self.diag.error("E006",
                "pure function annotation violated: body calls IO but return type does not declare IO",
                Some(f.span));
        }

        self.current_effect = saved_effect;
        self.last_fn_effect = Some(inferred_effect);

        Ty::fun(param_tys, ret_ty)
    }

    fn infer_call(&mut self, c: &CallExpr) -> Ty {
        // Detect IO calls: stdin/stdout are IO primitives; calling an IO fn propagates IO
        if let Expr::Var(ident) = &*c.func {
            match ident.name.as_str() {
                "stdout" | "stdin" => self.current_effect = Effect::IO,
                name => {
                    if self.fn_effects.get(name) == Some(&Effect::IO) {
                        self.current_effect = Effect::IO;
                    }
                }
            }
            // FnOnce check: closure with affine captures called more than once
            if self.fn_once_closures.get(&ident.name) == Some(&true) {
                if self.fn_once_called.get(&ident.name) == Some(&true) {
                    self.diag.error("E004",
                        format!("FnOnce closure '{}' called more than once (captures affine value)", ident.name),
                        Some(c.span));
                }
                self.fn_once_called.insert(ident.name.clone(), true);
            }
        }
        let func_ty = self.infer_expr(&c.func);
        if let Ty::Named(_, _) = &func_ty {
            for arg in &c.args {
                if let ExprArg::Value(e) = arg { self.infer_expr(e); }
            }
            return func_ty;
        }
        let ret_ty = self.tvg.fresh_ty();
        let mut param_tys: Vec<Ty> = c.args.iter()
            .map(|a| match a {
                ExprArg::Value(e) => {
                    let ty = self.infer_expr(e);
                    // Passing affine var as argument consumes it
                    if let Expr::Var(ident) = e.as_ref() {
                        if self.is_affine_var(&ident.name) {
                            self.consumed.insert(ident.name.clone(), true);
                        }
                    }
                    ty
                }
                ExprArg::Borrow(_) => self.tvg.fresh_ty(),
            })
            .collect();

        let expected = Ty::fun(param_tys.clone(), ret_ty.clone());
        let ret_ty = match unify(&func_ty, &expected) {
            Ok(s) => s.apply(&ret_ty),
            Err(msg) => {
                self.diag.error("E003",
                    format!("type mismatch in function call: {}", msg),
                    Some(c.span));
                ret_ty
            }
        };
        ret_ty
    }

    fn infer_match(&mut self, m: &MatchExpr) -> Ty {
        let scrutinee_ty = self.infer_expr(&m.scrutinee);
        let result_ty = self.tvg.fresh_ty();

        // Match on affine value consumes the scrutinee
        if let Expr::Var(ident) = m.scrutinee.as_ref() {
            if self.is_affine_var(&ident.name) {
                self.consumed.insert(ident.name.clone(), true);
            }
        }

        // E005: non-exhaustive match check
        self.check_exhaustiveness(&scrutinee_ty, &m.arms, m.span);

        for arm in &m.arms {
            self.infer_pattern(&arm.pattern, &scrutinee_ty);
            let arm_ty = self.infer_expr(&arm.body);
            unify_expr(&arm_ty, &result_ty, arm.span, self.diag, "match arm");
        }

        result_ty
    }

    fn infer_block(&mut self, b: &BlockExpr) -> Ty {
        let saved_env = self.env.clone();
        let mut result_ty = Ty::Unit;

        for stmt in &b.stmts {
            if let Some(ref def) = stmt.def {
                if def.rec {
                    self.env.insert(def.name.name.clone(),
                        Scheme { vars: vec![], ty: Ty::Var(self.tvg.fresh()) });
                }
            }
        }
        for stmt in &b.stmts {
            if let Some(ref def) = stmt.def {
                if !def.rec {
                    self.env.insert(def.name.name.clone(),
                        Scheme { vars: vec![], ty: Ty::Var(self.tvg.fresh()) });
                }
            }
            self.infer_expr(&stmt.expr);

            // def y = x consumes x if x is affine (not self-rebinding like def x = x { ... })
            if let Some(ref def) = stmt.def {
                if let Expr::Var(ident) = &stmt.expr {
                    if self.is_affine_var(&ident.name) && ident.name != def.name.name {
                        self.consumed.insert(ident.name.clone(), true);
                    }
                }
                // Track affine struct/enum construction for consumption checking
                let is_affine_ctor = match &stmt.expr {
                    Expr::StructLit(sl) => self.affine_types.contains_key(&sl.name.name),
                    Expr::EnumLit(el) => self.affine_types.contains_key(&el.name.name),
                    Expr::Call(c) => match &*c.func {
                        Expr::Var(v) => self.affine_types.iter().any(|(name, aff)| {
                            *aff == Affinity::Affine
                                && self.env.lookup(&v.name)
                                    .map(|s| matches!(&s.ty, Ty::Named(n, _) if n == name))
                                    .unwrap_or(false)
                        }),
                        _ => false,
                    },
                    _ => false,
                };
                if is_affine_ctor {
                    self.var_affine_hint.insert(def.name.name.clone(), true);
                }
                // FnOnce detection: closure capturing affine variables
                if let Expr::Fn(fn_expr) = &stmt.expr {
                    if self.fn_captures_affine(fn_expr) {
                        self.fn_once_closures.insert(def.name.name.clone(), true);
                    }
                }
            }
        }
        if let Some(final_expr) = &b.final_expr {
            result_ty = self.infer_expr(final_expr);
        }

        self.env = saved_env;
        result_ty
    }

    fn infer_tuple(&mut self, t: &TupleLit) -> Ty {
        Ty::Tuple(t.elements.iter().map(|e| self.infer_expr(e)).collect())
    }

    fn infer_struct_lit(&mut self, s: &StructLit) -> Ty {
        if let Some(scheme) = self.env.lookup(&s.name.name) {
            return scheme.ty.clone();
        }
        Ty::Named(s.name.name.clone(), vec![])
    }

    fn infer_enum_lit(&mut self, e: &EnumLit) -> Ty {
        if let Some(scheme) = self.env.lookup(&e.name.name) {
            return scheme.ty.clone();
        }
        Ty::Named(e.name.name.clone(), vec![])
    }

    fn infer_array_lit(&mut self, a: &ArrayLit) -> Ty {
        let elem_ty = if a.elements.is_empty() {
            self.tvg.fresh_ty()
        } else {
            let first = self.infer_expr(&a.elements[0]);
            for el in &a.elements[1..] {
                let el_ty = self.infer_expr(el);
                unify_expr(&first, &el_ty, a.span, self.diag, "array element");
            }
            first
        };
        Ty::Array(Box::new(elem_ty), a.elements.len())
    }

    fn infer_array_fill(&mut self, a: &ArrayFill) -> Ty {
        let elem_ty = self.infer_expr(&a.value);
        Ty::Array(Box::new(elem_ty), a.count)
    }

    fn infer_field(&mut self, f: &FieldExpr) -> Ty {
        let _obj_ty = self.infer_expr(&f.object);
        // Field access on affine struct consumes the struct (mark AFTER infer to avoid self-trigger)
        if let Expr::Var(ident) = &*f.object {
            if self.is_affine_var(&ident.name) {
                self.consumed.insert(ident.name.clone(), true);
            }
        }
        self.tvg.fresh_ty()
    }

    /// Check if a variable's type is affine.
    fn is_affine_var(&self, name: &str) -> bool {
        if self.var_affine_hint.get(name) == Some(&true) {
            return true;
        }
        self.env.lookup(name)
            .and_then(|s| match &s.ty {
                Ty::Named(n, _) => Some(n.clone()),
                _ => None,
            })
            .map(|n| self.affine_types.get(&n) == Some(&Affinity::Affine))
            .unwrap_or(false)
    }

    fn infer_subscript(&mut self, s: &SubscriptExpr) -> Ty {
        let arr_ty = self.infer_expr(&s.array);
        let idx_ty = self.infer_expr(&s.index);
        unify_with_type(&idx_ty, &Ty::Int, s.span, self.diag, "array index");
        let elem_ty = self.tvg.fresh_ty();
        let arr_size = match &arr_ty {
            Ty::Array(_, n) => *n,
            _ => 0,
        };
        let arr_expected = Ty::Array(Box::new(elem_ty.clone()), arr_size);
        unify_expr(&arr_ty, &arr_expected, s.span, self.diag, "array subscript");
        elem_ty
    }

    fn infer_update(&mut self, u: &UpdateExpr) -> Ty {
        self.infer_expr(&u.base)
    }

    fn infer_pattern(&mut self, pattern: &Pattern, expected_ty: &Ty) {
        match pattern {
            Pattern::Wildcard(_) => {}
            Pattern::Var(ident) => {
                self.env.insert(ident.name.clone(),
                    Scheme { vars: vec![], ty: expected_ty.clone() });
            }
            Pattern::Lit(lp) => {
                let lit_ty = match lp.value {
                    LitValue::Int(_) => Ty::Int,
                    LitValue::Bool(_) => Ty::Bool,
                    LitValue::Char(_) => Ty::Char,
                };
                unify_expr(&lit_ty, expected_ty, lp.span, self.diag, "literal pattern");
            }
            Pattern::Struct(sp) => {
                for field in &sp.fields {
                    match field {
                        PatternField::Shorthand { name, .. } => {
                            self.env.insert(name.name.clone(),
                                Scheme { vars: vec![], ty: self.tvg.fresh_ty() });
                        }
                        PatternField::Rename { var, .. } => {
                            self.env.insert(var.name.clone(),
                                Scheme { vars: vec![], ty: self.tvg.fresh_ty() });
                        }
                    }
                }
            }
            Pattern::Variant(vp) => {
                for payload in &vp.payload {
                    let fresh = self.tvg.fresh_ty();
                    self.infer_pattern(payload, &fresh);
                }
            }
            Pattern::Tuple(tp) => {
                for elem in &tp.elements {
                    let fresh = self.tvg.fresh_ty();
                    self.infer_pattern(elem, &fresh);
                }
            }
        }
    }

    fn ast_type_to_ty(&mut self, ast_ty: &Type) -> Ty {
        match ast_ty {
            Type::Named(n) if n.args.is_none() => {
                match n.name.name.as_str() {
                    "Int" => Ty::Int,
                    "Bool" => Ty::Bool,
                    "Char" => Ty::Char,
                    "Unit" => Ty::Unit,
                    _ => Ty::Named(n.name.name.clone(), vec![]),
                }
            }
            Type::Named(n) => {
                let args: Vec<Ty> = n.args.as_ref().map(|a| a.iter().map(|arg| match arg {
                    TypeArg::Type(t) => self.ast_type_to_ty(t),
                    TypeArg::Const(_) => Ty::Int,
                }).collect()).unwrap_or_default();
                Ty::Named(n.name.name.clone(), args)
            }
            Type::Fun(f) => {
                let params: Vec<Ty> = f.params.iter()
                    .map(|p| self.ast_type_to_ty(&p.ty))
                    .collect();
                let ret = f.return_ty.as_ref()
                    .map(|t| self.ast_type_to_ty(t))
                    .unwrap_or(Ty::Unit);
                Ty::fun(params, ret)
            }
            Type::Tuple(t) => {
                Ty::Tuple(t.elements.iter().map(|e| self.ast_type_to_ty(e)).collect())
            }
            Type::Array(a) => {
                Ty::Array(Box::new(self.ast_type_to_ty(&a.element)), a.size)
            }
            Type::Wildcard(_) => self.tvg.fresh_ty(),
            Type::TypeOf(_) => self.tvg.fresh_ty(),
        }
    }

    fn register_builtins(&mut self) {
        let a = self.tvg.fresh_ty();
        self.env.insert("stdout".into(), Scheme { vars: vec![], ty: Ty::Fun(Box::new(a), Box::new(Ty::Unit)) });
        let b = self.tvg.fresh_ty();
        self.env.insert("stdin".into(), Scheme { vars: vec![], ty: Ty::Fun(Box::new(b.clone()), Box::new(b)) });
        self.env.insert("not".into(), Scheme { vars: vec![], ty: Ty::Fun(Box::new(Ty::Bool), Box::new(Ty::Bool)) });
    }

    fn register_struct(&mut self, s: &StructDecl) {
        // Detect struct self-recursion (E008 Layout)
        for field in &s.fields {
            if let Type::Named(n) = &field.ty {
                if n.name.name == s.name.name && n.args.is_none() {
                    self.diag.error("E008",
                        format!("struct '{}' contains a field of its own type, causing infinite layout", s.name.name),
                        Some(s.span));
                }
            }
        }
        // Register struct as a named type constructor
        let arity = s.params.len();
        let param_vars: Vec<Ty> = (0..arity).map(|i| Ty::Var(TypeVar(1000 + i))).collect();
        let struct_ty = Ty::Named(s.name.name.clone(), param_vars);
        let vars: Vec<TypeVar> = (0..arity).map(|i| TypeVar(1000 + i)).collect();
        self.env.insert(s.name.name.clone(), Scheme { vars, ty: struct_ty });

        // Mark affine structs
        if s.attrs.iter().any(|a| matches!(a, Attr::Affine)) {
            self.affine_types.insert(s.name.name.clone(), Affinity::Affine);
        }
    }

    fn check_affine_auto_derive_struct(&mut self, s: &StructDecl) {
        for field in &s.fields {
            if self.type_is_affine(&field.ty) {
                self.diag.warn("W004",
                    format!("struct '{}' contains affine field '{}' but is not declared 'affine struct'",
                        s.name.name, field.name.name),
                    Some(s.span));
                // Treat as affine even without explicit keyword
                self.affine_types.insert(s.name.name.clone(), Affinity::Affine);
                return;
            }
        }
    }

    fn check_affine_auto_derive_enum(&mut self, e: &EnumDecl) {
        for variant in &e.variants {
            let payloads: &[Type] = match variant {
                Variant::Single { payload, .. } => payload,
                Variant::Struct { fields, .. } => return, // struct variants have named fields, handled separately
                Variant::Unit { .. } => continue,
            };
            for ty in payloads {
                if self.type_is_affine(ty) {
                    self.diag.warn("W004",
                        format!("enum '{}' has affine payload in variant '{}' but is not declared 'affine enum'",
                            e.name.name, variant_name(variant)),
                        Some(e.span));
                    self.affine_types.insert(e.name.name.clone(), Affinity::Affine);
                    return;
                }
            }
        }
    }

    /// Check if a function expression captures any affine variable from the outer scope.
    fn fn_captures_affine(&self, f: &FnExpr) -> bool {
        let param_names: std::collections::HashSet<&str> =
            f.params.iter().map(|p| p.name.name.as_str()).collect();
        fn collect_captures(expr: &Expr, bound: &std::collections::HashSet<&str>,
                             fvs: &mut std::collections::HashSet<String>) {
            match expr {
                Expr::Var(v) => {
                    if !bound.contains(v.name.as_str())
                        && v.name != "stdout" && v.name != "stdin" {
                        fvs.insert(v.name.clone());
                    }
                }
                Expr::Binary(b) => { collect_captures(&b.left, bound, fvs); collect_captures(&b.right, bound, fvs); }
                Expr::Call(c) => {
                    collect_captures(&c.func, bound, fvs);
                    for arg in &c.args {
                        if let ExprArg::Value(e) = arg { collect_captures(e, bound, fvs); }
                    }
                }
                Expr::Block(b) => {
                    let mut inner_bound = bound.clone();
                    for stmt in &b.stmts {
                        if let Some(def) = &stmt.def { inner_bound.insert(def.name.name.as_str()); }
                    }
                    for stmt in &b.stmts { collect_captures(&stmt.expr, &inner_bound, fvs); }
                    if let Some(fe) = &b.final_expr { collect_captures(fe, &inner_bound, fvs); }
                }
                Expr::Field(f) => { collect_captures(&f.object, bound, fvs); }
                Expr::If(i) => { collect_captures(&i.condition, bound, fvs); collect_captures(&i.then_branch, bound, fvs); collect_captures(&i.else_branch, bound, fvs); }
                _ => {}
            }
        }
        let mut fvs = std::collections::HashSet::new();
        collect_captures(&f.body, &param_names, &mut fvs);
        fvs.iter().any(|name| self.is_affine_var(name))
    }

    fn type_is_affine(&self, ty: &Type) -> bool {
        match ty {
            Type::Named(n) => {
                n.name.name == "Affine" || self.affine_types.get(&n.name.name) == Some(&Affinity::Affine)
            }
            _ => false,
        }
    }

    /// Check if an expression mentions a given name anywhere in its tree.
    fn expr_mentions_name(&self, expr: &Expr, name: &str) -> bool {
        match expr {
            Expr::Var(v) => v.name == name,
            Expr::Binary(b) => self.expr_mentions_name(&b.left, name) || self.expr_mentions_name(&b.right, name),
            Expr::Unary(u) => self.expr_mentions_name(&u.expr, name),
            Expr::Call(c) => {
                self.expr_mentions_name(&c.func, name)
                || c.args.iter().any(|a| match a {
                    ExprArg::Value(e) => self.expr_mentions_name(e, name),
                    ExprArg::Borrow(_) => false,
                })
            }
            Expr::Block(b) => {
                b.stmts.iter().any(|s| self.expr_mentions_name(&s.expr, name))
                || b.final_expr.as_ref().map_or(false, |e| self.expr_mentions_name(e, name))
            }
            Expr::If(i) => self.expr_mentions_name(&i.condition, name)
                || self.expr_mentions_name(&i.then_branch, name)
                || self.expr_mentions_name(&i.else_branch, name),
            Expr::Match(m) => {
                self.expr_mentions_name(&m.scrutinee, name)
                || m.arms.iter().any(|a| self.expr_mentions_name(&a.body, name))
            }
            Expr::Fn(f) => self.expr_mentions_name(&f.body, name),
            Expr::Field(f) => self.expr_mentions_name(&f.object, name),
            Expr::TupleLit(t) => t.elements.iter().any(|e| self.expr_mentions_name(e, name)),
            Expr::Force(f) => self.expr_mentions_name(&f.expr, name),
            Expr::Fix(f) => self.expr_mentions_name(&f.body, name),
            _ => false,
        }
    }

    fn check_exhaustiveness(&mut self, scrutinee_ty: &Ty, arms: &[MatchArm], span: Span) {
        let enum_name = match scrutinee_ty {
            Ty::Named(n, _) => n.clone(),
            _ => return, // int/bool/char matches don't use enum exhaustiveness
        };
        let Some(variants) = self.enum_variants.get(&enum_name) else { return };
        // Has wildcard arm → always exhaustive
        if arms.iter().any(|a| matches!(a.pattern, Pattern::Wildcard(_))) { return; }
        // Collect covered variant names (Variant patterns + Var patterns that match variant names)
        let covered: Vec<&str> = arms.iter().filter_map(|a| match &a.pattern {
            Pattern::Variant(vp) => Some(vp.name.name.as_str()),
            Pattern::Struct(sp) => Some(sp.name.name.as_str()),
            Pattern::Var(ip) => {
                if variants.contains(&ip.name) { Some(ip.name.as_str()) } else { None }
            }
            _ => None,
        }).collect();
        for v in variants {
            if !covered.contains(&v.as_str()) {
                self.diag.error("E005",
                    format!("non-exhaustive match: variant '{}' of enum '{}' is not covered", v, enum_name),
                    Some(span));
            }
        }
    }

    fn register_enum(&mut self, e: &EnumDecl) {
        let arity = e.params.len();
        let param_vars: Vec<Ty> = (0..arity).map(|i| Ty::Var(TypeVar(2000 + i))).collect();
        let enum_ty = Ty::Named(e.name.name.clone(), param_vars.clone());
        let vars: Vec<TypeVar> = (0..arity).map(|i| TypeVar(2000 + i)).collect();
        self.env.insert(e.name.name.clone(), Scheme { vars, ty: enum_ty });

        // Mark affine enums
        if e.attrs.iter().any(|a| matches!(a, Attr::Affine)) {
            self.affine_types.insert(e.name.name.clone(), Affinity::Affine);
        }

        let enum_name = e.name.name.clone();
        let mut variant_names = Vec::new();
        for variant in &e.variants {
            let vname = match variant {
                Variant::Single { name, .. } | Variant::Struct { name, .. } | Variant::Unit { name, .. } => name,
            };
            variant_names.push(vname.name.clone());
            let variant_ty = Ty::Named(enum_name.clone(), param_vars.clone());
            self.env.insert(vname.name.clone(), Scheme { vars: Vec::new(), ty: variant_ty });
        }
        self.enum_variants.insert(enum_name, variant_names);
    }
}

/// Check if a type annotation is `IO T` (effect marker wrapper).
fn is_io_type(ty: &Type) -> bool {
    match ty {
        Type::Named(n) => n.name.name == "IO" && n.args.as_ref().map_or(false, |a| a.len() == 1),
        _ => false,
    }
}

/// Extract the inner type from `IO T`.
fn io_inner_type(ty: &Type) -> Option<Type> {
    match ty {
        Type::Named(n) if n.name.name == "IO" => {
            n.args.as_ref().and_then(|a| a.first()).and_then(|arg| match arg {
                TypeArg::Type(t) => Some(t.clone()),
                _ => None,
            })
        }
        _ => None,
    }
}

fn unify_with_type(ty: &Ty, expected: &Ty, span: Span, diag: &mut DiagnosticCollector, context: &str) {
    match unify(ty, expected) {
        Ok(_) => {}
        Err(msg) => {
            diag.error("E003",
                format!("type mismatch in {}: {} (expected {}, got {})", context, msg, expected, ty),
                Some(span));
        }
    }
}

fn unify_expr(t1: &Ty, t2: &Ty, span: Span, diag: &mut DiagnosticCollector, context: &str) {
    match unify(t1, t2) {
        Ok(_) => {}
        Err(msg) => {
            diag.error("E003",
                format!("type mismatch in {}: {} (got {} and {})", context, msg, t1, t2),
                Some(span));
        }
    }
}

fn variant_name(v: &Variant) -> &str {
    match v {
        Variant::Single { name, .. } | Variant::Struct { name, .. } | Variant::Unit { name, .. } => &name.name,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::lexer::Lexer;
    use crate::parser::Parser;
    use crate::desugar::desugar_program;

    fn typecheck(src: &str) -> bool {
        let mut lexer = Lexer::new(src);
        let tokens = lexer.lex_all();
        let mut diag = DiagnosticCollector::new();
        let mut parser = Parser::new(tokens, &mut diag, src);
        let prog = parser.parse_program();
        let prog = desugar_program(&prog, &mut diag);
        let mut tc = TypeChecker::new(&mut diag);
        tc.check(&prog);
        !diag.has_errors()
    }

    #[test]
    fn int_literal_is_int() {
        assert!(typecheck("def x = 42;"));
    }

    #[test]
    fn binary_arithmetic() {
        assert!(typecheck("def x = 40 + 2;"));
    }

    #[test]
    fn type_mismatch_arithmetic() {
        assert!(!typecheck("def x = true + 2;"));
    }

    #[test]
    fn function_type() {
        assert!(typecheck("def add = fn(x: Int, y: Int) -> Int { x + y };"));
    }

    #[test]
    fn function_call() {
        assert!(typecheck("def add = fn(x: Int, y: Int) -> Int { x + y }; def r = add(40, 2);"));
    }
}
