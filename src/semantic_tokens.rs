// Semantic token extraction: walks pre-desugar AST + typeck results to produce
// LSP-compatible semantic tokens for editor highlighting.

use crate::ast::*;
use crate::diagnostics::DiagnosticCollector;
use crate::desugar::desugar_program;
use crate::lexer::{Lexer, TokenKind};
use crate::nameres::NameResolver;
use crate::parser::Parser;
use crate::typeck::{Effect, TypeChecker};
use std::collections::HashMap;

pub fn extract_semantic_tokens(src: &str) -> Vec<SemanticToken> {
    let mut diag = DiagnosticCollector::new();
    let mut lexer = Lexer::new(src);
    let tokens = lexer.lex_all();
    let mut parser = Parser::new(tokens, &mut diag, src);
    let prog = parser.parse_program();

    let mut extractor = TokenExtractor::new(src);
    extractor.collect_from_program(&prog);

    let desugared = desugar_program(&prog, &mut diag);
    let mut resolver = NameResolver::new(&mut diag);
    resolver.resolve(&desugared);
    let mut tc = TypeChecker::new(&mut diag);
    tc.check(&desugared);

    extractor.annotate_from_typeck(&tc);
    extractor.add_keyword_tokens();
    extractor.add_comment_tokens();
    extractor.tokens.sort_by_key(|t| t.span.start);
    extractor.tokens
}

struct TokenExtractor<'a> {
    src: &'a str,
    tokens: Vec<SemanticToken>,
    // Names that are borrow parameters (collected during AST walk)
    borrow_names: HashMap<String, Span>,
    // Names that are function definitions
    fn_def_names: HashMap<String, Span>,
}

impl<'a> TokenExtractor<'a> {
    fn new(src: &'a str) -> Self {
        TokenExtractor {
            src,
            tokens: Vec::new(),
            borrow_names: HashMap::new(),
            fn_def_names: HashMap::new(),
        }
    }

    fn collect_from_program(&mut self, prog: &Program) {
        for decl in &prog.decls {
            self.collect_from_decl(decl);
        }
    }

    fn collect_from_decl(&mut self, decl: &Decl) {
        match decl {
            Decl::Def(d) => {
                self.fn_def_names.insert(d.name.name.clone(), d.name.span);
                self.tokens.push(SemanticToken {
                    span: d.name.span,
                    token_type: SemanticTokenType::Variable,
                    modifiers: SemanticTokenModifiers::DEFINITION,
                });
                self.collect_from_expr(&d.value);
            }
            Decl::Struct(s) => {
                self.tokens.push(SemanticToken {
                    span: s.name.span,
                    token_type: if s.attrs.iter().any(|a| matches!(a, Attr::Affine)) {
                        SemanticTokenType::AffineType
                    } else {
                        SemanticTokenType::Type
                    },
                    modifiers: SemanticTokenModifiers::DEFINITION,
                });
                for field in &s.fields {
                    self.tokens.push(SemanticToken {
                        span: field.name.span,
                        token_type: SemanticTokenType::Variable,
                        modifiers: SemanticTokenModifiers::DEFINITION,
                    });
                }
            }
            Decl::Enum(e) => {
                self.tokens.push(SemanticToken {
                    span: e.name.span,
                    token_type: if e.attrs.iter().any(|a| matches!(a, Attr::Affine)) {
                        SemanticTokenType::AffineType
                    } else {
                        SemanticTokenType::Type
                    },
                    modifiers: SemanticTokenModifiers::DEFINITION,
                });
                for variant in &e.variants {
                    let vname = match variant {
                        Variant::Single { name, .. } | Variant::Struct { name, .. } | Variant::Unit { name, .. } => name,
                    };
                    self.tokens.push(SemanticToken {
                        span: vname.span,
                        token_type: SemanticTokenType::Type,
                        modifiers: SemanticTokenModifiers::DEFINITION,
                    });
                }
            }
            Decl::Import(_) => {}
        }
    }

    fn collect_from_expr(&mut self, expr: &Expr) {
        match expr {
            Expr::Var(ident) => {
                if ident.name == "stdout" || ident.name == "Stdin" {
                    self.tokens.push(SemanticToken {
                        span: ident.span,
                        token_type: SemanticTokenType::IoFunction,
                        modifiers: SemanticTokenModifiers::NONE,
                    });
                } else if self.borrow_names.contains_key(&ident.name) {
                    self.tokens.push(SemanticToken {
                        span: ident.span,
                        token_type: SemanticTokenType::BorrowVariable,
                        modifiers: SemanticTokenModifiers::NONE,
                    });
                } else {
                    self.tokens.push(SemanticToken {
                        span: ident.span,
                        token_type: SemanticTokenType::Variable,
                        modifiers: SemanticTokenModifiers::NONE,
                    });
                }
            }
            Expr::IntLit(lit) => {
                self.tokens.push(SemanticToken {
                    span: lit.span,
                    token_type: SemanticTokenType::Number,
                    modifiers: SemanticTokenModifiers::NONE,
                });
            }
            Expr::Fn(f) => {
                for param in &f.params {
                    if param.is_borrow {
                        self.borrow_names.insert(param.name.name.clone(), param.name.span);
                        self.tokens.push(SemanticToken {
                            span: param.name.span,
                            token_type: SemanticTokenType::BorrowVariable,
                            modifiers: SemanticTokenModifiers::DEFINITION,
                        });
                        // Mark the `&` itself
                        self.tokens.push(SemanticToken {
                            span: Span { start: param.span.start, end: param.span.start + 1, line: param.span.line, col: param.span.col.saturating_sub(1) },
                            token_type: SemanticTokenType::BorrowOperator,
                            modifiers: SemanticTokenModifiers::NONE,
                        });
                    } else {
                        self.tokens.push(SemanticToken {
                            span: param.name.span,
                            token_type: SemanticTokenType::Variable,
                            modifiers: SemanticTokenModifiers::DEFINITION,
                        });
                    }
                    if let Some(ty) = &param.ty {
                        self.collect_from_type(ty);
                    }
                }
                if let Some(ret) = &f.return_ty {
                    self.collect_from_type(ret);
                }
                self.collect_from_expr(&f.body);
                // Remove borrow names when exiting scope
                for param in &f.params {
                    if param.is_borrow {
                        self.borrow_names.remove(&param.name.name);
                    }
                }
            }
            Expr::Call(c) => {
                if let Expr::Var(ident) = c.func.as_ref() {
                    if self.fn_def_names.contains_key(&ident.name) {
                        self.tokens.push(SemanticToken {
                            span: ident.span,
                            token_type: SemanticTokenType::Function,
                            modifiers: SemanticTokenModifiers::NONE,
                        });
                    }
                } else {
                    self.collect_from_expr(&c.func);
                }
                for arg in &c.args {
                    match arg {
                        ExprArg::Value(e) => self.collect_from_expr(e),
                        ExprArg::Borrow(b) => {
                            // Mark the `&` operator at the call site
                            self.tokens.push(SemanticToken {
                                span: Span { start: b.span.start, end: b.span.start + 1, line: b.span.line, col: b.span.col },
                                token_type: SemanticTokenType::BorrowOperator,
                                modifiers: SemanticTokenModifiers::NONE,
                            });
                            // Mark the root variable as borrow usage
                            self.tokens.push(SemanticToken {
                                span: b.lvalue.root.span,
                                token_type: SemanticTokenType::BorrowVariable,
                                modifiers: SemanticTokenModifiers::NONE,
                            });
                        }
                    }
                }
            }
            Expr::Borrow(b) => {
                // Statement-level borrow: `&p = expr` or `&p { field = val }`
                // Mark the `&` operator
                self.tokens.push(SemanticToken {
                    span: Span { start: b.span.start, end: b.span.start + 1, line: b.span.line, col: b.span.col },
                    token_type: SemanticTokenType::BorrowOperator,
                    modifiers: SemanticTokenModifiers::NONE,
                });
                // Mark the root variable as borrow
                self.borrow_names.insert(b.lvalue.root.name.clone(), b.lvalue.root.span);
                self.tokens.push(SemanticToken {
                    span: b.lvalue.root.span,
                    token_type: SemanticTokenType::BorrowVariable,
                    modifiers: SemanticTokenModifiers::NONE,
                });
                if let Some(rhs) = &b.rhs {
                    match rhs.as_ref() {
                        BorrowRhs::Assign(e) => self.collect_from_expr(e),
                        BorrowRhs::Update(fields) => {
                            for f in fields {
                                match f {
                                    UpdateField::NamedField { value, .. } => self.collect_from_expr(value),
                                    UpdateField::ArrayIndex { index, value, .. } => { self.collect_from_expr(index); self.collect_from_expr(value); }
                                    UpdateField::TupleIndex { value, .. } => self.collect_from_expr(value),
                                }
                            }
                        }
                    }
                }
            }
            Expr::Force(f) => {
                self.tokens.push(SemanticToken {
                    span: Span { start: f.span.start, end: f.span.start + 1, line: f.span.line, col: f.span.col },
                    token_type: SemanticTokenType::ForceOperator,
                    modifiers: SemanticTokenModifiers::NONE,
                });
                self.collect_from_expr(&f.expr);
            }
            Expr::If(i) => {
                self.collect_from_expr(&i.condition);
                self.collect_from_expr(&i.then_branch);
                self.collect_from_expr(&i.else_branch);
            }
            Expr::Match(m) => {
                self.collect_from_expr(&m.scrutinee);
                for arm in &m.arms {
                    self.collect_from_pattern(&arm.pattern);
                    self.collect_from_expr(&arm.body);
                }
            }
            Expr::Block(b) => {
                for stmt in &b.stmts {
                    if let Some(def) = &stmt.def {
                        self.tokens.push(SemanticToken {
                            span: def.name.span,
                            token_type: SemanticTokenType::Variable,
                            modifiers: SemanticTokenModifiers::DEFINITION,
                        });
                    }
                    self.collect_from_expr(&stmt.expr);
                }
                if let Some(fe) = &b.final_expr {
                    self.collect_from_expr(fe);
                }
            }
            Expr::Binary(b) => { self.collect_from_expr(&b.left); self.collect_from_expr(&b.right); }
            Expr::Unary(u) => { self.collect_from_expr(&u.expr); }
            Expr::Pipeline(p) => { self.collect_from_expr(&p.value); self.collect_from_expr(&p.func); }
            Expr::Field(f) => { self.collect_from_expr(&f.object); }
            Expr::Subscript(s) => { self.collect_from_expr(&s.array); self.collect_from_expr(&s.index); }
            Expr::Update(u) => { self.collect_from_expr(&u.base); }
            Expr::TupleLit(t) => { for e in &t.elements { self.collect_from_expr(e); } }
            Expr::StructLit(s) => {
                self.tokens.push(SemanticToken {
                    span: s.name.span,
                    token_type: SemanticTokenType::Type,
                    modifiers: SemanticTokenModifiers::NONE,
                });
                for f in &s.fields {
                    if let Some(v) = &f.value { self.collect_from_expr(v); }
                }
            }
            Expr::EnumLit(e) => {
                self.tokens.push(SemanticToken {
                    span: e.name.span,
                    token_type: SemanticTokenType::Type,
                    modifiers: SemanticTokenModifiers::NONE,
                });
                for p in match &e.payload {
                    EnumPayload::Single(exprs) => exprs.iter().map(|b| b.as_ref()).collect::<Vec<_>>(),
                    EnumPayload::Struct(_) => Vec::new(),
                } { self.collect_from_expr(p); }
            }
            Expr::ArrayLit(a) => { for e in &a.elements { self.collect_from_expr(e); } }
            Expr::ArrayFill(a) => { self.collect_from_expr(&a.value); }
            Expr::Fix(f) => {
                self.tokens.push(SemanticToken {
                    span: f.loop_var.span,
                    token_type: SemanticTokenType::Variable,
                    modifiers: SemanticTokenModifiers::DEFINITION,
                });
                self.collect_from_expr(&f.body);
            }
            Expr::While(w) => { self.collect_from_expr(&w.condition); self.collect_from_expr(&w.body); }
            Expr::Loop(l) => { self.collect_from_expr(&l.body); }
            Expr::ForIn(fi) => { self.collect_from_expr(&fi.collection); self.collect_from_expr(&fi.body); }
            Expr::Cast(c) => { self.collect_from_expr(&c.expr); }
            Expr::BoolLit(_) | Expr::CharLit(_) | Expr::UnitLit(_) => {}
        }
    }

    fn collect_from_pattern(&mut self, pattern: &Pattern) {
        match pattern {
            Pattern::Var(ident) => {
                self.tokens.push(SemanticToken {
                    span: ident.span,
                    token_type: SemanticTokenType::Variable,
                    modifiers: SemanticTokenModifiers::DEFINITION,
                });
            }
            Pattern::Struct(sp) => {
                self.tokens.push(SemanticToken {
                    span: sp.name.span,
                    token_type: SemanticTokenType::Type,
                    modifiers: SemanticTokenModifiers::NONE,
                });
                for f in &sp.fields {
                    match f {
                        PatternField::Shorthand { name, .. } => {
                            self.tokens.push(SemanticToken {
                                span: name.span,
                                token_type: SemanticTokenType::Variable,
                                modifiers: SemanticTokenModifiers::DEFINITION,
                            });
                        }
                        PatternField::Rename { var, .. } => {
                            self.tokens.push(SemanticToken {
                                span: var.span,
                                token_type: SemanticTokenType::Variable,
                                modifiers: SemanticTokenModifiers::DEFINITION,
                            });
                        }
                    }
                }
            }
            Pattern::Variant(vp) => {
                self.tokens.push(SemanticToken {
                    span: vp.name.span,
                    token_type: SemanticTokenType::Type,
                    modifiers: SemanticTokenModifiers::NONE,
                });
                for p in &vp.payload { self.collect_from_pattern(p); }
            }
            Pattern::Tuple(tp) => { for e in &tp.elements { self.collect_from_pattern(e); } }
            Pattern::Wildcard(_) | Pattern::Lit(_) => {}
        }
    }

    fn collect_from_type(&mut self, ty: &Type) {
        match ty {
            Type::Named(n) => {
                self.tokens.push(SemanticToken {
                    span: n.name.span,
                    token_type: SemanticTokenType::Type,
                    modifiers: SemanticTokenModifiers::NONE,
                });
            }
            Type::Fun(f) => {
                for p in &f.params { self.collect_from_type(&p.ty); }
                if let Some(r) = &f.return_ty { self.collect_from_type(r); }
            }
            Type::Tuple(t) => { for e in &t.elements { self.collect_from_type(e); } }
            Type::Array(a) => { self.collect_from_type(&a.element); }
            Type::Wildcard(_) | Type::TypeOf(_) => {}
        }
    }

    /// After typeck, annotate tokens with affine/IO information.
    fn annotate_from_typeck(&mut self, tc: &TypeChecker) {
        // Mark IO functions — modify existing token instead of pushing new
        for (name, effect) in tc.fn_effects() {
            if *effect == Effect::IO {
                if let Some(span) = self.fn_def_names.get(name) {
                    for token in &mut self.tokens {
                        if token.span == *span {
                            token.token_type = SemanticTokenType::IoFunction;
                            break;
                        }
                    }
                }
            }
        }
        // Mark affine variables
        for (name, _is_affine) in tc.var_affine_hint() {
            for token in &mut self.tokens {
                if token.token_type == SemanticTokenType::Variable
                    || token.token_type == SemanticTokenType::BorrowVariable
                {
                    let token_end = token.span.end;
                    let name_end = name.len();
                    if token.span.start + name_end == token_end
                        || (token.span.end - token.span.start == name.len())
                    {
                        // Check if this span corresponds to this variable
                        let src_slice = if token.span.end <= self.src.len() {
                            &self.src[token.span.start..token.span.end]
                        } else {
                            ""
                        };
                        if src_slice == name.as_str() {
                            token.token_type = SemanticTokenType::AffineVariable;
                        }
                    }
                }
            }
        }
    }

    /// Re-lex the source and emit Keyword tokens for all Dew keywords
    /// that don't overlap with existing tokens.
    fn add_keyword_tokens(&mut self) {
        use crate::lexer::Lexer;
        let mut lexer = Lexer::new(self.src);
        let all_tokens = lexer.lex_all();
        for tok in &all_tokens {
            let is_keyword = match tok.kind {
                TokenKind::Def | TokenKind::Fn | TokenKind::Struct
                | TokenKind::Enum | TokenKind::Match
                | TokenKind::If | TokenKind::Else | TokenKind::Fix
                | TokenKind::Rec | TokenKind::Import | TokenKind::Affine
                | TokenKind::TypeMatch | TokenKind::TypeOf | TokenKind::Not
                | TokenKind::BoolLit(_) | TokenKind::Underscore => true,
                TokenKind::Ident(ref s) if s == "move" => true,
                _ => false,
            };
            if !is_keyword {
                continue;
            }
            // Skip if an existing token starts at the same byte offset
            if self.tokens.iter().any(|t| t.span.start == tok.span.start) {
                continue;
            }
            self.tokens.push(SemanticToken {
                span: tok.span,
                token_type: SemanticTokenType::Keyword,
                modifiers: SemanticTokenModifiers::NONE,
            });
        }
    }

    /// Scan source for `//` line comments and emit Comment tokens.
    fn add_comment_tokens(&mut self) {
        let bytes = self.src.as_bytes();
        let len = bytes.len();
        let mut i = 0;
        while i < len {
            // Skip string literals so we don't find comments inside strings
            if bytes[i] == b'"' {
                i += 1;
                while i < len && bytes[i] != b'"' {
                    if bytes[i] == b'\\' && i + 1 < len { i += 2; }
                    else { i += 1; }
                }
                i += 1;
                continue;
            }
            if i + 1 < len && bytes[i] == b'/' && bytes[i + 1] == b'/' {
                let start = i;
                while i < len && bytes[i] != b'\n' { i += 1; }
                let end = i;
                self.tokens.push(SemanticToken {
                    span: Span { start, end, line: 0, col: 0 },
                    token_type: SemanticTokenType::Comment,
                    modifiers: SemanticTokenModifiers::NONE,
                });
                continue;
            }
            i += 1;
        }
    }
}

pub(crate) fn byte_offset_to_line_col(src: &str, offset: usize) -> (usize, usize) {
    let mut line = 0usize;
    let mut line_start = 0usize;
    for (i, c) in src.char_indices() {
        if i >= offset { break; }
        if c == '\n' { line += 1; line_start = i + 1; }
    }
    let col = src[line_start..offset].chars().count();
    (line, col)
}

pub fn encode_tokens(tokens: &[SemanticToken], src: &str) -> Vec<u32> {
    let mut result = Vec::new();
    let mut prev_line = 0u32;
    let mut prev_col = 0u32;

    for token in tokens {
        let (line, col) = byte_offset_to_line_col(src, token.span.start);
        let line = line as u32;
        let col = col as u32;
        let length = if token.span.start < src.len() && token.span.end <= src.len() {
            src[token.span.start..token.span.end].chars().count() as u32
        } else {
            1
        };

        let delta_line = line.saturating_sub(prev_line);
        let delta_col = if delta_line == 0 { col.saturating_sub(prev_col) } else { col };

        result.push(delta_line);
        result.push(delta_col);
        result.push(length);
        result.push(token.token_type as u32);
        result.push(token.modifiers.bits() as u32);

        prev_line = line;
        prev_col = col;
    }

    result
}

/// The legend (token types + modifiers) declared in the LSP initialize response.
/// Must match SemanticTokenType indices exactly.
pub fn semantic_tokens_legend() -> (Vec<&'static str>, Vec<&'static str>) {
    let token_types = vec![
        "variable",           // 0
        "borrowVariable",     // 1
        "affineVariable",     // 2
        "function",           // 3
        "ioFunction",         // 4
        "type",               // 5
        "affineType",         // 6
        "keyword",            // 7
        "borrowOperator",     // 8
        "forceOperator",      // 9
        "string",             // 10
        "number",             // 11
        "comment",            // 12
    ];
    let token_modifiers = vec![
        "definition",         // 0
        "consumed",           // 1
    ];
    (token_types, token_modifiers)
}
