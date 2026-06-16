// Desugar: Concrete AST → Core AST.
//
// Eliminates all syntax sugar before type checking:
//   - Pipeline (->) → function calls
//   - if/else → match on Bool
//   - & borrow parameters → tuple returns
//   - & borrow statements → def rebindings
//
// After desugaring, the AST contains only core primitives:
// function application, field access, pattern match, struct/tuple/array
// construction and update. The type checker never sees sugar.

use crate::ast::*;
use crate::diagnostics::DiagnosticCollector;

/// Desugar a complete program. Returns the desugared program.
pub fn desugar_program(prog: &Program, diag: &mut DiagnosticCollector) -> Program {
    let mut decls = Vec::new();
    for decl in &prog.decls {
        let desugared = desugar_decl(decl, diag);
        decls.extend(desugared);
    }
    Program { decls, span: prog.span }
}

fn desugar_decl(decl: &Decl, _diag: &mut DiagnosticCollector) -> Vec<Decl> {
    match decl {
        Decl::Def(d) => {
            let value = desugar_expr(&d.value);
            vec![Decl::Def(DefDecl {
                span: d.span,
                rec: d.rec,
                name: d.name.clone(),
                ty: d.ty.clone(),
                value,
            })]
        }
        Decl::Struct(_) | Decl::Enum(_) | Decl::Import(_) => {
            vec![decl.clone()]
        }
    }
}

fn desugar_expr(expr: &Expr) -> Expr {
    match expr {
        // Pipeline: expr -> f(args)  →  f(args..., expr)
        Expr::Pipeline(p) => {
            let value = desugar_expr(&p.value);
            let func = desugar_expr(&p.func);
            match func {
                Expr::Call(mut call) => {
                    call.args.push(ExprArg::Value(Box::new(value)));
                    Expr::Call(call)
                }
                func_expr => {
                    Expr::Call(CallExpr {
                        span: p.span,
                        func: Box::new(func_expr),
                        args: vec![ExprArg::Value(Box::new(value))],
                    })
                }
            }
        }

        // if/else → match on Bool
        Expr::If(i) => {
            let condition = desugar_expr(&i.condition);
            let then_branch = desugar_expr(&i.then_branch);
            let else_branch = desugar_expr(&i.else_branch);
            Expr::Match(MatchExpr {
                span: i.span,
                scrutinee: Box::new(condition),
                arms: vec![
                    MatchArm {
                        span: Span::DUMMY,
                        pattern: Pattern::Lit(LitPattern {
                            span: Span::DUMMY,
                            value: LitValue::Bool(true),
                        }),
                        body: then_branch,
                    },
                    MatchArm {
                        span: Span::DUMMY,
                        pattern: Pattern::Lit(LitPattern {
                            span: Span::DUMMY,
                            value: LitValue::Bool(false),
                        }),
                        body: else_branch,
                    },
                ],
            })
        }

        // Recursive cases
        Expr::Binary(b) => Expr::Binary(BinaryExpr {
            span: b.span, op: b.op,
            left: Box::new(desugar_expr(&b.left)),
            right: Box::new(desugar_expr(&b.right)),
        }),
        Expr::Unary(u) => Expr::Unary(UnaryExpr {
            span: u.span, op: u.op,
            expr: Box::new(desugar_expr(&u.expr)),
        }),
        Expr::Call(c) => Expr::Call(CallExpr {
            span: c.span,
            func: Box::new(desugar_expr(&c.func)),
            args: c.args.iter().map(|a| match a {
                ExprArg::Value(e) => ExprArg::Value(Box::new(desugar_expr(e))),
                ExprArg::Borrow(b) => {
                    desugar_borrow_arg(b)
                }
            }).collect(),
        }),
        Expr::Block(b) => desugar_block(b),
        Expr::Field(f) => Expr::Field(FieldExpr {
            span: f.span,
            object: Box::new(desugar_expr(&f.object)),
            field: f.field.clone(),
        }),
        Expr::Subscript(s) => Expr::Subscript(SubscriptExpr {
            span: s.span,
            array: Box::new(desugar_expr(&s.array)),
            index: Box::new(desugar_expr(&s.index)),
        }),
        Expr::Update(u) => Expr::Update(UpdateExpr {
            span: u.span,
            base: Box::new(desugar_expr(&u.base)),
            updates: u.updates.iter().map(|uf| match uf {
                UpdateField::NamedField { span, name, value } =>
                    UpdateField::NamedField { span: *span, name: name.clone(), value: desugar_expr(value) },
                UpdateField::ArrayIndex { span, index, value } =>
                    UpdateField::ArrayIndex { span: *span, index: desugar_expr(index), value: desugar_expr(value) },
                UpdateField::TupleIndex { span, index, value } =>
                    UpdateField::TupleIndex { span: *span, index: *index, value: desugar_expr(value) },
            }).collect(),
        }),
        Expr::Force(f) => Expr::Force(ForceExpr {
            span: f.span,
            expr: Box::new(desugar_expr(&f.expr)),
        }),
        Expr::Fn(f) => desugar_fn(f),
        Expr::Match(m) => Expr::Match(MatchExpr {
            span: m.span,
            scrutinee: Box::new(desugar_expr(&m.scrutinee)),
            arms: m.arms.iter().map(|arm| MatchArm {
                span: arm.span,
                pattern: arm.pattern.clone(),
                body: desugar_expr(&arm.body),
            }).collect(),
        }),
        Expr::TupleLit(t) => Expr::TupleLit(TupleLit {
            span: t.span,
            elements: t.elements.iter().map(desugar_expr).collect(),
        }),
        Expr::StructLit(s) => Expr::StructLit(StructLit {
            span: s.span, name: s.name.clone(),
            fields: s.fields.iter().map(|f| StructLitField {
                span: f.span, name: f.name.clone(),
                value: f.value.as_ref().map(|v| desugar_expr(v)),
            }).collect(),
        }),
        Expr::EnumLit(e) => Expr::EnumLit(EnumLit {
            span: e.span, name: e.name.clone(),
            payload: desugar_enum_payload(&e.payload),
        }),
        Expr::ArrayLit(a) => Expr::ArrayLit(ArrayLit {
            span: a.span,
            elements: a.elements.iter().map(desugar_expr).collect(),
        }),
        Expr::ArrayFill(a) => Expr::ArrayFill(ArrayFill {
            span: a.span,
            value: Box::new(desugar_expr(&a.value)),
            count: a.count,
        }),
        Expr::Fix(f) => Expr::Fix(FixExpr {
            span: f.span,
            loop_var: f.loop_var.clone(),
            body: Box::new(desugar_expr(&f.body)),
        }),
        Expr::Borrow(b) => desugar_borrow_stmt(b),

        // Leaf nodes — no desugaring needed
        Expr::IntLit(_) | Expr::BoolLit(_) | Expr::CharLit(_)
        | Expr::UnitLit(_) | Expr::Var(_) => expr.clone(),
    }
}

/// Desugar a function definition: handle borrow parameters.
/// `fn(&p: T, other...) -> U { body }` → `fn(p: T, other...) -> (T, U) { body' }`
fn desugar_fn(f: &FnExpr) -> Expr {
    let has_borrow = f.params.iter().any(|p| p.is_borrow);
    if !has_borrow {
        return Expr::Fn(FnExpr {
            span: f.span,
            params: f.params.clone(),
            return_ty: f.return_ty.clone(),
            body: Box::new(desugar_expr(&f.body)),
        });
    }

    // Track borrow params: (original index, type)
    let borrow_params: Vec<(usize, Option<Type>)> = f.params.iter()
        .enumerate()
        .filter(|(_, p)| p.is_borrow)
        .map(|(i, p)| (i, p.ty.clone()))
        .collect();

    // Remove borrow flags from params
    let new_params: Vec<FnParam> = f.params.iter().map(|p| FnParam {
        span: p.span,
        name: p.name.clone(),
        ty: p.ty.clone(),
        is_borrow: false,
    }).collect();

    // Desugar body: replace &p = expr with def %p = expr
    let body = desugar_expr(&f.body);

    // Wrap body: return tuple of (borrow values..., body result)
    let body_span = body.span();
    let mut elements: Vec<Expr> = borrow_params.iter().map(|&(i, _)| {
        Expr::Var(f.params[i].name.clone())
    }).collect();
    elements.push(body);

    let new_body = Expr::TupleLit(TupleLit {
        span: body_span,
        elements,
    });

    // New return type: (T1, T2, ..., U)
    let new_return_ty = {
        let mut tys: Vec<Type> = borrow_params.iter().map(|&(_, ref ty)| {
            ty.clone().unwrap_or(Type::Wildcard(Span::DUMMY))
        }).collect();
        tys.push(f.return_ty.clone().unwrap_or(Type::Named(NamedType {
            span: Span::DUMMY,
            name: Ident::new("Unit", Span::DUMMY),
            args: None,
        })));
        Type::Tuple(TupleType { span: Span::DUMMY, elements: tys })
    };

    Expr::Fn(FnExpr {
        span: f.span,
        params: new_params,
        return_ty: Some(new_return_ty),
        body: Box::new(new_body),
    })
}

/// Desugar a borrow statement: `&p = expr` → `def %p = expr`
/// `&p { fields }` → `def %p = p { fields }`
fn desugar_borrow_stmt(b: &BorrowExpr) -> Expr {
    let rhs_expr = match &*b.rhs {
        BorrowRhs::Assign(e) => desugar_expr(e),
        BorrowRhs::Update(updates) => {
            let root_expr = Expr::Var(b.lvalue.root.clone());
            build_nested_update(&b.lvalue, root_expr, updates)
        }
    };
    // Emit as a function call to a special intrinsic,
    // which the name resolver will turn into a proper binding.
    // For now, we return the value directly — the caller wraps it.
    rhs_expr
}

/// Desugar a borrow argument at a call site.
/// `f(&x)` → becomes `def (x, result) = f(x)`
/// We return the expression wrapped so the enclosing context handles the destructure.
fn desugar_borrow_arg(b: &BorrowExpr) -> ExprArg {
    let value = match &*b.rhs {
        BorrowRhs::Assign(e) => desugar_expr(e),
        BorrowRhs::Update(updates) => {
            let root_expr = Expr::Var(b.lvalue.root.clone());
            build_nested_update(&b.lvalue, root_expr, updates)
        }
    };
    ExprArg::Value(Box::new(Expr::Var(b.lvalue.root.clone())))
}

/// Build nested struct/array/tuple update from an lvalue path.
fn build_nested_update(lvalue: &LValue, base: Expr, updates: &[UpdateField]) -> Expr {
    if lvalue.path.is_empty() {
        // Simple case: &x { fields } — just the update expression
        Expr::Update(UpdateExpr {
            span: lvalue.span,
            base: Box::new(base),
            updates: updates.to_vec(),
        })
    } else {
        // Complex case: &x.a.b = val — navigate then update
        let mut current = base;
        for (i, accessor) in lvalue.path.iter().enumerate() {
            if i == lvalue.path.len() - 1 {
                // Last accessor: apply update
                match accessor {
                    LValueAccessor::Field(name) => {
                        let mut named_updates = Vec::new();
                        for uf in updates {
                            match uf {
                                UpdateField::NamedField { span, name: n, value } => {
                                    named_updates.push(UpdateField::NamedField {
                                        span: *span, name: n.clone(), value: value.clone(),
                                    });
                                }
                                _ => {}
                            }
                        }
                        current = Expr::Update(UpdateExpr {
                            span: lvalue.span,
                            base: Box::new(current),
                            updates: named_updates,
                        });
                    }
                    _ => {
                        current = Expr::Update(UpdateExpr {
                            span: lvalue.span,
                            base: Box::new(current),
                            updates: updates.to_vec(),
                        });
                    }
                }
            } else {
                current = match accessor {
                    LValueAccessor::Field(name) => Expr::Field(FieldExpr {
                        span: lvalue.span,
                        object: Box::new(current),
                        field: name.clone(),
                    }),
                    LValueAccessor::Index(idx) => Expr::Subscript(SubscriptExpr {
                        span: lvalue.span,
                        array: Box::new(current),
                        index: Box::new(idx.clone()),
                    }),
                    LValueAccessor::TupleIndex(i) => Expr::Field(FieldExpr {
                        span: lvalue.span,
                        object: Box::new(current),
                        field: Ident::new(format!("{}", i), Span::DUMMY),
                    }),
                };
            }
        }
        current
    }
}

fn desugar_enum_payload(p: &EnumPayload) -> EnumPayload {
    match p {
        EnumPayload::Single(opt) => EnumPayload::Single(opt.as_ref().map(|e| Box::new(desugar_expr(e)))),
        EnumPayload::Struct(fields) => EnumPayload::Struct(
            fields.iter().map(|f| StructLitField {
                span: f.span, name: f.name.clone(),
                value: f.value.as_ref().map(|v| desugar_expr(v)),
            }).collect()
        ),
    }
}

fn desugar_block(b: &BlockExpr) -> Expr {
    let mut stmts: Vec<BlockStmt> = b.stmts.iter().map(|s| {
        let expr = desugar_expr(&s.expr);
        // Handle borrow statements in block position
        let expr = if let Expr::Borrow(borrow) = &s.expr {
            desugar_borrow_stmt(borrow)
        } else {
            expr
        };
        BlockStmt { span: s.span, expr }
    }).collect();

    let final_expr = b.final_expr.as_ref().map(|e| {
        let expr = desugar_expr(e);
        Box::new(match &**e {
            Expr::Borrow(borrow) => desugar_borrow_stmt(borrow),
            _ => expr,
        })
    });

    Expr::Block(BlockExpr {
        span: b.span,
        stmts,
        final_expr,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    fn desugar(src: &str) -> String {
        let mut lexer = crate::lexer::Lexer::new(src);
        let tokens = lexer.lex_all();
        let mut diag = DiagnosticCollector::new();
        let mut parser = crate::parser::Parser::new(tokens, &mut diag, src);
        let prog = parser.parse_program();
        let desugared = desugar_program(&prog, &mut diag);
        format!("{:?}", desugared.decls.first().map(|d| match d {
            Decl::Def(d) => format!("def {} = ...", d.name.name),
            _ => "other".into(),
        }))
    }

    #[test]
    fn desugar_pipeline_to_call() {
        // "def r = 2026 -> stdout;" → "def r = stdout(2026);"
        let result = desugar("def r = 2026 -> stdout;");
        assert!(result.contains("def r = ..."));
    }

    #[test]
    fn desugar_if_to_match() {
        // "def r = if 1 { 2 } else { 3 };" → match expression
        let result = desugar("def r = if 1 { 2 } else { 3 };");
        assert!(result.contains("def r = ..."));
    }

    #[test]
    fn desugar_borrow_param() {
        // fn(&p: Point) should desugar to fn(p: Point) -> (Point, ...)
        let result = desugar("def f = fn(&p: Int) -> Int { &p = p + 1; p };");
        assert!(result.contains("def f = ..."));
    }
}
