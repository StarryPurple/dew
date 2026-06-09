/// Compilation from typed AST to IR, with strictness-based suspend/force insertion.

use crate::ast::{BinOp, Expr};
use crate::ir::{Ir, IrOp};
use crate::strictness::{Context, StrictnessAnalysis};
use std::collections::HashSet;

pub fn compile(expr: &Expr) -> Ir {
    let compiler = IrCompiler;
    let ir = compiler.compile_expr(expr, Context::Strict);
    compiler.adjust_context(ir, Context::Strict)
}

struct IrCompiler;

impl IrCompiler {

    fn compile_expr(&self, expr: &Expr, ctx: Context) -> Ir {
        let ir = self.compile_expr_inner(expr, ctx);
        self.adjust_context(ir, ctx)
    }

    fn adjust_context(&self, ir: Ir, ctx: Context) -> Ir {
        match ctx {
            Context::Strict => {
                if StrictnessAnalysis::is_naturally_lazy(&ir) {
                    Ir::Force(Box::new(ir))
                } else { ir }
            }
            Context::Lazy => {
                if StrictnessAnalysis::is_naturally_strict(&ir) {
                    let captures = self.free_vars(&ir);
                    let ty = ir.ty();
                    Ir::Suspend(Box::new(ir), captures, ty, None)
                } else { ir }
            }
        }
    }

    fn compile_expr_inner(&self, expr: &Expr, outer_ctx: Context) -> Ir {
        match expr {
            Expr::LitInt(n, _) => Ir::Lit(*n),
            Expr::LitBool(b, _) => Ir::Bool(*b),
            Expr::LitUnit(_) => Ir::Unit,
            Expr::Var(name, _) => Ir::Var(name.clone()),
            Expr::BinOp(op, left, right, _) => {
                let op_ir = self.convert_op(*op);
                let l = self.compile_expr(left, Context::Strict);
                let r = self.compile_expr(right, Context::Strict);
                Ir::BinOp(op_ir, Box::new(l), Box::new(r))
            }
            Expr::If(cond, then_, else_, _) => {
                let c = self.compile_expr(cond, Context::Strict);
                let t = self.compile_expr(then_, outer_ctx);
                let e = self.compile_expr(else_, outer_ctx);
                Ir::If(Box::new(c), Box::new(t), Box::new(e))
            }
            Expr::Lam(param, param_ty, body, _) => {
                let b = self.compile_expr(body, Context::Lazy);
                let ret_ty = b.ty();
                // Affinity is inferred later; default to Normal here.
                Ir::Lam(param.clone(), Box::new(b), param_ty.clone(), ret_ty, crate::types::Affinity::Normal)
            }
            Expr::App(fn_expr, arg, _) => {
                let f = self.compile_expr(fn_expr, Context::Strict);
                let a = self.compile_expr(arg, Context::Lazy);
                Ir::App(Box::new(f), Box::new(a))
            }
            Expr::Let(name, bind, body, _) => {
                let b = self.compile_expr(bind, Context::Lazy);
                let body_ir = self.compile_expr(body, outer_ctx);
                let body_ty = body_ir.ty();
                Ir::Let(name.clone(), Box::new(b), Box::new(body_ir), body_ty)
            }
            Expr::Dup(inner, _) => {
                let i = self.compile_expr(inner, Context::Strict);
                Ir::Dup(Box::new(i))
            }
            Expr::Fix(name, ty, body, _) => {
                let b = self.compile_expr(body, Context::Lazy);
                Ir::Fix(name.clone(), Box::new(b), ty.clone())
            }
            Expr::Box(inner, _) => {
                let i = self.compile_expr(inner, Context::Strict);
                Ir::Alloc(Box::new(i))
            }
            Expr::Unbox(inner, _) => {
                let i = self.compile_expr(inner, Context::Strict);
                Ir::Dealloc(Box::new(i))
            }
            Expr::Nil(_) => Ir::Nil,
            Expr::Cons(head, tail, _) => {
                // Head is strict, tail is LAZY — this is what enables infinite lists.
                let h = self.compile_expr(head, Context::Strict);
                let t_raw = self.compile_expr(tail, Context::Lazy);
                // Force Suspend on the tail even if it's naturally lazy.
                // This prevents the evaluator from eagerly expanding tails.
                let t = match t_raw {
                    Ir::Suspend(_, _, _, _) => t_raw,
                    other => {
                        let captures = self.free_vars(&other);
                        let ty = other.ty();
                        Ir::Suspend(Box::new(other), captures, ty, None)
                    }
                };
                Ir::Cons(Box::new(h), Box::new(t))
            }
            Expr::Head(list, _) => {
                let l = self.compile_expr(list, Context::Strict);
                Ir::Head(Box::new(l))
            }
            Expr::Tail(list, _) => {
                let l = self.compile_expr(list, Context::Strict);
                Ir::Tail(Box::new(l))
            }
            Expr::IsNil(list, _) => {
                let l = self.compile_expr(list, Context::Strict);
                Ir::IsNil(Box::new(l))
            }
        }
    }

    fn convert_op(&self, op: BinOp) -> IrOp {
        match op {
            BinOp::Add => IrOp::Add, BinOp::Sub => IrOp::Sub,
            BinOp::Mul => IrOp::Mul, BinOp::Div => IrOp::Div,
            BinOp::Eq => IrOp::Eq, BinOp::Lt => IrOp::Lt, BinOp::Gt => IrOp::Gt,
        }
    }

    fn free_vars(&self, ir: &Ir) -> Vec<String> {
        let mut fv = HashSet::new();
        self.collect_free(ir, &mut fv);
        let mut v: Vec<String> = fv.into_iter().collect();
        v.sort();
        v
    }

    fn collect_free(&self, ir: &Ir, fv: &mut HashSet<String>) {
        match ir {
            Ir::Var(name) => { if !name.starts_with('%') { fv.insert(name.clone()); } }
            Ir::Let(name, bind, body, _) => {
                let mut body_fv = HashSet::new();
                self.collect_free(body, &mut body_fv);
                body_fv.remove(name);
                self.collect_free(bind, fv);
                fv.extend(body_fv);
            }
            Ir::Lam(param, body, _, _, _) => {
                let mut body_fv = HashSet::new();
                self.collect_free(body, &mut body_fv);
                body_fv.remove(param);
                fv.extend(body_fv);
            }
            Ir::App(fn_expr, arg) => { self.collect_free(fn_expr, fv); self.collect_free(arg, fv); }
            Ir::If(cond, then_, else_) => {
                self.collect_free(cond, fv); self.collect_free(then_, fv); self.collect_free(else_, fv);
            }
            Ir::BinOp(_, left, right) => { self.collect_free(left, fv); self.collect_free(right, fv); }
            Ir::Dup(inner) => { self.collect_free(inner, fv); }
            Ir::Fix(name, body, _) => {
                let mut body_fv = HashSet::new();
                self.collect_free(body, &mut body_fv);
                body_fv.remove(name);
                fv.extend(body_fv);
            }
            Ir::Suspend(_body, captures, _, _) => { fv.extend(captures.iter().cloned()); }
            Ir::Force(inner) => { self.collect_free(inner, fv); }
            Ir::Alloc(inner) => { self.collect_free(inner, fv); }
            Ir::Dealloc(inner) => { self.collect_free(inner, fv); }
            Ir::Nil => {}
            Ir::Cons(head, tail) => { self.collect_free(head, fv); self.collect_free(tail, fv); }
            Ir::Head(inner) => { self.collect_free(inner, fv); }
            Ir::Tail(inner) => { self.collect_free(inner, fv); }
            Ir::IsNil(inner) => { self.collect_free(inner, fv); }
            Ir::Lit(_) | Ir::Bool(_) | Ir::Unit => {}
        }
    }
}
