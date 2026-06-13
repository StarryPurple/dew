// Lexer and recursive descent parser for Dew

use crate::ast::*;

#[derive(Debug, Clone, PartialEq)]
pub enum Token {
  Def, Fn, Struct, Enum, Match, If, Else, Return, Fix, Import, Force, True, False, Not,
  IntLit(i64), BoolLit(bool), CharLit(char), StringLit(String),
  Ident(String),
  Plus, Minus, Star, Slash, Percent,
  Lt, Gt, Le, Ge, EqEq, Ne,
  AndAnd, OrOr,
  Arrow, FatArrow, Dot, Amp, Bang,
  LParen, RParen, LBrace, RBrace, LBracket, RBracket,
  Comma, Semicolon, Colon, Underscore, Eq,
  Eof,
}

fn tokenize(source: &str) -> Result<Vec<Token>, String> {
  let mut tokens = Vec::new();
  let chars: Vec<char> = source.chars().collect();
  let mut i = 0;
  while i < chars.len() {
    let c = chars[i];
    if c.is_whitespace() { i += 1; continue; }
    if c == '/' && i + 1 < chars.len() && chars[i + 1] == '/' {
      i += 2; while i < chars.len() && chars[i] != '\n' { i += 1; } continue;
    }
    if c == '/' && i + 1 < chars.len() && chars[i + 1] == '*' {
      i += 2; while i + 1 < chars.len() && !(chars[i] == '*' && chars[i + 1] == '/') { i += 1; } i += 2; continue;
    }
    if c == '"' {
      i += 1; let mut s = String::new();
      while i < chars.len() && chars[i] != '"' {
        if chars[i] == '\\' && i + 1 < chars.len() { i += 1; match chars[i] { 'n' => s.push('\n'), 't' => s.push('\t'), '\\' => s.push('\\'), '"' => s.push('"'), o => s.push(o), } }
        else { s.push(chars[i]); } i += 1;
      }
      if i >= chars.len() { return Err("unterminated string".into()); } i += 1; tokens.push(Token::StringLit(s)); continue;
    }
    if c == '\'' {
      i += 1; let ch = if i < chars.len() && chars[i] == '\\' && i + 1 < chars.len() { i += 1; match chars[i] { 'n' => '\n', 't' => '\t', '\\' => '\\', '\'' => '\'', o => o } } else if i < chars.len() { chars[i] } else { return Err("unterminated char".into()) };
      i += 1; if i >= chars.len() || chars[i] != '\'' { return Err("expected '".into()); } i += 1; tokens.push(Token::CharLit(ch)); continue;
    }
    if c.is_ascii_digit() { let mut n: i64 = 0; while i < chars.len() && chars[i].is_ascii_digit() { n = n * 10 + (chars[i] as i64 - '0' as i64); i += 1; } tokens.push(Token::IntLit(n)); continue; }
    if c == '-' && i + 1 < chars.len() && chars[i + 1] == '>' { tokens.push(Token::Arrow); i += 2; continue; }
    if c == '=' && i + 1 < chars.len() && chars[i + 1] == '>' { tokens.push(Token::FatArrow); i += 2; continue; }
    if c == '<' && i + 1 < chars.len() && chars[i + 1] == '=' { tokens.push(Token::Le); i += 2; continue; }
    if c == '>' && i + 1 < chars.len() && chars[i + 1] == '=' { tokens.push(Token::Ge); i += 2; continue; }
    if c == '=' && i + 1 < chars.len() && chars[i + 1] == '=' { tokens.push(Token::EqEq); i += 2; continue; }
    if c == '!' && i + 1 < chars.len() && chars[i + 1] == '=' { tokens.push(Token::Ne); i += 2; continue; }
    if c == '&' && i + 1 < chars.len() && chars[i + 1] == '&' { tokens.push(Token::AndAnd); i += 2; continue; }
    if c == '|' && i + 1 < chars.len() && chars[i + 1] == '|' { tokens.push(Token::OrOr); i += 2; continue; }
    let token = match c {
      '+' => Token::Plus, '-' => Token::Minus, '*' => Token::Star, '/' => Token::Slash, '%' => Token::Percent,
      '<' => Token::Lt, '>' => Token::Gt, '!' => Token::Bang, '&' => Token::Amp, '.' => Token::Dot,
      ':' => Token::Colon, ';' => Token::Semicolon, ',' => Token::Comma,
      '(' => Token::LParen, ')' => Token::RParen, '{' => Token::LBrace, '}' => Token::RBrace,
      '[' => Token::LBracket, ']' => Token::RBracket, '_' => Token::Underscore, '=' => Token::Eq,
      ch if ch.is_alphabetic() || ch == '_' => {
        let start = i; while i < chars.len() && (chars[i].is_alphanumeric() || chars[i] == '_') { i += 1; }
        let word: String = chars[start..i].iter().collect(); i -= 1;
        match word.as_str() { "def" => Token::Def, "fn" => Token::Fn, "struct" => Token::Struct, "enum" => Token::Enum, "match" => Token::Match, "if" => Token::If, "else" => Token::Else, "return" => Token::Return, "fix" => Token::Fix, "import" => Token::Import, "force" => Token::Force, "true" => Token::True, "false" => Token::False, "not" => Token::Not, _ => Token::Ident(word) }
      }
      _ => return Err(format!("unexpected character: '{c}'")),
    };
    tokens.push(token); i += 1;
  }
  tokens.push(Token::Eof); Ok(tokens)
}

pub fn parse_program(source: &str) -> Result<Vec<Decl>, String> {
  let tokens = tokenize(source)?;
  let mut p = Parser { tokens, pos: 0 };
  p.parse_decls()
}

struct Parser { tokens: Vec<Token>, pos: usize }

impl Parser {
  fn peek(&self) -> &Token { &self.tokens[self.pos] }
  fn advance(&mut self) -> &Token { let t = &self.tokens[self.pos]; self.pos += 1; t }
  fn check(&self, e: &Token) -> bool { self.pos < self.tokens.len() && std::mem::discriminant(&self.tokens[self.pos]) == std::mem::discriminant(e) }
  fn expect(&mut self, e: &Token) -> Result<(), String> { if self.check(e) { self.advance(); Ok(()) } else { Err(format!("expected {:?}, got {:?}", e, self.peek())) } }
  fn expect_ident(&mut self) -> Result<String, String> { match self.advance() { Token::Ident(s) => Ok(s.clone()), t => Err(format!("expected ident, got {t:?}")) } }
  fn span(&self) -> Span { Span::new(0, 0) }

  fn parse_decls(&mut self) -> Result<Vec<Decl>, String> { let mut v = Vec::new(); while self.peek() != &Token::Eof { v.push(self.parse_decl()?); } Ok(v) }
  fn parse_decl(&mut self) -> Result<Decl, String> { match self.peek() { Token::Def => self.parse_def(), Token::Struct => self.parse_struct_decl(), Token::Enum => self.parse_enum_decl(), Token::Import => self.parse_import(), _ => Err(format!("expected decl, got {:?}", self.peek())) } }

  fn parse_def(&mut self) -> Result<Decl, String> { self.advance(); let n = self.expect_ident()?; self.expect(&Token::Eq)?; let v = self.parse_expr()?; let _ = self.check(&Token::Semicolon).then(|| self.advance()); Ok(Decl::Def { name: n, type_ann: None, value: v }) }
  fn parse_struct_decl(&mut self) -> Result<Decl, String> { self.advance(); let n = self.expect_ident()?; self.expect(&Token::LBrace)?; let mut fs = Vec::new(); while self.peek() != &Token::RBrace { let f = self.expect_ident()?; self.expect(&Token::Colon)?; let t = self.parse_type()?; fs.push((f, t)); if self.peek() == &Token::Comma { self.advance(); } } self.advance(); Ok(Decl::Struct { name: n, fields: fs }) }
  fn parse_enum_decl(&mut self) -> Result<Decl, String> { self.advance(); let n = self.expect_ident()?; self.expect(&Token::LBrace)?; let mut vs = Vec::new(); while self.peek() != &Token::RBrace { let vn = self.expect_ident()?; let p = if self.peek() == &Token::LParen { self.advance(); let t = self.parse_type()?; self.expect(&Token::RParen)?; Some(t) } else { None }; vs.push(Variant { name: vn, payload: p }); if self.peek() == &Token::Comma { self.advance(); } } self.advance(); Ok(Decl::Enum { name: n, variants: vs }) }
  fn parse_import(&mut self) -> Result<Decl, String> { self.advance(); let p = match self.advance() { Token::StringLit(s) => s.clone(), t => return Err(format!("expected string, got {t:?}")) }; let _ = self.check(&Token::Semicolon).then(|| self.advance()); Ok(Decl::Import { path: p }) }

  fn parse_type(&mut self) -> Result<Type, String> { match self.peek() { Token::Ident(_) => { let n = self.expect_ident()?; if self.peek() == &Token::LParen { self.advance(); let mut a = Vec::new(); while self.peek() != &Token::RParen { a.push(self.parse_type()?); if self.peek() == &Token::Comma { self.advance(); } } self.advance(); Ok(Type::App(n, a)) } else { match n.as_str() { "Int" => Ok(Type::Prim(PrimType::Int)), "Bool" => Ok(Type::Prim(PrimType::Bool)), "Char" => Ok(Type::Prim(PrimType::Char)), "Unit" => Ok(Type::Prim(PrimType::Unit)), _ => Ok(Type::Named(n)) } } } Token::LParen => { self.advance(); let mut ts = Vec::new(); while self.peek() != &Token::RParen { ts.push(self.parse_type()?); if self.peek() == &Token::Comma { self.advance(); } } self.advance(); Ok(Type::Tuple(ts)) } _ => Err(format!("expected type, got {:?}", self.peek())) } }

  fn parse_expr(&mut self) -> Result<Expr, String> { self.parse_pipe() }

  fn parse_pipe(&mut self) -> Result<Expr, String> { let mut l = self.parse_logic()?; while self.peek() == &Token::Arrow { self.advance(); let r = self.parse_logic()?; l = Expr::Pipe { left: Box::new(l), right: Box::new(r), span: self.span() }; } Ok(l) }

  fn parse_logic(&mut self) -> Result<Expr, String> { let mut l = self.parse_comp()?; loop { let op = match self.peek() { Token::AndAnd => BinOpKind::And, Token::OrOr => BinOpKind::Or, _ => break }; self.advance(); let r = self.parse_comp()?; l = Expr::BinOp { op, left: Box::new(l), right: Box::new(r), span: self.span() }; } Ok(l) }

  fn parse_comp(&mut self) -> Result<Expr, String> { let mut l = self.parse_add()?; loop { let op = match self.peek() { Token::Lt => BinOpKind::Lt, Token::Gt => BinOpKind::Gt, Token::Le => BinOpKind::Le, Token::Ge => BinOpKind::Ge, Token::EqEq => BinOpKind::Eq, Token::Ne => BinOpKind::Ne, _ => break }; self.advance(); let r = self.parse_add()?; l = Expr::BinOp { op, left: Box::new(l), right: Box::new(r), span: self.span() }; } Ok(l) }

  fn parse_add(&mut self) -> Result<Expr, String> { let mut l = self.parse_mul()?; loop { let op = match self.peek() { Token::Plus => BinOpKind::Add, Token::Minus => BinOpKind::Sub, _ => break }; self.advance(); let r = self.parse_mul()?; l = Expr::BinOp { op, left: Box::new(l), right: Box::new(r), span: self.span() }; } Ok(l) }

  fn parse_mul(&mut self) -> Result<Expr, String> { let mut l = self.parse_unary()?; loop { let op = match self.peek() { Token::Star => BinOpKind::Mul, Token::Slash => BinOpKind::Div, Token::Percent => BinOpKind::Rem, _ => break }; self.advance(); let r = self.parse_unary()?; l = Expr::BinOp { op, left: Box::new(l), right: Box::new(r), span: self.span() }; } Ok(l) }

  fn parse_unary(&mut self) -> Result<Expr, String> { match self.peek() { Token::Not => { self.advance(); let e = self.parse_unary()?; Ok(Expr::App { func: Box::new(Expr::Var("not".into(), self.span())), args: vec![e], span: self.span() }) } Token::Bang => { self.advance(); let e = self.parse_unary()?; Ok(Expr::Force { expr: Box::new(e), span: self.span() }) } Token::Force => { self.advance(); self.expect(&Token::LParen)?; let e = self.parse_expr()?; self.expect(&Token::RParen)?; Ok(Expr::Force { expr: Box::new(e), span: self.span() }) } _ => self.parse_primary() } }

  fn is_at_expr_start(&self) -> bool { matches!(self.peek(), Token::IntLit(_)|Token::True|Token::False|Token::CharLit(_)|Token::StringLit(_)|Token::Ident(_)|Token::LBrace|Token::LParen|Token::LBracket|Token::If|Token::Match|Token::Fn|Token::Fix|Token::Not|Token::Bang|Token::Force|Token::Amp) }

  fn parse_primary(&mut self) -> Result<Expr, String> { let s = self.span(); match self.peek().clone() { Token::IntLit(n) => { self.advance(); Ok(Expr::Int(n, s)) } Token::True => { self.advance(); Ok(Expr::Bool(true, s)) } Token::False => { self.advance(); Ok(Expr::Bool(false, s)) } Token::CharLit(c) => { self.advance(); Ok(Expr::Char(c, s)) } Token::StringLit(st) => { self.advance(); let cs: Vec<Expr> = st.chars().map(|c| Expr::Char(c, s)).collect(); Ok(Expr::ArrayLit { elements: cs, span: s }) } Token::Ident(n) => { self.advance(); self.parse_ident_tail(n, s) } Token::LBrace => self.parse_block(), Token::If => self.parse_if(), Token::Match => self.parse_match(), Token::Fn => self.parse_fn(), Token::Fix => self.parse_fix(), Token::LParen => { self.advance(); let f = self.parse_expr()?; if self.peek() == &Token::Comma { let mut es = vec![f]; while self.peek() == &Token::Comma { self.advance(); es.push(self.parse_expr()?); } self.expect(&Token::RParen)?; Ok(Expr::TupleLit { elements: es, span: s }) } else { self.expect(&Token::RParen)?; Ok(f) } } Token::LBracket => { self.advance(); let mut es = Vec::new(); while self.peek() != &Token::RBracket { es.push(self.parse_expr()?); if self.peek() == &Token::Comma { self.advance(); } } self.advance(); Ok(Expr::ArrayLit { elements: es, span: s }) } Token::Amp => { self.advance(); let n = self.expect_ident()?; if self.peek() == &Token::Eq { self.advance(); let v = self.parse_expr()?; Ok(Expr::BorrowBind { name: n, value: Box::new(v), span: s }) } else { Ok(Expr::Borrow { name: n, span: s }) } } _ => Err(format!("expected expr, got {:?}", self.peek())) } }

  fn parse_ident_tail(&mut self, name: String, span: Span) -> Result<Expr, String> {
    if self.peek() == &Token::LParen { self.advance(); let mut fs = Vec::new(); while self.peek() != &Token::RParen { fs.push(self.parse_expr()?); if self.peek() == &Token::Comma { self.advance(); } } self.advance(); return Ok(Expr::StructCons { name, fields: fs, span }); }
    if self.peek() == &Token::Dot { self.advance(); let f = self.expect_ident()?; return Ok(Expr::FieldAccess { expr: Box::new(Expr::Var(name, span)), field: f, span }); }
    if self.peek() == &Token::LBrace { self.advance(); let mut us = Vec::new(); while self.peek() != &Token::RBrace { let fnm = self.expect_ident()?; self.expect(&Token::Eq)?; let v = self.parse_expr()?; us.push((fnm, v)); if self.peek() == &Token::Comma { self.advance(); } } self.advance(); return Ok(Expr::StructUpdate { expr: Box::new(Expr::Var(name, span)), updates: us, span }); }
    let mut expr = Expr::Var(name, span);
    loop { if self.is_at_expr_start() { let a = self.parse_primary()?; expr = Expr::App { func: Box::new(expr), args: vec![a], span: self.span() }; } else { break; } }
    Ok(expr)
  }

  fn parse_block(&mut self) -> Result<Expr, String> {
    self.advance(); // {
    let mut defs: Vec<(String, Expr)> = Vec::new();
    while self.peek() == &Token::Def {
      self.advance();
      let n = self.expect_ident()?;
      self.expect(&Token::Eq)?;
      let v = self.parse_expr()?;
      self.expect(&Token::Semicolon)?;
      defs.push((n, v));
    }
    let mut stmts = Vec::new();
    while self.peek() != &Token::RBrace {
      let expr = self.parse_expr()?;
      if self.peek() == &Token::Semicolon { self.advance(); stmts.push(expr); }
      else {
        self.expect(&Token::RBrace)?;
        let span = self.span();
        let mut body = Expr::Block { stmts, final_expr: Box::new(expr), span };
        for (name, value) in defs.into_iter().rev() { body = Expr::Let { name, value: Box::new(value), body: Box::new(body), span }; }
        return Ok(body);
      }
    }
    self.advance(); // }
    let span = self.span();
    let mut body = Expr::Block { stmts, final_expr: Box::new(Expr::Unit(span)), span };
    for (name, value) in defs.into_iter().rev() { body = Expr::Let { name, value: Box::new(value), body: Box::new(body), span }; }
    Ok(body)
  }

  fn parse_if(&mut self) -> Result<Expr, String> { self.advance(); let c = self.parse_expr()?; let t = self.parse_block()?; if self.peek() == &Token::Else { self.advance(); let e = if self.peek() == &Token::If { self.parse_if()? } else { self.parse_block()? }; Ok(Expr::If { cond: Box::new(c), then: Box::new(t), else_: Box::new(e), span: self.span() }) } else { Ok(Expr::If { cond: Box::new(c), then: Box::new(t), else_: Box::new(Expr::Unit(self.span())), span: self.span() }) } }
  fn parse_match(&mut self) -> Result<Expr, String> { self.advance(); let s = self.parse_expr()?; self.expect(&Token::LBrace)?; let mut arms = Vec::new(); while self.peek() != &Token::RBrace { let p = self.parse_pattern()?; self.expect(&Token::FatArrow)?; let b = self.parse_expr()?; arms.push((p, b)); if self.peek() == &Token::Comma { self.advance(); } } self.advance(); Ok(Expr::Match { scrutinee: Box::new(s), arms, span: self.span() }) }
  fn parse_fn(&mut self) -> Result<Expr, String> { self.advance(); let mut ps = Vec::new(); if self.peek() != &Token::Arrow && self.peek() == &Token::LParen { self.advance(); while self.peek() != &Token::RParen { let borrow = self.peek() == &Token::Amp; if borrow { self.advance(); } let n = self.expect_ident()?; let t = if self.peek() == &Token::Colon { self.advance(); self.parse_type()? } else { Type::Var("_".into()) }; ps.push((n, t)); if self.peek() == &Token::Comma { self.advance(); } } self.advance(); } let rt = if self.peek() == &Token::Arrow { self.advance(); Some(self.parse_type()?) } else { None }; let b = self.parse_block()?; Ok(Expr::Fn { params: ps, ret_ty: rt, body: Box::new(b), span: self.span() }) }
  fn parse_fix(&mut self) -> Result<Expr, String> { self.advance(); let n = self.expect_ident()?; let b = self.parse_block()?; Ok(Expr::Fix { name: n, body: Box::new(b), span: self.span() }) }

  fn parse_pattern(&mut self) -> Result<Pattern, String> { match self.peek() { Token::Underscore => { self.advance(); Ok(Pattern::Wildcard) } Token::Ident(name) => { let n = name.clone(); self.advance(); if self.peek() == &Token::LParen { self.advance(); let mut fs = Vec::new(); while self.peek() != &Token::RParen { fs.push(self.parse_pattern()?); if self.peek() == &Token::Comma { self.advance(); } } self.advance(); Ok(Pattern::EnumVariant(n, Some(Box::new(Pattern::Tuple(fs))))) } else { Ok(Pattern::Var(n)) } } Token::IntLit(n) => { let n = *n; self.advance(); Ok(Pattern::Lit(Expr::Int(n, self.span()))) } Token::True => { self.advance(); Ok(Pattern::Lit(Expr::Bool(true, self.span()))) } Token::False => { self.advance(); Ok(Pattern::Lit(Expr::Bool(false, self.span()))) } Token::CharLit(c) => { let c = *c; self.advance(); Ok(Pattern::Lit(Expr::Char(c, self.span()))) } Token::LParen => { self.advance(); let mut is = Vec::new(); while self.peek() != &Token::RParen { is.push(self.parse_pattern()?); if self.peek() == &Token::Comma { self.advance(); } } self.advance(); Ok(Pattern::Tuple(is)) } _ => Err(format!("expected pattern, got {:?}", self.peek())) } }
}
