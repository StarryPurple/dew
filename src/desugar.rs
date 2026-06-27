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
use std::collections::HashSet;

/// Collect root variable names of all `&lvalue = expr` in an expression tree.
/// Used to validate that while-borrow/if-borrow bodies only mutate vars
/// declared in their header.
fn collect_borrow_vars(expr: &Expr) -> HashSet<String> {
    let mut vars = HashSet::new();
    collect_borrow_vars_impl(expr, &mut vars);
    vars
}

fn collect_borrow_vars_impl(expr: &Expr, vars: &mut HashSet<String>) {
    match expr {
        Expr::Borrow(b) => {
            vars.insert(b.lvalue.root.name.clone());
        }
        Expr::Block(b) => {
            for s in &b.stmts { collect_borrow_vars_impl(&s.expr, vars); }
            if let Some(fe) = &b.final_expr { collect_borrow_vars_impl(fe, vars); }
        }
        Expr::If(i) => {
            collect_borrow_vars_impl(&i.condition, vars);
            collect_borrow_vars_impl(&i.then_branch, vars);
            if let Some(eb) = &i.else_branch { collect_borrow_vars_impl(eb, vars); }
        }
        Expr::Match(m) => {
            collect_borrow_vars_impl(&m.scrutinee, vars);
            for arm in &m.arms { collect_borrow_vars_impl(&arm.body, vars); }
        }
        Expr::Fn(f) => collect_borrow_vars_impl(&f.body, vars),
        Expr::Fix(f) => collect_borrow_vars_impl(&f.body, vars),
        Expr::While(w) => collect_borrow_vars_impl(&w.body, vars),
        Expr::Loop(l) => collect_borrow_vars_impl(&l.body, vars),
        Expr::ForIn(fi) => collect_borrow_vars_impl(&fi.body, vars),
        Expr::Pipeline(pi) => {
            // IO pipes (&a -> stdin/stdout) pass a reference — not a borrow assignment
            // that would need carry declaration.
            let is_io_pipe = if let Expr::Var(v) = &*pi.func {
                v.name == "stdin" || v.name == "stdout"
            } else { false };
            if !is_io_pipe {
                collect_borrow_vars_impl(&pi.value, vars);
            }
            collect_borrow_vars_impl(&pi.func, vars);
        }
        Expr::Binary(b) => {
            collect_borrow_vars_impl(&b.left, vars);
            collect_borrow_vars_impl(&b.right, vars);
        }
        Expr::Unary(u) => collect_borrow_vars_impl(&u.expr, vars),
        Expr::Call(c) => {
            collect_borrow_vars_impl(&c.func, vars);
            for a in &c.args {
                match a {
                    ExprArg::Value(e) => collect_borrow_vars_impl(e, vars),
                    // Borrow args in calls pass references — not carry assignments
                    ExprArg::Borrow(_) => {}
                }
            }
        }
        Expr::Field(f) => collect_borrow_vars_impl(&f.object, vars),
        Expr::Subscript(s) => {
            collect_borrow_vars_impl(&s.array, vars);
            collect_borrow_vars_impl(&s.index, vars);
        }
        Expr::Update(u) => {
            collect_borrow_vars_impl(&u.base, vars);
            for up in &u.updates {
                match up {
                    UpdateField::NamedField { value, .. } => collect_borrow_vars_impl(value, vars),
                    UpdateField::ArrayIndex { value, .. } => collect_borrow_vars_impl(value, vars),
                    UpdateField::TupleIndex { value, .. } => collect_borrow_vars_impl(value, vars),
                }
            }
        }
        Expr::TupleLit(t) => { for e in &t.elements { collect_borrow_vars_impl(e, vars); } }
        Expr::StructLit(s) => {
            for f in &s.fields { if let Some(ref v) = f.value { collect_borrow_vars_impl(v, vars); } }
        }
        Expr::EnumLit(e) => {
            match &e.payload {
                EnumPayload::Single(exprs) => {
                    for e in exprs { collect_borrow_vars_impl(e.as_ref(), vars); }
                }
                EnumPayload::Struct(fields) => {
                    for f in fields { if let Some(ref v) = f.value { collect_borrow_vars_impl(v, vars); } }
                }
            }
        }
        Expr::ArrayLit(a) => { for e in &a.elements { collect_borrow_vars_impl(e, vars); } }
        Expr::ArrayFill(a) => collect_borrow_vars_impl(&a.value, vars),
        Expr::Cast(c) => collect_borrow_vars_impl(&c.expr, vars),
        Expr::Force(f) => collect_borrow_vars_impl(&f.expr, vars),
        _ => {}
    }
}

/// Validate that all borrow-assigned variables in while/if-borrow bodies
/// are explicitly declared in their scope header. Runs on the pre-desugared AST.
fn validate_borrow_scopes(expr: &Expr, diag: &mut DiagnosticCollector) {
    match expr {
        Expr::While(w) => {
            let declared: HashSet<String> = w.borrow_vars.iter().map(|v| v.name.clone()).collect();
            let used = collect_borrow_vars(&w.body);
            for uv in &used {
                if !declared.contains(uv.as_str()) {
                    diag.error("E003",
                        format!("'{}' used with & in while body but not declared in while header (declare: &{})",
                            uv, uv),
                        Some(w.span));
                }
            }
            // Recurse into body (inner while/if-borrow have their own scope)
            validate_borrow_scopes_impl(&w.body, diag);
        }
        Expr::If(i) => {
            if !i.if_borrow.is_empty() {
                let declared: HashSet<String> = i.if_borrow.iter().map(|v| v.name.clone()).collect();
                let used = collect_borrow_vars(&i.then_branch);
                for uv in &used {
                    if !declared.contains(uv.as_str()) {
                        diag.error("E003",
                            format!("'{}' used with & in if-borrow body but not declared in if header", uv),
                            Some(i.span));
                    }
                }
            }
            validate_borrow_scopes_impl(&i.then_branch, diag);
            if let Some(eb) = &i.else_branch {
                // Also validate else-borrow if present
                if let Expr::If(inner_if) = eb.as_ref() {
                    if let Some(ref ebv) = inner_if.else_borrow {
                        let declared: HashSet<String> = ebv.iter().map(|v| v.name.clone()).collect();
                        let used = collect_borrow_vars(&inner_if.then_branch);
                        for uv in &used {
                            if !declared.contains(uv.as_str()) {
                                diag.error("E003",
                                    format!("'{}' used with & in else-borrow body but not declared", uv),
                                    Some(inner_if.span));
                            }
                        }
                    }
                }
                validate_borrow_scopes_impl(eb, diag);
            }
        }
        Expr::Block(b) => {
            for s in &b.stmts { validate_borrow_scopes_impl(&s.expr, diag); }
            if let Some(fe) = &b.final_expr { validate_borrow_scopes_impl(fe, diag); }
        }
        _ => {}
    }
}

fn validate_borrow_scopes_impl(expr: &Expr, diag: &mut DiagnosticCollector) {
    match expr {
        Expr::While(w) => {
            validate_borrow_scopes(expr, diag);
        }
        Expr::If(i) => { validate_borrow_scopes(expr, diag); }
        Expr::Block(b) => {
            for s in &b.stmts { validate_borrow_scopes_impl(&s.expr, diag); }
            if let Some(fe) = &b.final_expr { validate_borrow_scopes_impl(fe, diag); }
        }
        Expr::Fn(f) => { validate_borrow_scopes_impl(&f.body, diag); }
        Expr::Fix(fx) => { validate_borrow_scopes_impl(&fx.body, diag); }
        Expr::Match(m) => {
            for arm in &m.arms { validate_borrow_scopes_impl(&arm.body, diag); }
        }
        _ => {}
    }
}

/// Desugar a complete program. Returns the desugared program.
pub fn desugar_program(prog: &Program, diag: &mut DiagnosticCollector) -> Program {
    // Validate borrow scope declarations before desugaring eliminates Expr::Borrow
    for decl in &prog.decls {
        if let Decl::Def(d) = decl {
            validate_borrow_scopes_impl(&d.value, diag);
        }
    }
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
                        name: d.name.clone(), destructure: None, 
                        ty: d.ty.clone(),
                        value: new_fn,
                    })];
                }
            }
            let value = desugar_expr(&d.value);
            vec![Decl::Def(DefDecl {
                span: d.span,
                rec: d.rec,
                name: d.name.clone(), destructure: None, 
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

        // if/else (borrow or regular) → match on Bool
        Expr::If(i) => {
            // If borrow if: desugar directly to match + tuple destructure
            if !i.if_borrow.is_empty() {
                let union_vars = {
                    let mut v = i.if_borrow.clone();
                    if let Some(ref eb) = i.else_borrow {
                        for ev in eb { if !v.iter().any(|x| x.name == ev.name) { v.push(ev.clone()); } }
                    }
                    v
                };
                let build_tuple = |vars: &[Ident]| -> Expr {
                    Expr::TupleLit(TupleLit {
                        span: Span::DUMMY,
                        elements: vars.iter().map(|v| Expr::Var(v.clone())).collect(),
                    })
                };
                let wrap_branch = |branch: &Expr, vars: &[Ident]| -> Expr {
                    let mut stmts: Vec<BlockStmt> = Vec::new();
                    match branch {
                        Expr::Block(b) => {
                            for s in &b.stmts { stmts.push(s.clone()); }
                            // If final_expr has a Borrow statement, promote to stmt
                            if let Some(fe) = &b.final_expr {
                                if matches!(**fe, Expr::Borrow(_)) {
                                    stmts.push(BlockStmt { span: Span::DUMMY, expr: (**fe).clone(), def: None });
                                }
                            }
                        }
                        other => {
                            stmts.push(BlockStmt { span: Span::DUMMY, expr: other.clone(), def: None });
                        }
                    }
                    Expr::Block(BlockExpr {
                        span: Span::DUMMY,
                        stmts,
                        final_expr: Some(Box::new(build_tuple(vars))),
                    })
                };
                let condition = desugar_expr(&i.condition);
                let then_body = desugar_expr(&wrap_branch(&i.then_branch, &union_vars));
                let else_body = i.else_branch.as_deref().unwrap_or(&Expr::UnitLit(Span::DUMMY));
                let else_body = desugar_expr(&wrap_branch(else_body, &union_vars));
                // Build match directly — skip intermediate IfExpr
                let match_expr = Expr::Match(MatchExpr {
                    span: i.span,
                    scrutinee: Box::new(condition),
                    arms: vec![
                        MatchArm { span: Span::DUMMY,
                            pattern: Pattern::Lit(LitPattern { span: Span::DUMMY, value: LitValue::Bool(true) }),
                            body: then_body,
                        },
                        MatchArm { span: Span::DUMMY,
                            pattern: Pattern::Lit(LitPattern { span: Span::DUMMY, value: LitValue::Bool(false) }),
                            body: else_body,
                        },
                    ],
                });
                let mut stmts: Vec<BlockStmt> = Vec::new();
                let tmp_name = Ident::new("%_ifbrw", Span::DUMMY);
                stmts.push(BlockStmt {
                    span: i.span,
                    expr: match_expr,
                    def: Some(DefDecl {
                        span: i.span, rec: false, name: tmp_name.clone(),
                        destructure: None, ty: None,
                        value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }),
                    }),
                });
                for (idx, v) in union_vars.iter().enumerate() {
                    let field = Expr::Field(FieldExpr {
                        span: i.span,
                        object: Box::new(Expr::Var(tmp_name.clone())),
                        field: Ident::new(format!("{}", idx), Span::DUMMY),
                    });
                    stmts.push(BlockStmt {
                        span: i.span,
                        expr: field,
                        def: Some(DefDecl {
                            span: i.span, rec: false, name: v.clone(),
                            destructure: None, ty: None,
                            value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }),
                        }),
                    });
                }
                return Expr::Block(BlockExpr { span: i.span, stmts, final_expr: None });
                return Expr::Block(BlockExpr { span: i.span, stmts, final_expr: None });
            }

            let condition = desugar_expr(&i.condition);
            let then_branch = desugar_expr(&i.then_branch);
            let else_branch = desugar_expr(i.else_branch.as_deref().unwrap_or(&Expr::UnitLit(Span::DUMMY)));
            return Expr::Match(MatchExpr {
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
            });
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
                    span: c.span, rec: false, name: tmp.clone(), destructure: None, 
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
                            span: c.span, rec: false, name: name.clone(), destructure: None, 
                            ty: None, value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }),
                        }),
                    });
                } else {
                    // Compound lvalue: rebuild the outer struct with updated inner field
                    let last_accessor = borrow_arg.lvalue.path.last().unwrap();
                    let root_expr = Expr::Var(name.clone());
                    let update_field = match last_accessor {
                        LValueAccessor::Field(ident) => UpdateField::NamedField {
                            span: c.span, name: ident.clone(), value: field,
                        },
                        LValueAccessor::Index(idx) => UpdateField::ArrayIndex {
                            span: c.span, index: idx.clone(), value: field,
                        },
                        LValueAccessor::TupleIndex(i) => UpdateField::TupleIndex {
                            span: c.span, index: *i, value: field,
                        },
                    };
                    let update = build_nested_update(&borrow_arg.lvalue, root_expr, &[update_field]);
                    block_stmts.push(BlockStmt {
                        span: c.span, expr: update,
                        def: Some(DefDecl {
                            span: c.span, rec: false, name: name.clone(), destructure: None, 
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
                value: Some(f.value.as_ref().map_or_else(
                    || Expr::Var(f.name.clone()),    // shorthand: `x` → `x: x`
                    |v| desugar_expr(v),
                )),
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
                        span: f.span, rec: true, name: loop_ident.clone(), destructure: None, 
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
                // 1 borrow param WITH explicit return type: result IS the updated param
                // Otherwise (no explicit return or multiple params): result is Unit
                if borrow_params.len() == 1 && f.return_ty.is_some() {
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
            // Use a generic temporary name for the result value to avoid
            // shadowing any borrow param with a potentially different type.
            let result_name = Ident::new("%__fn_res".to_string(), Span::DUMMY);
            b.stmts.push(BlockStmt {
                span: body_span,
                expr: orig_final,
                def: Some(DefDecl {
                    span: body_span, rec: false,
                    name: result_name.clone(), destructure: None, 
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
                    name: p_name.clone(), destructure: None, 
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
            || i.else_branch.as_ref().map_or(false, |eb| expr_has_borrow(eb))
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

/// Detect if an expression contains direct stdin/stdout IO calls.
/// Used by desugar_while_borrow to annotate fix function return types with IO.
fn expr_has_io(expr: &Expr) -> bool {
    match expr {
        // Direct stdin/stdout pipeline: x -> stdin, node_pool[i].ans -> stdout
        Expr::Pipeline(p) => {
            if let Expr::Var(ident) = &*p.func {
                if ident.name == "stdout" || ident.name == "stdin" {
                    return true;
                }
            }
            expr_has_io(&p.value) || expr_has_io(&p.func)
        }
        // Direct stdin/stdout call: stdin(), stdout(x)
        Expr::Call(c) => {
            if let Expr::Var(ident) = &*c.func {
                if ident.name == "stdout" || ident.name == "stdin" {
                    return true;
                }
            }
            c.args.iter().any(|a| match a {
                ExprArg::Value(e) => expr_has_io(e),
                ExprArg::Borrow(b) => b.rhs.as_ref().map_or(false, |rhs| match &**rhs {
                    BorrowRhs::Assign(e) => expr_has_io(e),
                    BorrowRhs::Update(updates) => updates.iter().any(|u| match u {
                        UpdateField::NamedField { value, .. } => expr_has_io(value),
                        UpdateField::ArrayIndex { value, .. } => expr_has_io(value),
                        UpdateField::TupleIndex { value, .. } => expr_has_io(value),
                    }),
                }),
            })
        }
        Expr::Block(b) => {
            b.stmts.iter().any(|s| expr_has_io(&s.expr))
            || b.final_expr.as_ref().map_or(false, |e| expr_has_io(e))
        }
        Expr::If(i) => {
            expr_has_io(&i.condition)
            || expr_has_io(&i.then_branch)
            || i.else_branch.as_ref().map_or(false, |eb| expr_has_io(eb))
        }
        Expr::Match(m) => {
            expr_has_io(&m.scrutinee)
            || m.arms.iter().any(|a| expr_has_io(&a.body))
        }
        Expr::Binary(b) => expr_has_io(&b.left) || expr_has_io(&b.right),
        Expr::Unary(u) => expr_has_io(&u.expr),
        Expr::Field(f) => expr_has_io(&f.object),
        Expr::StructLit(s) => s.fields.iter().filter_map(|f| f.value.as_ref()).any(expr_has_io),
        Expr::TupleLit(t) => t.elements.iter().any(expr_has_io),
        Expr::ArrayLit(a) => a.elements.iter().any(expr_has_io),
        Expr::ArrayFill(a) => expr_has_io(&a.value),
        Expr::Force(f) => expr_has_io(&f.expr),
        Expr::Fix(f) => expr_has_io(&f.body),
        Expr::Fn(f) => expr_has_io(&f.body),
        Expr::Subscript(s) => expr_has_io(&s.array) || expr_has_io(&s.index),
        Expr::Update(u) => expr_has_io(&u.base) || u.updates.iter().any(|f| match f {
            UpdateField::NamedField { value, .. } => expr_has_io(value),
            UpdateField::ArrayIndex { value, .. } => expr_has_io(value),
            UpdateField::TupleIndex { value, .. } => expr_has_io(value),
        }),
        Expr::While(w) => expr_has_io(&w.condition) || expr_has_io(&w.body),
        Expr::Loop(l) => expr_has_io(&l.body),
        Expr::Borrow(b) => b.rhs.as_ref().map_or(false, |rhs| match &**rhs {
            BorrowRhs::Assign(e) => expr_has_io(e),
            BorrowRhs::Update(updates) => updates.iter().any(|u| match u {
                UpdateField::NamedField { value, .. } => expr_has_io(value),
                UpdateField::ArrayIndex { value, .. } => expr_has_io(value),
                UpdateField::TupleIndex { value, .. } => expr_has_io(value),
            }),
        }),
        _ => false,
    }
}

/// Replace `continue`/`break` keywords in a while-borrow body block with
/// `__Continue((vars...))`/`__Done((vars...))` enum expressions.
fn replace_while_jumps(mut block: BlockExpr, vars: &[Ident]) -> BlockExpr {
    let build_continue = |span: Span| -> Expr {
        let var_refs: Vec<Box<Expr>> = vars.iter()
            .map(|v| Box::new(Expr::Var(v.clone())))
            .collect();
        Expr::EnumLit(EnumLit {
            span, name: Ident::new("__Continue", Span::DUMMY),
            payload: EnumPayload::Single(var_refs),
        })
    };
    let build_break = |span: Span| -> Expr {
        let var_refs: Vec<Box<Expr>> = vars.iter()
            .map(|v| Box::new(Expr::Var(v.clone())))
            .collect();
        Expr::EnumLit(EnumLit {
            span, name: Ident::new("__Done", Span::DUMMY),
            payload: EnumPayload::Single(var_refs),
        })
    };
    for stmt in &mut block.stmts {
        stmt.expr = replace_jump_in_expr(std::mem::replace(&mut stmt.expr, Expr::UnitLit(Span::DUMMY)), &build_continue, &build_break);
    }
    if let Some(fe) = &mut block.final_expr {
        let old = std::mem::replace(fe.as_mut(), Expr::UnitLit(Span::DUMMY));
        *fe = Box::new(replace_jump_in_expr(old, &build_continue, &build_break));
    }
    block
}

fn replace_jump_in_expr(expr: Expr, cont: &dyn Fn(Span) -> Expr, brk: &dyn Fn(Span) -> Expr) -> Expr {
    match expr {
        Expr::Var(ref ident) if ident.name == "continue" => cont(ident.span),
        Expr::Var(ref ident) if ident.name == "break" => brk(ident.span),
        Expr::Block(b) => {
            let mut stmts = Vec::new();
            for s in b.stmts {
                stmts.push(BlockStmt {
                    expr: replace_jump_in_expr(s.expr, cont, brk),
                    ..s
                });
            }
            let fe = b.final_expr.map(|e| Box::new(replace_jump_in_expr(*e, cont, brk)));
            Expr::Block(BlockExpr { stmts, final_expr: fe, ..b })
        }
        Expr::If(i) => {
            Expr::If(IfExpr {
                condition: Box::new(replace_jump_in_expr(*i.condition, cont, brk)),
                then_branch: Box::new(replace_jump_in_expr(*i.then_branch, cont, brk)),
                else_branch: i.else_branch.map(|e| Box::new(replace_jump_in_expr(*e, cont, brk))),
                ..i
            })
        }
        Expr::Match(m) => {
            Expr::Match(MatchExpr {
                scrutinee: Box::new(replace_jump_in_expr(*m.scrutinee, cont, brk)),
                arms: m.arms.into_iter().map(|a| MatchArm {
                    body: replace_jump_in_expr(a.body, cont, brk),
                    ..a
                }).collect(),
                ..m
            })
        }
        Expr::Fix(f) => Expr::Fix(FixExpr {
            body: Box::new(replace_jump_in_expr(*f.body, cont, brk)),
            ..f
        }),
        Expr::Fn(f) => Expr::Fn(FnExpr {
            body: Box::new(replace_jump_in_expr(*f.body, cont, brk)),
            ..f
        }),
        _ => expr,
    }
}

/// Desugar a borrow statement: `&p = expr` → `def p = expr`
/// `&p { fields }` → `def p = p { fields }`
/// Desugar a borrow statement: `&p = expr` → `def p = expr`
/// `&p { fields }` → `def p = p { fields }`
/// Compound lvalue: `&p.f.g = val` → `def p = p { .f = p.f { .g = val } }`
fn desugar_borrow_stmt(b: &BorrowExpr) -> Expr {
    let Some(ref rhs) = b.rhs else { return Expr::UnitLit(Span::DUMMY) };
    let rhs_expr = match &**rhs {
        BorrowRhs::Assign(e) => {
            let rhs = desugar_expr(e);
            if b.lvalue.path.is_empty() {
                rhs
            } else {
                // Compound lvalue: walk path backwards from innermost to root,
                // building nested updates at each level.
                build_nested_assign(&b.lvalue, rhs)
            }
        }
        BorrowRhs::Update(updates) => {
            let root_expr = Expr::Var(b.lvalue.root.clone());
            build_nested_update(&b.lvalue, root_expr, updates)
        }
    };
    rhs_expr
}

/// Build nested struct/array updates for a borrow assignment with compound lvalue.
/// For `&x.f.g = val`, returns `x { .f = x.f { .g = val } }`.
/// Walks the lvalue path backwards, wrapping the inner value in an update
/// at each level.
fn build_nested_assign(lvalue: &LValue, rhs: Expr) -> Expr {
    let root = Expr::Var(lvalue.root.clone());
    let mut current = rhs;
    for (i, accessor) in lvalue.path.iter().enumerate().rev() {
        let mut target = root.clone();
        for prev in lvalue.path.iter().take(i) {
            target = match prev {
                LValueAccessor::Field(name) => Expr::Field(FieldExpr {
                    span: lvalue.span, object: Box::new(target), field: name.clone(),
                }),
                LValueAccessor::Index(idx) => Expr::Subscript(SubscriptExpr {
                    span: lvalue.span, array: Box::new(target), index: Box::new(idx.clone()),
                }),
                LValueAccessor::TupleIndex(idx) => Expr::Field(FieldExpr {
                    span: lvalue.span, object: Box::new(target),
                    field: Ident::new(format!("{}", idx), Span::DUMMY),
                }),
            };
        }
        let update = match accessor {
            LValueAccessor::Field(name) => UpdateField::NamedField {
                span: lvalue.span, name: name.clone(), value: current,
            },
            LValueAccessor::Index(idx) => UpdateField::ArrayIndex {
                span: lvalue.span, index: idx.clone(), value: current,
            },
            LValueAccessor::TupleIndex(idx) => UpdateField::TupleIndex {
                span: lvalue.span, index: *idx, value: current,
            },
        };
        current = Expr::Update(UpdateExpr {
            span: lvalue.span,
            base: Box::new(target),
            updates: vec![update],
        });
    }
    current
}

fn desugar_while(w: &WhileExpr) -> Expr {
    if !w.borrow_vars.is_empty() {
        return desugar_while_borrow(w);
    }
    let lname = Ident::new("%while_loop", Span::DUMMY);
    let self_call = Expr::Call(CallExpr { span: w.span, func: Box::new(Expr::Var(lname.clone())), args: vec![] });
    let then_stmts = vec![
        BlockStmt { span: w.span, expr: (*w.body).clone(), def: None },
        BlockStmt { span: w.span, expr: self_call, def: None },
    ];
    let if_expr = Expr::If(IfExpr { span: w.span, if_borrow: vec![], else_borrow: None, condition: w.condition.clone(), then_branch: Box::new(Expr::Block(BlockExpr { span: w.span, stmts: then_stmts, final_expr: None })), else_branch: Some(Box::new(Expr::UnitLit(Span::DUMMY))) });
    Expr::Block(BlockExpr {
        span: w.span,
        stmts: vec![BlockStmt { span: w.span, expr: Expr::Fn(FnExpr { span: w.span, params: vec![], return_ty: None, body: Box::new(if_expr) }), def: Some(DefDecl { span: w.span, rec: true, name: lname.clone(), destructure: None, ty: None, value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }) }) }],
        final_expr: Some(Box::new(Expr::Call(CallExpr { span: w.span, func: Box::new(Expr::Var(lname)), args: vec![] }))),
    })
}

fn desugar_while_borrow(w: &WhileExpr) -> Expr {
    let vars = &w.borrow_vars;
    // Use None for param types — the HM type checker infers them from the call site.
    // Using Some(Int) was wrong for non-Int borrow vars like struct arrays.
    let params: Vec<FnParam> = vars.iter().map(|v| FnParam {
        span: Span::DUMMY, name: v.clone(), ty: None, is_borrow: false,
    }).collect();

    // Tuple of borrow var types — used as type arg to __ControlFlow
    let tuple_ty = Type::Tuple(TupleType { span: Span::DUMMY, elements: vec![Type::Wildcard(Span::DUMMY); vars.len()] });
    let cf_ret_ty = Type::Named(NamedType {
        span: Span::DUMMY,
        name: Ident::new("__ControlFlow", Span::DUMMY),
        args: Some(vec![TypeArg::Type(tuple_ty.clone())]),
    });
    // Detect IO in while body and annotate the fix function's return type accordingly.
    // This prevents W005 false positives for compiler-generated fix functions.
    let body_has_io = expr_has_io(&w.body);
    let ret_ty: Type = if body_has_io {
        Type::Named(NamedType {
            span: Span::DUMMY,
            name: Ident::new("IO", Span::DUMMY),
            args: Some(vec![TypeArg::Type(cf_ret_ty.clone())]),
        })
    } else {
        cf_ret_ty.clone()
    };
    let build_tuple_expr = |exprs: Vec<Expr>| -> Expr {
        Expr::TupleLit(TupleLit { span: Span::DUMMY, elements: exprs })
    };
    let var_refs: Vec<Expr> = vars.iter().map(|v| Expr::Var(v.clone())).collect();
    let initial_tuple = build_tuple_expr(var_refs);

    // Inner match dispatch: Continue(v) => __wb(v.0,v.1), Done(v) => Done(v)
    let loop_name = Ident::new("%__wb", Span::DUMMY);
    let rec_call = Expr::Call(CallExpr { span: w.span, func: Box::new(Expr::Var(loop_name.clone())), args: vec![] });
    let dispatch_arms = vec![
        MatchArm { span: Span::DUMMY,
            pattern: Pattern::Variant(VariantPattern { span: Span::DUMMY, name: Ident::new("__Done", Span::DUMMY), payload: vec![Pattern::Var(Ident::new("%_d", Span::DUMMY))] }),
            body: Expr::EnumLit(EnumLit { span: Span::DUMMY, name: Ident::new("__Done", Span::DUMMY), payload: EnumPayload::Single(vec![Box::new(Expr::Var(Ident::new("%_d", Span::DUMMY)))]) }),
        },
        MatchArm { span: Span::DUMMY,
            pattern: Pattern::Variant(VariantPattern { span: Span::DUMMY, name: Ident::new("__Continue", Span::DUMMY), payload: vec![Pattern::Var(Ident::new("%_c", Span::DUMMY))] }),
            body: Expr::Call(CallExpr { span: w.span, func: Box::new(Expr::Var(Ident::new("%__wb", Span::DUMMY))),
                args: (0..vars.len()).map(|i| ExprArg::Value(Box::new(Expr::Field(FieldExpr {
                    span: Span::DUMMY,
                    object: Box::new(Expr::Var(Ident::new("%_c", Span::DUMMY))),
                    field: Ident::new(format!("{}", i), Span::DUMMY),
                })))).collect(),
            }),
        },
    ];

    // Body: wrap to ensure Continue/Done in final_expr
    let body_block = match &*w.body {
        Expr::Block(b) => b.clone(),
        other => BlockExpr { span: Span::DUMMY, stmts: vec![BlockStmt { span: Span::DUMMY, expr: other.clone(), def: None }], final_expr: None },
    };
    // Replace `continue`/`break` keywords with __Continue((vars...))/__Done((vars...))
    let body_block = replace_while_jumps(body_block, vars);

    // Build fix fn body: if (cond) { match ({ body }) { Dispatch } } else { Done(init_tuple) }
    let fix_body = Expr::If(IfExpr {
        span: w.span, if_borrow: vec![], else_borrow: None,
        condition: w.condition.clone(),
        then_branch: Box::new(Expr::Match(MatchExpr {
            span: w.span,
            scrutinee: Box::new(Expr::Block(BlockExpr {
                span: Span::DUMMY, stmts: body_block.stmts.clone(), final_expr: body_block.final_expr.clone(),
            })),
            arms: dispatch_arms,
        })),
        else_branch: Some(Box::new(Expr::EnumLit(EnumLit {
            span: Span::DUMMY, name: Ident::new("__Done", Span::DUMMY),
            payload: EnumPayload::Single(vec![Box::new(initial_tuple.clone())]),
        }))),
    });

    // Build fix fn
    let fix_span = w.span;
    let fix_fn = Expr::Fix(FixExpr {
        span: fix_span,
        loop_var: loop_name.clone(),
        body: Box::new(Expr::Fn(FnExpr {
            span: fix_span, params, return_ty: Some(ret_ty),
            body: Box::new(fix_body),
        })),
    });

    // Match the fix call result: Done(v) => v
    let call_args: Vec<ExprArg> = vars.iter().map(|v| ExprArg::Value(Box::new(Expr::Var(v.clone())))).collect();
    let fix_call = Expr::Call(CallExpr { span: w.span, func: Box::new(fix_fn), args: call_args });
    let match_result = Expr::Match(MatchExpr {
        span: w.span,
        scrutinee: Box::new(fix_call),
        arms: vec![MatchArm { span: Span::DUMMY,
            pattern: Pattern::Variant(VariantPattern { span: Span::DUMMY, name: Ident::new("__Done", Span::DUMMY), payload: vec![Pattern::Var(Ident::new("%_r", Span::DUMMY))] }),
            body: Expr::Var(Ident::new("%_r", Span::DUMMY)),
        }],
    });

    // Wrap in def (x,) = match ...
    let tmp = Ident::new("%_wb_res", Span::DUMMY);
    let mut stmts: Vec<BlockStmt> = Vec::new();
    stmts.push(BlockStmt {
        span: w.span,
        expr: match_result,
        def: Some(DefDecl { span: w.span, rec: false, name: tmp.clone(), destructure: None, ty: None, value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }) }),
    });
    for (i, v) in vars.iter().enumerate() {
        let field = Expr::Field(FieldExpr {
            span: w.span, object: Box::new(Expr::Var(tmp.clone())),
            field: Ident::new(format!("{}", i), Span::DUMMY),
        });
        stmts.push(BlockStmt {
            span: w.span, expr: field,
            def: Some(DefDecl { span: w.span, rec: false, name: v.clone(), destructure: None, ty: None, value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }) }),
        });
    }
    Expr::Block(BlockExpr { span: w.span, stmts, final_expr: None })
}

fn desugar_loop(l: &LoopExpr) -> Expr {
    let lname = Ident::new("%loop_inf", Span::DUMMY);
    let self_call = Expr::Call(CallExpr { span: l.span, func: Box::new(Expr::Var(lname.clone())), args: vec![] });
    let bstmts = vec![BlockStmt { span: l.span, expr: (*l.body).clone(), def: None }, BlockStmt { span: l.span, expr: self_call, def: None }];
    Expr::Block(BlockExpr {
        span: l.span,
        stmts: vec![BlockStmt { span: l.span, expr: Expr::Fn(FnExpr { span: l.span, params: vec![], return_ty: None, body: Box::new(Expr::Block(BlockExpr { span: l.span, stmts: bstmts, final_expr: None })) }), def: Some(DefDecl { span: l.span, rec: true, name: lname.clone(), destructure: None,  ty: None, value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }) }) }],
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

/// Flatten borrow-call Blocks inside an expression. Borrow-call desugaring
/// produces a Block containing the function call + borrow param rebindings
/// + final expression. When this Block is embedded in a borrow assignment's
/// RHS, the borrow param rebindings must be lifted into the enclosing scope
/// instead of being trapped in a nested block.
fn flatten_borrow_call_in_expr(expr: &mut Expr, stmts: &mut Vec<BlockStmt>) -> bool {
    match expr {
        Expr::Block(b) => {
            let is_borrow_call = b.stmts.first().and_then(|s| s.def.as_ref())
                .map_or(false, |d| d.name.name.starts_with("%_"));
            if is_borrow_call {
                stmts.extend(b.stmts.drain(..));
                if let Some(fe) = b.final_expr.take() {
                    *expr = *fe;
                } else {
                    *expr = Expr::UnitLit(Span::DUMMY);
                }
                return true;
            }
            false
        }
        Expr::Update(u) => {
            for up in &mut u.updates {
                let val = match up {
                    UpdateField::NamedField { value, .. } => value,
                    UpdateField::ArrayIndex { value, .. } => value,
                    UpdateField::TupleIndex { value, .. } => value,
                };
                if flatten_borrow_call_in_expr(val, stmts) {
                    return true;
                }
            }
            false
        }
        Expr::Call(c) => {
            for arg in &mut c.args {
                if let ExprArg::Value(e) = arg {
                    if flatten_borrow_call_in_expr(e.as_mut(), stmts) {
                        return true;
                    }
                }
            }
            false
        }
        _ => false,
    }
}

fn desugar_block(b: &BlockExpr) -> Expr {
    let mut stmts: Vec<BlockStmt> = Vec::new();
    for s in &b.stmts {
        // Expand tuple destructure: `def (a, b) = expr`
        if let Some(DefDecl { destructure: Some(vars), name: tmp_name, value, .. }) = &s.def {
            let tmp = Ident::new(&tmp_name.name, Span::DUMMY);
            // def %_dstmp = value;
            stmts.push(BlockStmt {
                span: s.span,
                expr: desugar_expr(value),
                def: Some(DefDecl {
                    span: s.span, rec: false, name: tmp.clone(),
                    destructure: None, ty: None,
                    value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }),
                }),
            });
            // def a = %_dstmp.0; def b = %_dstmp.1; ...
            for (i, v) in vars.iter().enumerate() {
                let field = Expr::Field(FieldExpr {
                    span: s.span,
                    object: Box::new(Expr::Var(tmp.clone())),
                    field: Ident::new(format!("{}", i), Span::DUMMY),
                });
                stmts.push(BlockStmt {
                    span: s.span,
                    expr: field,
                    def: Some(DefDecl {
                        span: s.span, rec: false, name: v.clone(),
                        destructure: None, ty: None,
                        value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }),
                    }),
                });
            }
            continue;
        }

        let expr = desugar_expr(&s.expr);

        if let Expr::Borrow(borrow) = &s.expr {
            let mut rhs = desugar_borrow_stmt(borrow);
            let name = borrow.lvalue.root.clone();
            // Flatten any borrow-call Block inside rhs — extract its statements
            // into the current scope so borrow param rebindings aren't lost
            // inside a nested block.
            let mut call_stmts = Vec::new();
            flatten_borrow_call_in_expr(&mut rhs, &mut call_stmts);
            stmts.extend(call_stmts);
            stmts.push(BlockStmt {
                span: s.span,
                expr: rhs.clone(),
                def: Some(DefDecl {
                    span: s.span,
                    rec: false,
                    name,
                    destructure: None,
                    ty: None,
                    value: rhs,
                }),
            });
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
                                    name: def_name, destructure: None, 
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
                                name: def_name, destructure: None, 
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
        let result: Expr = match &**e {
            Expr::Borrow(borrow) => {
                let rhs = desugar_borrow_stmt(borrow);
                let name = borrow.lvalue.root.clone();
                stmts.push(BlockStmt {
                    span: borrow.lvalue.span,
                    expr: rhs.clone(),
                    def: Some(DefDecl {
                        span: borrow.lvalue.span, rec: false,
                        name: name.clone(), destructure: None, ty: None,
                        value: Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }),
                    }),
                });
                Expr::Var(name)
            }
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
            span: i.span, if_borrow: i.if_borrow.clone(), else_borrow: i.else_borrow.clone(),
            condition: Box::new(substitute_var(&i.condition, from, to)),
            then_branch: Box::new(substitute_var(&i.then_branch, from, to)),
            else_branch: i.else_branch.as_ref().map(|eb| Box::new(substitute_var(eb, from, to))),
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
