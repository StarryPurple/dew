/// Affine type checker for Dew.
///
/// Rules:
///   - Int, Bool, Unit are Normal — never consumed on use.
///   - Box(T) is Affine — consumed on use, must be unboxed.
///   - Pure closures (no affine captures) are Normal.
///   - Closures capturing affine variables are Affine (FnOnce).
///   - fix bindings are Normal (recursion needs reuse).

use crate::ast::{BinOp, Expr};
use crate::diagnostics::DiagnosticCollector;
use crate::types::{Affinity, Type};
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
            TypeError::UnusedAffine(_) | TypeError::BoxInnerNotConsumed(_) => "D002",
            TypeError::BranchMismatch(_) => "D004",
            TypeError::DupOnAffine(_) => "D005",
            TypeError::TypeMismatch { .. } | TypeError::InvalidBinOp(..)
                | TypeError::IfConditionNotBool(_) | TypeError::FixTypeNotFunction(_) => "D006",
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
        }
    }
}

/// Typing context: maps variable names to (type, consumed?).
#[derive(Debug, Clone)]
struct Ctx {
    vars: HashMap<String, (Type, bool)>,
}

impl Ctx {
    fn new() -> Self {
        Ctx { vars: HashMap::new() }
    }

    fn insert(&mut self, name: String, ty: Type) {
        self.vars.insert(name, (ty, false));
    }

    /// Look up a variable. Normal types are never consumed.
    /// Affine types are consumed on first use; error on second.
    fn use_var(&mut self, name: &str) -> Result<Type, TypeError> {
        match self.vars.get_mut(name) {
            Some((ty, consumed)) => {
                if ty.is_copyable() {
                    // Normal — don't consume.
                    Ok(ty.clone())
                } else if *consumed {
                    Err(TypeError::AffineViolation(name.to_string()))
                } else {
                    *consumed = true;
                    Ok(ty.clone())
                }
            }
            None => Err(TypeError::UnboundVariable(name.to_string())),
        }
    }

    /// Mark a variable as consumed (for unbox).
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
            None => Err(TypeError::UnboundVariable(name.to_string())),
        }
    }
}

pub struct TypeChecker<'a> {
    ctx: Ctx,
    diag: &'a mut DiagnosticCollector,
}

impl<'a> TypeChecker<'a> {
    pub fn new(diag: &'a mut DiagnosticCollector) -> Self {
        TypeChecker { ctx: Ctx::new(), diag }
    }

    pub fn check(&mut self, expr: &Expr) -> Result<Type, TypeError> {
        let ty = self.infer(expr)?;

        // Validate main function exists and has the right shape.
        self.validate_main(expr)?;

        Ok(ty)
    }

    /// Ensure exactly one `def main = fn () { body }` exists, with body : Int.
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

    fn infer(&mut self, expr: &Expr) -> Result<Type, TypeError> {
        match expr {
            Expr::LitInt(_, _) => Ok(Type::Int),
            Expr::LitBool(_, _) => Ok(Type::Bool),
            Expr::LitUnit(_) => Ok(Type::Unit),
            Expr::Var(name, _) => self.ctx.use_var(name),

            Expr::BinOp(op, left, right, _) => {
                let lty = self.infer(left)?;
                let rty = self.infer(right)?;
                match op {
                    BinOp::Add | BinOp::Sub | BinOp::Mul | BinOp::Div => {
                        if lty != Type::Int || rty != Type::Int {
                            return Err(TypeError::InvalidBinOp(*op, lty, rty));
                        }
                        Ok(Type::Int)
                    }
                    BinOp::Eq | BinOp::Lt | BinOp::Gt => {
                        if lty != Type::Int || rty != Type::Int {
                            return Err(TypeError::InvalidBinOp(*op, lty, rty));
                        }
                        Ok(Type::Bool)
                    }
                }
            }

            Expr::If(cond, then_, else_, _) => {
                let cty = self.infer(cond)?;
                if cty != Type::Bool {
                    return Err(TypeError::IfConditionNotBool(cty));
                }
                let ctx_after_cond = self.ctx.clone();

                let tty = self.infer(then_)?;
                let ctx_after_then = self.ctx.clone();

                self.ctx = ctx_after_cond.clone();
                let ety = self.infer(else_)?;
                let ctx_after_else = self.ctx.clone();

                if tty != ety {
                    return Err(TypeError::TypeMismatch { expected: tty, found: ety });
                }

                // Merge: both branches must consume the same affine variables.
                let mut final_ctx = ctx_after_cond;
                for (name, (ty, _)) in &ctx_after_then.vars {
                    let then_c = ctx_after_then.vars.get(name).map(|(_, c)| *c).unwrap_or(false);
                    let else_c = ctx_after_else.vars.get(name).map(|(_, c)| *c).unwrap_or(false);
                    if then_c != else_c && ty.is_affine() {
                        let msg = if then_c {
                            format!("affine variable '{name}' consumed in then-branch but not else-branch")
                        } else {
                            format!("affine variable '{name}' consumed in else-branch but not then-branch")
                        };
                        return Err(TypeError::BranchMismatch(msg));
                    }
                    final_ctx.vars.insert(name.clone(), (ty.clone(), then_c || else_c));
                }
                self.ctx = final_ctx;
                Ok(tty)
            }

            Expr::Lam(param, param_ty, body, _) => {
                let saved = self.ctx.clone();
                self.ctx.insert(param.clone(), param_ty.clone());

                let body_ty = self.infer(body)?;

                // Compute free variables of the body that are in saved context.
                let free = free_vars_of_expr(body);
                let mut has_affine_capture = false;
                let mut affine_captures: Vec<String> = Vec::new();

                for fv in &free {
                    if fv == param { continue; }
                    if let Some((ty, _)) = saved.vars.get(fv) {
                        if ty.is_affine() {
                            has_affine_capture = true;
                            affine_captures.push(format!("{fv}: {ty}"));
                        }
                    }
                }

                let affinity = if has_affine_capture {
                    // The affine capture is "moved" into the closure.
                    // Mark it as consumed in the outer context.
                    for fv in &free {
                        if let Some((ty, _)) = saved.vars.get(fv) {
                            if ty.is_affine() {
                                if let Err(_) = self.ctx.consume(fv) {
                                    // Was already consumed in body? We track via saved.
                                }
                            }
                        }
                    }
                    self.diag.record_closure_classification(param, &affine_captures);
                    Affinity::Affine
                } else {
                    Affinity::Normal
                };

                self.ctx = saved;
                Ok(Type::Fun(
                    Box::new(param_ty.clone()),
                    Box::new(body_ty),
                    affinity,
                ))
            }

            Expr::App(fn_expr, arg, _) => {
                let fn_ty = self.infer(fn_expr)?;
                let arg_ty = self.infer(arg)?;
                match fn_ty {
                    Type::Fun(expected_arg, ret, _affinity) => {
                        if *expected_arg != arg_ty {
                            return Err(TypeError::TypeMismatch { expected: *expected_arg, found: arg_ty });
                        }
                        Ok(*ret)
                    }
                    _ => Err(TypeError::TypeMismatch {
                        expected: Type::Fun(Box::new(arg_ty), Box::new(Type::Int), Affinity::Normal),
                        found: fn_ty,
                    }),
                }
            }

            Expr::Let(name, bind, body, _) => {
                let bind_ty = self.infer(bind)?;
                self.ctx.insert(name.clone(), bind_ty.clone());
                let body_ty = self.infer(body)?;

                // Warn if an affine binding is never consumed in its body.
                if bind_ty.is_affine() {
                    if let Some((_, consumed)) = self.ctx.vars.get(name) {
                        if !consumed {
                            self.diag.record_unused_variable(name);
                            self.diag.record_resource_leak(name);
                        }
                    }
                }

                Ok(body_ty)
            }

            Expr::Dup(inner, _) => {
                let ty = self.infer(inner)?;
                if ty.is_affine() {
                    return Err(TypeError::DupOnAffine(ty));
                }
                Ok(ty)
            }

            Expr::Fix(name, ty, body, _) => {
                match ty {
                    Type::Fun(_, _, _) => {
                        let saved = self.ctx.clone();
                        // fix binding is Normal within the body.
                        self.ctx.vars.insert(name.clone(), (ty.clone(), true)); // pre-consumed = no tracking
                        let body_ty = self.infer(body)?;
                        self.ctx = saved;
                        if body_ty != *ty {
                            return Err(TypeError::TypeMismatch { expected: ty.clone(), found: body_ty });
                        }
                        Ok(ty.clone())
                    }
                    _ => Err(TypeError::FixTypeNotFunction(ty.clone())),
                }
            }

            Expr::Box(inner, _) => {
                let inner_ty = self.infer(inner)?;
                Ok(Type::Box(Box::new(inner_ty)))
            }

            Expr::Unbox(inner, _) => {
                let inner_ty = self.infer(inner)?;
                match inner_ty {
                    Type::Box(contents) => Ok(*contents),
                    _ => Err(TypeError::TypeMismatch {
                        expected: Type::Box(Box::new(Type::Int)),
                        found: inner_ty,
                    }),
                }
            }

            Expr::Nil(_) => Ok(Type::List(Box::new(Type::Int))), // polymorphic placeholder

            Expr::Cons(head, tail, _) => {
                let head_ty = self.infer(head)?;
                let tail_ty = self.infer(tail)?;
                match tail_ty {
                    Type::List(ref elem_ty) => {
                        if head_ty != **elem_ty {
                            return Err(TypeError::TypeMismatch {
                                expected: *elem_ty.clone(),
                                found: head_ty,
                            });
                        }
                        Ok(Type::List(Box::new(head_ty)))
                    }
                    _ => Err(TypeError::TypeMismatch {
                        expected: Type::List(Box::new(head_ty.clone())),
                        found: tail_ty,
                    }),
                }
            }

            Expr::Head(list, _) => {
                let list_ty = self.infer(list)?;
                match list_ty {
                    Type::List(elem_ty) => Ok(*elem_ty),
                    _ => Err(TypeError::TypeMismatch {
                        expected: Type::List(Box::new(Type::Int)),
                        found: list_ty,
                    }),
                }
            }

            Expr::Tail(list, _) => {
                let list_ty = self.infer(list)?;
                match list_ty {
                    Type::List(_) => Ok(list_ty),
                    _ => Err(TypeError::TypeMismatch {
                        expected: Type::List(Box::new(Type::Int)),
                        found: list_ty,
                    }),
                }
            }

            Expr::IsNil(list, _) => {
                let list_ty = self.infer(list)?;
                match list_ty {
                    Type::List(_) => Ok(Type::Bool),
                    _ => Err(TypeError::TypeMismatch {
                        expected: Type::List(Box::new(Type::Int)),
                        found: list_ty,
                    }),
                }
            }
        }
    }
}

/// Compute the set of free variable names in an expression.
pub fn free_vars_of_expr(expr: &Expr) -> HashSet<String> {
    let mut fv = HashSet::new();
    collect_free(expr, &mut fv);
    fv
}

fn collect_free(expr: &Expr, fv: &mut HashSet<String>) {
    match expr {
        Expr::Var(name, _) => {
            fv.insert(name.clone());
        }
        Expr::LitInt(_, _) | Expr::LitBool(_, _) | Expr::LitUnit(_) => {}
        Expr::BinOp(_, left, right, _) => {
            collect_free(left, fv);
            collect_free(right, fv);
        }
        Expr::If(cond, then_, else_, _) => {
            collect_free(cond, fv);
            collect_free(then_, fv);
            collect_free(else_, fv);
        }
        Expr::Lam(param, _, body, _) => {
            let mut body_fv = HashSet::new();
            collect_free(body, &mut body_fv);
            body_fv.remove(param);
            fv.extend(body_fv);
        }
        Expr::App(fn_expr, arg, _) => {
            collect_free(fn_expr, fv);
            collect_free(arg, fv);
        }
        Expr::Let(name, bind, body, _) => {
            collect_free(bind, fv);
            let mut body_fv = HashSet::new();
            collect_free(body, &mut body_fv);
            body_fv.remove(name);
            fv.extend(body_fv);
        }
        Expr::Dup(inner, _) => {
            collect_free(inner, fv);
        }
        Expr::Fix(name, _, body, _) => {
            let mut body_fv = HashSet::new();
            collect_free(body, &mut body_fv);
            body_fv.remove(name);
            fv.extend(body_fv);
        }
        Expr::Box(inner, _) => {
            collect_free(inner, fv);
        }
        Expr::Unbox(inner, _) => { collect_free(inner, fv); }
        Expr::Nil(_) => {}
        Expr::Cons(head, tail, _) => { collect_free(head, fv); collect_free(tail, fv); }
        Expr::Head(inner, _) => { collect_free(inner, fv); }
        Expr::Tail(inner, _) => { collect_free(inner, fv); }
        Expr::IsNil(inner, _) => { collect_free(inner, fv); }
    }
}

/// Walk the AST and find all `def main = fn (...)` bindings.
/// Returns Vec of (param_type, body_type) for each main found.
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
        Expr::If(_, then_, else_, _) => {
            find_main_in(then_, results);
            find_main_in(else_, results);
        }
        Expr::BinOp(_, left, right, _) => {
            find_main_in(left, results);
            find_main_in(right, results);
        }
        Expr::App(fn_expr, arg, _) => {
            find_main_in(fn_expr, results);
            find_main_in(arg, results);
        }
        Expr::Dup(inner, _) => find_main_in(inner, results),
        Expr::Fix(_, _, body, _) => find_main_in(body, results),
        Expr::Box(inner, _) => find_main_in(inner, results),
        Expr::Unbox(inner, _) => find_main_in(inner, results),
        Expr::Cons(head, tail, _) => {
            find_main_in(head, results);
            find_main_in(tail, results);
        }
        Expr::Head(inner, _) => find_main_in(inner, results),
        Expr::Tail(inner, _) => find_main_in(inner, results),
        Expr::IsNil(inner, _) => find_main_in(inner, results),
        Expr::Lam(_, _, body, _) => find_main_in(body, results),
        _ => {}
    }
}

/// Quick body-type inference for the main check.
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
        Expr::Lam(_, _, _, _) => Type::Int,
        Expr::Nil(_) => Type::Int,
    }
}
