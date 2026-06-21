// Name Resolution: validates that all variable references are bound.
//
// Establishes lexical scoping:
//   - Top-level defs are visible to all subsequent defs
//   - Function parameters introduce a new scope
//   - Block expressions create nested scopes
//   - def rec makes the name visible in its own RHS
//   - Reports [E007] for unbound variables
//
// Imports are handled by textual inclusion before parsing,
// so imported names are already in the AST by this point.

use crate::ast::*;
use crate::diagnostics::DiagnosticCollector;
use std::collections::HashMap;

pub struct NameResolver<'a> {
    diag: &'a mut DiagnosticCollector,
}

impl<'a> NameResolver<'a> {
    pub fn new(diag: &'a mut DiagnosticCollector) -> Self {
        NameResolver { diag }
    }

    pub fn resolve(&mut self, prog: &Program) {
        let mut top_level = Scope::new();

        // Register built-in names
        for builtin in &["stdout", "stdin", "not"] {
            top_level.insert(builtin.to_string(), Span::DUMMY);
        }

        // First pass: collect all top-level def names (forward reference support)
        for decl in &prog.decls {
            if let Decl::Def(d) = decl {
                top_level.insert(d.name.name.clone(), d.span);
            }
        }

        for decl in &prog.decls {
            if let Decl::Enum(e) = decl {
                for variant in &e.variants {
                    let vname = match variant {
                        Variant::Single { name, .. } | Variant::Struct { name, .. } | Variant::Unit { name, .. } => name,
                    };
                    top_level.insert(vname.name.clone(), vname.span);
                }
            }
        }

        // Second pass: resolve each declaration
        for decl in &prog.decls {
            match decl {
                Decl::Def(d) => {
                    let mut scope = Scope::with_parent(&top_level);
                    self.resolve_expr(&d.value, &mut scope);
                }
                Decl::Struct(_) | Decl::Enum(_) | Decl::Import(_) => {}
            }
        }
    }

    fn resolve_expr(&mut self, expr: &Expr, scope: &mut Scope) {
        match expr {
            Expr::Var(ident) => {
                if !scope.contains(&ident.name) {
                    self.diag.error("E007",
                        format!("unbound variable '{}'", ident.name),
                        Some(ident.span),
                    );
                }
            }
            Expr::Binary(b) => {
                self.resolve_expr(&b.left, scope);
                self.resolve_expr(&b.right, scope);
            }
            Expr::Unary(u) => {
                self.resolve_expr(&u.expr, scope);
            }
            Expr::Fn(f) => {
                let mut fn_scope = Scope::with_parent(scope);
                for param in &f.params {
                    fn_scope.insert(param.name.name.clone(), param.span);
                }
                self.resolve_expr(&f.body, &mut fn_scope);
            }
            Expr::Call(c) => {
                self.resolve_expr(&c.func, scope);
                for arg in &c.args {
                    match arg {
                        ExprArg::Value(e) => self.resolve_expr(e, scope),
                        ExprArg::Borrow(b) => self.resolve_borrow(b, scope),
                    }
                }
            }
            Expr::If(i) => {
                self.resolve_expr(&i.condition, scope);
                self.resolve_expr(&i.then_branch, scope);
                self.resolve_expr(&i.else_branch, scope);
            }
            Expr::Match(m) => {
                self.resolve_expr(&m.scrutinee, scope);
                for arm in &m.arms {
                    let mut arm_scope = Scope::with_parent(scope);
                    self.resolve_pattern(&arm.pattern, &mut arm_scope);
                    self.resolve_expr(&arm.body, &mut arm_scope);
                }
            }
            Expr::Block(b) => {
                let mut block_scope = Scope::with_parent(scope);
                for stmt in &b.stmts {
                    if let Some(def) = &stmt.def {
                        if def.rec {
                            block_scope.insert(def.name.name.clone(), def.span);
                        }
                    }
                }
                for stmt in &b.stmts {
                    // Resolve expression first so non-rec defs use the outer scope
                    // (def i = i + 1 should read the OLD i, not the new binding).
                    self.resolve_expr(&stmt.expr, &mut block_scope);
                    if let Some(def) = &stmt.def {
                        if !def.rec {
                            block_scope.insert(def.name.name.clone(), def.span);
                        }
                    }
                }
                if let Some(final_expr) = &b.final_expr {
                    self.resolve_expr(final_expr, &mut block_scope);
                }
            }
            Expr::Field(f) => {
                self.resolve_expr(&f.object, scope);
            }
            Expr::Subscript(s) => {
                self.resolve_expr(&s.array, scope);
                self.resolve_expr(&s.index, scope);
            }
            Expr::Update(u) => {
                self.resolve_expr(&u.base, scope);
                for uf in &u.updates {
                    match uf {
                        UpdateField::NamedField { value, .. }
                        | UpdateField::ArrayIndex { value, .. }
                        | UpdateField::TupleIndex { value, .. } => {
                            self.resolve_expr(value, scope);
                        }
                    }
                }
            }
            Expr::Pipeline(p) => {
                self.resolve_expr(&p.value, scope);
                self.resolve_expr(&p.func, scope);
            }
            Expr::Borrow(b) => self.resolve_borrow(b, scope),
            Expr::Force(f) => {
                self.resolve_expr(&f.expr, scope);
            }
            Expr::TupleLit(t) => {
                for e in &t.elements {
                    self.resolve_expr(e, scope);
                }
            }
            Expr::StructLit(s) => {
                for f in &s.fields {
                    if let Some(v) = &f.value {
                        self.resolve_expr(v, scope);
                    }
                }
            }
            Expr::EnumLit(e) => {
                match &e.payload {
                    EnumPayload::Single(exprs) => {
                        for expr in exprs {
                            self.resolve_expr(expr, scope);
                        }
                    }
                    EnumPayload::Struct(fields) => {
                        for f in fields {
                            if let Some(v) = &f.value {
                                self.resolve_expr(v, scope);
            }
        }
        }
                    _ => {}
                }
            }
            Expr::ArrayLit(a) => {
                for e in &a.elements {
                    self.resolve_expr(e, scope);
                }
            }
            Expr::ArrayFill(a) => {
                self.resolve_expr(&a.value, scope);
            }
            Expr::Fix(f) => {
                let mut fix_scope = Scope::with_parent(scope);
                fix_scope.insert(f.loop_var.name.clone(), f.loop_var.span);
                self.resolve_expr(&f.body, &mut fix_scope);
            }
            // Leaf nodes — no names to resolve (loops desugared before nameres)
            Expr::IntLit(_) | Expr::BoolLit(_) | Expr::CharLit(_) | Expr::UnitLit(_)
            | Expr::While(_) | Expr::Loop(_) | Expr::ForIn(_) => {}
            Expr::Cast(c) => self.resolve_expr(&c.expr, scope),
        }
    }

    fn resolve_borrow(&mut self, b: &BorrowExpr, scope: &mut Scope) {
        if !scope.contains(&b.lvalue.root.name) {
            self.diag.error("E007",
                format!("unbound variable '{}'", b.lvalue.root.name),
                Some(b.lvalue.root.span),
            );
        }
        for accessor in &b.lvalue.path {
            match accessor {
                LValueAccessor::Index(expr) => self.resolve_expr(expr, scope),
                _ => {}
            }
        }
        if let Some(ref rhs) = b.rhs {
            match &**rhs {
                BorrowRhs::Assign(e) => self.resolve_expr(e, scope),
                BorrowRhs::Update(updates) => {
                    for uf in updates {
                        match uf {
                            UpdateField::NamedField { value, .. }
                            | UpdateField::ArrayIndex { value, .. }
                            | UpdateField::TupleIndex { value, .. } => {
                                self.resolve_expr(value, scope);
                            }
                        }
                    }
                }
            }
        }
    }

    fn resolve_pattern(&mut self, pattern: &Pattern, scope: &mut Scope) {
        match pattern {
            Pattern::Var(ident) => {
                scope.insert(ident.name.clone(), ident.span);
            }
            Pattern::Struct(sp) => {
                for field in &sp.fields {
                    match field {
                        PatternField::Shorthand { name, .. } => {
                            scope.insert(name.name.clone(), name.span);
                        }
                        PatternField::Rename { var, .. } => {
                            scope.insert(var.name.clone(), var.span);
                        }
                    }
                }
            }
            Pattern::Variant(vp) => {
                for payload in &vp.payload {
                    self.resolve_pattern(payload, scope);
                }
            }
            Pattern::Tuple(tp) => {
                for elem in &tp.elements {
                    self.resolve_pattern(elem, scope);
                }
            }
            Pattern::Wildcard(_) | Pattern::Lit(_) => {}
        }
    }
}

/// A lexical scope: maps variable names to their definition spans.
struct Scope {
    names: HashMap<String, Span>,
    parent: Option<Box<Scope>>,
}

impl Scope {
    fn new() -> Self {
        Scope { names: HashMap::new(), parent: None }
    }

    fn with_parent(parent: &Scope) -> Self {
        Scope { names: HashMap::new(), parent: Some(Box::new(parent.clone())) }
    }

    fn insert(&mut self, name: String, span: Span) {
        self.names.insert(name, span);
    }

    fn contains(&self, name: &str) -> bool {
        if self.names.contains_key(name) {
            return true;
        }
        self.parent.as_ref().map(|p| p.contains(name)).unwrap_or(false)
    }
}

// Manual Clone impl needed since Scope contains HashMap
impl Clone for Scope {
    fn clone(&self) -> Self {
        Scope {
            names: self.names.clone(),
            parent: self.parent.clone(),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::lexer::Lexer;
    use crate::parser::Parser;

    fn check(src: &str) -> bool {
        let mut lexer = Lexer::new(src);
        let tokens = lexer.lex_all();
        let mut diag = DiagnosticCollector::new();
        let mut parser = Parser::new(tokens, &mut diag, src);
        let prog = parser.parse_program();
        let mut resolver = NameResolver::new(&mut diag);
        resolver.resolve(&prog);
        !diag.has_errors()
    }

    #[test]
    fn bound_variable() {
        assert!(check("def x = 42; def y = x;"));
    }

    #[test]
    fn unbound_variable() {
        assert!(!check("def y = x;"));
    }

    #[test]
    fn function_params() {
        assert!(check("def f = fn(x: Int) -> Int { x + 1 };"));
    }

    #[test]
    fn shadowing() {
        assert!(check("def x = 1; def f = fn(x: Int) -> Int { x };"));
    }

    #[test]
    fn rec_binding() {
        let src = "def rec f = fn(n: Int) -> Int { n + f(n - 1) };";
        let mut lexer = Lexer::new(src);
        let tokens = lexer.lex_all();
        let mut diag = DiagnosticCollector::new();
        let mut parser = Parser::new(tokens, &mut diag, src);
        let prog = parser.parse_program();
        assert!(!diag.has_errors(), "parse error");
        let mut resolver = NameResolver::new(&mut diag);
        resolver.resolve(&prog);
        assert!(!diag.has_errors(), "name resolution error");
    }
}
