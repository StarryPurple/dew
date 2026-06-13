// Lexer and recursive descent parser for Dew

use crate::ast::*;

// ── Token ──────────────────────────────────────────────────

#[derive(Debug, Clone, PartialEq)]
pub enum Token {
  // Keywords
  Def, Fn, Struct, Enum, Match, If, Else, Return, Fix, Import, Force, True, False, Not,
  // Literals
  IntLit(i64), BoolLit(bool), CharLit(char), StringLit(String),
  // Identifiers
  Ident(String),
  // Operators
  Plus, Minus, Star, Slash, Percent,
  Lt, Gt, Le, Ge, EqEq, Ne,
  AndAnd, OrOr,
  Arrow, Dot, Amp, Bang,
  // Delimiters
  LParen, RParen, LBrace, RBrace, LBracket, RBracket,
  Comma, Semicolon, Colon, Underscore,
  Eq,
  // End of file
  Eof,
}

// ── Lexer ──────────────────────────────────────────────────

fn tokenize(source: &str) -> Result<Vec<Token>, String> {
  let mut tokens = Vec::new();
  let chars: Vec<char> = source.chars().collect();
  let mut i = 0;

  while i < chars.len() {
    let c = chars[i];

    // Whitespace
    if c.is_whitespace() { i += 1; continue; }

    // Line comment
    if c == '/' && i + 1 < chars.len() && chars[i + 1] == '/' {
      i += 2;
      while i < chars.len() && chars[i] != '\n' { i += 1; }
      continue;
    }

    // Block comment
    if c == '/' && i + 1 < chars.len() && chars[i + 1] == '*' {
      i += 2;
      while i + 1 < chars.len() && !(chars[i] == '*' && chars[i + 1] == '/') { i += 1; }
      i += 2;
      continue;
    }

    // String literal
    if c == '"' {
      i += 1;
      let mut s = String::new();
      while i < chars.len() && chars[i] != '"' {
        if chars[i] == '\\' && i + 1 < chars.len() {
          i += 1;
          match chars[i] {
            'n' => s.push('\n'), 't' => s.push('\t'),
            '\\' => s.push('\\'), '"' => s.push('"'),
            other => s.push(other),
          }
        } else { s.push(chars[i]); }
        i += 1;
      }
      if i >= chars.len() { return Err("unterminated string".into()); }
      i += 1;
      tokens.push(Token::StringLit(s));
      continue;
    }

    // Char literal
    if c == '\'' {
      i += 1;
      let ch = if i < chars.len() && chars[i] == '\\' && i + 1 < chars.len() {
        i += 1;
        match chars[i] { 'n' => '\n', 't' => '\t', '\\' => '\\', '\'' => '\'', o => o }
      } else if i < chars.len() { chars[i] } else { return Err("unterminated char".into()) };
      i += 1;
      if i >= chars.len() || chars[i] != '\'' { return Err("expected closing '".into()); }
      i += 1;
      tokens.push(Token::CharLit(ch));
      continue;
    }

    // Number
    if c.is_ascii_digit() {
      let mut n: i64 = 0;
      while i < chars.len() && chars[i].is_ascii_digit() {
        n = n * 10 + (chars[i] as i64 - '0' as i64);
        i += 1;
      }
      tokens.push(Token::IntLit(n));
      continue;
    }

    // Arrow
    if c == '-' && i + 1 < chars.len() && chars[i + 1] == '>' {
      tokens.push(Token::Arrow); i += 2; continue;
    }

    // Multi-char operators
    if c == '<' && i + 1 < chars.len() && chars[i + 1] == '=' { tokens.push(Token::Le); i += 2; continue; }
    if c == '>' && i + 1 < chars.len() && chars[i + 1] == '=' { tokens.push(Token::Ge); i += 2; continue; }
    if c == '=' && i + 1 < chars.len() && chars[i + 1] == '=' { tokens.push(Token::EqEq); i += 2; continue; }
    if c == '!' && i + 1 < chars.len() && chars[i + 1] == '=' { tokens.push(Token::Ne); i += 2; continue; }
    if c == '&' && i + 1 < chars.len() && chars[i + 1] == '&' { tokens.push(Token::AndAnd); i += 2; continue; }
    if c == '|' && i + 1 < chars.len() && chars[i + 1] == '|' { tokens.push(Token::OrOr); i += 2; continue; }

    // Single-char tokens
    let token = match c {
      '+' => Token::Plus,
      '-' => Token::Minus,
      '*' => Token::Star,
      '/' => Token::Slash,
      '%' => Token::Percent,
      '<' => Token::Lt,
      '>' => Token::Gt,
      '!' => Token::Bang,
      '&' => Token::Amp,
      '.' => Token::Dot,
      ':' => Token::Colon,
      ';' => Token::Semicolon,
      ',' => Token::Comma,
      '(' => Token::LParen,
      ')' => Token::RParen,
      '{' => Token::LBrace,
      '}' => Token::RBrace,
      '[' => Token::LBracket,
      ']' => Token::RBracket,
      '_' => Token::Underscore,
      '=' => Token::Eq,
      ch if ch.is_alphabetic() || ch == '_' => {
        let start = i;
        while i < chars.len() && (chars[i].is_alphanumeric() || chars[i] == '_') { i += 1; }
        let word: String = chars[start..i].iter().collect();
        i -= 1;
        match word.as_str() {
          "def" => Token::Def, "fn" => Token::Fn, "struct" => Token::Struct,
          "enum" => Token::Enum, "match" => Token::Match, "if" => Token::If,
          "else" => Token::Else, "return" => Token::Return, "fix" => Token::Fix,
          "import" => Token::Import, "force" => Token::Force,
          "true" => Token::True, "false" => Token::False, "not" => Token::Not,
          _ => Token::Ident(word),
        }
      }
      _ => return Err(format!("unexpected character: '{c}'")),
    };
    tokens.push(token);
    i += 1;
  }

  tokens.push(Token::Eof);
  Ok(tokens)
}

// ── Parser ─────────────────────────────────────────────────

pub fn parse_program(source: &str) -> Result<Vec<Decl>, String> {
  let tokens = tokenize(source)?;
  let mut p = Parser { tokens, pos: 0 };
  p.parse_decls()
}

struct Parser {
  tokens: Vec<Token>,
  pos: usize,
}

impl Parser {
  fn peek(&self) -> &Token { &self.tokens[self.pos] }

  fn advance(&mut self) -> &Token { let t = &self.tokens[self.pos]; self.pos += 1; t }

  fn check(&self, expected: &Token) -> bool {
    self.pos < self.tokens.len() && std::mem::discriminant(&self.tokens[self.pos]) == std::mem::discriminant(expected)
  }

  fn expect(&mut self, expected: &Token) -> Result<(), String> {
    if self.check(expected) { self.advance(); Ok(()) }
    else { Err(format!("expected {:?}, got {:?}", expected, self.peek())) }
  }

  fn expect_ident(&mut self) -> Result<String, String> {
    match self.advance() {
      Token::Ident(s) => Ok(s.clone()),
      t => Err(format!("expected identifier, got {t:?}")),
    }
  }

  fn span(&self) -> Span { Span::new(0, 0) }

  // ── Declarations ────────────────────────────────────────

  fn parse_decls(&mut self) -> Result<Vec<Decl>, String> {
    let mut decls = Vec::new();
    while self.peek() != &Token::Eof {
      decls.push(self.parse_decl()?);
    }
    Ok(decls)
  }

  fn parse_decl(&mut self) -> Result<Decl, String> {
    match self.peek() {
      Token::Def => self.parse_def(),
      Token::Struct => self.parse_struct_decl(),
      Token::Enum => self.parse_enum_decl(),
      Token::Import => self.parse_import(),
      _ => Err(format!("expected declaration, got {:?}", self.peek())),
    }
  }

  fn parse_def(&mut self) -> Result<Decl, String> {
    self.advance(); // def
    let name = self.expect_ident()?;
    self.expect(&Token::Eq)?; // =
    let value = self.parse_expr()?;
    let _ = self.check(&Token::Semicolon).then(|| self.advance());
    Ok(Decl::Def { name, type_ann: None, value })
  }

  fn parse_struct_decl(&mut self) -> Result<Decl, String> {
    self.advance(); // struct
    let name = self.expect_ident()?;
    self.expect(&Token::LBrace)?;
    let mut fields = Vec::new();
    while self.peek() != &Token::RBrace {
      let fname = self.expect_ident()?;
      self.expect(&Token::Colon)?;
      let fty = self.parse_type()?;
      fields.push((fname, fty));
      if self.peek() == &Token::Comma { self.advance(); }
    }
    self.advance(); // }
    Ok(Decl::Struct { name, fields })
  }

  fn parse_enum_decl(&mut self) -> Result<Decl, String> {
    self.advance(); // enum
    let name = self.expect_ident()?;
    self.expect(&Token::LBrace)?;
    let mut variants = Vec::new();
    while self.peek() != &Token::RBrace {
      let vname = self.expect_ident()?;
      let payload = if self.peek() == &Token::LParen {
        self.advance();
        let ty = self.parse_type()?;
        self.expect(&Token::RParen)?;
        Some(ty)
      } else { None };
      variants.push(Variant { name: vname, payload });
      if self.peek() == &Token::Comma { self.advance(); }
    }
    self.advance(); // }
    Ok(Decl::Enum { name, variants })
  }

  fn parse_import(&mut self) -> Result<Decl, String> {
    self.advance(); // import
    let path = match self.advance() {
      Token::StringLit(s) => s.clone(),
      t => return Err(format!("expected string, got {t:?}")),
    };
    let _ = self.check(&Token::Semicolon).then(|| self.advance());
    Ok(Decl::Import { path })
  }

  // ── Types ───────────────────────────────────────────────

  fn parse_type(&mut self) -> Result<Type, String> {
    match self.peek() {
      Token::Ident(_) => {
        let name = self.expect_ident()?;
        if self.peek() == &Token::LParen {
          self.advance();
          let mut args = Vec::new();
          while self.peek() != &Token::RParen {
            args.push(self.parse_type()?);
            if self.peek() == &Token::Comma { self.advance(); }
          }
          self.advance(); // )
          Ok(Type::App(name, args))
        } else {
          match name.as_str() {
            "Int" => Ok(Type::Prim(PrimType::Int)),
            "Bool" => Ok(Type::Prim(PrimType::Bool)),
            "Char" => Ok(Type::Prim(PrimType::Char)),
            "Unit" => Ok(Type::Prim(PrimType::Unit)),
            _ => Ok(Type::Named(name)),
          }
        }
      }
      Token::LParen => {
        self.advance();
        let mut types = Vec::new();
        while self.peek() != &Token::RParen {
          types.push(self.parse_type()?);
          if self.peek() == &Token::Comma { self.advance(); }
        }
        self.advance(); // )
        Ok(Type::Tuple(types))
      }
      _ => Err(format!("expected type, got {:?}", self.peek())),
    }
  }

  // ── Expressions ─────────────────────────────────────────

  fn parse_expr(&mut self) -> Result<Expr, String> { self.parse_pipe() }

  fn parse_pipe(&mut self) -> Result<Expr, String> {
    let mut left = self.parse_logic()?;
    while self.peek() == &Token::Arrow {
      self.advance();
      let right = self.parse_logic()?;
      left = Expr::Pipe { left: Box::new(left), right: Box::new(right), span: self.span() };
    }
    Ok(left)
  }

  fn parse_logic(&mut self) -> Result<Expr, String> {
    let mut left = self.parse_comp()?;
    loop {
      let op = match self.peek() {
        Token::AndAnd => BinOpKind::And,
        Token::OrOr => BinOpKind::Or,
        _ => break,
      };
      self.advance();
      let right = self.parse_comp()?;
      left = Expr::BinOp { op, left: Box::new(left), right: Box::new(right), span: self.span() };
    }
    Ok(left)
  }

  fn parse_comp(&mut self) -> Result<Expr, String> {
    let mut left = self.parse_add()?;
    loop {
      let op = match self.peek() {
        Token::Lt => BinOpKind::Lt, Token::Gt => BinOpKind::Gt,
        Token::Le => BinOpKind::Le, Token::Ge => BinOpKind::Ge,
        Token::EqEq => BinOpKind::Eq, Token::Ne => BinOpKind::Ne,
        _ => break,
      };
      self.advance();
      let right = self.parse_add()?;
      left = Expr::BinOp { op, left: Box::new(left), right: Box::new(right), span: self.span() };
    }
    Ok(left)
  }

  fn parse_add(&mut self) -> Result<Expr, String> {
    let mut left = self.parse_mul()?;
    loop {
      let op = match self.peek() {
        Token::Plus => BinOpKind::Add, Token::Minus => BinOpKind::Sub, _ => break,
      };
      self.advance();
      let right = self.parse_mul()?;
      left = Expr::BinOp { op, left: Box::new(left), right: Box::new(right), span: self.span() };
    }
    Ok(left)
  }

  fn parse_mul(&mut self) -> Result<Expr, String> {
    let mut left = self.parse_unary()?;
    loop {
      let op = match self.peek() {
        Token::Star => BinOpKind::Mul, Token::Slash => BinOpKind::Div,
        Token::Percent => BinOpKind::Rem, _ => break,
      };
      self.advance();
      let right = self.parse_unary()?;
      left = Expr::BinOp { op, left: Box::new(left), right: Box::new(right), span: self.span() };
    }
    Ok(left)
  }

  fn parse_unary(&mut self) -> Result<Expr, String> {
    match self.peek() {
      Token::Not => {
        self.advance();
        let expr = self.parse_unary()?;
        Ok(Expr::App {
          func: Box::new(Expr::Var("not".into(), self.span())),
          args: vec![expr],
          span: self.span(),
        })
      }
      Token::Bang => {
        self.advance();
        let expr = self.parse_unary()?;
        Ok(Expr::Force { expr: Box::new(expr), span: self.span() })
      }
      Token::Force => {
        self.advance();
        self.expect(&Token::LParen)?;
        let expr = self.parse_expr()?;
        self.expect(&Token::RParen)?;
        Ok(Expr::Force { expr: Box::new(expr), span: self.span() })
      }
      _ => self.parse_primary(),
    }
  }

  fn is_at_expr_start(&self) -> bool {
    matches!(self.peek(),
      Token::IntLit(_) | Token::True | Token::False | Token::CharLit(_)
      | Token::StringLit(_) | Token::Ident(_) | Token::LBrace | Token::LParen
      | Token::LBracket | Token::If | Token::Match | Token::Fn | Token::Fix
      | Token::Not | Token::Bang | Token::Force | Token::Amp
    )
  }

  fn parse_primary(&mut self) -> Result<Expr, String> {
    let span = self.span();
    match self.peek().clone() {
      Token::IntLit(n) => { self.advance(); Ok(Expr::Int(n, span)) }
      Token::True => { self.advance(); Ok(Expr::Bool(true, span)) }
      Token::False => { self.advance(); Ok(Expr::Bool(false, span)) }
      Token::CharLit(c) => { self.advance(); Ok(Expr::Char(c, span)) }
      Token::StringLit(s) => {
        self.advance();
        let chars: Vec<Expr> = s.chars().map(|c| Expr::Char(c, span)).collect();
        Ok(Expr::ArrayLit { elements: chars, span })
      }
      Token::Ident(name) => { self.advance(); self.parse_ident_tail(name, span) }
      Token::LBrace => self.parse_block(),
      Token::If => self.parse_if(),
      Token::Match => self.parse_match(),
      Token::Fn => self.parse_fn(),
      Token::Fix => self.parse_fix(),
      Token::LParen => {
        self.advance();
        let first = self.parse_expr()?;
        if self.peek() == &Token::Comma {
          let mut elements = vec![first];
          while self.peek() == &Token::Comma {
            self.advance();
            elements.push(self.parse_expr()?);
          }
          self.expect(&Token::RParen)?;
          Ok(Expr::TupleLit { elements, span })
        } else {
          self.expect(&Token::RParen)?;
          Ok(first)
        }
      }
      Token::LBracket => {
        self.advance();
        let mut elements = Vec::new();
        while self.peek() != &Token::RBracket {
          elements.push(self.parse_expr()?);
          if self.peek() == &Token::Comma { self.advance(); }
        }
        self.advance(); // ]
        Ok(Expr::ArrayLit { elements, span })
      }
      Token::Amp => {
        self.advance();
        let name = self.expect_ident()?;
        if self.peek() == &Token::Eq {
          self.advance();
          let value = self.parse_expr()?;
          Ok(Expr::BorrowBind { name, value: Box::new(value), span })
        } else {
          Ok(Expr::Borrow { name, span })
        }
      }
      _ => Err(format!("expected expression, got {:?}", self.peek())),
    }
  }

  fn parse_ident_tail(&mut self, name: String, span: Span) -> Result<Expr, String> {
    // Struct/enum construction: Name(args...)
    if self.peek() == &Token::LParen {
      self.advance();
      let mut fields = Vec::new();
      while self.peek() != &Token::RParen {
        fields.push(self.parse_expr()?);
        if self.peek() == &Token::Comma { self.advance(); }
      }
      self.advance(); // )
      return Ok(Expr::StructCons { name, fields, span });
    }

    // Dot access: expr.field
    if self.peek() == &Token::Dot {
      self.advance();
      let field = self.expect_ident()?;
      let expr = Expr::Var(name, span);
      return Ok(Expr::FieldAccess { expr: Box::new(expr), field, span });
    }

    // Struct update: expr { field = val, ... }
    if self.peek() == &Token::LBrace {
      self.advance();
      let mut updates = Vec::new();
      while self.peek() != &Token::RBrace {
        let fname = self.expect_ident()?;
        self.expect(&Token::Eq)?;
        let val = self.parse_expr()?;
        updates.push((fname, val));
        if self.peek() == &Token::Comma { self.advance(); }
      }
      self.advance(); // }
      let expr = Expr::Var(name, span);
      return Ok(Expr::StructUpdate { expr: Box::new(expr), updates, span });
    }

    // Function application (no parens): f arg
    let mut expr = Expr::Var(name, span);
    loop {
      if self.is_at_expr_start() {
        let arg = self.parse_primary()?;
        expr = Expr::App { func: Box::new(expr), args: vec![arg], span: self.span() };
      } else { break; }
    }
    Ok(expr)
  }

  // ── Blocks & control flow ──────────────────────────────

  fn parse_block(&mut self) -> Result<Expr, String> {
    self.advance(); // {
    let mut stmts = Vec::new();
    while self.peek() != &Token::RBrace {
      let expr = self.parse_expr()?;
      if self.peek() == &Token::Semicolon {
        self.advance();
        stmts.push(expr);
      } else {
        // Last expression without semicolon — tail return
        self.expect(&Token::RBrace)?;
        let span = self.span();
        return Ok(Expr::Block { stmts, final_expr: Box::new(expr), span });
      }
    }
    self.advance(); // }
    let span = self.span();
    Ok(Expr::Block { stmts, final_expr: Box::new(Expr::Unit(span)), span })
  }

  fn parse_if(&mut self) -> Result<Expr, String> {
    self.advance(); // if
    let cond = self.parse_expr()?;
    let then = self.parse_block()?;
    if self.peek() == &Token::Else {
      self.advance();
      let else_ = if self.peek() == &Token::If { self.parse_if()? }
                   else { self.parse_block()? };
      Ok(Expr::If { cond: Box::new(cond), then: Box::new(then),
                    else_: Box::new(else_), span: self.span() })
    } else {
      Ok(Expr::If { cond: Box::new(cond), then: Box::new(then),
                    else_: Box::new(Expr::Unit(self.span())), span: self.span() })
    }
  }

  fn parse_match(&mut self) -> Result<Expr, String> {
    self.advance(); // match
    let scrutinee = self.parse_expr()?;
    self.expect(&Token::LBrace)?;
    let mut arms = Vec::new();
    while self.peek() != &Token::RBrace {
      let pattern = self.parse_pattern()?;
      self.expect(&Token::Arrow)?; // =>
      let body = self.parse_expr()?;
      arms.push((pattern, body));
      if self.peek() == &Token::Comma { self.advance(); }
    }
    self.advance(); // }
    Ok(Expr::Match { scrutinee: Box::new(scrutinee), arms, span: self.span() })
  }

  fn parse_fn(&mut self) -> Result<Expr, String> {
    self.advance(); // fn
    let mut params = Vec::new();
    // fn -> T { ... }  (no-param sugar)
    if self.peek() == &Token::Arrow {
      // no params
    } else if self.peek() == &Token::LParen {
      self.advance();
      while self.peek() != &Token::RParen {
        let _borrow = self.peek() == &Token::Amp;
        if _borrow { self.advance(); }
        let name = self.expect_ident()?;
        let ty = if self.peek() == &Token::Colon {
          self.advance();
          self.parse_type()?
        } else { Type::Var("_".into()) };
        params.push((name, ty));
        if self.peek() == &Token::Comma { self.advance(); }
      }
      self.advance(); // )
    }
    let ret_ty = if self.peek() == &Token::Arrow {
      self.advance();
      Some(self.parse_type()?)
    } else { None };
    let body = self.parse_block()?;
    Ok(Expr::Fn { params, ret_ty, body: Box::new(body), span: self.span() })
  }

  fn parse_fix(&mut self) -> Result<Expr, String> {
    self.advance(); // fix
    let name = self.expect_ident()?;
    let body = self.parse_block()?;
    Ok(Expr::Fix { name, body: Box::new(body), span: self.span() })
  }

  // ── Patterns ────────────────────────────────────────────

  fn parse_pattern(&mut self) -> Result<Pattern, String> {
    match self.peek() {
      Token::Underscore => { self.advance(); Ok(Pattern::Wildcard) }
      Token::Ident(name) => {
        let name = name.clone(); self.advance();
        if self.peek() == &Token::LParen {
          self.advance();
          let mut fields = Vec::new();
          while self.peek() != &Token::RParen {
            fields.push(self.parse_pattern()?);
            if self.peek() == &Token::Comma { self.advance(); }
          }
          self.advance(); // )
          Ok(Pattern::EnumVariant(name, Some(Box::new(Pattern::Tuple(fields)))))
        } else { Ok(Pattern::Var(name)) }
      }
      Token::IntLit(n) => { let n = *n; self.advance(); Ok(Pattern::Lit(Expr::Int(n, self.span()))) }
      Token::True => { self.advance(); Ok(Pattern::Lit(Expr::Bool(true, self.span()))) }
      Token::False => { self.advance(); Ok(Pattern::Lit(Expr::Bool(false, self.span()))) }
      Token::CharLit(c) => { let c = *c; self.advance(); Ok(Pattern::Lit(Expr::Char(c, self.span()))) }
      Token::LParen => {
        self.advance();
        let mut items = Vec::new();
        while self.peek() != &Token::RParen { items.push(self.parse_pattern()?); if self.peek() == &Token::Comma { self.advance(); } }
        self.advance(); // )
        Ok(Pattern::Tuple(items))
      }
      _ => Err(format!("expected pattern, got {:?}", self.peek())),
    }
  }
}
