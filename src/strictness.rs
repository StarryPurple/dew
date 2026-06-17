/// Strictness context: whether an expression is demanded immediately.
/// Drives thunk insertion during IR generation.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Strictness {
    Strict,
    Lazy,
}

/// Walk the AST and classify each expression's strictness context.
/// Returns the strictness of the program's final expression.
pub fn analyze(prog: &crate::ast::Program) -> ProgramStrictness {
    let mut ctx = StrictnessContext::new();
    for decl in &prog.decls {
        if let crate::ast::Decl::Def(d) = decl {
            ctx.classify_expr(&d.value, Strictness::Lazy);
        }
    }
    ProgramStrictness { _marker: () }
}

/// Result of strictness analysis — holds no data for now,
/// but the classification is used during IR generation.
pub struct ProgramStrictness {
    _marker: (),
}

struct StrictnessContext {
    in_io_body: bool,
}

impl StrictnessContext {
    fn new() -> Self {
        StrictnessContext { in_io_body: false }
    }

    fn classify_expr(&mut self, expr: &crate::ast::Expr, context: Strictness) -> Strictness {
        match expr {
            crate::ast::Expr::IntLit(_) | crate::ast::Expr::BoolLit(_)
            | crate::ast::Expr::CharLit(_) | crate::ast::Expr::UnitLit(_)
            | crate::ast::Expr::Var(_) => Strictness::Strict,

            crate::ast::Expr::Binary(b) => {
                self.classify_expr(&b.left, Strictness::Strict);
                self.classify_expr(&b.right, Strictness::Strict);
                Strictness::Strict
            }
            crate::ast::Expr::Unary(u) => {
                self.classify_expr(&u.expr, Strictness::Strict);
                Strictness::Strict
            }
            crate::ast::Expr::Fn(f) => {
                // Function body: strict if IO, lazy otherwise
                let body_ctx = if self.in_io_body { Strictness::Strict } else { context };
                self.classify_expr(&f.body, body_ctx);
                Strictness::Lazy // fn definition is lazy
            }
            crate::ast::Expr::Call(c) => {
                self.classify_expr(&c.func, Strictness::Strict);
                for arg in &c.args {
                    match arg {
                        crate::ast::ExprArg::Value(e) => {
                            self.classify_expr(e, Strictness::Lazy);
                        }
                        crate::ast::ExprArg::Borrow(_) => {}
                    }
                }
                Strictness::Strict // call result is strict
            }
            crate::ast::Expr::If(i) => {
                self.classify_expr(&i.condition, Strictness::Strict);
                self.classify_expr(&i.then_branch, context);
                self.classify_expr(&i.else_branch, context);
                context
            }
            crate::ast::Expr::Match(m) => {
                self.classify_expr(&m.scrutinee, Strictness::Strict);
                for arm in &m.arms {
                    self.classify_expr(&arm.body, context);
                }
                context
            }
            crate::ast::Expr::Block(b) => {
                for stmt in &b.stmts {
                    self.classify_expr(&stmt.expr, Strictness::Lazy);
                }
                if let Some(final_expr) = &b.final_expr {
                    self.classify_expr(final_expr, context)
                } else {
                    Strictness::Lazy
                }
            }
            crate::ast::Expr::Force(f) => {
                self.classify_expr(&f.expr, Strictness::Strict);
                Strictness::Strict
            }
            crate::ast::Expr::TupleLit(t) => {
                for e in &t.elements {
                    self.classify_expr(e, Strictness::Lazy);
                }
                Strictness::Lazy
            }
            crate::ast::Expr::StructLit(s) => {
                for f in &s.fields {
                    if let Some(v) = &f.value {
                        self.classify_expr(v, Strictness::Lazy);
                    }
                }
                Strictness::Lazy
            }
            crate::ast::Expr::EnumLit(e) => {
                match &e.payload {
                    crate::ast::EnumPayload::Single(exprs) => {
                        for expr in exprs {
                            self.classify_expr(expr, Strictness::Lazy);
                        }
                    }
                    crate::ast::EnumPayload::Struct(fields) => {
                        for f in fields {
                            if let Some(v) = &f.value {
                                self.classify_expr(v, Strictness::Lazy);
                            }
                        }
                    }
                    _ => {}
                }
                Strictness::Lazy
            }
            crate::ast::Expr::ArrayLit(a) => {
                for e in &a.elements {
                    self.classify_expr(e, Strictness::Lazy);
                }
                Strictness::Lazy
            }
            crate::ast::Expr::ArrayFill(a) => {
                self.classify_expr(&a.value, Strictness::Lazy);
                Strictness::Lazy
            }
            crate::ast::Expr::Field(f) => {
                self.classify_expr(&f.object, Strictness::Strict);
                Strictness::Strict
            }
            crate::ast::Expr::Subscript(s) => {
                self.classify_expr(&s.array, Strictness::Strict);
                self.classify_expr(&s.index, Strictness::Strict);
                Strictness::Strict
            }
            crate::ast::Expr::Update(u) => {
                self.classify_expr(&u.base, Strictness::Strict);
                for uf in &u.updates {
                    match uf {
                        crate::ast::UpdateField::NamedField { value, .. }
                        | crate::ast::UpdateField::ArrayIndex { value, .. }
                        | crate::ast::UpdateField::TupleIndex { value, .. } => {
                            self.classify_expr(value, Strictness::Strict);
                        }
                    }
                }
                Strictness::Strict
            }
            crate::ast::Expr::Pipeline(p) => {
                self.classify_expr(&p.value, Strictness::Strict);
                self.classify_expr(&p.func, Strictness::Strict);
                Strictness::Strict
            }
            crate::ast::Expr::Borrow(b) => {
                if let Some(ref rhs) = b.rhs {
                    match &**rhs {
                        crate::ast::BorrowRhs::Assign(e) => {
                            self.classify_expr(e, Strictness::Strict);
                        }
                        crate::ast::BorrowRhs::Update(updates) => {
                            for uf in updates {
                                match uf {
                                    crate::ast::UpdateField::NamedField { value, .. } => {
                                        self.classify_expr(value, Strictness::Strict);
                                    }
                                    _ => {}
                                }
                            }
                        }
                    }
                }
                Strictness::Strict
            }
            crate::ast::Expr::Fix(f) => {
                self.classify_expr(&f.body, Strictness::Lazy);
                Strictness::Lazy
            }
            crate::ast::Expr::While(w) => {
                self.classify_expr(&w.condition, Strictness::Strict);
                self.classify_expr(&w.body, Strictness::Lazy);
                Strictness::Lazy
            }
            crate::ast::Expr::Loop(l) => {
                self.classify_expr(&l.body, Strictness::Lazy);
                Strictness::Lazy
            }
            crate::ast::Expr::ForIn(fi) => {
                self.classify_expr(&fi.collection, Strictness::Strict);
                self.classify_expr(&fi.body, Strictness::Lazy);
                Strictness::Lazy
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::ast::*;

    #[test]
    fn literals_are_strict() {
        let expr = Expr::IntLit(IntLit { span: Span::DUMMY, value: 42 });
        let mut ctx = StrictnessContext::new();
        assert_eq!(ctx.classify_expr(&expr, Strictness::Lazy), Strictness::Strict);
    }

    #[test]
    fn function_def_is_lazy() {
        let expr = Expr::Fn(FnExpr {
            span: Span::DUMMY,
            params: vec![],
            return_ty: None,
            body: Box::new(Expr::IntLit(IntLit { span: Span::DUMMY, value: 1 })),
        });
        let mut ctx = StrictnessContext::new();
        assert_eq!(ctx.classify_expr(&expr, Strictness::Lazy), Strictness::Lazy);
    }

    #[test]
    fn binary_operands_are_strict() {
        let left = Expr::IntLit(IntLit { span: Span::DUMMY, value: 1 });
        let right = Expr::IntLit(IntLit { span: Span::DUMMY, value: 2 });
        let expr = Expr::Binary(BinaryExpr {
            span: Span::DUMMY, op: BinaryOp::Add,
            left: Box::new(left), right: Box::new(right),
        });
        let mut ctx = StrictnessContext::new();
        assert_eq!(ctx.classify_expr(&expr, Strictness::Lazy), Strictness::Strict);
    }
}
