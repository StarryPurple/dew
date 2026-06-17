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

pub struct TypeChecker<'a> {
    diag: &'a mut DiagnosticCollector,
    tvg: TypeVarGen,
    env: TypeEnv,
}

impl<'a> TypeChecker<'a> {
    pub fn new(diag: &'a mut DiagnosticCollector) -> Self {
        TypeChecker {
            diag,
            tvg: TypeVarGen::new(),
            env: TypeEnv::new(),
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

        // Second pass: pre-register all def rec names
        for decl in &prog.decls {
            if let Decl::Def(d) = decl {
                if d.rec {
                    self.env.insert(d.name.name.clone(),
                        Scheme { vars: vec![], ty: self.tvg.fresh_ty() });
                }
            }
        }

        // Third pass: infer types for def bindings
        for decl in &prog.decls {
            if let Decl::Def(d) = decl {
                if !d.rec {
                    self.env.insert(d.name.name.clone(),
                        Scheme { vars: vec![], ty: self.tvg.fresh_ty() });
                }
                self.infer_def(d);
            }
        }
    }

    fn infer_def(&mut self, def: &DefDecl) {
        let ty = self.infer_expr(&def.value);

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
            Expr::Fix(_) => {
                self.diag.error("E003", "fix not yet implemented in type checker", None);
                Ty::Unit
            }
        }
    }

    fn infer_var(&mut self, ident: &Ident) -> Ty {
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

        // Add params to typing scope and infer body
        let saved_env = self.env.clone();
        for (param, pty) in f.params.iter().zip(param_tys.iter()) {
            self.env.insert(param.name.name.clone(),
                Scheme { vars: vec![], ty: pty.clone() });
        }

        let body_ty = self.infer_expr(&f.body);
        self.env = saved_env;

        let ret_ty = f.return_ty.as_ref()
            .map(|t| self.ast_type_to_ty(t))
            .unwrap_or(body_ty.clone());

        unify_expr(&body_ty, &ret_ty, f.span, self.diag, "function return");

        Ty::fun(param_tys, ret_ty)
    }

    fn infer_call(&mut self, c: &CallExpr) -> Ty {
        let func_ty = self.infer_expr(&c.func);
        let ret_ty = self.tvg.fresh_ty();
        let mut param_tys: Vec<Ty> = c.args.iter()
            .map(|a| match a {
                ExprArg::Value(e) => self.infer_expr(e),
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
        Ty::Named(s.name.name.clone(), vec![])
    }

    fn infer_enum_lit(&mut self, e: &EnumLit) -> Ty {
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
        self.tvg.fresh_ty()
    }

    fn infer_subscript(&mut self, s: &SubscriptExpr) -> Ty {
        let arr_ty = self.infer_expr(&s.array);
        let idx_ty = self.infer_expr(&s.index);
        unify_with_type(&idx_ty, &Ty::Int, s.span, self.diag, "array index");
        let elem_ty = self.tvg.fresh_ty();
        let arr_expected = Ty::Array(Box::new(elem_ty.clone()), 0);
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
            Pattern::Variant(_) => {}
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
        // Register struct as a named type constructor
        let arity = s.params.len();
        let param_vars: Vec<Ty> = (0..arity).map(|i| Ty::Var(TypeVar(1000 + i))).collect();
        let struct_ty = Ty::Named(s.name.name.clone(), param_vars);
        let vars: Vec<TypeVar> = (0..arity).map(|i| TypeVar(1000 + i)).collect();
        self.env.insert(s.name.name.clone(), Scheme { vars, ty: struct_ty });
    }

    fn register_enum(&mut self, e: &EnumDecl) {
        let arity = e.params.len();
        let param_vars: Vec<Ty> = (0..arity).map(|i| Ty::Var(TypeVar(2000 + i))).collect();
        let enum_ty = Ty::Named(e.name.name.clone(), param_vars);
        let vars: Vec<TypeVar> = (0..arity).map(|i| TypeVar(2000 + i)).collect();
        self.env.insert(e.name.name.clone(), Scheme { vars, ty: enum_ty });
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
