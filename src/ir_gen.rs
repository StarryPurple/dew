// AST -> IR compilation
//
// Uses strictness analysis to insert Suspend/Force nodes.
// Desugars if/else into match, pipe into application, etc.

use crate::ast::*;
use crate::ir::*;
use crate::strictness;

/// Context for IR code generation
pub struct GenCtx {
    /// Variable renaming counter (for uniqueness)
    counter: usize,
}

impl GenCtx {
    pub fn new() -> Self {
        Self { counter: 0 }
    }

    fn fresh_name(&mut self) -> String {
        let n = self.counter;
        self.counter += 1;
        format!("_t{n}")
    }

    /// Compile a Dew declaration to IR
    pub fn compile_decl(&mut self, decl: &Decl) -> Ir {
        match decl {
            Decl::Def { name, value, .. } => {
                let body = self.compile_expr(value);
                Ir::Let {
                    name: name.clone(),
                    value: Box::new(Ir::Suspend(Box::new(body))),
                    body: Box::new(Ir::Var(name.clone())),
                }
            }
            Decl::Struct { .. } | Decl::Enum { .. } | Decl::Import { .. } => {
                Ir::Unit // No runtime effect
            }
        }
    }

    /// Compile a program: list of declarations -> IR
    pub fn compile_program(&mut self, decls: &[Decl]) -> Ir {
        let mut body = Ir::Unit;
        for decl in decls.iter().rev() {
            let ir = self.compile_decl(decl);
            if matches!(ir, Ir::Unit) {
                continue;
            }
            // Nest let bindings
            if let Ir::Let { name, value, body: _ } = ir {
                body = Ir::Let {
                    name,
                    value,
                    body: Box::new(body),
                };
            }
        }
        body
    }

    /// Compile an expression, inserting Suspend/Force based on strictness
    pub fn compile_expr(&mut self, expr: &Expr) -> Ir {
        let s = strictness::classify(expr, strictness::Strictness::Lazy);
        self.compile_expr_with_strictness(expr, s)
    }

    fn compile_expr_with_strictness(&mut self, expr: &Expr, ctx: strictness::Strictness) -> Ir {
        let ir = self.compile_expr_inner(expr);
        match ctx {
            strictness::Strictness::Strict => Ir::Force(Box::new(ir)),
            strictness::Strictness::Lazy => Ir::Suspend(Box::new(ir)),
        }
    }

    fn compile_expr_inner(&mut self, expr: &Expr) -> Ir {
        match expr {
            Expr::Int(n, _) => Ir::Int(*n),
            Expr::Bool(b, _) => Ir::Bool(*b),
            Expr::Char(c, _) => Ir::Char(*c),
            Expr::Unit(_) => Ir::Unit,
            Expr::Var(name, _) => Ir::Var(name.clone()),
            Expr::Fn { params, body, .. } => {
                let param_names: Vec<String> = params.iter().map(|(n, _)| n.clone()).collect();
                let body_ir = self.compile_expr_with_strictness(
                    body,
                    strictness::Strictness::Lazy,
                );
                Ir::Lambda {
                    params: param_names,
                    body: Box::new(body_ir),
                }
            }
            Expr::App { func, args, .. } => {
                let f = self.compile_expr_with_strictness(func, strictness::Strictness::Strict);
                let a: Vec<Ir> = args.iter().map(|a| {
                    self.compile_expr_with_strictness(a, strictness::Strictness::Lazy)
                }).collect();
                Ir::Apply {
                    func: Box::new(f),
                    args: a,
                }
            }
            Expr::Let { name, value, body, .. } => {
                let v = self.compile_expr_with_strictness(value, strictness::Strictness::Lazy);
                let b = self.compile_expr(body);
                Ir::Let {
                    name: name.clone(),
                    value: Box::new(v),
                    body: Box::new(b),
                }
            }
            Expr::If { cond, then, else_, .. } => {
                let c = self.compile_expr_with_strictness(cond, strictness::Strictness::Strict);
                let t = self.compile_expr(then);
                let e = self.compile_expr(else_);
                Ir::If {
                    cond: Box::new(c),
                    then: Box::new(t),
                    else_: Box::new(e),
                }
            }
            Expr::BinOp { op, left, right, .. } => {
                let l = self.compile_expr_with_strictness(left, strictness::Strictness::Strict);
                let r = self.compile_expr_with_strictness(right, strictness::Strictness::Strict);
                Ir::BinOp {
                    op: convert_binop(*op),
                    left: Box::new(l),
                    right: Box::new(r),
                }
            }
            Expr::Return { expr, .. } => {
                let e = self.compile_expr_with_strictness(expr, strictness::Strictness::Strict);
                Ir::Return(Box::new(e))
            }
            _ => Ir::Unit, // TODO: Implement remaining forms
        }
    }
}

fn convert_binop(op: BinOpKind) -> IrBinOp {
    match op {
        BinOpKind::Add => IrBinOp::Add,
        BinOpKind::Sub => IrBinOp::Sub,
        BinOpKind::Mul => IrBinOp::Mul,
        BinOpKind::Div => IrBinOp::Div,
        BinOpKind::Rem => IrBinOp::Rem,
        BinOpKind::Lt => IrBinOp::Lt,
        BinOpKind::Gt => IrBinOp::Gt,
        BinOpKind::Le => IrBinOp::Le,
        BinOpKind::Ge => IrBinOp::Ge,
        BinOpKind::Eq => IrBinOp::Eq,
        BinOpKind::Ne => IrBinOp::Ne,
        BinOpKind::And => IrBinOp::And,
        BinOpKind::Or => IrBinOp::Or,
    }
}
