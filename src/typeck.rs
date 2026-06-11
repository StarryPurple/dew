/// Hindley-Milner type checker with affine tracking for Dew.
///
/// Algorithm W: generates fresh type variables, unifies constraints,
/// generalizes at `def` boundaries, instantiates at use sites.
///
/// Affine tracking: only active when types are annotated (Box(T) etc).
/// Inferred type variables are treated as Normal.

use crate::ast::{BinOp, Expr};
use crate::diagnostics::DiagnosticCollector;
use crate::types::{Affinity, Scheme, Subst, Type};
use std::collections::{HashMap, HashSet};

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum TypeError {
    UnboundVariable(String),
    TypeMismatch { expected: Type, found: Type },
    AffineViolation(String),
    DupOnAffine(Type),
    InvalidBinOp(BinOp, Type, Type),
    IfConditionNotBool(Type),
    FixTypeNotFunction(Type),
    BranchMismatch(String),
    UnusedAffine(String),
    BoxInnerNotConsumed(String),
    MissingMain,
    MultipleMains,
    MainMustBeUnit(Type),
    MainMustReturnInt(Type),
    InfiniteType,
}

impl std::fmt::Display for TypeError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "[{}] {}", self.code(), self.detailed())
    }
}

impl TypeError {
    pub fn code(&self) -> &'static str {
        match self {
            TypeError::AffineViolation(_) => "D001",
            TypeError::UnusedAffine(_) | TypeError::BoxInnerNotConsumed(_) => "W001",
            TypeError::BranchMismatch(_) => "D004",
            TypeError::DupOnAffine(_) => "D005",
            TypeError::TypeMismatch { .. } | TypeError::InvalidBinOp(..)
                | TypeError::IfConditionNotBool(_) | TypeError::FixTypeNotFunction(_)
                | TypeError::InfiniteType => "D006",
            TypeError::UnboundVariable(_) => "D007",
            TypeError::MissingMain | TypeError::MultipleMains
                | TypeError::MainMustBeUnit(_) | TypeError::MainMustReturnInt(_) => "D008",
        }
    }

    pub fn detailed(&self) -> String {
        match self {
            TypeError::UnboundVariable(x) => format!("unbound variable '{x}'"),
            TypeError::TypeMismatch { expected, found } => {
                format!("type mismatch: expected {expected}, found {found}")
            }
            TypeError::AffineViolation(x) => {
                format!("affine violation: variable '{x}' used more than once")
            }
            TypeError::DupOnAffine(ty) => {
                format!("cannot dup value of type {ty} — only normal types are copyable")
            }
            TypeError::InvalidBinOp(op, l, r) => {
                format!("invalid binary operation {op:?} on types {l} and {r}")
            }
            TypeError::IfConditionNotBool(ty) => {
                format!("if condition must be Bool, found {ty}")
            }
            TypeError::FixTypeNotFunction(ty) => {
                format!("fix requires a function type, found {ty}")
            }
            TypeError::BranchMismatch(msg) => {
                format!("branch mismatch: {msg}")
            }
            TypeError::UnusedAffine(x) => {
                format!("resource leak: affine variable '{x}' is never consumed")
            }
            TypeError::BoxInnerNotConsumed(x) => {
                format!("resource leak: Box '{x}' captured by closure but never unboxed")
            }
            TypeError::MissingMain => {
                "missing entry point: define 'def main = fn () {{ ... }}' returning Int".into()
            }
            TypeError::MultipleMains => {
                "multiple 'main' definitions found — only one allowed".into()
            }
            TypeError::MainMustBeUnit(ty) => {
                format!("main must take no parameters (fn ()), found parameter type {ty}")
            }
            TypeError::MainMustReturnInt(ty) => {
                format!("main must return Int as exit code, found return type {ty}")
            }
            TypeError::InfiniteType => "infinite type detected — recursive type".into(),
        }
    }
}

/// Typing context: maps variable names to (scheme, consumed?).
#[derive(Debug, Clone)]
struct Ctx {
    vars: HashMap<String, (Scheme, bool)>,
}

impl Ctx {
    fn new() -> Self {
        Ctx { vars: HashMap::new() }
    }

    fn insert(&mut self, name: String, scheme: Scheme) {
        self.vars.insert(name, (scheme, false));
    }

    fn consume(&mut self, name: &str) -> Result<(), TypeError> {
        match self.vars.get_mut(name) {
            Some((_, consumed)) => {
                if *consumed {
                    Err(TypeError::AffineViolation(name.to_string()))
                } else {
                    *consumed = true;
                    Ok(())
                }
            }
            None => Ok(()), // May be out of scope — not an error
        }
    }
}

pub struct TypeChecker<'a> {
    ctx: Ctx,
    diag: &'a mut DiagnosticCollector,
    tv_counter: u32,
}

impl<'a> TypeChecker<'a> {
    pub fn new(diag: &'a mut DiagnosticCollector) -> Self {
        TypeChecker { ctx: Ctx::new(), diag, tv_counter: 0 }
    }

    fn fresh_var(&mut self) -> Type {
        let v = self.tv_counter;
        self.tv_counter += 1;
        Type::Var(v)
    }

    // ── Unification ──────────────────────────────────────────────────

    fn unify(&self, t1: &Type, t2: &Type) -> Result<Subst, TypeError> {
        match (t1, t2) {
            (Type::Var(v1), Type::Var(v2)) if v1 == v2 => Ok(Subst::new()),
            (Type::Var(v), other) => {
                if occurs_in(*v, other) {
                    Err(TypeError::InfiniteType)
                } else {
                    Ok(Subst::singleton(*v, other.clone()))
                }
            }
            (other, Type::Var(v)) => {
                if occurs_in(*v, other) {
                    Err(TypeError::InfiniteType)
                } else {
                    Ok(Subst::singleton(*v, other.clone()))
                }
            }
            (Type::Int, Type::Int)
            | (Type::Bool, Type::Bool)
            | (Type::Unit, Type::Unit) => Ok(Subst::new()),
            (Type::Box(a), Type::Box(b)) => self.unify(a, b),
            (Type::List(a), Type::List(b)) => self.unify(a, b),
            (Type::Fun(p1, r1, _), Type::Fun(p2, r2, _)) => {
                // Affinity is metadata from capture inference — ignore for unification
                let s1 = self.unify(p1, p2)?;
                let s2 = self.unify(&r1.apply(&s1), &r2.apply(&s1))?;
                Ok(s1.compose(&s2))
            }
            _ => Err(TypeError::TypeMismatch {
                expected: t1.clone(), found: t2.clone(),
            }),
        }
    }

    // ── Instantiation ────────────────────────────────────────────────

    fn instantiate(&mut self, scheme: &Scheme) -> Type {
        if scheme.vars.is_empty() {
            return scheme.body.clone();
        }
        let mut subst = Subst::new();
        for v in &scheme.vars {
            let fresh = self.fresh_var();
            subst = subst.compose(&Subst::singleton(*v, fresh));
        }
        scheme.body.apply(&subst)
    }

    // ── Generalization ───────────────────────────────────────────────

    fn generalize(&self, ty: &Type, ctx_vars: &HashSet<u32>) -> Scheme {
        let free = free_type_vars(ty);
        let vars: Vec<u32> = free.into_iter().filter(|v| !ctx_vars.contains(v)).collect();
        Scheme { vars, body: ty.clone() }
    }

    fn ctx_type_vars(&self) -> HashSet<u32> {
        let mut vars = HashSet::new();
        for (_, (scheme, _)) in &self.ctx.vars {
            for v in &scheme.vars {
                vars.insert(*v);
            }
            collect_type_vars(&scheme.body, &mut vars);
        }
        vars
    }

    // ── Public check entry point ─────────────────────────────────────

    pub fn check(&mut self, expr: &Expr) -> Result<Type, TypeError> {
        let (subst, ty) = self.infer_w(expr)?;
        self.validate_main(expr)?;
        Ok(ty.apply(&subst))
    }

    fn validate_main(&self, expr: &Expr) -> Result<(), TypeError> {
        let mains = find_main_bindings(expr);
        match mains.len() {
            0 => Err(TypeError::MissingMain),
            1 => {
                let (param_ty, body_ty) = &mains[0];
                if *param_ty != Type::Unit {
                    Err(TypeError::MainMustBeUnit(param_ty.clone()))
                } else if *body_ty != Type::Int {
                    Err(TypeError::MainMustReturnInt(body_ty.clone()))
                } else {
                    Ok(())
                }
            }
            _ => Err(TypeError::MultipleMains),
        }
    }

    // ── Algorithm W ──────────────────────────────────────────────────

    /// infer_w(expr) → (Subst, Type)
    /// Returns the substitution discovered during inference and the type of the expression.
    fn infer_w(&mut self, expr: &Expr) -> Result<(Subst, Type), TypeError> {
        match expr {
            Expr::LitInt(_, _) => Ok((Subst::new(), Type::Int)),
            Expr::LitBool(_, _) => Ok((Subst::new(), Type::Bool)),
            Expr::LitUnit(_) => Ok((Subst::new(), Type::Unit)),

            Expr::Var(name, _) => {
                let scheme = self.ctx.vars.get(name).map(|(s, _)| s.clone());
                match scheme {
                    Some(scheme) => {
                        let ty = self.instantiate(&scheme);
                        // Affine check + consume tracking
                        if !matches!(&ty, Type::Var(_)) && ty.is_affine() {
                            if let Some((_, consumed)) = self.ctx.vars.get_mut(name) {
                                if *consumed {
                                    return Err(TypeError::AffineViolation(name.clone()));
                                }
                                *consumed = true;
                            }
                        }
                        Ok((Subst::new(), ty))
                    }
                    None => Err(TypeError::UnboundVariable(name.clone())),
                }
            }

            Expr::BinOp(op, left, right, _) => {
                let (s1, lty) = self.infer_w(left)?;
                let (s2, rty) = self.infer_w(right)?;
                let s = s1.compose(&s2);
                match op {
                    BinOp::Add | BinOp::Sub | BinOp::Mul | BinOp::Div => {
                        let s3 = self.unify(&lty, &Type::Int)?;
                        let s4 = self.unify(&rty.apply(&s3), &Type::Int)?;
                        Ok((s.compose(&s3).compose(&s4), Type::Int))
                    }
                    BinOp::Eq | BinOp::Lt | BinOp::Gt => {
                        let s3 = self.unify(&lty, &Type::Int)?;
                        let s4 = self.unify(&rty.apply(&s3), &Type::Int)?;
                        Ok((s.compose(&s3).compose(&s4), Type::Bool))
                    }
                }
            }

            Expr::If(cond, then_, else_, _) => {
                let (s1, cty) = self.infer_w(cond)?;
                let s2 = self.unify(&cty, &Type::Bool)?;
                let ctx_saved = self.ctx.clone();
                let (s3, tty) = self.infer_w(then_)?;
                let ctx_then = self.ctx.clone();
                self.ctx = ctx_saved.clone();
                let (s4, ety) = self.infer_w(else_)?;
                let ctx_else = self.ctx.clone();
                let s5 = self.unify(&tty, &ety)?;
                // Affine branch merge
                let mut merged_ctx = ctx_saved;
                for (name, (_, _)) in &ctx_then.vars {
                    let then_c = ctx_then.vars.get(name).map(|(_, c)| *c).unwrap_or(false);
                    let else_c = ctx_else.vars.get(name).map(|(_, c)| *c).unwrap_or(false);
                    if then_c != else_c {
                        let then_ty = ctx_then.vars.get(name).map(|(s, _)| s.body.clone());
                        if let Some(ty) = then_ty {
                            if !matches!(&ty, Type::Var(_)) && ty.is_affine() {
                                let msg = if then_c {
                                    format!("affine variable '{name}' consumed in then-branch but not else-branch")
                                } else {
                                    format!("affine variable '{name}' consumed in else-branch but not then-branch")
                                };
                                return Err(TypeError::BranchMismatch(msg));
                            }
                        }
                    }
                    let scheme = ctx_then.vars.get(name).map(|(s, _)| s.clone())
                        .unwrap_or_else(|| Scheme::monomorphic(Type::Int));
                    merged_ctx.vars.insert(name.clone(), (scheme, then_c || else_c));
                }
                self.ctx = merged_ctx;
                let s = s1.compose(&s2).compose(&s3).compose(&s4).compose(&s5);
                Ok((s, tty))
            }

            Expr::Lam(param, param_ty, body, _) => {
                let param_type = if *param_ty == Type::Var(u32::MAX) {
                    // Sentinel: type was omitted in source → fresh variable
                    self.fresh_var()
                } else {
                    param_ty.clone()
                };
                let saved = self.ctx.clone();
                self.ctx.insert(param.clone(), Scheme::monomorphic(param_type.clone()));
                let (s, body_ty) = self.infer_w(body)?;
                self.ctx = saved.clone();
                // Compute free variables + affine captures
                let free = free_vars_of_expr(body);
                let mut has_affine = false;
                let mut affine_captures: Vec<String> = Vec::new();
                for fv in &free {
                    if fv == param { continue; }
                    if let Some((scheme, _)) = saved.vars.get(fv) {
                        let captured_ty = scheme.body.apply(&s);
                        if !matches!(&captured_ty, Type::Var(_)) && captured_ty.is_affine() {
                            has_affine = true;
                            affine_captures.push(format!("{fv}: {captured_ty}"));
                        }
                    }
                }
                let affinity = if has_affine {
                    for fv in &free {
                        if let Some((scheme, _)) = saved.vars.get(fv) {
                            let ct = scheme.body.apply(&s);
                            if !matches!(&ct, Type::Var(_)) && ct.is_affine() {
                                let _ = self.ctx.consume(fv);
                            }
                        }
                    }
                    self.diag.record_closure_classification(param, &affine_captures);
                    Affinity::Affine
                } else {
                    Affinity::Normal
                };
                let fn_ty = Type::Fun(Box::new(param_type.apply(&s)), Box::new(body_ty.clone()), affinity);
                Ok((s, fn_ty))
            }

            Expr::App(fn_expr, arg, _) => {
                let (s1, fn_ty) = self.infer_w(fn_expr)?;
                let (s2, arg_ty) = self.infer_w(arg)?;
                let ret_ty = self.fresh_var();
                let fn_expected = Type::Fun(
                    Box::new(arg_ty.clone()),
                    Box::new(ret_ty.clone()),
                    Affinity::Normal,
                );
                let s3 = self.unify(&fn_ty.apply(&s2), &fn_expected)?;
                let s = s1.compose(&s2).compose(&s3);
                Ok((s, ret_ty.apply(&s3)))
            }

            Expr::Let(name, bind, body, _) => {
                let ctx_vars = self.ctx_type_vars();
                let (s1, bind_ty) = self.infer_w(bind)?;
                let scheme = self.generalize(&bind_ty.apply(&s1), &ctx_vars);
                self.ctx.insert(name.clone(), scheme.clone());
                let (s2, body_ty) = self.infer_w(body)?;
                // Warn if affine binding is never consumed
                let concrete = bind_ty.apply(&s1).apply(&s2);
                if !matches!(&concrete, Type::Var(_)) && concrete.is_affine() {
                    if let Some((_, consumed)) = self.ctx.vars.get(name) {
                        if !consumed {
                            self.diag.record_unused_variable(name);
                            self.diag.record_resource_leak(name);
                        }
                    }
                }
                Ok((s1.compose(&s2), body_ty))
            }

            Expr::Dup(inner, _) => {
                let (s, ty) = self.infer_w(inner)?;
                let concrete = ty.apply(&s);
                if !matches!(&concrete, Type::Var(_)) && concrete.is_affine() {
                    return Err(TypeError::DupOnAffine(concrete));
                }
                Ok((s, ty))
            }

            Expr::Fix(name, ty, body, _) => {
                match ty {
                    Type::Fun(_, _, _) => {
                        let saved = self.ctx.clone();
                        self.ctx.vars.insert(name.clone(), (Scheme::monomorphic(ty.clone()), true));
                        let (s, body_ty) = self.infer_w(body)?;
                        self.ctx = saved.clone();
                        let concrete_body = body_ty.apply(&s);
                        if concrete_body != *ty {
                            return Err(TypeError::TypeMismatch { expected: ty.clone(), found: concrete_body });
                        }
                        Ok((s, ty.clone()))
                    }
                    _ => Err(TypeError::FixTypeNotFunction(ty.clone())),
                }
            }

            Expr::Box(inner, _) => {
                let (s, inner_ty) = self.infer_w(inner)?;
                Ok((s, Type::Box(Box::new(inner_ty))))
            }

            Expr::Unbox(inner, _) => {
                let (s, inner_ty) = self.infer_w(inner)?;
                let elem = self.fresh_var();
                let s2 = self.unify(&inner_ty.apply(&s), &Type::Box(Box::new(elem.clone())))?;
                Ok((s.compose(&s2), elem.apply(&s2)))
            }

            Expr::Nil(_) => {
                let elem = self.fresh_var();
                Ok((Subst::new(), Type::List(Box::new(elem))))
            }

            Expr::Cons(head, tail, _) => {
                let (s1, head_ty) = self.infer_w(head)?;
                let (s2, tail_ty) = self.infer_w(tail)?;
                let elem = self.fresh_var();
                let s3 = self.unify(&tail_ty.apply(&s1), &Type::List(Box::new(elem.clone())))?;
                let s4 = self.unify(&head_ty.apply(&s1.compose(&s3)), &elem)?;
                let s = s1.compose(&s2).compose(&s3).compose(&s4);
                let result_ty = Type::List(Box::new(elem.apply(&s)));
                Ok((s, result_ty))
            }

            Expr::Head(list, _) => {
                let (s, list_ty) = self.infer_w(list)?;
                let elem = self.fresh_var();
                let s2 = self.unify(&list_ty.apply(&s), &Type::List(Box::new(elem.clone())))?;
                Ok((s.compose(&s2), elem.apply(&s2)))
            }

            Expr::Tail(list, _) => {
                let (s, list_ty) = self.infer_w(list)?;
                Ok((s, list_ty))
            }

            Expr::IsNil(list, _) => {
                let (s, list_ty) = self.infer_w(list)?;
                let elem = self.fresh_var();
                let s2 = self.unify(&list_ty.apply(&s), &Type::List(Box::new(elem)))?;
                Ok((s.compose(&s2), Type::Bool))
            }

            Expr::ForceStrict(inner, _) => {
                self.infer_w(inner)
            }

            Expr::Constructor(name, args, _) => {
                let mut s = Subst::new();
                let mut arg_tys = Vec::new();
                for a in args {
                    let (s_a, ty_a) = self.infer_w(a)?;
                    s = s.compose(&s_a);
                    arg_tys.push(ty_a.apply(&s_a));
                }
                // Type will be resolved against type decls later
                let ret = Type::Named(name.clone(), arg_tys);
                Ok((s, ret))
            }

            Expr::Match(scrutinee, arms, _) => {
                let (s_scrut, scrut_ty) = self.infer_w(scrutinee)?;
                if arms.is_empty() {
                    return Err(TypeError::TypeMismatch {
                        expected: Type::Int, found: Type::Int,
                    });
                }
                let (_, first_body_ty) = self.infer_w(&arms[0].1)?;
                for (pat, body) in &arms[1..] {
                    let (_, body_ty) = self.infer_w(body)?;
                    // TODO: proper pattern type checking
                    let _ = (pat, body_ty);
                }
                Ok((s_scrut, first_body_ty))
            }

            Expr::Pipe(left, right, _) => { /* ... existing ... */
                let desugared = match right.as_ref() {
                    Expr::Var(name, span) => match name.as_str() {
                        "tail" => Expr::Tail(left.clone(), *span),
                        "head" => Expr::Head(left.clone(), *span),
                        "isnil" => Expr::IsNil(left.clone(), *span),
                        _ => Expr::App(right.clone(), left.clone(), *span),
                    },
                    _ => Expr::App(right.clone(), left.clone(), (0, 0, 0, 0)),
                };
                self.infer_w(&desugared)
            }
        }
    }
}

// ── Type variable utilities ──────────────────────────────────────────

fn occurs_in(var: u32, ty: &Type) -> bool {
    match ty {
        Type::Var(v) => *v == var,
        Type::Box(inner) => occurs_in(var, inner),
        Type::List(inner) => occurs_in(var, inner),
        Type::Named(_, args) => args.iter().any(|a| occurs_in(var, a)),
        Type::Fun(p, r, _) => occurs_in(var, p) || occurs_in(var, r),
        _ => false,
    }
}

fn collect_type_vars(ty: &Type, vars: &mut HashSet<u32>) {
    match ty {
        Type::Var(v) => { vars.insert(*v); }
        Type::Box(inner) => collect_type_vars(inner, vars),
        Type::List(inner) => collect_type_vars(inner, vars),
        Type::Named(_, args) => { for a in args { collect_type_vars(a, vars); } }
        Type::Fun(p, r, _) => { collect_type_vars(p, vars); collect_type_vars(r, vars); }
        _ => {}
    }
}

fn free_type_vars(ty: &Type) -> HashSet<u32> {
    let mut vars = HashSet::new();
    collect_type_vars(ty, &mut vars);
    vars
}

// ── Free variable analysis ───────────────────────────────────────────

pub fn free_vars_of_expr(expr: &Expr) -> HashSet<String> {
    let mut fv = HashSet::new();
    collect_free(expr, &mut fv);
    fv
}

fn collect_free(expr: &Expr, fv: &mut HashSet<String>) {
    match expr {
        Expr::Var(name, _) => { fv.insert(name.clone()); }
        Expr::LitInt(_, _) | Expr::LitBool(_, _) | Expr::LitUnit(_) => {}
        Expr::BinOp(_, left, right, _) => { collect_free(left, fv); collect_free(right, fv); }
        Expr::If(cond, then_, else_, _) => { collect_free(cond, fv); collect_free(then_, fv); collect_free(else_, fv); }
        Expr::Lam(param, _, body, _) => { let mut b = HashSet::new(); collect_free(body, &mut b); b.remove(param); fv.extend(b); }
        Expr::App(fn_expr, arg, _) => { collect_free(fn_expr, fv); collect_free(arg, fv); }
        Expr::Let(name, bind, body, _) => { collect_free(bind, fv); let mut b = HashSet::new(); collect_free(body, &mut b); b.remove(name); fv.extend(b); }
        Expr::Dup(inner, _) => { collect_free(inner, fv); }
        Expr::Fix(name, _, body, _) => { let mut b = HashSet::new(); collect_free(body, &mut b); b.remove(name); fv.extend(b); }
        Expr::Box(inner, _) => { collect_free(inner, fv); }
        Expr::Unbox(inner, _) => { collect_free(inner, fv); }
        Expr::ForceStrict(inner, _) => { collect_free(inner, fv); }
        Expr::Constructor(_, args, _) => { for a in args { collect_free(a, fv); } }
        Expr::Match(scrut, arms, _) => { collect_free(scrut, fv); for (_, b) in arms { collect_free(b, fv); } }
        Expr::Nil(_) => {}
        Expr::Cons(head, tail, _) => { collect_free(head, fv); collect_free(tail, fv); }
        Expr::Head(inner, _) => { collect_free(inner, fv); }
        Expr::Tail(inner, _) => { collect_free(inner, fv); }
        Expr::IsNil(inner, _) => { collect_free(inner, fv); }
        Expr::Pipe(left, right, _) => { collect_free(left, fv); collect_free(right, fv); }
    }
}

// ── Main function validation ─────────────────────────────────────────

pub fn find_main_bindings(expr: &Expr) -> Vec<(Type, Type)> {
    let mut results = Vec::new();
    find_main_in(expr, &mut results);
    results
}

fn find_main_in(expr: &Expr, results: &mut Vec<(Type, Type)>) {
    match expr {
        Expr::Let(name, bind, body, _) => {
            if name == "main" {
                if let Expr::Lam(_param, param_ty, body_expr, _) = bind.as_ref() {
                    let body_ty = infer_body_type(body_expr);
                    results.push((param_ty.clone(), body_ty));
                }
            }
            find_main_in(bind, results);
            find_main_in(body, results);
        }
        Expr::If(_, then_, else_, _) => { find_main_in(then_, results); find_main_in(else_, results); }
        Expr::BinOp(_, left, right, _) => { find_main_in(left, results); find_main_in(right, results); }
        Expr::App(fn_expr, arg, _) => { find_main_in(fn_expr, results); find_main_in(arg, results); }
        Expr::Dup(inner, _) => find_main_in(inner, results),
        Expr::Fix(_, _, body, _) => find_main_in(body, results),
        Expr::Box(inner, _) => find_main_in(inner, results),
        Expr::Unbox(inner, _) => find_main_in(inner, results),
        Expr::Cons(head, tail, _) => { find_main_in(head, results); find_main_in(tail, results); }
        Expr::Head(inner, _) => find_main_in(inner, results),
        Expr::Tail(inner, _) => find_main_in(inner, results),
        Expr::IsNil(inner, _) => find_main_in(inner, results),
        Expr::ForceStrict(inner, _) => find_main_in(inner, results),
        Expr::Constructor(_, args, _) => { for a in args { find_main_in(a, results); } }
        Expr::Match(scrut, arms, _) => { find_main_in(scrut, results); for (_, b) in arms { find_main_in(b, results); } }
        Expr::Pipe(left, right, _) => { find_main_in(left, results); find_main_in(right, results); }
        Expr::Lam(_, _, body, _) => find_main_in(body, results),
        _ => {}
    }
}

fn infer_body_type(expr: &Expr) -> Type {
    match expr {
        Expr::LitInt(_, _) => Type::Int,
        Expr::LitBool(_, _) => Type::Bool,
        Expr::LitUnit(_) => Type::Unit,
        Expr::BinOp(op, _, _, _) => match op {
            BinOp::Add | BinOp::Sub | BinOp::Mul | BinOp::Div => Type::Int,
            BinOp::Eq | BinOp::Lt | BinOp::Gt => Type::Bool,
        },
        Expr::If(_, then_, _, _) => infer_body_type(then_),
        Expr::App(_, _, _) => Type::Int,
        Expr::Let(_, _, body, _) => infer_body_type(body),
        Expr::Var(_, _) => Type::Int,
        Expr::Dup(_, _) => Type::Int,
        Expr::Fix(_, _, _, _) => Type::Int,
        Expr::Head(_, _) => Type::Int,
        Expr::Tail(_, _) => Type::Int,
        Expr::IsNil(_, _) => Type::Bool,
        Expr::Box(_, _) => Type::Box(Box::new(Type::Int)),
        Expr::Unbox(inner, _) => match infer_body_type(inner) {
            Type::Box(t) => *t,
            _ => Type::Int,
        },
        Expr::Cons(_, _, _) => Type::Int,
        Expr::ForceStrict(inner, _) => infer_body_type(inner),
        Expr::Constructor(_, _, _) => Type::Int,
        Expr::Match(_, arms, _) => if let Some((_, b)) = arms.first() { infer_body_type(b) } else { Type::Int },
        Expr::Pipe(left, right, _) => {
            infer_body_type(&Expr::App(right.clone(), left.clone(), (0, 0, 0, 0)))
        }
        Expr::Lam(_, _, _, _) => Type::Int,
        Expr::Nil(_) => Type::Int,
    }
}
