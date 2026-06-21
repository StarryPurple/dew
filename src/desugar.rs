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
            // Handle top-level fix: extract Fn from fix body (possibly wrapped in Block)
            if matches!(&d.value, Expr::Fix(_)) {
                let Expr::Fix(fix) = &d.value else { unreachable!() };
                let fn_expr: Option<&FnExpr> = match fix.body.as_ref() {
                    Expr::Fn(f) => Some(f),
                    Expr::Block(b) => b.final_expr.as_ref()
                        .and_then(|e| if let Expr::Fn(f) = e.as_ref() { Some(f) } else { None }),
                    _ => None,
                };
                if let Some(fn_expr) = fn_expr {
                    let new_body = substitute_var(&fn_expr.body, &fix.loop_var.name, &d.name.name);
                    let new_fn = Expr::Fn(FnExpr {
                        span: fn_expr.span,
                        params: fn_expr.params.clone(),
                        return_ty: fn_expr.return_ty.clone(),
                        body: Box::new(desugar_expr(&new_body)),
                    });
                    return vec![Decl::Def(DefDecl {
                        span: d.span,
                        rec: true,
                        name: d.name.clone(),
                        ty: d.ty.clone(),
                        value: new_fn,
                    })];
                }
            }
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
        Expr::Pipeline(p) => {
            let is_borrow = matches!(&*p.value, Expr::Borrow(_));
            let value = desugar_expr(&p.value);
            let func = desugar_expr(&p.func);
            let piped_arg = if is_borrow {
                if let Expr::Borrow(b) = &*p.value {
                    ExprArg::Borrow(b.clone())
                } else {
                    ExprArg::Value(Box::new(value))
                }
            } else {
                ExprArg::Value(Box::new(value))
            };
            match func {
                Expr::Call(mut call) => {
                    call.args.push(piped_arg);
                    desugar_expr(&Expr::Call(call))
                }
                func_expr => {
                    desugar_expr(&Expr::Call(CallExpr {
                        span: p.span,
                        func: Box::new(func_expr),
                        args: vec![piped_arg],
                    }))
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

        Expr::While(w) => desugar_expr(&desugar_while(w)),
        Expr::Loop(l) => desugar_expr(&desugar_loop(l)),
        Expr::ForIn(_) => { Expr::UnitLit(Span::DUMMY) }, // deferred
        Expr::Cast(c) => Expr::Cast(Box::new(CastExpr {
            span: c.span,
            expr: Box::new(desugar_expr(&c.expr)),
            target_ty: c.target_ty.clone(),
        })),

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
        Expr::Call(c) => {
            // For stdin/stdout, skip the complex borrow-wrapping path.
            // These builtins write to the borrow register directly.
            if let Expr::Var(v) = &*c.func {
                if matches!(v.name.as_str(), "stdin" | "stdout") {
                    return Expr::Call(CallExpr {
                        span: c.span,
                        func: Box::new(desugar_expr(&c.func)),
                        args: c.args.iter().map(|a| match a {
                            ExprArg::Value(e) => ExprArg::Value(Box::new(desugar_expr(e))),
                            ExprArg::Borrow(b) => ExprArg::Borrow(b.clone()),
                        }).collect(),
                    });
                }
            }
            let borrow_names: Vec<Ident> = c.args.iter()
                .filter_map(|a| match a {
                    ExprArg::Borrow(b) => Some(b.lvalue.root.clone()),
                    _ => None,
                }).collect();
            if borrow_names.is_empty() {
                return Expr::Call(CallExpr {
                    span: c.span,
                    func: Box::new(desugar_expr(&c.func)),
                    args: c.args.iter().map(|a| match a {
                        ExprArg::Value(e) => ExprArg::Value(Box::new(desugar_expr(e))),
                        ExprArg::Borrow(b) => {
                            desugar_borrow_arg(b)
                        }
                    }).collect(),
                });
            }
            let new_func = desugar_expr(&c.func);
            let new_args: Vec<ExprArg> = c.args.iter().map(|a| match a {
                ExprArg::Borrow(b) => {
                    let mut expr = Expr::Var(b.lvalue.root.clone());
                    for accessor in &b.lvalue.path {
                        expr = match accessor {
                            LValueAccessor::Field(name) => Expr::Field(FieldExpr {
                                span: b.lvalue.span,
                                object: Box::new(expr),
                                field: name.clone(),
                            }),
                            LValueAccessor::Index(idx) => Expr::Subscript(SubscriptExpr {
                                span: b.lvalue.span,
                                array: Box::new(expr),
                                index: Box::new(idx.clone()),
                            }),
                            LValueAccessor::TupleIndex(i) => Expr::Field(FieldExpr {
                                span: b.lvalue.span,
                                object: Box::new(expr),
                                field: Ident::new(format!("{}", i), Span::DUMMY),
                            }),
                        };
                    }
                    ExprArg::Value(Box::new(expr))
                }
                other => other.clone(),
            }).collect();
            let call_expr = Expr::Call(CallExpr {
                span: c.span,
                func: Box::new(new_func),
                args: new_args,
            });
            let tmp = Ident::new("%_btmp", Span::DUMMY);
            let mut block_stmts = Vec::new();
            block_stmts.push(BlockStmt {
                span: c.span, expr: call_expr,
                def: Some(DefDecl {
                    span: c.span, rec: false, name: tmp.clone(),
                    ty: None, value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }),
                }),
            });
            for (ci, name) in borrow_names.iter().enumerate() {
                let field = Expr::Field(FieldExpr {
                    span: c.span,
                    object: Box::new(Expr::Var(tmp.clone())),
                    field: Ident::new(ci.to_string(), Span::DUMMY),
                });
                
                // Check if this is a compound lvalue (has path)
                let borrow_arg = c.args.iter().filter_map(|a| match a {
                    ExprArg::Borrow(b) if &b.lvalue.root == name => Some(b),
                    _ => None,
                }).next().unwrap();
                
                if borrow_arg.lvalue.path.is_empty() {
                    // Simple lvalue: just rebind the root name
                    block_stmts.push(BlockStmt {
                        span: c.span, expr: field,
                        def: Some(DefDecl {
                            span: c.span, rec: false, name: name.clone(),
                            ty: None, value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }),
                        }),
                    });
                } else {
                    // Compound lvalue: rebuild the outer struct with updated inner field
                    let last_accessor = borrow_arg.lvalue.path.last().unwrap();
                    let field_name = match last_accessor {
                        LValueAccessor::Field(ident) => ident.clone(),
                        LValueAccessor::Index(_) => Ident::new("0", Span::DUMMY),
                        LValueAccessor::TupleIndex(i) => Ident::new(format!("{}", i), Span::DUMMY),
                    };
                    let root_expr = Expr::Var(name.clone());
                    let update = build_nested_update(&borrow_arg.lvalue, root_expr, &[
                        UpdateField::NamedField {
                            span: c.span,
                            name: field_name,
                            value: field,
                        }
                    ]);
                    block_stmts.push(BlockStmt {
                        span: c.span, expr: update,
                        def: Some(DefDecl {
                            span: c.span, rec: false, name: name.clone(),
                            ty: None, value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }),
                        }),
                    });
                }
            }
            let result_idx = borrow_names.len();
            Expr::Block(BlockExpr {
                span: c.span,
                stmts: block_stmts,
                final_expr: Some(Box::new(Expr::Field(FieldExpr {
                    span: c.span,
                    object: Box::new(Expr::Var(tmp)),
                    field: Ident::new(result_idx.to_string(), Span::DUMMY),
                }))),
            })
        }
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
        Expr::Fix(f) => {
            let body = desugar_expr(&f.body);
            let loop_ident = f.loop_var.clone();
            // Extract the inner fn expression from the block so compile_def
            // uses compile_fn (static function) instead of compile_thunk.
            // This ensures self-referencing calls use Static call targets
            // and avoids thunk blackholing during recursive execution.
            let inner_fn = match &body {
                Expr::Block(b) => b.final_expr.as_ref()
                    .and_then(|e| if let Expr::Fn(_) = e.as_ref() { Some(e.as_ref().clone()) } else { None })
                    .unwrap_or(body.clone()),
                _ => body.clone(),
            };
            Expr::Block(BlockExpr {
                span: f.span,
                stmts: vec![BlockStmt {
                    span: f.span, expr: body,
                    def: Some(DefDecl {
                        span: f.span, rec: true, name: loop_ident.clone(),
                        ty: None, value: inner_fn,
                    }),
                }],
                final_expr: Some(Box::new(Expr::Var(loop_ident))),
            })
        },
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

    let has_rebindings = expr_has_borrow(&f.body);

    let new_params: Vec<FnParam> = f.params.iter().map(|p| FnParam {
        span: p.span,
        name: p.name.clone(),
        ty: p.ty.clone(),
        is_borrow: false,
    }).collect();

    if !has_rebindings {
        return Expr::Fn(FnExpr {
            span: f.span,
            params: new_params,
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

    let mut body = desugar_expr(&f.body);
    let body_span = body.span();

    let new_body = if let Expr::Block(mut b) = body {
        let orig_final = b.final_expr.take()
            .map(|e| (*e).clone())
            .unwrap_or_else(|| {
                if borrow_params.len() == 1 {
                    Expr::Var(f.params[borrow_params[0].0].name.clone())
                } else {
                    Expr::UnitLit(Span::DUMMY)
                }
            });
        // If the block already has statements (e.g., borrow mutations),
        // the result def binding must use a unique name to avoid
        // shadowing the borrow param's existing def binding.
        // When stmts is empty (simple borrow expr as final_expr),
        // the def binding MUST use the param name so Var(p) in the
        // tuple references the updated value.
        let result = if !matches!(&orig_final, Expr::UnitLit(_) | Expr::Var(_)) {
            // With 2+ borrow params, the result def binding name must
            // differ from the first borrow param to avoid collision:
            // the Tuple must reference the borrow param's original type
            // (e.g. Int) while the result has a different type (e.g. Array).
            // With 1 borrow param, the def binding shadows the param
            // intentionally so Var(p) references the updated value.
            let result_name = if borrow_params.len() > 1 {
                Ident::new(
                    format!("{}__res", f.params[borrow_params[0].0].name.name),
                    f.params[borrow_params[0].0].name.span)
            } else {
                f.params[borrow_params[0].0].name.clone()
            };
            b.stmts.push(BlockStmt {
                span: body_span,
                expr: orig_final,
                def: Some(DefDecl {
                    span: body_span, rec: false,
                    name: result_name.clone(),
                    ty: None,
                    value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }),
                }),
            });
            Expr::Var(result_name)
        } else {
            orig_final
        };
        let mut elements: Vec<Expr> = borrow_params.iter().map(|&(i, _)| {
            Expr::Var(f.params[i].name.clone())
        }).collect();
        elements.push(result);
        b.final_expr = Some(Box::new(Expr::TupleLit(TupleLit {
            span: body_span,
            elements,
        })));
        Expr::Block(b)
    } else {
        // Bare expr (from desugar_borrow_stmt): wrap in Block so
        // def p = update_expr rebinds the param before the final tuple.
        let p_name = f.params[borrow_params[0].0].name.clone();
        Expr::Block(BlockExpr {
            span: body_span,
            stmts: vec![BlockStmt {
                span: body_span,
                expr: body,
                def: Some(DefDecl {
                    span: body_span, rec: false,
                    name: p_name.clone(),
                    ty: None,
                    value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }),
                }),
            }],
            final_expr: Some(Box::new(Expr::TupleLit(TupleLit {
                span: body_span,
                elements: vec![
                    Expr::Var(p_name.clone()),
                    Expr::Var(p_name),
                ],
            }))),
        })
    };

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

fn expr_has_borrow(expr: &Expr) -> bool {
    match expr {
        Expr::Borrow(_) => true,
        Expr::Fn(f) => expr_has_borrow(&f.body),
        Expr::Block(b) => {
            b.stmts.iter().any(|s| expr_has_borrow(&s.expr))
            || b.final_expr.as_ref().map_or(false, |e| expr_has_borrow(e))
        }
        Expr::If(i) => {
            expr_has_borrow(&i.condition)
            || expr_has_borrow(&i.then_branch)
            || expr_has_borrow(&i.else_branch)
        }
        Expr::Match(m) => {
            expr_has_borrow(&m.scrutinee)
            || m.arms.iter().any(|a| expr_has_borrow(&a.body))
        }
        Expr::Call(c) => {
            expr_has_borrow(&c.func)
            || c.args.iter().any(|a| match a {
                ExprArg::Value(e) => expr_has_borrow(e),
                ExprArg::Borrow(_) => true,
            })
        }
        Expr::Binary(b) => expr_has_borrow(&b.left) || expr_has_borrow(&b.right),
        Expr::Unary(u) => expr_has_borrow(&u.expr),
        Expr::Field(f) => expr_has_borrow(&f.object),
        Expr::StructLit(s) => s.fields.iter().filter_map(|f| f.value.as_ref()).any(expr_has_borrow),
        Expr::TupleLit(t) => t.elements.iter().any(expr_has_borrow),
        Expr::ArrayLit(a) => a.elements.iter().any(expr_has_borrow),
        Expr::ArrayFill(a) => expr_has_borrow(&a.value),
        Expr::Pipeline(p) => expr_has_borrow(&p.value) || expr_has_borrow(&p.func),
        Expr::Force(f) => expr_has_borrow(&f.expr),
        Expr::Fix(f) => expr_has_borrow(&f.body),
        _ => false,
    }
}

/// Desugar a borrow statement: `&p = expr` → `def p = expr`
/// `&p { fields }` → `def p = p { fields }`
/// Desugar a borrow statement: `&p = expr` → `def p = expr`
/// `&p { fields }` → `def p = p { fields }`
fn desugar_borrow_stmt(b: &BorrowExpr) -> Expr {
    let Some(ref rhs) = b.rhs else { return Expr::UnitLit(Span::DUMMY) };
    let rhs_expr = match &**rhs {
        BorrowRhs::Assign(e) => desugar_expr(e),
        BorrowRhs::Update(updates) => {
            let root_expr = Expr::Var(b.lvalue.root.clone());
            build_nested_update(&b.lvalue, root_expr, updates)
        }
    };
    rhs_expr
}

fn desugar_while(w: &WhileExpr) -> Expr {
    let lname = Ident::new("%while_loop", Span::DUMMY);
    let self_call = Expr::Call(CallExpr { span: w.span, func: Box::new(Expr::Var(lname.clone())), args: vec![] });
    let then_stmts = vec![
        BlockStmt { span: w.span, expr: (*w.body).clone(), def: None },
        BlockStmt { span: w.span, expr: self_call, def: None },
    ];
    let if_expr = Expr::If(IfExpr { span: w.span, condition: w.condition.clone(), then_branch: Box::new(Expr::Block(BlockExpr { span: w.span, stmts: then_stmts, final_expr: None })), else_branch: Box::new(Expr::UnitLit(Span::DUMMY)) });
    Expr::Block(BlockExpr {
        span: w.span,
        stmts: vec![BlockStmt { span: w.span, expr: Expr::Fn(FnExpr { span: w.span, params: vec![], return_ty: None, body: Box::new(if_expr) }), def: Some(DefDecl { span: w.span, rec: true, name: lname.clone(), ty: None, value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }) }) }],
        final_expr: Some(Box::new(Expr::Call(CallExpr { span: w.span, func: Box::new(Expr::Var(lname)), args: vec![] }))),
    })
}

fn desugar_loop(l: &LoopExpr) -> Expr {
    let lname = Ident::new("%loop_inf", Span::DUMMY);
    let self_call = Expr::Call(CallExpr { span: l.span, func: Box::new(Expr::Var(lname.clone())), args: vec![] });
    let bstmts = vec![BlockStmt { span: l.span, expr: (*l.body).clone(), def: None }, BlockStmt { span: l.span, expr: self_call, def: None }];
    Expr::Block(BlockExpr {
        span: l.span,
        stmts: vec![BlockStmt { span: l.span, expr: Expr::Fn(FnExpr { span: l.span, params: vec![], return_ty: None, body: Box::new(Expr::Block(BlockExpr { span: l.span, stmts: bstmts, final_expr: None })) }), def: Some(DefDecl { span: l.span, rec: true, name: lname.clone(), ty: None, value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }) }) }],
        final_expr: Some(Box::new(Expr::Call(CallExpr { span: l.span, func: Box::new(Expr::Var(lname)), args: vec![] }))),
    })
}

/// Desugar a borrow argument at a call site.
/// `f(&x)` → becomes `def (x, result) = f(x)`
/// We return the expression wrapped so the enclosing context handles the destructure.
fn desugar_borrow_arg(b: &BorrowExpr) -> ExprArg {
    // If rhs is None (&x in a call arg, no assignment), just pass the variable
    let Some(ref rhs) = b.rhs else { return ExprArg::Value(Box::new(Expr::Var(b.lvalue.root.clone()))) };
    let _value = match &**rhs {
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
        EnumPayload::Single(exprs) => EnumPayload::Single(
            exprs.iter().map(|e| Box::new(desugar_expr(e))).collect()
        ),
        EnumPayload::Struct(fields) => EnumPayload::Struct(
            fields.iter().map(|f| StructLitField {
                span: f.span, name: f.name.clone(),
                value: f.value.as_ref().map(|v| desugar_expr(v)),
            }).collect()
        ),
    }
}

fn desugar_block(b: &BlockExpr) -> Expr {
    let mut stmts: Vec<BlockStmt> = Vec::new();
    for s in &b.stmts {
        let expr = desugar_expr(&s.expr);

        if let Expr::Borrow(borrow) = &s.expr {
            let rhs = desugar_borrow_stmt(borrow);
            let name = borrow.lvalue.root.clone();
            stmts.push(BlockStmt {
                span: s.span,
                expr: rhs.clone(),
                def: Some(DefDecl {
                    span: s.span,
                    rec: false,
                    name,
                    ty: None,
                    value: rhs,
                }),
            });
            // Push dummy Var references for lvalue path variables.
            // These keep outer-scope variables (like v in node_pool[v])
            // alive for closure capture tracking (collect_free_vars),
            // since the borrow desugar only preserves the RHS.
            for accessor in &borrow.lvalue.path {
                if let LValueAccessor::Index(idx_expr) = accessor {
                    if let Expr::Var(ident) = idx_expr {
                        stmts.push(BlockStmt {
                            span: s.span,
                            expr: Expr::Var(ident.clone()),
                            def: None,
                        });
                    }
                }
            }
            continue;
        }

        // Delegate borrow-call handling to desugar_expr, which correctly
        // handles compound lvalues (e.g. &e.pos → extract e.pos, rebuild e).
        // The block-level handler just needs to flatten the resulting
        // inner block and assign the final result to the def name.
        if s.def.is_some() {
            if let Expr::Call(c) = &s.expr {
                let has_borrow = c.args.iter().any(|a| matches!(a, ExprArg::Borrow(_)));
                if has_borrow {
                    let desugared = desugar_expr(&s.expr);
                    let def_name = s.def.as_ref().unwrap().name.clone();
                    if let Expr::Block(inner) = &desugared {
                        // Flatten inner block stmts (call + borrow rebindings)
                        for is in &inner.stmts { stmts.push(is.clone()); }
                        // Assign final_expr result to the def name
                        if let Some(fe) = inner.final_expr.as_ref() {
                            stmts.push(BlockStmt {
                                span: s.span,
                                expr: (**fe).clone(),
                                def: Some(DefDecl {
                                    span: s.span,
                                    rec: false,
                                    name: def_name,
                                    ty: None,
                                    value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }),
                                }),
                            });
                        }
                    } else {
                        // desugar_expr returned a non-block (shouldn't happen for borrow calls)
                        stmts.push(BlockStmt {
                            span: s.span,
                            expr: desugared,
                            def: Some(DefDecl {
                                span: s.span,
                                rec: false,
                                name: def_name,
                                ty: None,
                                value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }),
                            }),
                        });
                    }
                    continue;
                }
            }
        }

        if s.def.is_none() {
            if let Expr::Block(inner) = &expr {
                for is in &inner.stmts { stmts.push(is.clone()); }
                if let Some(fe) = inner.final_expr.as_ref() {
                    stmts.push(BlockStmt {
                        span: fe.span(), expr: (**fe).clone(), def: None,
                    });
                }
                continue;
            }
        }

        stmts.push(BlockStmt { span: s.span, expr, def: s.def.clone() });
    }

    let final_expr = b.final_expr.as_ref().map(|e| {
        let expr = desugar_expr(e);
        let result = match &**e {
            Expr::Borrow(borrow) => desugar_borrow_stmt(borrow),
            _ => expr,
        };
        if let Expr::Block(inner) = &result {
            for is in &inner.stmts { stmts.push(is.clone()); }
            Box::new(inner.final_expr.as_ref()
                .map(|fe| (**fe).clone())
                .unwrap_or(Expr::UnitLit(Span::DUMMY)))
        } else {
            Box::new(result)
        }
    });

    Expr::Block(BlockExpr {
        span: b.span,
        stmts,
        final_expr,
    })
}

fn substitute_var(expr: &Expr, from: &str, to: &str) -> Expr {
    match expr {
        Expr::Var(v) if v.name == from => Expr::Var(Ident::new(to, v.span)),
        Expr::Binary(b) => Expr::Binary(BinaryExpr {
            span: b.span, op: b.op,
            left: Box::new(substitute_var(&b.left, from, to)),
            right: Box::new(substitute_var(&b.right, from, to)),
        }),
        Expr::Unary(u) => Expr::Unary(UnaryExpr {
            span: u.span, op: u.op,
            expr: Box::new(substitute_var(&u.expr, from, to)),
        }),
        Expr::Call(c) => Expr::Call(CallExpr {
            span: c.span,
            func: Box::new(substitute_var(&c.func, from, to)),
            args: c.args.iter().map(|a| match a {
                ExprArg::Value(e) => ExprArg::Value(Box::new(substitute_var(e, from, to))),
                ExprArg::Borrow(b) => ExprArg::Borrow(Box::new(BorrowExpr {
                    span: b.span, lvalue: b.lvalue.clone(),
                    rhs: b.rhs.clone(),
                })),
            }).collect(),
        }),
        Expr::Block(b) => Expr::Block(BlockExpr {
            span: b.span,
            stmts: b.stmts.iter().map(|s| BlockStmt {
                span: s.span,
                expr: substitute_var(&s.expr, from, to),
                def: s.def.clone(),
            }).collect(),
            final_expr: b.final_expr.as_ref().map(|e| Box::new(substitute_var(e, from, to))),
        }),
        Expr::If(i) => Expr::If(IfExpr {
            span: i.span,
            condition: Box::new(substitute_var(&i.condition, from, to)),
            then_branch: Box::new(substitute_var(&i.then_branch, from, to)),
            else_branch: Box::new(substitute_var(&i.else_branch, from, to)),
        }),
        Expr::Match(m) => Expr::Match(MatchExpr {
            span: m.span,
            scrutinee: Box::new(substitute_var(&m.scrutinee, from, to)),
            arms: m.arms.iter().map(|arm| MatchArm {
                span: arm.span, pattern: arm.pattern.clone(),
                body: substitute_var(&arm.body, from, to),
            }).collect(),
        }),
        Expr::Field(f) => Expr::Field(FieldExpr {
            span: f.span, field: f.field.clone(),
            object: Box::new(substitute_var(&f.object, from, to)),
        }),
        Expr::StructLit(s) => Expr::StructLit(StructLit {
            span: s.span, name: s.name.clone(),
            fields: s.fields.iter().map(|f| StructLitField {
                span: f.span, name: f.name.clone(),
                value: f.value.as_ref().map(|v| substitute_var(v, from, to)),
            }).collect(),
        }),
        Expr::TupleLit(t) => Expr::TupleLit(TupleLit {
            span: t.span,
            elements: t.elements.iter().map(|e| substitute_var(e, from, to)).collect(),
        }),
        Expr::Fn(f) => Expr::Fn(FnExpr {
            span: f.span, params: f.params.clone(), return_ty: f.return_ty.clone(),
            body: Box::new(substitute_var(&f.body, from, to)),
        }),
        _ => expr.clone(),
    }
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
