// Parser: token stream → Concrete AST.
//
// Recursive descent with Pratt parsing for operator precedence.
// Two-phase block parsing: def bindings → expressions.
// All syntax sugar (pipeline, borrow, if/else) preserved at this level.

use crate::ast::*;
use crate::diagnostics::DiagnosticCollector;
use crate::lexer::{Token, TokenKind};

pub struct Parser<'a> {
    tokens: Vec<Token>,
    pos: usize,
    diag: &'a mut DiagnosticCollector,
    source: &'a str,
}

// Duplicate parse_expr and parse_pratt — removing the first pair
impl<'a> Parser<'a> {
    pub fn new(
        tokens: Vec<Token>,
        diag: &'a mut DiagnosticCollector,
        source: &'a str,
    ) -> Self {
        Parser { tokens, pos: 0, diag, source }
    }

    pub fn parse_program(&mut self) -> Program {
        let mut decls = Vec::new();
        let start = self.current_span().start;
        while !self.is_eof() {
            if let Some(decl) = self.parse_decl() {
                decls.push(decl);
            } else {
                self.advance(); // skip to recover
            }
        }
        let end = if let Some(t) = self.tokens.last() { t.span.end } else { start };
        Program { decls, span: Span { start, end, line: 0, col: 0 } }
    }

    // ==================================================================
    // Declarations
    // ==================================================================

    fn parse_decl(&mut self) -> Option<Decl> {
        self.parse_decl_result().ok()
    }

    fn parse_decl_result(&mut self) -> Result<Decl, Span> {
        self.eat_attribute();
        match self.peek_kind() {
            TokenKind::Struct => self.parse_struct_decl(),
            TokenKind::Enum => self.parse_enum_decl(),
            TokenKind::Affine => {
                if self.peek_ahead(1) == Some(&TokenKind::Struct) {
                    self.parse_struct_decl()
                } else if self.peek_ahead(1) == Some(&TokenKind::Enum) {
                    self.parse_enum_decl()
                } else {
                    // affine followed by unknown — try as struct
                    self.parse_struct_decl()
                }
            }
            TokenKind::Def => self.parse_def_decl(),
            TokenKind::Import => self.parse_import_decl(),
            _ => {
                let tok = self.peek().cloned();
                let span = tok.as_ref().map(|t| t.span);
                self.diag.error("E002",
                    format!("expected declaration, found {:?}", tok.map(|t| t.kind)),
                    span,
                );
                Err(self.current_span())
            }
        }
    }

    fn parse_struct_decl(&mut self) -> Result<Decl, Span> {
        let start = self.current_span().start;
        let mut attrs = Vec::new();
        if self.eat(TokenKind::Affine) {
            attrs.push(Attr::Affine);
        }
        self.expect(TokenKind::Struct)?;
        let name = self.expect_ident()?;
        let params = self.parse_generic_params();
        self.expect(TokenKind::LBrace)?;
        let mut fields = Vec::new();
        while !self.check(TokenKind::RBrace) && !self.is_eof() {
            let fspan = self.current_span();
            let fname = self.expect_ident()?;
            self.expect(TokenKind::Colon)?;
            let fty = self.parse_type()?;
            fields.push(StructField { span: fspan, name: fname, ty: fty });
            if !self.check(TokenKind::RBrace) {
                self.expect(TokenKind::Comma)?;
            }
        }
        let end = self.expect(TokenKind::RBrace)?.span.end;
        Ok(Decl::Struct(StructDecl {
            span: Span { start, end, line: 0, col: start },
            attrs, name, params, fields,
        }))
    }

    fn parse_enum_decl(&mut self) -> Result<Decl, Span> {
        let start = self.current_span().start;
        let mut attrs = Vec::new();
        if self.eat(TokenKind::Affine) {
            attrs.push(Attr::Affine);
        }
        self.expect(TokenKind::Enum)?;
        let name = self.expect_ident()?;
        let params = self.parse_generic_params();
        self.expect(TokenKind::LBrace)?;
        let mut variants = Vec::new();
        while !self.check(TokenKind::RBrace) && !self.is_eof() {
            let vspan = self.current_span();
            let vname = self.expect_ident()?;
            let variant = if self.check(TokenKind::LParen) {
                self.advance();
                let mut payload = Vec::new();
                if !self.check(TokenKind::RParen) {
                    payload.push(self.parse_type()?);
                    while self.eat(TokenKind::Comma) {
                        payload.push(self.parse_type()?);
                    }
                }
                self.expect(TokenKind::RParen)?;
                Variant::Single { span: vspan, name: vname, payload }
            } else if self.check(TokenKind::LBrace) {
                self.advance();
                let mut vfields = Vec::new();
                while !self.check(TokenKind::RBrace) && !self.is_eof() {
                    let fspan = self.current_span();
                    let fname = self.expect_ident()?;
                    self.expect(TokenKind::Colon)?;
                    let ftype = self.parse_type()?;
                    vfields.push(StructField { span: fspan, name: fname, ty: ftype });
                    if !self.check(TokenKind::RBrace) {
                        self.expect(TokenKind::Comma)?;
                    }
                }
                self.expect(TokenKind::RBrace)?;
                Variant::Struct { span: vspan, name: vname, fields: vfields }
            } else {
                Variant::Unit { span: vspan, name: vname }
            };
            variants.push(variant);
            if !self.check(TokenKind::RBrace) {
                self.expect(TokenKind::Comma)?;
            }
        }
        let end = self.expect(TokenKind::RBrace)?.span.end;
        Ok(Decl::Enum(EnumDecl {
            span: Span { start, end, line: 0, col: start },
            attrs, name, params, variants,
        }))
    }

    fn parse_def_decl(&mut self) -> Result<Decl, Span> {
        let start = self.current_span().start;
        self.expect(TokenKind::Def)?;
        let rec = self.eat(TokenKind::Rec);
        // Tuple destructuring: `def (a, b) = expr`
        let (name, destructure) = if self.eat(TokenKind::LParen) {
            let mut vars = Vec::new();
            while !self.check(TokenKind::RParen) && !self.is_eof() {
                let v = self.expect_ident()?;
                vars.push(v);
                if !self.check(TokenKind::RParen) {
                    self.expect(TokenKind::Comma)?;
                }
            }
            self.expect(TokenKind::RParen)?;
            (Ident::new("%_dstmp", Span::DUMMY), Some(vars))
        } else {
            (self.expect_ident()?, None)
        };
        let params = self.parse_generic_params();
        let ty: Option<Type> = if self.eat(TokenKind::Colon) {
            self.parse_type().ok()
        } else {
            None
        };
        let value = if self.eat(TokenKind::Eq) {
            self.parse_expr()
        } else if ty.is_some() && !self.check(TokenKind::Eq) {
            // Default init: `def x: Int;`
            let end = self.expect(TokenKind::Semicolon)?.span.end;
            let default_value = match ty.as_ref() {
                Some(t) => match t {
                    Type::Named(n) => match n.name.name.as_str() {
                        "Bool" => Expr::BoolLit(BoolLit { span: Span::DUMMY, value: false }),
                        "Char" => Expr::CharLit(CharLit { span: Span::DUMMY, value: '\0' }),
                        "Unit" => Expr::UnitLit(Span::DUMMY),
                        _ => Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }),
                    },
                    _ => Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }),
                },
                None => Expr::IntLit(IntLit { span: Span::DUMMY, value: 0 }),
            };
            return Ok(Decl::Def(DefDecl {
                span: Span { start, end, line: 0, col: start },
                rec, name, destructure, ty, value: default_value,
            }));
        } else {
            self.diag.error("E002", "expected '=' or ';' after def binding",
                Some(Span { start: self.current_span().start, end: self.current_span().start, line: 0, col: 0 }));
            return Err(self.current_span());
        };
        let end = if self.peek().map(|t| t.kind == TokenKind::Semicolon).unwrap_or(false) {
            self.advance();
            self.tokens.get(self.pos - 1).map(|t| t.span.end).unwrap_or(start)
        } else {
            value.span().end
        };
        Ok(Decl::Def(DefDecl {
            span: Span { start, end, line: 0, col: start },
            rec, name, destructure, ty, value,
        }))
    }

    fn parse_import_decl(&mut self) -> Result<Decl, Span> {
        let start = self.current_span().start;
        self.expect(TokenKind::Import)?;
        let path = if let TokenKind::StringLit(s) = &self.peek().ok_or(self.current_span())?.kind {
            let s = s.clone();
            let end = self.advance().end;
            ImportDecl { span: Span { start, end, line: 0, col: start }, path: s }
        } else {
            self.diag.error("E002", "expected string literal after import",
                Some(self.current_span()));
            return Err(self.current_span());
        };
        Ok(Decl::Import(path))
    }

    // ==================================================================
    // Expressions — Pratt parsing
    // ==================================================================

    fn parse_expr(&mut self) -> Expr {
        match self.parse_pratt(0) {
            Ok(e) => e,
            Err(span) => Expr::IntLit(IntLit { span, value: 0 }), // error recovery
        }
    }

    fn parse_expr_no_postfix(&mut self) -> Result<Expr, Span> {
        self.parse_expr_no_postfix_bp(0)
    }

    /// Parse prefix (unary `-`, `!`, `not`) or atom, but NO postfix.
    /// This is the LHS entry point for `parse_expr_no_postfix_bp`, which
    /// handles postfix and binary operators in its own loop.
    /// Uses bp=15 (above all binary ops) so prefix operators don't
    /// consume subsequent operators meant for the outer loop.
    fn parse_prefix_no_postfix(&mut self) -> Result<Expr, Span> {
        match self.peek_kind() {
            TokenKind::Bang => {
                let start = self.advance().start;
                let expr = self.parse_expr_no_postfix_bp(15)?;
                let span = Span { start, end: expr.span().end, line: 0, col: start };
                Ok(Expr::Force(ForceExpr { span, expr: Box::new(expr) }))
            }
            TokenKind::Minus => {
                let start = self.advance().start;
                let expr = self.parse_expr_no_postfix_bp(15)?;
                let span = Span { start, end: expr.span().end, line: 0, col: start };
                Ok(Expr::Unary(UnaryExpr { span, op: UnaryOp::Neg, expr: Box::new(expr) }))
            }
            TokenKind::Not => {
                let start = self.advance().start;
                let expr = self.parse_expr_no_postfix_bp(15)?;
                let span = Span { start, end: expr.span().end, line: 0, col: start };
                Ok(Expr::Unary(UnaryExpr { span, op: UnaryOp::Not, expr: Box::new(expr) }))
            }
            _ => self.parse_atom(),
        }
    }

    fn parse_expr_no_postfix_bp(&mut self, min_bp: u8) -> Result<Expr, Span> {
        let mut lhs = self.parse_prefix_no_postfix()?;
        loop {
            let (op, lbp, rbp): (BinaryOp, u8, u8) = match self.peek_kind() {
                TokenKind::OrOr => (BinaryOp::Or, 1, 2),
                TokenKind::AndAnd => (BinaryOp::And, 3, 4),
                TokenKind::Pipe => (BinaryOp::BitOr, 5, 6),
                TokenKind::Caret => (BinaryOp::BitXor, 5, 6),
                TokenKind::Amp => (BinaryOp::BitAnd, 5, 6),
                TokenKind::EqEq | TokenKind::Ne => {
                    let op = if self.peek_kind() == TokenKind::EqEq { BinaryOp::Eq } else { BinaryOp::Ne };
                    (op, 7, 8)
                }
                TokenKind::Shl | TokenKind::Shr | TokenKind::Lt | TokenKind::Gt | TokenKind::Le | TokenKind::Ge => {
                    let op = match self.peek_kind() {
                        TokenKind::Lt => BinaryOp::Lt, TokenKind::Gt => BinaryOp::Gt,
                        TokenKind::Shl => BinaryOp::Shl, TokenKind::Shr => BinaryOp::Shr,
                        TokenKind::Le => BinaryOp::Le, TokenKind::Ge => BinaryOp::Ge,
                        _ => unreachable!(),
                    };
                    (op, 9, 10)
                }
                TokenKind::Plus => (BinaryOp::Add, 11, 12),
                TokenKind::Minus => (BinaryOp::Sub, 11, 12),
                TokenKind::Star | TokenKind::Slash | TokenKind::Percent => {
                    let op = match self.peek_kind() {
                        TokenKind::Star => BinaryOp::Mul,
                        TokenKind::Slash => BinaryOp::Div,
                        TokenKind::Percent => BinaryOp::Rem,
                        _ => unreachable!(),
                    };
                    (op, 13, 14)
                }
                _ => break,
            };
            if lbp < min_bp { break; }
            self.advance();
            let rhs = self.parse_expr_no_postfix_bp(rbp)?;
            let span = lhs.span().merge(rhs.span());
            lhs = Expr::Binary(BinaryExpr {
                span, op, left: Box::new(lhs), right: Box::new(rhs),
            });
        }
        Ok(lhs)
    }

    fn parse_pratt(&mut self, min_bp: u8) -> Result<Expr, Span> {
        let mut lhs = self.parse_prefix()?;
        loop {
            let (op, lbp, rbp): (BinaryOp, u8, u8) = match self.peek_kind() {
                TokenKind::Arrow => (BinaryOp::Add, 9, 0), // pipeline needs special handling
                TokenKind::OrOr => (BinaryOp::Or, 1, 2),
                TokenKind::AndAnd => (BinaryOp::And, 3, 4),
                TokenKind::Pipe => (BinaryOp::BitOr, 5, 6),
                TokenKind::Caret => (BinaryOp::BitXor, 5, 6),
                TokenKind::Amp => (BinaryOp::BitAnd, 5, 6),
                TokenKind::EqEq | TokenKind::Ne => {
                    let op = if self.peek_kind() == TokenKind::EqEq { BinaryOp::Eq } else { BinaryOp::Ne };
                    (op, 7, 8)
                }
                TokenKind::Shl | TokenKind::Shr | TokenKind::Lt | TokenKind::Gt | TokenKind::Le | TokenKind::Ge => {
                    let op = match self.peek_kind() {
                        TokenKind::Lt => BinaryOp::Lt, TokenKind::Gt => BinaryOp::Gt,
                        TokenKind::Shl => BinaryOp::Shl, TokenKind::Shr => BinaryOp::Shr,
                        TokenKind::Le => BinaryOp::Le, TokenKind::Ge => BinaryOp::Ge,
                        _ => unreachable!(),
                    };
                    (op, 9, 10)
                }
                TokenKind::Plus => (BinaryOp::Add, 11, 12),
                TokenKind::Minus => (BinaryOp::Sub, 11, 12),
                TokenKind::Star | TokenKind::Slash | TokenKind::Percent => {
                    let op = match self.peek_kind() {
                        TokenKind::Star => BinaryOp::Mul,
                        TokenKind::Slash => BinaryOp::Div,
                        TokenKind::Percent => BinaryOp::Rem,
                        _ => unreachable!(),
                    };
                    (op, 13, 14)
                }
                _ => break,
            };

            if lbp < min_bp { break; }

            self.advance(); // consume operator

            if matches!(op, BinaryOp::Add) && lbp == 9 && self.prev_was_arrow() {
                let func = self.parse_pratt(0)?;
                let span = lhs.span().merge(func.span());
                lhs = Expr::Pipeline(PipelineExpr {
                    span, value: Box::new(lhs), func: Box::new(func),
                });
            } else {
                let rhs = self.parse_pratt(rbp)?;
                let span = lhs.span().merge(rhs.span());
                lhs = Expr::Binary(BinaryExpr {
                    span, op, left: Box::new(lhs), right: Box::new(rhs),
                });
            }
        }
        Ok(lhs)
    }

    fn prev_was_arrow(&self) -> bool {
        self.pos >= 1 && self.tokens[self.pos - 1].kind == TokenKind::Arrow
    }

    fn parse_prefix(&mut self) -> Result<Expr, Span> {
        match self.peek_kind() {
            TokenKind::Bang => {
                let start = self.advance().start;
                let expr = self.parse_pratt(15)?; // prefix binds tighter than all binary ops
                let span = Span { start, end: expr.span().end, line: 0, col: start };
                Ok(Expr::Force(ForceExpr { span, expr: Box::new(expr) }))
            }
            TokenKind::Minus => {
                let start = self.advance().start;
                let expr = self.parse_pratt(15)?;
                let span = Span { start, end: expr.span().end, line: 0, col: start };
                Ok(Expr::Unary(UnaryExpr { span, op: UnaryOp::Neg, expr: Box::new(expr) }))
            }
            TokenKind::Not => {
                let start = self.advance().start;
                let expr = self.parse_pratt(15)?;
                let span = Span { start, end: expr.span().end, line: 0, col: start };
                Ok(Expr::Unary(UnaryExpr { span, op: UnaryOp::Not, expr: Box::new(expr) }))
            }
             TokenKind::Amp => {
                let start = self.advance().start;
                let lvalue = self.parse_lvalue()?;
                let rhs = if self.eat(TokenKind::Eq) {
                    let val = self.parse_expr();
                    Some(Box::new(BorrowRhs::Assign(Box::new(val))))
                } else if self.check(TokenKind::LBrace) {
                    let updates = self.parse_update_fields()?;
                    Some(Box::new(BorrowRhs::Update(updates)))
                } else {
                    None
                };
                let end = self.current_span().end;
                Ok(Expr::Borrow(Box::new(BorrowExpr {
                    span: Span { start, end, line: 0, col: start },
                    lvalue, rhs,
                })))
            }
            _ => self.parse_atom().and_then(|e| self.parse_postfix(e)),
        }
    }

    fn parse_atom(&mut self) -> Result<Expr, Span> {
        let start = self.current_span().start;
        match self.peek_kind() {
            TokenKind::IntLit(v) => {
                let v = v;
                let end = self.advance().end;
                Ok(Expr::IntLit(IntLit { span: Span { start, end, line: 0, col: start }, value: v }))
            }
            TokenKind::BoolLit(v) => {
                let v = v;
                let end = self.advance().end;
                Ok(Expr::BoolLit(BoolLit { span: Span { start, end, line: 0, col: start }, value: v }))
            }
            TokenKind::CharLit(c) => {
                let c = c;
                let end = self.advance().end;
                Ok(Expr::CharLit(CharLit { span: Span { start, end, line: 0, col: start }, value: c }))
            }
            TokenKind::StringLit(s) => {
                let s = s;
                let end = self.advance().end;
                Ok(Expr::ArrayLit(ArrayLit {
                    span: Span { start, end, line: 0, col: start },
                    elements: s.chars().map(|c| Expr::CharLit(CharLit {
                        span: Span::DUMMY, value: c,
                    })).collect(),
                }))
            }
            TokenKind::Unit => {
                let end = self.advance().end;
                Ok(Expr::UnitLit(Span { start, end, line: 0, col: start }))
            }
            TokenKind::Ident(_) => {
                let ident = self.expect_ident()?;
                Ok(Expr::Var(ident))
            }
            TokenKind::LParen => self.parse_tuple_or_paren(),
            TokenKind::LBrace => self.parse_block(),
            TokenKind::LBracket => self.parse_array(),
            TokenKind::If => self.parse_if(),
            TokenKind::Match => self.parse_match(),
            TokenKind::Fn => self.parse_fn_expr(),
            TokenKind::Fix => self.parse_fix(),
            TokenKind::While => self.parse_while(),
            TokenKind::Loop => self.parse_loop(),
            TokenKind::Continue => {
                let start = self.advance().start;
                Ok(Expr::Var(Ident { name: "continue".into(), span: Span { start, end: start, line: 0, col: start } }))
            }
            TokenKind::Break => {
                let start = self.advance().start;
                Ok(Expr::Var(Ident { name: "break".into(), span: Span { start, end: start, line: 0, col: start } }))
            }
            _ => {
                self.diag.error("E002", "unexpected token", Some(self.current_span()));
                Err(self.current_span())
            }
        }
    }

    fn parse_postfix(&mut self, mut expr: Expr) -> Result<Expr, Span> {
        loop {
            match self.peek_kind() {
                TokenKind::Dot => {
                    self.advance();
                    if let TokenKind::IntLit(n) = self.peek_kind() {
                        // .0, .1 — tuple field access
                        let idx = n as usize;
                        self.advance();
                        let span = expr.span().merge(self.tokens[self.pos - 1].span);
                        expr = Expr::Field(FieldExpr {
                            span, object: Box::new(expr),
                            field: Ident::new(format!("{}", idx), self.tokens[self.pos - 1].span),
                        });
                    } else {
                        let field = self.expect_ident()?;
                        let span = expr.span().merge(field.span);
                        expr = Expr::Field(FieldExpr {
                            span, object: Box::new(expr), field,
                        });
                    }
                }
                TokenKind::LBracket => {
                    self.advance();
                    let index = self.parse_expr();
                    let rb = self.expect(TokenKind::RBracket)?;
                    let span = expr.span().merge(rb.span);
                    expr = Expr::Subscript(SubscriptExpr {
                        span, array: Box::new(expr), index: Box::new(index),
                    });
                }
                TokenKind::LParen => {
                    let args = self.parse_call_args()?;
                    let span = expr.span().merge(self.tokens[self.pos - 1].span);
                    expr = Expr::Call(CallExpr {
                        span, func: Box::new(expr), args,
                    });
                }
                TokenKind::LBrace => {
                    if self.is_struct_construction() {
                        expr = self.parse_struct_construction(expr)?;
                    } else {
                        let updates = self.parse_update_fields()?;
                        let span = expr.span().merge(self.tokens[self.pos - 1].span);
                        expr = Expr::Update(UpdateExpr {
                            span, base: Box::new(expr), updates,
                        });
                    }
                }
                TokenKind::As => {
                    self.advance();
                    let ty_start = self.current_span().start;
                    let type_name = self.expect_ident()?;
                    let ty_span = Span { start: ty_start, end: type_name.span.end, line: 0, col: ty_start };
                    let target_ty = Type::Named(NamedType {
                        span: ty_span,
                        name: type_name,
                        args: None,
                    });
                    let span = expr.span().merge(ty_span);
                    expr = Expr::Cast(Box::new(CastExpr {
                        span, expr: Box::new(expr), target_ty,
                    }));
                }
                _ => break,
            }
        }
        Ok(expr)
    }

    fn is_struct_construction(&self) -> bool {
        let p = self.pos;
        // p is `{`. The token before `{` is the struct name (consumed).
        if p + 2 >= self.tokens.len() { return false; }
        // If first field is `ident :`, it's struct construction (long form)
        // If first field is `ident ,` or `ident }`, it's struct construction (shorthand)
        // If first field is `ident =`, it's an update expression
        match &self.tokens[p + 2].kind {
            TokenKind::Colon => true,
            TokenKind::Comma => true,
            TokenKind::RBrace => true,
            _ => false,
        }
    }

    fn parse_struct_construction(&mut self, name_expr: Expr) -> Result<Expr, Span> {
        self.advance();
        let name = match &name_expr {
            Expr::Var(ident) => ident.clone(),
            _ => return Err(self.current_span()),
        };
        let mut fields = Vec::new();
        while !self.check(TokenKind::RBrace) && !self.is_eof() {
            let fspan = self.current_span();
            let fname = self.expect_ident()?;
            let value = if self.eat(TokenKind::Colon) {
                Some(self.parse_expr())
            } else {
                None  // shorthand: `x` means `x: x`
            };
            fields.push(StructLitField { span: fspan, name: fname, value });
            if !self.check(TokenKind::RBrace) {
                self.expect(TokenKind::Comma)?;
            }
        }
        let end = self.expect(TokenKind::RBrace)?.span.end;
        Ok(Expr::StructLit(StructLit {
            span: Span { start: name.span.start, end, line: 0, col: name.span.start },
            name,
            fields,
        }))
    }

    // ==================================================================
    // Specific expression forms
    // ==================================================================

    fn parse_tuple_or_paren(&mut self) -> Result<Expr, Span> {
        let start = self.advance().start; // (
        if self.eat(TokenKind::RParen) {
            // Empty parens in fn type position — handled by caller
            let end = self.tokens[self.pos - 1].span.end;
            return Ok(Expr::TupleLit(TupleLit {
                span: Span { start, end, line: 0, col: start }, elements: vec![],
            }));
        }
        let first = self.parse_expr();
        if self.eat(TokenKind::Comma) {
            let mut elements = vec![first];
            while !self.check(TokenKind::RParen) && !self.is_eof() {
                elements.push(self.parse_expr());
                if !self.check(TokenKind::RParen) {
                    self.expect(TokenKind::Comma)?;
                }
            }
            let end = self.expect(TokenKind::RParen)?.span.end;
            Ok(Expr::TupleLit(TupleLit {
                span: Span { start, end, line: 0, col: start }, elements,
            }))
        } else {
            let end = self.expect(TokenKind::RParen)?.span.end;
            Ok(first) // parenthesized expression
        }
    }

    fn parse_block(&mut self) -> Result<Expr, Span> {
        let start = self.advance().start; // {
        let mut stmts = Vec::new();
        let mut final_expr = None;

        // Phase 1: def bindings
        while self.check(TokenKind::Def) {
            let stmt_start = self.current_span().start;
            if let Ok(Decl::Def(def)) = self.parse_def_decl() {
                let end = self.current_span().end;
                let value = def.value.clone();
                stmts.push(BlockStmt {
                    span: Span { start: stmt_start, end, line: 0, col: start },
                    expr: value,
                    def: Some(def),
                });
            }
        }

        // Phase 2: def bindings and expression statements (interleaved)
        while !self.check(TokenKind::RBrace) && !self.is_eof() {
            // def bindings may appear after expressions (used by Rx→Dew translator
            // for assignments translated as def x = expr)
            if self.check(TokenKind::Def) {
                let stmt_start = self.current_span().start;
                if let Ok(Decl::Def(def)) = self.parse_def_decl() {
                    let value = def.value.clone();
                    stmts.push(BlockStmt {
                        span: Span { start: stmt_start, end: def.span.end, line: 0, col: start },
                        expr: value,
                        def: Some(def),
                    });
                } else {
                    self.advance();
                }
                continue;
            }
            let expr = self.parse_expr();
            if self.eat(TokenKind::Semicolon) {
                let end = self.tokens[self.pos - 1].span.end;
                stmts.push(BlockStmt { span: expr.span(), expr, def: None });
            } else {
                final_expr = Some(Box::new(expr));
                break;
            }
        }
        let end = self.expect(TokenKind::RBrace)?.span.end;
        Ok(Expr::Block(BlockExpr {
            span: Span { start, end, line: 0, col: start },
            stmts, final_expr,
        }))
    }

    fn parse_if(&mut self) -> Result<Expr, Span> {
        let start = self.advance().start; // if
        // Detect `if (&x, &y; cond)` borrow syntax
        let (if_borrow, condition) = if self.check(TokenKind::LParen) && {
            // Check if token after `(` is `&` — use direct comparison
            let p = self.pos;
            p + 1 < self.tokens.len() && matches!(self.tokens[p + 1].kind, TokenKind::Amp)
        } {
            self.advance(); // (
            let mut vars = Vec::new();
            while self.eat(TokenKind::Amp) {
                let name = self.expect_ident()?;
                vars.push(name);
                if !self.check(TokenKind::Semicolon) { self.expect(TokenKind::Comma)?; }
            }
            self.expect(TokenKind::Semicolon)?;
            let cond = self.parse_pratt(0)?;
            self.expect(TokenKind::RParen)?;
            (vars, cond)
        } else {
            (vec![], self.parse_expr_no_postfix()?)
        };
        let then_branch = self.parse_block()?;
        // Parse else (may also have borrows: `else (&x) { }`)
        let (else_borrow, else_branch) = if self.eat(TokenKind::Else) {
            let else_brw = if self.check(TokenKind::LParen) && {
                let p = self.pos; p + 1 < self.tokens.len() && matches!(self.tokens[p + 1].kind, TokenKind::Amp)
            } {
                self.advance(); // (
                let mut vars = Vec::new();
                while self.eat(TokenKind::Amp) {
                    let name = self.expect_ident()?;
                    vars.push(name);
                    if !self.check(TokenKind::RParen) { self.expect(TokenKind::Comma)?; }
                }
                self.expect(TokenKind::RParen)?;
                Some(vars)
            } else {
                None
            };
            if self.check(TokenKind::If) {
                (else_brw, Some(self.parse_if()?))
            } else {
                (else_brw, Some(self.parse_block()?))
            }
        } else {
            (None, None)
        };
        let span = if let Some(ref eb) = else_branch {
            condition.span().merge(eb.span())
        } else {
            then_branch.span()
        };
        Ok(Expr::If(IfExpr {
            span, if_borrow, else_borrow,
            condition: Box::new(condition),
            then_branch: Box::new(then_branch),
            else_branch: else_branch.map(Box::new),
        }))
    }

    fn parse_match(&mut self) -> Result<Expr, Span> {
        let start = self.advance().start;
        let scrutinee = self.parse_expr_no_postfix()?;
        self.expect(TokenKind::LBrace)?;
        let mut arms = Vec::new();
        while !self.check(TokenKind::RBrace) && !self.is_eof() {
            let arm_start = self.current_span().start;
            let pattern = self.parse_pattern()?;
            // => is Eq + Gt in our token stream
            self.expect(TokenKind::Eq)?;
            self.expect(TokenKind::Gt)?;
            let body = self.parse_expr();
            arms.push(MatchArm { span: Span { start: arm_start, end: body.span().end, line: 0, col: arm_start }, pattern, body });
            if !self.check(TokenKind::RBrace) {
                self.expect(TokenKind::Comma)?;
            }
        }
        let end = self.expect(TokenKind::RBrace)?.span.end;
        Ok(Expr::Match(MatchExpr {
            span: Span { start, end, line: 0, col: start },
            scrutinee: Box::new(scrutinee), arms,
        }))
    }

    fn parse_fn_expr(&mut self) -> Result<Expr, Span> {
        let start = self.advance().start;
        let mut params = Vec::new();
        let mut return_ty: Option<Type> = None;

        if self.check(TokenKind::LParen) {
            self.advance();
            while !self.check(TokenKind::RParen) && !self.is_eof() {
                let pspan = self.current_span();
                let is_borrow = self.eat(TokenKind::Amp);
                let name = self.expect_ident()?;
                let ty: Option<Type> = if self.eat(TokenKind::Colon) {
                    self.parse_type().ok()
                } else {
                    None
                };
                params.push(FnParam { span: pspan, name, ty, is_borrow });
                if !self.check(TokenKind::RParen) {
                    self.expect(TokenKind::Comma)?;
                }
            }
            self.expect(TokenKind::RParen)?;
            let (is_io, inner_ty) = if self.eat(TokenKind::Arrow) {
                self.parse_return_type()?
            } else {
                (false, None)
            };
            return_ty = if is_io {
                Some(Type::Named(NamedType {
                    span: Span::DUMMY,
                    name: Ident::new(String::from("IO"), Span::DUMMY),
                    args: Some(vec![TypeArg::Type(inner_ty.unwrap_or(Type::Wildcard(Span::DUMMY)))]),
                }))
            } else {
                inner_ty
            };
        } else {
            let (is_io, inner_ty) = if self.eat(TokenKind::Arrow) {
                self.parse_return_type()?
            } else {
                (false, None)
            };
            return_ty = if is_io {
                Some(Type::Named(NamedType {
                    span: Span::DUMMY,
                    name: Ident::new(String::from("IO"), Span::DUMMY),
                    args: Some(vec![TypeArg::Type(inner_ty.unwrap_or(Type::Wildcard(Span::DUMMY)))]),
                }))
            } else {
                inner_ty
            };
        }

        let body = self.parse_expr();
        // parse_expr() greedily consumes IIFE args and pipelines.
        // {body}(args) -> f becomes Pipeline(Call(Block{body}, args), f).
        // Extract the Block, args, and pipeline func for reconstruction.
        let (inner_body, iife_args, outer_pipe) = extract_iife(&body);

        let span = Span { start, end: start, line: 0, col: start }.merge(inner_body.span());
        let fn_expr = Expr::Fn(FnExpr {
            span, params, return_ty, body: Box::new(inner_body),
        });
        let result = match iife_args {
            Some(args) => Expr::Call(CallExpr {
                span: fn_expr.span(),
                func: Box::new(fn_expr),
                args,
            }),
            None => fn_expr,
        };
        match outer_pipe {
            Some(f) => Ok(Expr::Pipeline(PipelineExpr {
                span: result.span().merge(f.span()),
                value: Box::new(result),
                func: f,
            })),
            None => Ok(result),
        }
    }

    fn parse_fix(&mut self) -> Result<Expr, Span> {
        let start = self.advance().start;
        let loop_var = self.expect_ident()?;
        let body = self.parse_expr();
        // parse_expr() greedily consumes IIFE args and pipelines.
        // {body}(args) -> f becomes Pipeline(Call(Block{body}, args), f).
        // Extract the Block, args, and pipeline func for reconstruction.
        let (inner_body, iife_args, outer_pipe) = extract_iife(&body);
        let span = Span { start, end: start, line: 0, col: start }.merge(inner_body.span());
        let fix_expr = Expr::Fix(FixExpr { span, loop_var, body: Box::new(inner_body) });
        let result = match iife_args {
            Some(args) => Expr::Call(CallExpr {
                span: fix_expr.span(),
                func: Box::new(fix_expr),
                args,
            }),
            None => fix_expr,
        };
        match outer_pipe {
            Some(f) => Ok(Expr::Pipeline(PipelineExpr {
                span: result.span().merge(f.span()),
                value: Box::new(result),
                func: f,
            })),
            None => Ok(result),
        }
    }

    fn parse_while(&mut self) -> Result<Expr, Span> {
        let start = self.advance().start;
        let (borrow_vars, condition) = if self.check(TokenKind::LParen) && {
            let p = self.pos; p + 1 < self.tokens.len() && matches!(self.tokens[p + 1].kind, TokenKind::Amp)
        } {
            self.advance(); // (
            let mut vars = Vec::new();
            while self.check(TokenKind::Amp) {
                self.advance(); // &
                let name = self.expect_ident()?;
                vars.push(name);
                if self.check(TokenKind::Comma) { self.advance(); }
            }
            self.expect(TokenKind::Semicolon)?;
            let cond = self.parse_pratt(0)?;
            self.expect(TokenKind::RParen)?;
            (vars, cond)
        } else {
            (vec![], self.parse_expr_no_postfix().unwrap_or(Expr::UnitLit(Span::DUMMY)))
        };
        let body = self.parse_block()?;
        let end = body.span().end;
        Ok(Expr::While(WhileExpr { span: Span { start, end, line: 0, col: start }, borrow_vars, condition: Box::new(condition), body: Box::new(body) }))
    }

    fn parse_loop(&mut self) -> Result<Expr, Span> {
        let start = self.advance().start;
        let body = self.parse_block()?;
        let end = body.span().end;
        Ok(Expr::Loop(LoopExpr { span: Span { start, end, line: 0, col: start }, body: Box::new(body) }))
    }

    fn parse_array(&mut self) -> Result<Expr, Span> {
        let start = self.advance().start; // [
        if self.check(TokenKind::RBracket) {
            let end = self.advance().end;
            return Ok(Expr::ArrayLit(ArrayLit {
                span: Span { start, end, line: 0, col: start }, elements: vec![],
            }));
        }
        let first = self.parse_expr();
        if self.eat(TokenKind::Semicolon) {
            // Array fill: [expr; N]
            let count = if let TokenKind::IntLit(n) = self.peek_kind() {
                let n = n as usize;
                self.advance();
                n
            } else {
                self.diag.error("E002", "expected integer size in array fill", Some(self.current_span()));
                0
            };
            let end = self.expect(TokenKind::RBracket)?.span.end;
            Ok(Expr::ArrayFill(ArrayFill {
                span: Span { start, end, line: 0, col: start },
                value: Box::new(first), count,
            }))
        } else {
            let mut elements = vec![first];
            while self.eat(TokenKind::Comma) {
                elements.push(self.parse_expr());
            }
            let end = self.expect(TokenKind::RBracket)?.span.end;
            Ok(Expr::ArrayLit(ArrayLit {
                span: Span { start, end, line: 0, col: start }, elements,
            }))
        }
    }

    fn parse_call_args(&mut self) -> Result<Vec<ExprArg>, Span> {
        self.advance(); // (
        let mut args = Vec::new();
        while !self.check(TokenKind::RParen) && !self.is_eof() {
            if self.eat(TokenKind::Amp) {
                let lvalue = self.parse_lvalue()?;
                args.push(ExprArg::Borrow(Box::new(BorrowExpr {
                    span: lvalue.span,
                    lvalue, rhs: None,
                })));
            } else {
                args.push(ExprArg::Value(Box::new(self.parse_expr())));
            }
            if !self.check(TokenKind::RParen) {
                self.expect(TokenKind::Comma)?;
            }
        }
        self.expect(TokenKind::RParen)?;
        Ok(args)
    }

    fn parse_update_fields(&mut self) -> Result<Vec<UpdateField>, Span> {
        self.advance(); // {
        let mut updates = Vec::new();
        while !self.check(TokenKind::RBrace) && !self.is_eof() {
            let field_start = self.current_span().start;
            match self.peek_kind() {
                TokenKind::Ident(_) => {
                    let name = self.expect_ident()?;
                    self.expect(TokenKind::Eq)?;
                    let value = self.parse_expr();
                    updates.push(UpdateField::NamedField {
                        span: Span { start: field_start, end: value.span().end, line: 0, col: field_start },
                        name, value,
                    });
                }
                TokenKind::LBracket => {
                    self.advance();
                    let index = self.parse_expr();
                    self.expect(TokenKind::RBracket)?;
                    self.expect(TokenKind::Eq)?;
                    let value = self.parse_expr();
                    updates.push(UpdateField::ArrayIndex {
                        span: Span { start: field_start, end: value.span().end, line: 0, col: field_start },
                        index, value,
                    });
                }
                TokenKind::Dot => {
                    self.advance();
                    if let TokenKind::IntLit(n) = self.peek_kind() {
                        let idx = n as usize;
                        self.advance();
                        self.expect(TokenKind::Eq)?;
                        let value = self.parse_expr();
                        updates.push(UpdateField::TupleIndex {
                            span: Span { start: field_start, end: value.span().end, line: 0, col: field_start },
                            index: idx, value,
                        });
                    } else {
                        let name = self.expect_ident()?;
                        self.expect(TokenKind::Eq)?;
                        let value = self.parse_expr();
                        updates.push(UpdateField::NamedField {
                            span: Span { start: field_start, end: value.span().end, line: 0, col: field_start },
                            name, value,
                        });
                    }
                }
                _ => {
                    self.diag.error("E002", "expected field name, [index], or .index in update",
                        Some(self.current_span()));
                    return Err(self.current_span());
                }
            }
            if !self.check(TokenKind::RBrace) {
                self.expect(TokenKind::Comma)?;
            }
        }
        self.expect(TokenKind::RBrace)?;
        Ok(updates)
    }

    // ==================================================================
    // Patterns
    // ==================================================================

    fn parse_pattern(&mut self) -> Result<Pattern, Span> {
        match self.peek_kind() {
            TokenKind::Underscore => {
                let span = self.advance();
                Ok(Pattern::Wildcard(span))
            }
            TokenKind::IntLit(v) => {
                let v = v;
                let span = self.advance();
                Ok(Pattern::Lit(LitPattern { span, value: LitValue::Int(v) }))
            }
            TokenKind::BoolLit(v) => {
                let v = v;
                let span = self.advance();
                Ok(Pattern::Lit(LitPattern { span, value: LitValue::Bool(v) }))
            }
            TokenKind::CharLit(c) => {
                let c = c;
                let span = self.advance();
                Ok(Pattern::Lit(LitPattern { span, value: LitValue::Char(c) }))
            }
            TokenKind::LParen => self.parse_tuple_pattern(),
            TokenKind::Ident(_) => {
                let ident = self.expect_ident()?;
        if self.check(TokenKind::LParen) {
                    // Variant(inner_pattern, ...)
                    self.advance();
                    let mut payload = Vec::new();
                    if !self.check(TokenKind::RParen) {
                        payload.push(self.parse_pattern()?);
                        while self.eat(TokenKind::Comma) {
                            payload.push(self.parse_pattern()?);
                        }
                    }
                    self.expect(TokenKind::RParen)?;
                    Ok(Pattern::Variant(VariantPattern {
                        span: ident.span, name: ident, payload,
                    }))
                } else if self.check(TokenKind::LBrace) {
                    // Struct destructuring: Point { x, y, .. }
                    self.advance();
                    let mut fields = Vec::new();
                    let mut has_rest = false;
                    while !self.check(TokenKind::RBrace) && !self.is_eof() {
                        if self.eat(TokenKind::Dot) && self.eat(TokenKind::Dot) {
                            has_rest = true;
                            break;
                        }
                        let fspan = self.current_span();
                        let fname = self.expect_ident()?;
                        if self.eat(TokenKind::Colon) {
                            let var = self.expect_ident()?;
                            fields.push(PatternField::Rename { span: fspan, field: fname, var });
                        } else {
                            fields.push(PatternField::Shorthand { span: fspan, name: fname });
                        }
                        if !self.check(TokenKind::RBrace) {
                            self.expect(TokenKind::Comma)?;
                        }
                    }
                    self.expect(TokenKind::RBrace)?;
                    Ok(Pattern::Struct(StructPattern {
                        span: ident.span, name: ident, fields, has_rest,
                    }))
                } else {
                    Ok(Pattern::Var(ident))
                }
            }
            _ => {
                self.diag.error("E002", "expected pattern", Some(self.current_span()));
                Err(self.current_span())
            }
        }
    }

    fn parse_tuple_pattern(&mut self) -> Result<Pattern, Span> {
        let start = self.advance().start;
        let mut elements = Vec::new();
        while !self.check(TokenKind::RParen) && !self.is_eof() {
            elements.push(self.parse_pattern()?);
            if !self.check(TokenKind::RParen) {
                self.expect(TokenKind::Comma)?;
            }
        }
        let end = self.expect(TokenKind::RParen)?.span.end;
        Ok(Pattern::Tuple(TuplePattern {
            span: Span { start, end, line: 0, col: start }, elements,
        }))
    }

    // ==================================================================
    // Types
    // ==================================================================

    fn parse_type(&mut self) -> Result<Type, Span> {
        if self.check(TokenKind::Underscore) {
            let span = self.advance();
            return Ok(Type::Wildcard(span));
        }
        if self.check(TokenKind::TypeOf) || self.check(TokenKind::TypeMatch) {
            return self.parse_typeof_type();
        }
        if self.check(TokenKind::LBracket) {
            // Parse [T; N] as array type
            let start = self.advance().start;
            let element = self.parse_type()?;
            self.expect(TokenKind::Semicolon)?;
            let size = if let TokenKind::IntLit(n) = self.peek_kind() {
                let n = n as usize;
                self.advance();
                n
            } else {
                return Err(self.current_span());
            };
            let end = self.expect(TokenKind::RBracket)?.span.end;
            let arr_ty = ArrayType {
                span: Span { start, end: start, line: 0, col: start },
                element: Box::new(element),
                size,
            };
            return Ok(Type::Array(arr_ty));
        }
        if self.check(TokenKind::LParen) {
            let start = self.current_span().start;
            self.advance();
            if self.check(TokenKind::RParen) {
                let mut params: Vec<crate::ast::FunParamType> = Vec::new();
                self.advance();
                if self.eat(TokenKind::Arrow) {
                    let is_io = self.eat(TokenKind::Ident("IO".into()));
                    self.expect_ident()?;
                    return Err(self.current_span()); // () -> IO/Type not yet implemented
                }
                return Err(self.current_span());
            }
            let first = self.parse_type()?;
            if self.eat(TokenKind::Comma) {
                let mut params = vec![FunParamType { span: first.span(), ty: first.clone(), is_borrow: false }];
                while !self.check(TokenKind::RParen) && !self.is_eof() {
                    let is_borrow = self.eat(TokenKind::Amp);
                    let ty = self.parse_type()?;
                    params.push(FunParamType { span: ty.span(), ty, is_borrow });
                    if !self.check(TokenKind::RParen) {
                        self.expect(TokenKind::Comma)?;
                    }
                }
                let end_paren = self.expect(TokenKind::RParen)?.span.end;
                if self.eat(TokenKind::Arrow) {
                    let (is_io, return_ty) = self.parse_return_type()?;
                    Ok(Type::Fun(FunType {
                        span: Span { start, end: return_ty.as_ref().map(|t| t.span().end).unwrap_or(end_paren), line: 0, col: start },
                        params, return_ty: return_ty.map(Box::new), is_io,
                    }))
                } else {
                    let mut elements = vec![first];
                    for p in params {
                        elements.push(p.ty);
                    }
                    Ok(Type::Tuple(TupleType {
                        span: Span { start, end: end_paren, line: 0, col: start }, elements,
                    }))
                }
            } else {
                self.expect(TokenKind::RParen)?;
                if self.eat(TokenKind::Arrow) {
                    let (is_io, return_ty) = self.parse_return_type()?;
                    let params = vec![FunParamType { span: first.span(), ty: first, is_borrow: false }];
                    Ok(Type::Fun(FunType {
                        span: Span { start, end: return_ty.as_ref().map(|t| t.span().end).unwrap_or(start), line: 0, col: start },
                        params, return_ty: return_ty.map(Box::new), is_io,
                    }))
                } else {
                    Err(self.current_span())
                }
            }
        } else if self.check(TokenKind::Unit) {
            let span = self.advance();
            Ok(Type::Named(NamedType { span, name: Ident::new(String::from("Unit"), span), args: None }))
        } else if self.peek_kind().is_ident() {
            let name = self.expect_ident()?;
            let args = self.parse_type_args()?;
            if self.eat(TokenKind::Arrow) {
                let (is_io, return_ty) = self.parse_return_type()?;
                let param_ty = Type::Named(NamedType { span: name.span, name: name.clone(), args: None });
                let params = vec![FunParamType { span: name.span, ty: param_ty, is_borrow: false }];
                Ok(Type::Fun(FunType {
                    span: Span { start: name.span.start, end: return_ty.as_ref().map(|t| t.span().end).unwrap_or(name.span.end), line: 0, col: name.span.start },
                    params, return_ty: return_ty.map(Box::new), is_io,
                }))
            } else {
                Ok(Type::Named(NamedType { span: name.span, name, args }))
            }
        } else {
            self.diag.error("E002", "expected type", Some(self.current_span()));
            Err(self.current_span())
        }
    }

    fn parse_return_type(&mut self) -> Result<(bool, Option<Type>), Span> {
        let is_io = self.eat_str("IO");
        let ty = self.parse_type().ok();
        Ok((is_io, ty))
    }

    fn parse_typeof_type(&mut self) -> Result<Type, Span> {
        let start = self.current_span().start;
        self.advance();
        self.expect(TokenKind::LParen)?;
        let expr = self.parse_expr();
        let end = self.expect(TokenKind::RParen)?.span.end;
        Ok(Type::TypeOf(TypeOfType {
            span: Span { start, end, line: 0, col: start },
            expr: Box::new(expr),
        }))
    }

    fn parse_type_args(&mut self) -> Result<Option<Vec<TypeArg>>, Span> {
        if !self.check(TokenKind::LParen) {
            return Ok(None);
        }
        self.advance();
        let mut args = Vec::new();
        while !self.check(TokenKind::RParen) && !self.is_eof() {
            if let TokenKind::IntLit(n) = self.peek_kind() {
                args.push(TypeArg::Const(n as usize));
                self.advance();
            } else {
                let ty = self.parse_type()?;
                args.push(TypeArg::Type(ty));
            }
            if !self.check(TokenKind::RParen) {
                self.expect(TokenKind::Comma)?;
            }
        }
        self.expect(TokenKind::RParen)?;
        Ok(Some(args))
    }

    fn fun_param_from_type(&self, ty: Type, is_borrow: bool) -> FunParamType {
        FunParamType { span: ty.span(), ty, is_borrow }
    }

    // ==================================================================
    // Generic params
    // ==================================================================

    fn parse_generic_params(&mut self) -> Vec<GenericParam> {
        if !self.check(TokenKind::LParen) {
            return vec![];
        }
        self.advance();
        let mut params = Vec::new();
        while !self.check(TokenKind::RParen) && !self.is_eof() {
            let name = self.expect_ident();
            if let Ok(name) = name {
                if self.eat(TokenKind::Colon) {
                    params.push(GenericParam::Const(name));
                } else {
                    params.push(GenericParam::Type(name));
                }
            }
            if !self.check(TokenKind::RParen) {
                self.expect(TokenKind::Comma).ok();
            }
        }
        self.expect(TokenKind::RParen).ok();
        params
    }

    // ==================================================================
    // LValue parsing (for borrow sugar)
    // ==================================================================

    fn parse_lvalue(&mut self) -> Result<LValue, Span> {
        let start = self.current_span().start;
        let root = self.expect_ident()?;
        let mut path = Vec::new();
        loop {
            match self.peek_kind() {
                TokenKind::Dot => {
                    self.advance();
                    if let TokenKind::IntLit(n) = self.peek_kind() {
                        path.push(LValueAccessor::TupleIndex(n as usize));
                        self.advance();
                    } else {
                        let field = self.expect_ident()?;
                        path.push(LValueAccessor::Field(field));
                    }
                }
                TokenKind::LBracket => {
                    self.advance();
                    let index = self.parse_expr();
                    self.expect(TokenKind::RBracket)?;
                    path.push(LValueAccessor::Index(index));
                }
                _ => break,
            }
        }
        let end = self.current_span().end;
        Ok(LValue { span: Span { start, end, line: 0, col: start }, root, path })
    }

    // ==================================================================
    // Token stream helpers
    // ==================================================================

    fn peek(&self) -> Option<&Token> {
        self.tokens.get(self.pos)
    }

    fn peek_kind(&self) -> TokenKind {
        self.peek().map(|t| t.kind.clone()).unwrap_or(TokenKind::Eof)
    }

    fn peek_ahead(&self, n: usize) -> Option<&TokenKind> {
        self.tokens.get(self.pos + n).map(|t| &t.kind)
    }

    fn check(&self, kind: TokenKind) -> bool {
        self.peek().map(|t| t.kind == kind).unwrap_or(false)
    }

    fn current_span(&self) -> Span {
        self.peek().map(|t| t.span).unwrap_or(Span::DUMMY)
    }

    fn is_eof(&self) -> bool {
        self.pos >= self.tokens.len()
    }

    fn advance(&mut self) -> Span {
        if self.pos < self.tokens.len() {
            let span = self.tokens[self.pos].span;
            self.pos += 1;
            span
        } else {
            Span::DUMMY
        }
    }

    fn eat(&mut self, kind: TokenKind) -> bool {
        if self.check(kind) {
            self.advance();
            true
        } else {
            false
        }
    }

    fn eat_str(&mut self, s: &str) -> bool {
        match self.peek() {
            Some(Token { kind: TokenKind::Ident(name), .. }) if name == s => {
                self.advance();
                true
            }
            _ => false,
        }
    }

    fn eat_attribute(&mut self) {
        if self.check(TokenKind::Hash) {
            self.advance();
            self.expect(TokenKind::LBracket).ok();
            self.advance(); // skip the attribute name
            self.expect(TokenKind::RBracket).ok();
        }
    }

    fn expect(&mut self, kind: TokenKind) -> Result<Token, Span> {
        let kind_name = format!("{:?}", kind);
        if self.check(kind.clone()) {
            let tok = self.peek().cloned().unwrap();
            self.advance();
            Ok(tok)
        } else {
            let span = self.current_span();
            self.diag.error("E002",
                format!("expected {}, found {:?}", kind_name, self.peek_kind()),
                Some(span),
            );
            Err(span)
        }
    }

    fn expect_ident(&mut self) -> Result<Ident, Span> {
        match self.peek() {
            Some(Token { kind: TokenKind::Ident(name), span }) => {
                let name = name.clone();
                let span = *span;
                self.advance();
                Ok(Ident { name, span })
            }
            _ => {
                self.diag.error("E002", "expected identifier", Some(self.current_span()));
                Err(self.current_span())
            }
        }
    }
}

// Helpers for type parsing
impl TokenKind {
    fn is_ident(&self) -> bool {
        matches!(self, TokenKind::Ident(_))
    }
}

// Expression span helper — public for use by other modules
impl Expr {
    pub fn span(&self) -> Span {
        match self {
            Expr::IntLit(l) => l.span,
            Expr::BoolLit(l) => l.span,
            Expr::CharLit(l) => l.span,
            Expr::UnitLit(s) => *s,
            Expr::Var(i) => i.span,
            Expr::Binary(e) => e.span,
            Expr::Unary(e) => e.span,
            Expr::Fn(e) => e.span,
            Expr::Call(e) => e.span,
            Expr::If(e) => e.span,
            Expr::Match(e) => e.span,
            Expr::Block(e) => e.span,
            Expr::Field(e) => e.span,
            Expr::Subscript(e) => e.span,
            Expr::Update(e) => e.span,
            Expr::Pipeline(e) => e.span,
            Expr::Borrow(e) => e.span,
            Expr::Force(e) => e.span,
            Expr::TupleLit(e) => e.span,
            Expr::StructLit(e) => e.span,
            Expr::EnumLit(e) => e.span,
            Expr::ArrayLit(e) => e.span,
            Expr::ArrayFill(e) => e.span,
            Expr::Fix(e) => e.span,
            Expr::While(e) => e.span,
            Expr::Loop(e) => e.span,
            Expr::ForIn(e) => e.span,
            Expr::Cast(e) => e.expr.span().merge(e.target_ty.span()),
        }
    }
}

impl Type {
    pub fn span(&self) -> Span {
        match self {
            Type::Named(t) => t.span,
            Type::Fun(t) => t.span,
            Type::Tuple(t) => t.span,
            Type::Array(t) => t.span,
            Type::Wildcard(s) => *s,
            Type::TypeOf(t) => t.span,
        }
    }
}

// Expression span helper
mod tests {
    use super::*;
    use crate::lexer::Lexer;

    fn parse(src: &str) -> Program {
        let mut lexer = Lexer::new(src);
        let tokens = lexer.lex_all();
        let mut diag = DiagnosticCollector::new();
        let mut parser = Parser::new(tokens, &mut diag, src);
        parser.parse_program()
    }

    fn first_decl(prog: &Program) -> &Decl {
        &prog.decls[0]
    }

    #[test]
    fn parse_def_binding() {
        let prog = parse("def x = 42;");
        assert_eq!(prog.decls.len(), 1);
        match first_decl(&prog) {
            Decl::Def(d) => {
                assert_eq!(d.name.name, "x");
                assert!(!d.rec);
            }
            _ => panic!("expected Def"),
        }
    }

    #[test]
    fn parse_int_lit() {
        let prog = parse("def x = 2026;");
        match first_decl(&prog) {
            Decl::Def(d) => match &d.value {
                Expr::IntLit(l) => assert_eq!(l.value, 2026),
                _ => panic!("expected IntLit"),
            },
            _ => panic!("expected Def"),
        }
    }

    #[test]
    fn parse_binary_expr() {
        let prog = parse("def x = 40 + 2;");
        match first_decl(&prog) {
            Decl::Def(d) => match &d.value {
                Expr::Binary(b) => {
                    assert_eq!(b.op, BinaryOp::Add);
                    match &*b.left {
                        Expr::IntLit(l) => assert_eq!(l.value, 40),
                        _ => panic!("expected left IntLit"),
                    }
                }
                _ => panic!("expected Binary"),
            },
            _ => panic!("expected Def"),
        }
    }

    #[test]
    fn parse_fn_def() {
        let prog = parse("def add = fn(x: Int, y: Int) -> Int { x + y };");
        match first_decl(&prog) {
            Decl::Def(d) => match &d.value {
                Expr::Fn(f) => {
                    assert_eq!(f.params.len(), 2);
                    assert_eq!(f.params[0].name.name, "x");
                }
                _ => panic!("expected Fn"),
            },
            _ => panic!("expected Def"),
        }
    }

    #[test]
    fn parse_if_else() {
        let prog = parse("def main = fn { if x > 0 { 1 } else { 0 } };");
        match first_decl(&prog) {
            Decl::Def(d) => match &d.value {
                Expr::Fn(f) => match &*f.body {
                    Expr::Block(b) => match &b.final_expr {
                        Some(expr) => match &**expr {
                            Expr::If(_) => {}
                            _ => panic!("expected If"),
                        },
                        None => panic!("no final expr"),
                    },
                    _ => panic!("expected Block"),
                },
                _ => panic!("expected Fn"),
            },
            _ => panic!("expected Def"),
        }
    }

    #[test]
    fn parse_pipeline() {
        let prog = parse("def main = fn { 2026 -> stdout; };");
        match first_decl(&prog) {
            Decl::Def(d) => match &d.value {
                Expr::Fn(f) => {
                    // The body should contain a pipeline expression
                    // or be a block with statements
                    match &*f.body {
                        Expr::Block(_) => {} // valid: block with pipeline stmt
                        Expr::Pipeline(_) => {} // also valid
                        _ => panic!("expected Block or Pipeline, got {:?}", std::mem::discriminant(&*f.body)),
                    }
                }
                _ => panic!("expected Fn"),
            },
            _ => panic!("expected Def"),
        }
    }

    #[test]
    fn parse_struct_decl() {
        let prog = parse("struct Point { x: Int, y: Int }");
        match first_decl(&prog) {
            Decl::Struct(s) => {
                assert_eq!(s.name.name, "Point");
                assert_eq!(s.fields.len(), 2);
            }
            _ => panic!("expected Struct"),
        }
    }

    #[test]
    fn parse_enum_decl() {
        let prog = parse("enum Option { Some(Int), None }");
        match first_decl(&prog) {
            Decl::Enum(e) => {
                assert_eq!(e.name.name, "Option");
                assert_eq!(e.variants.len(), 2);
            }
            _ => panic!("expected Enum"),
        }
    }
}

/// Extract IIFE structure from a parsed function body.
/// Returns (inner_body, iife_args, outer_pipeline_func).
fn extract_iife(body: &Expr) -> (Expr, Option<Vec<ExprArg>>, Option<Box<Expr>>) {
    // Case 1: Pipeline(Call(Block{body}, args), func) — {body}(args) -> func
    if let Expr::Pipeline(p) = body {
        if let Expr::Call(c) = &*p.value {
            if matches!(&*c.func, Expr::Block(_)) {
                let inner = (*c.func).clone();
                return (inner, Some(c.args.clone()), Some(p.func.clone()));
            }
        }
    }
    // Case 2: Call(Block{body}, args) — {body}(args)
    if let Expr::Call(c) = body {
        if matches!(&*c.func, Expr::Block(_)) {
            let inner = (*c.func).clone();
            return (inner, Some(c.args.clone()), None);
        }
    }
    // No IIFE pattern found
    (body.clone(), None, None)
}

trait IsDummy {
    fn is_dummy(&self) -> bool;
}

impl IsDummy for Span {
    fn is_dummy(&self) -> bool {
        self.start == 0 && self.end == 0 && self.line == 0 && self.col == 0
    }
}
