/// Hand-written recursive descent parser for Dew.

use crate::ast::{BinOp, Expr, Span};
use crate::types::Type;

pub fn parse(source: &str) -> Result<Expr, Vec<String>> {
    let mut lexer = Lexer::new(source);
    let (tokens, spans) = lexer.tokenize().map_err(|errs| errs)?;
    let mut parser = Parser::new(tokens, spans);
    let expr = parse_expr_from_parser(&mut parser).map_err(|e| vec![e])?;
    match parser.peek() {
        Some(tok) if !matches!(tok, Token::Eof) => {
            Err(vec![format!("unexpected token '{tok}' — end of input expected")])
        }
        _ => Ok(expr),
    }
}

// ── Token ──────────────────────────────────────────────────────────────

#[derive(Debug, Clone, PartialEq)]
enum Token {
    Int(i64), True, False, Ident(String),
    Fn, Let, If, Else, Fix, Dup, Box, Unbox, Nil, Cons, Head, Tail, IsNil,
    Pipe, Bang,
    LBracket, RBracket,
    LParen, RParen, LBrace, RBrace, Semicolon, Colon, Comma, Arrow, Eq,
    Plus, Minus, Star, Slash, EqEq, Lt, Gt,
    Eof,
}

impl std::fmt::Display for Token {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Token::Int(n) => write!(f, "{n}"),
            Token::True => write!(f, "true"),
            Token::False => write!(f, "false"),
            Token::Ident(s) => write!(f, "{s}"),
            Token::Fn => write!(f, "fn"),
            Token::Let => write!(f, "def"),
            Token::If => write!(f, "if"),
            Token::Else => write!(f, "else"),
            Token::Fix => write!(f, "fix"),
            Token::Dup => write!(f, "dup"),
            Token::Box => write!(f, "box"),
            Token::Unbox => write!(f, "unbox"),
            Token::Nil => write!(f, "nil"),
            Token::Cons => write!(f, "cons"),
            Token::Head => write!(f, "head"),
            Token::Tail => write!(f, "tail"),
            Token::IsNil => write!(f, "isnil"),
            Token::Pipe => write!(f, "|>"),
            Token::Bang => write!(f, "!"),
            Token::LBracket => write!(f, "["),
            Token::RBracket => write!(f, "]"),
            Token::LParen => write!(f, "("),
            Token::RParen => write!(f, ")"),
            Token::LBrace => write!(f, "{{"),
            Token::RBrace => write!(f, "}}"),
            Token::Semicolon => write!(f, ";"),
            Token::Colon => write!(f, ":"),
            Token::Comma => write!(f, ","),
            Token::Arrow => write!(f, "->"),
            Token::Eq => write!(f, "="),
            Token::Plus => write!(f, "+"),
            Token::Minus => write!(f, "-"),
            Token::Star => write!(f, "*"),
            Token::Slash => write!(f, "/"),
            Token::EqEq => write!(f, "=="),
            Token::Lt => write!(f, "<"),
            Token::Gt => write!(f, ">"),
            Token::Eof => write!(f, "EOF"),
        }
    }
}

// ── Lexer ──────────────────────────────────────────────────────────────

struct Lexer {
    chars: Vec<char>,
    pos: usize,
    line: usize,
    col: usize,
}

impl Lexer {
    fn new(source: &str) -> Self {
        Lexer { chars: source.chars().collect(), pos: 0, line: 1, col: 1 }
    }

    fn span(&self) -> String {
        format!("line {} col {}", self.line, self.col)
    }

    fn peek_char(&self) -> Option<char> { self.chars.get(self.pos).copied() }

    fn advance(&mut self) -> Option<char> {
        let ch = self.chars.get(self.pos).copied();
        if let Some(c) = ch {
            self.pos += 1;
            if c == '\n' { self.line += 1; self.col = 1; }
            else { self.col += 1; }
        }
        ch
    }

    fn skip_whitespace(&mut self) {
        while let Some(ch) = self.peek_char() {
            if ch.is_whitespace() { self.advance(); }
            else if ch == '#' {
                self.advance();
                while let Some(c) = self.peek_char() { if c == '\n' { break; } self.advance(); }
            } else { break; }
        }
    }

    fn tokenize(&mut self) -> Result<(Vec<Token>, Vec<Span>), Vec<String>> {
        let mut tokens = Vec::new();
        let mut spans = Vec::new();
        loop {
            self.skip_whitespace();
            let start_line = self.line;
            let start_col = self.col;
            let ch = match self.peek_char() { Some(c) => c, None => break, };
            let tok = match ch {
                '0'..='9' => {
                    let mut n = 0i64;
                    while let Some(c) = self.peek_char() {
                        if let Some(d) = c.to_digit(10) { n = n * 10 + d as i64; self.advance(); }
                        else if c.is_alphabetic() || c == '_' {
                            return Err(vec![format!("unexpected character '{c}' in number at {}", self.span())]);
                        } else { break; }
                    }
                    Token::Int(n)
                }
                '(' => { self.advance(); Token::LParen }
                ')' => { self.advance(); Token::RParen }
                '{' => { self.advance(); Token::LBrace }
                '}' => { self.advance(); Token::RBrace }
                ';' => { self.advance(); Token::Semicolon }
                ':' => { self.advance(); Token::Colon }
                ',' => { self.advance(); Token::Comma }
                '=' => {
                    self.advance();
                    if self.peek_char() == Some('=') { self.advance(); Token::EqEq }
                    else { Token::Eq }
                }
                '-' => {
                    self.advance();
                    if self.peek_char() == Some('>') { self.advance(); Token::Arrow }
                    else { Token::Minus }
                }
                '|' => {
                    self.advance();
                    if self.peek_char() == Some('>') { self.advance(); Token::Pipe }
                    else { return Err(vec![format!("expected '>' after '|' for pipe operator at {}", self.span())]); }
                }
                '+' => { self.advance(); Token::Plus }
                '*' => { self.advance(); Token::Star }
                '/' => { self.advance(); Token::Slash }
                '!' => { self.advance(); Token::Bang }
                '[' => { self.advance(); Token::LBracket }
                ']' => { self.advance(); Token::RBracket }
                '<' => { self.advance(); Token::Lt }
                '>' => { self.advance(); Token::Gt }
                'a'..='z' | 'A'..='Z' | '_' => {
                    let mut s = String::new();
                    while let Some(c) = self.peek_char() {
                        if c.is_alphanumeric() || c == '_' { s.push(c); self.advance(); }
                        else { break; }
                    }
                    match s.as_str() {
                        "fn" => Token::Fn, "def" => Token::Let, "if" => Token::If,
                        "else" => Token::Else, "fix" => Token::Fix, "dup" => Token::Dup,
                        "box" | "Box" => Token::Box, "unbox" | "Unbox" => Token::Unbox,
                        "nil" | "Nil" => Token::Nil, "cons" | "Cons" => Token::Cons,
                        "head" | "Head" => Token::Head, "tail" | "Tail" => Token::Tail,
                        "isnil" | "IsNil" | "isNil" => Token::IsNil,
                        "true" | "True" => Token::True, "false" | "False" => Token::False,
                        "Int" | "Bool" | "List" => Token::Ident(s),
                        _ => Token::Ident(s),
                    }
                }
                c => return Err(vec![format!("unexpected character '{c}' at {}", self.span())]),
            };
            let end_line = self.line;
            let end_col = self.col;
            tokens.push(tok);
            spans.push((start_line, start_col, end_line, end_col));
        }
        tokens.push(Token::Eof);
        spans.push((self.line, self.col, self.line, self.col));
        Ok((tokens, spans))
    }
}

// ── Parser ─────────────────────────────────────────────────────────────

struct Parser {
    tokens: Vec<Token>,
    spans: Vec<Span>,
    pos: usize,
}

impl Parser {
    fn new(tokens: Vec<Token>, spans: Vec<Span>) -> Self { Parser { tokens, spans, pos: 0 } }
    fn peek(&self) -> Option<&Token> { self.tokens.get(self.pos) }
    fn span(&self) -> Span { self.spans.get(self.pos).copied().unwrap_or((0, 0, 0, 0)) }
    fn advance(&mut self) -> &Token {
        let tok = &self.tokens[self.pos];
        if self.pos < self.tokens.len() - 1 { self.pos += 1; }
        tok
    }
    fn expect(&mut self, expected: &Token) -> Result<(), String> {
        let tok = self.advance();
        if std::mem::discriminant(tok) == std::mem::discriminant(expected) { Ok(()) }
        else { Err(format!("expected {expected} but found {tok}")) }
    }
    fn check(&self, tok: &Token) -> bool {
        match self.peek() { Some(t) => std::mem::discriminant(t) == std::mem::discriminant(tok), None => false }
    }
}

// ── Recursive descent ──────────────────────────────────────────────────

fn parse_expr_from_parser(parser: &mut Parser) -> Result<Expr, String> {
    parse_pipe(parser)
}

fn parse_pipe(parser: &mut Parser) -> Result<Expr, String> {
    let mut left = parse_comp(parser)?;
    while parser.check(&Token::Pipe) {
        parser.advance();
        let right = parse_comp(parser)?;
        let span = parser.span();
        // Desugar: left |> right  →  right(left)
        left = Expr::App(Box::new(right), Box::new(left), span);
    }
    Ok(left)
}

fn parse_comp(parser: &mut Parser) -> Result<Expr, String> {
    let mut left = parse_term(parser)?;
    while parser.check(&Token::EqEq) || parser.check(&Token::Lt) || parser.check(&Token::Gt) {
        let op = match parser.advance() { Token::EqEq => BinOp::Eq, Token::Lt => BinOp::Lt, Token::Gt => BinOp::Gt, _ => unreachable!() };
        let right = parse_term(parser)?;
        let span = parser.span();
        left = Expr::BinOp(op, Box::new(left), Box::new(right), span);
    }
    Ok(left)
}

fn parse_term(parser: &mut Parser) -> Result<Expr, String> {
    let mut left = parse_factor(parser)?;
    while parser.check(&Token::Plus) || parser.check(&Token::Minus) {
        let op = match parser.advance() { Token::Plus => BinOp::Add, Token::Minus => BinOp::Sub, _ => unreachable!() };
        let right = parse_factor(parser)?;
        let span = parser.span();
        left = Expr::BinOp(op, Box::new(left), Box::new(right), span);
    }
    Ok(left)
}

fn parse_factor(parser: &mut Parser) -> Result<Expr, String> {
    // Explicit strict evaluation: !expr
    if parser.check(&Token::Bang) {
        let span = parser.span();
        parser.advance();
        let inner = parse_factor(parser)?;
        return Ok(Expr::ForceStrict(Box::new(inner), span));
    }
    let mut left = parse_app(parser)?;
    while parser.check(&Token::Star) || parser.check(&Token::Slash) {
        let op = match parser.advance() { Token::Star => BinOp::Mul, Token::Slash => BinOp::Div, _ => unreachable!() };
        let right = parse_app(parser)?;
        let span = parser.span();
        left = Expr::BinOp(op, Box::new(left), Box::new(right), span);
    }
    Ok(left)
}

fn parse_app(parser: &mut Parser) -> Result<Expr, String> {
    let mut expr = parse_primary(parser)?;
    while !parser.check(&Token::Eof) && !parser.check(&Token::Semicolon)
        && !parser.check(&Token::RBrace) && !parser.check(&Token::LBrace)
        && !parser.check(&Token::RParen) && !parser.check(&Token::Comma)
        && !parser.check(&Token::Colon) && !parser.check(&Token::Arrow)
        && !parser.check(&Token::EqEq) && !parser.check(&Token::Lt)
        && !parser.check(&Token::Gt) && !parser.check(&Token::Plus)
        && !parser.check(&Token::Minus) && !parser.check(&Token::Star)
        && !parser.check(&Token::Slash) && !parser.check(&Token::Else)
        && !parser.check(&Token::Pipe) && !parser.check(&Token::Bang)
        && !parser.check(&Token::RBracket) && !parser.check(&Token::LBracket)
    {
        let arg = parse_primary(parser)?;
        let span = parser.span();
        expr = Expr::App(Box::new(expr), Box::new(arg), span);
    }
    Ok(expr)
}

fn parse_primary(parser: &mut Parser) -> Result<Expr, String> {
    let span = parser.span();
    match parser.peek() {
        Some(Token::Int(n)) => { let n = *n; parser.advance(); Ok(Expr::LitInt(n, span)) }
        Some(Token::True) => { parser.advance(); Ok(Expr::LitBool(true, span)) }
        Some(Token::False) => { parser.advance(); Ok(Expr::LitBool(false, span)) }
        Some(Token::Ident(name)) => { let name = name.clone(); parser.advance(); Ok(Expr::Var(name, span)) }
        Some(Token::If) => {
            parser.advance();
            let cond = parse_expr_from_parser(parser)?;
            expect_brace(parser, Token::LBrace, "{")?;
            let then_body = parse_expr_from_parser(parser)?;
            expect_brace(parser, Token::RBrace, "}")?;
            parser.expect(&Token::Else)?;
            expect_brace(parser, Token::LBrace, "{")?;
            let else_body = parse_expr_from_parser(parser)?;
            expect_brace(parser, Token::RBrace, "}")?;
            Ok(Expr::If(Box::new(cond), Box::new(then_body), Box::new(else_body), span))
        }
        Some(Token::Fn) => {
            parser.advance();
            parser.expect(&Token::LParen)?;
            let (param_name, param_ty) = if parser.check(&Token::RParen) {
                parser.advance(); // )
                ("_".to_string(), Type::Unit)
            } else {
                let p = parse_param(parser)?;
                parser.expect(&Token::RParen)?;
                p
            };
            expect_brace(parser, Token::LBrace, "{")?;
            let body = parse_expr_from_parser(parser)?;
            expect_brace(parser, Token::RBrace, "}")?;
            Ok(Expr::Lam(param_name, param_ty, Box::new(body), span))
        }
        Some(Token::Let) => {
            parser.advance();
            let name = expect_ident(parser)?;
            parser.expect(&Token::Eq)?;
            let bind = parse_expr_from_parser(parser)?;
            if parser.check(&Token::Semicolon) {
                parser.advance(); // ;
                let body = parse_expr_from_parser(parser)?;
                Ok(Expr::Let(name, Box::new(bind), Box::new(body), span))
            } else {
                Ok(Expr::Let(name.clone(), Box::new(bind), Box::new(Expr::Var(name, span)), span))
            }
        }
        Some(Token::Dup) => {
            parser.advance();
            parser.expect(&Token::LParen)?;
            let inner = parse_expr_from_parser(parser)?;
            parser.expect(&Token::RParen)?;
            Ok(Expr::Dup(Box::new(inner), span))
        }
        Some(Token::Fix) => {
            parser.advance();
            let name = expect_ident(parser)?;
            parser.expect(&Token::Colon)?;
            let ty = parse_type(parser)?;
            expect_brace(parser, Token::LBrace, "{")?;
            let body = parse_expr_from_parser(parser)?;
            expect_brace(parser, Token::RBrace, "}")?;
            Ok(Expr::Fix(name, ty, Box::new(body), span))
        }
        Some(Token::Box) => {
            parser.advance();
            parser.expect(&Token::LParen)?;
            let inner = parse_expr_from_parser(parser)?;
            parser.expect(&Token::RParen)?;
            Ok(Expr::Box(Box::new(inner), span))
        }
        Some(Token::Unbox) => {
            parser.advance();
            parser.expect(&Token::LParen)?;
            let inner = parse_expr_from_parser(parser)?;
            parser.expect(&Token::RParen)?;
            Ok(Expr::Unbox(Box::new(inner), span))
        }
        Some(Token::Nil) => {
            parser.advance();
            Ok(Expr::Nil(span))
        }
        Some(Token::Cons) => {
            parser.advance();
            parser.expect(&Token::LParen)?;
            let head = parse_expr_from_parser(parser)?;
            parser.expect(&Token::Comma)?;
            let tail = parse_expr_from_parser(parser)?;
            parser.expect(&Token::RParen)?;
            Ok(Expr::Cons(Box::new(head), Box::new(tail), span))
        }
        Some(Token::Head) => {
            parser.advance();
            parser.expect(&Token::LParen)?;
            let inner = parse_expr_from_parser(parser)?;
            parser.expect(&Token::RParen)?;
            Ok(Expr::Head(Box::new(inner), span))
        }
        Some(Token::Tail) => {
            parser.advance();
            parser.expect(&Token::LParen)?;
            let inner = parse_expr_from_parser(parser)?;
            parser.expect(&Token::RParen)?;
            Ok(Expr::Tail(Box::new(inner), span))
        }
        Some(Token::IsNil) => {
            parser.advance();
            parser.expect(&Token::LParen)?;
            let inner = parse_expr_from_parser(parser)?;
            parser.expect(&Token::RParen)?;
            Ok(Expr::IsNil(Box::new(inner), span))
        }
        Some(Token::LBracket) => {
            parser.advance(); // [
            match parser.peek() {
                Some(Token::RBracket) => {
                    parser.advance(); // ]
                    Ok(Expr::Nil(span))
                }
                _ => {
                    let head = parse_expr_from_parser(parser)?;
                    let tail = parse_list_tail(parser)?;
                    Ok(Expr::Cons(Box::new(head), Box::new(tail), span))
                }
            }
        }
        Some(Token::LParen) => {
            parser.advance(); // (
            if parser.check(&Token::RParen) {
                parser.advance(); // )
                Ok(Expr::LitUnit(span))
            } else {
                let expr = parse_expr_from_parser(parser)?;
                parser.expect(&Token::RParen)?;
                Ok(expr)
            }
        }
        Some(tok) => Err(format!("unexpected token {tok}")),
        None => Err("unexpected end of input".to_string()),
    }
}

fn expect_brace(parser: &mut Parser, expected: Token, label: &str) -> Result<(), String> {
    if parser.check(&expected) { parser.advance(); Ok(()) }
    else { Err(format!("expected '{label}' but found {}", parser.peek().map(|t| t.to_string()).unwrap_or_default())) }
}

fn expect_ident(parser: &mut Parser) -> Result<String, String> {
    match parser.peek() {
        Some(Token::Ident(s)) => { let s = s.clone(); parser.advance(); Ok(s) }
        Some(tok) => Err(format!("expected identifier but found {tok}")),
        None => Err("expected identifier but reached end of input".to_string()),
    }
}

fn parse_param(parser: &mut Parser) -> Result<(String, Type), String> {
    let name = expect_ident(parser)?;
    parser.expect(&Token::Colon)?;
    let ty = parse_type(parser)?;
    Ok((name, ty))
}

fn parse_type(parser: &mut Parser) -> Result<Type, String> {
    let ty = parse_simple_type(parser)?;
    if parser.check(&Token::Arrow) {
        parser.advance();
        let ret = parse_type(parser)?;
        Ok(Type::Fun(Box::new(ty), Box::new(ret), crate::types::Affinity::Normal))
    } else {
        Ok(ty)
    }
}

/// Parse the tail of a list literal: `, e2, ..., en]` or just `]`.
/// Returns the nested Cons chain.
fn parse_list_tail(parser: &mut Parser) -> Result<Expr, String> {
    let span = parser.span();
    match parser.peek() {
        Some(Token::Comma) => {
            parser.advance(); // ,
            let head = parse_expr_from_parser(parser)?;
            let tail = parse_list_tail(parser)?;
            Ok(Expr::Cons(Box::new(head), Box::new(tail), span))
        }
        Some(Token::RBracket) => {
            parser.advance(); // ]
            Ok(Expr::Nil(span))
        }
        Some(tok) => Err(format!("expected ',' or ']' in list literal, found {tok}")),
        None => Err("unexpected end of input in list literal".to_string()),
    }
}

fn parse_simple_type(parser: &mut Parser) -> Result<Type, String> {
    match parser.peek() {
        Some(Token::Ident(s)) if s == "Int" => { parser.advance(); Ok(Type::Int) }
        Some(Token::Ident(s)) if s == "Bool" => { parser.advance(); Ok(Type::Bool) }
        Some(Token::LParen) => {
            parser.advance();
            if parser.check(&Token::RParen) {
                parser.advance(); // )
                Ok(Type::Unit)
            } else {
                let ty = parse_type(parser)?;
                parser.expect(&Token::RParen)?;
                Ok(ty)
            }
        }
        Some(Token::LBracket) => {
            // [T] — list type sugar for List(T)
            parser.advance();
            let inner = parse_type(parser)?;
            parser.expect(&Token::RBracket)?;
            Ok(Type::List(Box::new(inner)))
        }
        Some(Token::Box) => {
            parser.advance();
            parser.expect(&Token::LParen)?;
            let inner = parse_type(parser)?;
            parser.expect(&Token::RParen)?;
            Ok(Type::Box(Box::new(inner)))
        }
        Some(Token::Ident(s)) if s == "List" => {
            parser.advance();
            parser.expect(&Token::LParen)?;
            let inner = parse_type(parser)?;
            parser.expect(&Token::RParen)?;
            Ok(Type::List(Box::new(inner)))
        }
        Some(tok) => Err(format!("expected type but found {tok}")),
        None => Err("expected type but reached end of input".to_string()),
    }
}

