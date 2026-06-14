// Rx parser — recursive descent parser for the Rx language subset
// Handles: struct, impl, fn, let/let mut, while, if/else, expressions, assignment

#[derive(Debug, Clone, PartialEq)]
pub enum Token {
    KwStruct, KwImpl, KwFn, KwLet, KwMut, KwWhile, KwIf, KwElse, KwReturn, KwContinue, KwExit,
    KwSelf, KwRefSelf, KwMutSelf, KwTrue, KwFalse, KwGetInt, KwPrintInt, KwPrintlnInt,
    Ident(String), IntLit(i64), BoolLit(bool), StrLit(String),
    Plus, Minus, Star, Slash, Percent,
    EqEq, Ne, Lt, Gt, Le, Ge,
    And, Or, Not, Amp,
    Eq, PlusEq, MinusEq, StarEq,
    LParen, RParen, LBrace, RBrace, LBracket, RBracket,
    Colon, Semi, Comma, Dot, Arrow, FatArrow,
    Eof,
}

pub struct Lexer {
    chars: Vec<char>,
    pos: usize,
}

impl Lexer {
    pub fn new(src: &str) -> Self {
        Self { chars: src.chars().collect(), pos: 0 }
    }

    fn peek_char(&self) -> Option<char> {
        self.chars.get(self.pos).copied()
    }

    fn advance(&mut self) -> Option<char> {
        let c = self.chars.get(self.pos).copied();
        self.pos += 1;
        c
    }

    fn skip_whitespace_and_comments(&mut self) {
        loop {
            match self.peek_char() {
                Some(c) if c.is_whitespace() => { self.advance(); }
                Some('/') if self.pos + 1 < self.chars.len() => {
                    match self.chars[self.pos + 1] {
                        '/' => { while let Some(c) = self.peek_char() { if c == '\n' { break; } self.advance(); } }
                        '*' => {
                            self.advance(); self.advance();
                            while self.pos < self.chars.len() {
                                if self.peek_char() == Some('*') && self.pos + 1 < self.chars.len() && self.chars[self.pos + 1] == '/' {
                                    self.advance(); self.advance(); break;
                                }
                                self.advance();
                            }
                        }
                        _ => break,
                    }
                }
                _ => break,
            }
        }
    }

    fn read_ident(&mut self) -> String {
        let mut s = String::new();
        while let Some(c) = self.peek_char() {
            if c.is_alphanumeric() || c == '_' { s.push(c); self.advance(); } else { break; }
        }
        s
    }

    fn read_number(&mut self) -> i64 {
        let mut n: i64 = 0;
        while let Some(c) = self.peek_char() {
            if c.is_ascii_digit() { n = n * 10 + (c as i64 - '0' as i64); self.advance(); } else { break; }
        }
        n
    }

    fn read_string(&mut self) -> String {
        self.advance(); // skip opening "
        let mut s = String::new();
        while let Some(c) = self.peek_char() {
            self.advance();
            if c == '"' { break; }
            if c == '\\' {
                match self.peek_char() {
                    Some('n') => { s.push('\n'); self.advance(); }
                    Some('t') => { s.push('\t'); self.advance(); }
                    Some('\\') => { s.push('\\'); self.advance(); }
                    Some('"') => { s.push('"'); self.advance(); }
                    _ => {}
                }
            } else { s.push(c); }
        }
        s
    }

    pub fn next_token(&mut self) -> Token {
        self.skip_whitespace_and_comments();
        let c = match self.peek_char() {
            Some(c) => c,
            None => return Token::Eof,
        };

        if c.is_alphabetic() || c == '_' {
            let ident = self.read_ident();
            return match ident.as_str() {
                "struct" => Token::KwStruct, "impl" => Token::KwImpl, "fn" => Token::KwFn,
                "let" => Token::KwLet, "mut" => Token::KwMut, "while" => Token::KwWhile,
                "if" => Token::KwIf, "else" => Token::KwElse, "return" => Token::KwReturn,
                "continue" => Token::KwContinue, "exit" => Token::KwExit,
                "self" => Token::KwSelf, "true" => Token::BoolLit(true),
                "false" => Token::BoolLit(false),
                "getInt" => Token::KwGetInt, "printInt" => Token::KwPrintInt, "printlnInt" => Token::KwPrintlnInt,
                _ => Token::Ident(ident),
            };
        }

        if c.is_ascii_digit() {
            return Token::IntLit(self.read_number());
        }

        if c == '"' { return Token::StrLit(self.read_string()); }

        self.advance();
        match c {
            '+' => if self.peek_char() == Some('=') { self.advance(); Token::PlusEq } else { Token::Plus },
            '-' => if self.peek_char() == Some('=') { self.advance(); Token::MinusEq } else if self.peek_char() == Some('>') { self.advance(); Token::Arrow } else { Token::Minus },
            '*' => if self.peek_char() == Some('=') { self.advance(); Token::StarEq } else { Token::Star },
            '/' => Token::Slash,
            '%' => Token::Percent,
            '=' => if self.peek_char() == Some('=') { self.advance(); Token::EqEq } else { Token::Eq },
            '!' => if self.peek_char() == Some('=') { self.advance(); Token::Ne } else { Token::Not },
            '<' => if self.peek_char() == Some('=') { self.advance(); Token::Le } else { Token::Lt },
            '>' => if self.peek_char() == Some('=') { self.advance(); Token::Ge } else { Token::Gt },
            '&' => if self.peek_char() == Some('&') { self.advance(); Token::And } else if self.peek_char() == Some('m') { self.read_ident(); Token::KwRefSelf } else { Token::Amp },
            '|' => if self.peek_char() == Some('|') { self.advance(); Token::Or } else { Token::Eof },
            '(' => Token::LParen, ')' => Token::RParen, '{' => Token::LBrace, '}' => Token::RBrace,
            '[' => Token::LBracket, ']' => Token::RBracket,
            ':' => Token::Colon, ';' => Token::Semi, ',' => Token::Comma, '.' => Token::Dot,
            _ => Token::Eof,
        }
    }
}

// ── AST ──

#[derive(Debug, Clone)]
pub struct Program {
    pub decls: Vec<Decl>,
}

#[derive(Debug, Clone)]
pub enum Decl {
    Struct { name: String, fields: Vec<(String, String)> },
    Impl { struct_name: String, methods: Vec<FnDecl> },
    Fn(FnDecl),
    Const { name: String, value: String },
}

#[derive(Debug, Clone)]
pub struct FnDecl {
    pub name: String,
    pub params: Vec<(String, String)>,
    pub ret_type: String,
    pub body: Vec<Stmt>,
}

#[derive(Debug, Clone)]
pub enum Stmt {
    Let { name: String, mutable: bool, ty: String, init: Option<Expr> },
    Assign { lhs: Expr, op: AssignOp, rhs: Expr },
    While { cond: Expr, body: Vec<Stmt> },
    If { cond: Expr, then_body: Vec<Stmt>, else_body: Option<Vec<Stmt>> },
    Return(Option<Expr>),
    Continue,
    Expr(Expr),
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum AssignOp { Plain, Plus, Minus, Star }

#[derive(Debug, Clone)]
pub enum Expr {
    Int(i64), Bool(bool), Ident(String), Str(String),
    Binary(Box<Expr>, BinOp, Box<Expr>),
    Unary(UnOp, Box<Expr>),
    Call { func: Box<Expr>, args: Vec<Expr> },
    Field(Box<Expr>, String),
    Index(Box<Expr>, Box<Expr>),
    StructLit { name: String, fields: Vec<(String, Expr)> },
    ArrayLit { elements: Vec<Expr>, repeat: Option<Box<Expr>> },
    Cast(Box<Expr>, String),
    Ref(Box<Expr>),
    Deref(Box<Expr>),
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum BinOp { Add, Sub, Mul, Div, Rem, Eq, Ne, Lt, Gt, Le, Ge, And, Or }

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum UnOp { Neg, Not }

// ── Parser ──

pub struct Parser {
    lexer: Lexer,
    current: Token,
}

impl Parser {
    pub fn new(src: &str) -> Self {
        let mut lexer = Lexer::new(src);
        let current = lexer.next_token();
        Self { lexer, current }
    }

    fn advance(&mut self) {
        self.current = self.lexer.next_token();
    }

    fn expect(&mut self, expected: &Token) -> Result<(), String> {
        if std::mem::discriminant(&self.current) == std::mem::discriminant(expected) {
            self.advance();
            Ok(())
        } else {
            Err(format!("expected {:?}, got {:?}", expected, self.current))
        }
    }

    fn expect_ident(&mut self) -> Result<String, String> {
        match &self.current {
            Token::Ident(s) => { let s = s.clone(); self.advance(); Ok(s) }
            t => Err(format!("expected ident, got {:?}", t))
        }
    }

    pub fn parse_program(&mut self) -> Result<Program, String> {
        let mut decls = Vec::new();
        while !matches!(self.current, Token::Eof) {
            decls.push(self.parse_decl()?);
        }
        Ok(Program { decls })
    }

    fn parse_decl(&mut self) -> Result<Decl, String> {
        match &self.current {
            Token::KwStruct => self.parse_struct(),
            Token::KwImpl => self.parse_impl(),
            Token::KwFn => self.parse_fn_decl().map(Decl::Fn),
            Token::Ident(s) if s == "const" => self.parse_const(),
            _ => Err(format!("expected decl, got {:?}", self.current)),
        }
    }

    fn parse_struct(&mut self) -> Result<Decl, String> {
        self.advance(); // struct
        let name = self.expect_ident()?;
        self.expect(&Token::LBrace)?;
        let mut fields = Vec::new();
        while !matches!(self.current, Token::RBrace) {
            let fname = self.expect_ident()?;
            self.expect(&Token::Colon)?;
            let ftype = self.parse_type()?;
            fields.push((fname, ftype));
            if matches!(self.current, Token::Comma) { self.advance(); }
        }
        self.expect(&Token::RBrace)?;
        Ok(Decl::Struct { name, fields })
    }

    fn parse_const(&mut self) -> Result<Decl, String> {
        self.advance(); // const
        let name = self.expect_ident()?;
        self.expect(&Token::Colon)?;
        let _type = self.parse_type()?;
        self.expect(&Token::Eq)?;
        let mut value = String::new();
        while !matches!(self.current, Token::Semi) {
            match &self.current {
                Token::IntLit(n) => { value.push_str(&n.to_string()); self.advance(); }
                Token::Ident(s) => { value.push_str(s); self.advance(); }
                Token::Plus | Token::Minus | Token::Star => { value.push_str(&format!("{:?}", self.current)); self.advance(); }
                _ => break,
            }
        }
        self.expect(&Token::Semi)?;
        Ok(Decl::Const { name, value })
    }

    fn parse_type(&mut self) -> Result<String, String> {
        let mut ty = String::new();
        // Handle &mut and &
        if matches!(self.current, Token::Amp) {
            self.advance();
            if matches!(self.current, Token::KwMut) { self.advance(); ty.push_str("&mut "); }
            else { ty.push_str("&"); }
        }
        // Handle [T; N]
        if matches!(self.current, Token::LBracket) {
            self.advance();
            let inner = self.parse_type()?;
            ty.push_str(&format!("[{}; ", inner));
            self.expect(&Token::Semi)?;
            // Read size expression
            while !matches!(self.current, Token::RBracket) && !matches!(self.current, Token::Semi) {
                match &self.current {
                    Token::Ident(s) => { ty.push_str(s); self.advance(); }
                    Token::IntLit(n) => { ty.push_str(&n.to_string()); self.advance(); }
                    Token::Plus | Token::Minus | Token::Star => { ty.push_str(&format!("{:?}", self.current)); self.advance(); }
                    _ => { ty.push_str(&format!("{:?}", self.current)); self.advance(); }
                }
            }
            if matches!(self.current, Token::Semi) {
                self.advance();
                while !matches!(self.current, Token::RBracket) {
                    match &self.current {
                        Token::Ident(s) => { ty.push_str(&format!(" {}", s)); self.advance(); }
                        Token::IntLit(n) => { ty.push_str(&format!(" {}", n)); self.advance(); }
                        Token::Plus | Token::Minus | Token::Star | Token::Slash => { ty.push_str(&format!(" {:?}", self.current)); self.advance(); }
                        _ => { ty.push_str(&format!(" {:?}", self.current)); self.advance(); }
                    }
                }
            }
            self.expect(&Token::RBracket)?;
            ty.push(']');
            return Ok(ty);
        }
        match &self.current {
            Token::Ident(s) => { ty.push_str(s); self.advance(); }
            _ => return Err(format!("expected type, got {:?}", self.current)),
        }
        Ok(ty)
    }

    fn parse_impl(&mut self) -> Result<Decl, String> {
        self.advance(); // impl
        let struct_name = self.expect_ident()?;
        self.expect(&Token::LBrace)?;
        let mut methods = Vec::new();
        while !matches!(self.current, Token::RBrace) {
            methods.push(self.parse_fn_decl()?);
        }
        self.expect(&Token::RBrace)?;
        Ok(Decl::Impl { struct_name, methods })
    }

    fn parse_fn_decl(&mut self) -> Result<FnDecl, String> {
        self.advance(); // fn
        let name = self.expect_ident()?;
        self.expect(&Token::LParen)?;
        let mut params = Vec::new();
        let mut first = true;
        while !matches!(self.current, Token::RParen) {
            if !first { self.expect(&Token::Comma)?; }
            first = false;
            // Handle self/&self/&mut self
            if matches!(self.current, Token::KwSelf) {
                params.push(("self".into(), "Self".into()));
                self.advance();
                continue;
            }
            if matches!(self.current, Token::KwRefSelf) {
                params.push(("self".into(), "&Self".into()));
                self.advance();
                continue;
            }
            let pname = self.expect_ident()?;
            self.expect(&Token::Colon)?;
            let ptype = self.parse_type()?;
            params.push((pname, ptype));
        }
        self.expect(&Token::RParen)?;
        let ret_type = if matches!(self.current, Token::Arrow) {
            self.advance();
            self.parse_type()?
        } else { "()".into() };
        let body = self.parse_block()?;
        Ok(FnDecl { name, params, ret_type, body })
    }

    fn parse_block(&mut self) -> Result<Vec<Stmt>, String> {
        self.expect(&Token::LBrace)?;
        let mut stmts = Vec::new();
        while !matches!(self.current, Token::RBrace) {
            stmts.push(self.parse_stmt()?);
        }
        self.expect(&Token::RBrace)?;
        Ok(stmts)
    }

    fn parse_stmt(&mut self) -> Result<Stmt, String> {
        match &self.current {
            Token::KwLet => self.parse_let(),
            Token::KwWhile => self.parse_while(),
            Token::KwIf => self.parse_if(),
            Token::KwReturn => { self.advance(); Ok(Stmt::Return(None)) }
            Token::KwContinue => { self.advance(); self.expect(&Token::Semi)?; Ok(Stmt::Continue) }
            _ => {
                let expr = self.parse_expr()?;
                // Check for assignment
                if matches!(self.current, Token::Eq | Token::PlusEq | Token::MinusEq | Token::StarEq) {
                    let op = match self.current {
                        Token::Eq => AssignOp::Plain,
                        Token::PlusEq => AssignOp::Plus,
                        Token::MinusEq => AssignOp::Minus,
                        Token::StarEq => AssignOp::Star,
                        _ => AssignOp::Plain,
                    };
                    self.advance();
                    let rhs = self.parse_expr()?;
                    self.expect(&Token::Semi)?;
                    Ok(Stmt::Assign { lhs: expr, op, rhs })
                } else {
                    self.expect(&Token::Semi)?;
                    Ok(Stmt::Expr(expr))
                }
            }
        }
    }

    fn parse_let(&mut self) -> Result<Stmt, String> {
        self.advance(); // let
        let mutable = matches!(self.current, Token::KwMut);
        if mutable { self.advance(); }
        let name = self.expect_ident()?;
        self.expect(&Token::Colon)?;
        let ty = self.parse_type()?;
        let init = if matches!(self.current, Token::Eq) {
            self.advance();
            let expr = self.parse_expr()?;
            self.expect(&Token::Semi)?;
            Some(expr)
        } else { None };
        Ok(Stmt::Let { name, mutable, ty, init })
    }

    fn parse_while(&mut self) -> Result<Stmt, String> {
        self.advance(); // while
        let cond = self.parse_expr()?;
        let body = self.parse_block()?;
        Ok(Stmt::While { cond, body })
    }

    fn parse_if(&mut self) -> Result<Stmt, String> {
        self.advance(); // if
        let cond = self.parse_expr()?;
        let then_body = self.parse_block()?;
        let else_body = if matches!(self.current, Token::KwElse) {
            self.advance();
            if matches!(self.current, Token::KwIf) {
                Some(vec![self.parse_if()?])
            } else {
                Some(self.parse_block()?)
            }
        } else { None };
        Ok(Stmt::If { cond, then_body, else_body })
    }

    fn parse_expr(&mut self) -> Result<Expr, String> {
        self.parse_assignment()
    }

    fn parse_assignment(&mut self) -> Result<Expr, String> {
        let left = self.parse_or()?;
        if matches!(self.current, Token::Eq) {
            // Not assignment — handled in parse_stmt
            return Ok(left);
        }
        Ok(left)
    }

    fn parse_or(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_and()?;
        while matches!(self.current, Token::Or) {
            self.advance();
            let right = self.parse_and()?;
            left = Expr::Binary(Box::new(left), BinOp::Or, Box::new(right));
        }
        Ok(left)
    }

    fn parse_and(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_equality()?;
        while matches!(self.current, Token::And) {
            self.advance();
            let right = self.parse_equality()?;
            left = Expr::Binary(Box::new(left), BinOp::And, Box::new(right));
        }
        Ok(left)
    }

    fn parse_equality(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_comparison()?;
        while matches!(self.current, Token::EqEq | Token::Ne) {
            let op = if matches!(self.current, Token::EqEq) { BinOp::Eq } else { BinOp::Ne };
            self.advance();
            let right = self.parse_comparison()?;
            left = Expr::Binary(Box::new(left), op, Box::new(right));
        }
        Ok(left)
    }

    fn parse_comparison(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_term()?;
        while matches!(self.current, Token::Lt | Token::Gt | Token::Le | Token::Ge) {
            let op = match self.current {
                Token::Lt => BinOp::Lt, Token::Gt => BinOp::Gt,
                Token::Le => BinOp::Le, Token::Ge => BinOp::Ge,
                _ => unreachable!(),
            };
            self.advance();
            let right = self.parse_term()?;
            left = Expr::Binary(Box::new(left), op, Box::new(right));
        }
        Ok(left)
    }

    fn parse_term(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_factor()?;
        while matches!(self.current, Token::Plus | Token::Minus) {
            let op = if matches!(self.current, Token::Plus) { BinOp::Add } else { BinOp::Sub };
            self.advance();
            let right = self.parse_factor()?;
            left = Expr::Binary(Box::new(left), op, Box::new(right));
        }
        Ok(left)
    }

    fn parse_factor(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_unary()?;
        while matches!(self.current, Token::Star | Token::Slash | Token::Percent) {
            let op = match self.current {
                Token::Star => BinOp::Mul, Token::Slash => BinOp::Div, Token::Percent => BinOp::Rem,
                _ => unreachable!(),
            };
            self.advance();
            let right = self.parse_unary()?;
            left = Expr::Binary(Box::new(left), op, Box::new(right));
        }
        // Handle 'as' cast: expr as Type
        while matches!(&self.current, Token::Ident(s) if s == "as") {
            self.advance();
            let ty = self.parse_type()?;
            left = Expr::Cast(Box::new(left), ty);
        }
        Ok(left)
    }

    fn parse_unary(&mut self) -> Result<Expr, String> {
        match self.current {
            Token::Minus => { self.advance(); Ok(Expr::Unary(UnOp::Neg, Box::new(self.parse_unary()?))) }
            Token::Not => { self.advance(); Ok(Expr::Unary(UnOp::Not, Box::new(self.parse_unary()?))) }
            Token::Amp => { self.advance(); Ok(Expr::Ref(Box::new(self.parse_unary()?))) }
            Token::Star => { self.advance(); Ok(Expr::Deref(Box::new(self.parse_unary()?))) }
            _ => self.parse_postfix(),
        }
    }

    fn parse_postfix(&mut self) -> Result<Expr, String> {
        let mut expr = self.parse_primary()?;
        loop {
            match &self.current {
                Token::Dot => {
                    self.advance();
                    let field = self.expect_ident()?;
                    expr = Expr::Field(Box::new(expr), field);
                }
                Token::LParen => {
                    self.advance();
                    let mut args = Vec::new();
                    while !matches!(self.current, Token::RParen) {
                        args.push(self.parse_expr()?);
                        if matches!(self.current, Token::Comma) { self.advance(); }
                    }
                    self.expect(&Token::RParen)?;
                    expr = Expr::Call { func: Box::new(expr), args };
                }
                Token::LBracket => {
                    self.advance();
                    let index = self.parse_expr()?;
                    self.expect(&Token::RBracket)?;
                    expr = Expr::Index(Box::new(expr), Box::new(index));
                }
                _ => break,
            }
        }
        Ok(expr)
    }

    fn parse_primary(&mut self) -> Result<Expr, String> {
        match &self.current {
            Token::IntLit(n) => { let n = *n; self.advance(); Ok(Expr::Int(n)) }
            Token::BoolLit(b) => { let b = *b; self.advance(); Ok(Expr::Bool(b)) }
            Token::StrLit(s) => { let s = s.clone(); self.advance(); Ok(Expr::Str(s)) }
            Token::Ident(s) => {
                let name = s.clone(); self.advance();
                // Struct literal: Name { field: val, ... }
                if matches!(self.current, Token::LBrace) {
                    self.advance();
                    let mut fields = Vec::new();
                    while !matches!(self.current, Token::RBrace) {
                        let fname = self.expect_ident()?;
                        self.expect(&Token::Colon)?;
                        let val = self.parse_expr()?;
                        fields.push((fname, val));
                        if matches!(self.current, Token::Comma) { self.advance(); }
                    }
                    self.expect(&Token::RBrace)?;
                    return Ok(Expr::StructLit { name, fields });
                }
                Ok(Expr::Ident(name))
            }
            Token::KwGetInt => { self.advance(); self.expect(&Token::LParen)?; self.expect(&Token::RParen)?; Ok(Expr::Ident("getInt".into())) }
            Token::KwPrintInt => { self.advance(); self.expect(&Token::LParen)?; let arg = self.parse_expr()?; self.expect(&Token::RParen)?; Ok(Expr::Call { func: Box::new(Expr::Ident("printInt".into())), args: vec![arg] }) }
            Token::KwPrintlnInt => { self.advance(); self.expect(&Token::LParen)?; let arg = self.parse_expr()?; self.expect(&Token::RParen)?; Ok(Expr::Call { func: Box::new(Expr::Ident("printlnInt".into())), args: vec![arg] }) }
            Token::KwExit => { self.advance(); self.expect(&Token::LParen)?; self.parse_expr()?; self.expect(&Token::RParen)?; Ok(Expr::Ident("exit".into())) }
            Token::LParen => { self.advance(); let expr = self.parse_expr()?; self.expect(&Token::RParen)?; Ok(expr) }
            Token::LBracket => {
                self.advance();
                let elem = self.parse_expr()?;
                if matches!(self.current, Token::Semi) {
                    self.advance();
                    let count = self.parse_expr()?;
                    self.expect(&Token::RBracket)?;
                    Ok(Expr::ArrayLit { elements: vec![elem], repeat: Some(Box::new(count)) })
                } else {
                    let mut elements = vec![elem];
                    while matches!(self.current, Token::Comma) {
                        self.advance();
                        elements.push(self.parse_expr()?);
                    }
                    self.expect(&Token::RBracket)?;
                    Ok(Expr::ArrayLit { elements, repeat: None })
                }
            }
            _ => Err(format!("expected expression, got {:?}", self.current)),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parse_simple_fn() {
        let src = "fn main() { let x: i32 = 42; return x; }";
        let mut parser = Parser::new(src);
        let prog = parser.parse_program().unwrap();
        assert_eq!(prog.decls.len(), 1);
    }

    #[test]
    fn parse_struct() {
        let src = "struct Point { x: i32, y: i32 } fn main() { }";
        let mut parser = Parser::new(src);
        let prog = parser.parse_program().unwrap();
        assert_eq!(prog.decls.len(), 2);
    }

    #[test]
    fn parse_while_if() {
        let src = "fn main() { let mut i: i32 = 0; while (i < 10) { if (i == 5) { i = i + 1; } i = i + 1; } }";
        let mut parser = Parser::new(src);
        let prog = parser.parse_program().unwrap();
        assert_eq!(prog.decls.len(), 1);
    }
}
