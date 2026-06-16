// Lexer: character stream → token stream.
//
// Handles keywords, integer/char/string literals, identifiers,
// operators, delimiters, and line comments.

use crate::ast::Span;

#[derive(Debug, Clone, PartialEq)]
pub enum TokenKind {
    // Keywords
    Def, Fn, Struct, Enum, Match, If, Else, Fix, Rec,
    Import, Unit, Affine, TypeMatch, TypeOf, Not,

    // Literals
    IntLit(i64),
    BoolLit(bool),
    CharLit(char),
    StringLit(String),
    Ident(String),

    // Operators
    Plus, Minus, Star, Slash, Percent,
    Lt, Gt, Le, Ge, EqEq, Ne,
    AndAnd, OrOr, Bang,
    Arrow, Dot,

    // Borrow / address-of
    Amp,

    // Delimiters
    Eq, Semicolon, Colon, Comma, Underscore,
    LParen, RParen, LBrace, RBrace,
    LBracket, RBracket,
    Hash,

    Eof,
}

#[derive(Debug, Clone, PartialEq)]
pub struct Token {
    pub kind: TokenKind,
    pub span: Span,
}

pub struct Lexer {
    source: Vec<char>,
    pos: usize,
    line: usize,
    col: usize,
}

impl Lexer {
    pub fn new(source: &str) -> Self {
        Lexer {
            source: source.chars().collect(),
            pos: 0,
            line: 0,
            col: 0,
        }
    }

    pub fn lex_all(&mut self) -> Vec<Token> {
        let mut tokens = Vec::new();
        loop {
            let tok = self.next_token();
            if tok.kind == TokenKind::Eof {
                break;
            }
            tokens.push(tok);
        }
        tokens
    }

    fn next_token(&mut self) -> Token {
        self.skip_whitespace_and_comments();
        if self.pos >= self.source.len() {
            return self.make_token(TokenKind::Eof);
        }

        let start = self.pos;
        let ch = self.source[self.pos];

        let kind = match ch {
            '+' => { self.advance(); TokenKind::Plus }
            '*' => { self.advance(); TokenKind::Star }
            '%' => { self.advance(); TokenKind::Percent }
            ';' => { self.advance(); TokenKind::Semicolon }
            ':' => { self.advance(); TokenKind::Colon }
            ',' => { self.advance(); TokenKind::Comma }
            '(' => { self.advance(); TokenKind::LParen }
            ')' => { self.advance(); TokenKind::RParen }
            '{' => { self.advance(); TokenKind::LBrace }
            '}' => { self.advance(); TokenKind::RBrace }
            '[' => { self.advance(); TokenKind::LBracket }
            ']' => { self.advance(); TokenKind::RBracket }
            '#' => { self.advance(); TokenKind::Hash }

            '-' => {
                self.advance();
                if self.peek() == Some('>') { self.advance(); TokenKind::Arrow }
                else { TokenKind::Minus }
            }
            '/' => { self.advance(); TokenKind::Slash }
            '<' => {
                self.advance();
                if self.peek() == Some('=') { self.advance(); TokenKind::Le }
                else { TokenKind::Lt }
            }
            '>' => {
                self.advance();
                if self.peek() == Some('=') { self.advance(); TokenKind::Ge }
                else { TokenKind::Gt }
            }
            '=' => {
                self.advance();
                if self.peek() == Some('=') { self.advance(); TokenKind::EqEq }
                else { TokenKind::Eq }
            }
            '!' => {
                self.advance();
                if self.peek() == Some('=') { self.advance(); TokenKind::Ne }
                else { TokenKind::Bang }
            }
            '&' => {
                self.advance();
                if self.peek() == Some('&') { self.advance(); TokenKind::AndAnd }
                else { TokenKind::Amp }
            }
            '|' => {
                self.advance();
                if self.peek() == Some('|') { self.advance(); TokenKind::OrOr }
                else { TokenKind::Eof } // single | is invalid
            }
            '.' => { self.advance(); TokenKind::Dot }
            '\'' => self.lex_char(),
            '"' => self.lex_string(),
            '0'..='9' => self.lex_int(),
            'a'..='z' | 'A'..='Z' | '_' => self.lex_ident_or_keyword(),
            _ => { self.advance(); TokenKind::Eof }
        };

        Token { kind, span: Span { start, end: self.pos, line: self.line, col: start } }
    }

    fn skip_whitespace_and_comments(&mut self) {
        loop {
            while self.pos < self.source.len() && self.source[self.pos].is_whitespace() {
                if self.source[self.pos] == '\n' { self.line += 1; self.col = 0; }
                else { self.col += 1; }
                self.pos += 1;
            }
            if self.pos + 1 < self.source.len()
                && self.source[self.pos] == '/'
                && self.source[self.pos + 1] == '/'
            {
                while self.pos < self.source.len() && self.source[self.pos] != '\n' {
                    self.pos += 1;
                    self.col += 1;
                }
                continue;
            }
            break;
        }
    }

    fn lex_char(&mut self) -> TokenKind {
        self.advance(); // opening '
        if self.pos >= self.source.len() { return TokenKind::Eof; }
        let ch = if self.source[self.pos] == '\\' {
            self.advance();
            if self.pos >= self.source.len() { return TokenKind::Eof; }
            let esc = match self.source[self.pos] {
                'n' => '\n', 't' => '\t', 'r' => '\r',
                '\\' => '\\', '\'' => '\'', '0' => '\0',
                _ => '\0',
            };
            self.advance();
            esc
        } else {
            let c = self.source[self.pos];
            self.advance();
            c
        };
        if self.peek() == Some('\'') { self.advance(); }
        TokenKind::CharLit(ch)
    }

    fn lex_string(&mut self) -> TokenKind {
        self.advance(); // opening "
        let mut s = String::new();
        while self.pos < self.source.len() && self.source[self.pos] != '"' {
            if self.source[self.pos] == '\\' {
                self.advance();
                if self.pos >= self.source.len() { break; }
                match self.source[self.pos] {
                    'n' => s.push('\n'), 't' => s.push('\t'),
                    'r' => s.push('\r'), '\\' => s.push('\\'),
                    '"' => s.push('"'), '0' => s.push('\0'),
                    _ => {}
                }
                self.advance();
            } else {
                s.push(self.source[self.pos]);
                self.col += 1;
                self.pos += 1;
            }
        }
        if self.peek() == Some('"') { self.advance(); }
        TokenKind::StringLit(s)
    }

    fn lex_int(&mut self) -> TokenKind {
        let mut v: i64 = 0;
        while self.pos < self.source.len() && self.source[self.pos].is_ascii_digit() {
            v = v.saturating_mul(10).saturating_add((self.source[self.pos] as u8 - b'0') as i64);
            self.col += 1;
            self.pos += 1;
        }
        TokenKind::IntLit(v)
    }

    fn lex_ident_or_keyword(&mut self) -> TokenKind {
        let mut name = String::new();
        while self.pos < self.source.len()
            && (self.source[self.pos].is_alphanumeric() || self.source[self.pos] == '_')
        {
            name.push(self.source[self.pos]);
            self.col += 1;
            self.pos += 1;
        }
        match name.as_str() {
            "def" => TokenKind::Def, "fn" => TokenKind::Fn,
            "struct" => TokenKind::Struct, "enum" => TokenKind::Enum,
            "match" => TokenKind::Match, "if" => TokenKind::If,
            "else" => TokenKind::Else, "fix" => TokenKind::Fix,
            "rec" => TokenKind::Rec, "import" => TokenKind::Import,
            "true" => TokenKind::BoolLit(true), "false" => TokenKind::BoolLit(false),
            "Unit" => TokenKind::Unit, "affine" => TokenKind::Affine,
            "type_match" => TokenKind::TypeMatch, "typeof" => TokenKind::TypeOf,
            "not" => TokenKind::Not, "_" => TokenKind::Underscore,
            _ => TokenKind::Ident(name),
        }
    }

    fn peek(&self) -> Option<char> {
        if self.pos < self.source.len() { Some(self.source[self.pos]) } else { None }
    }

    fn advance(&mut self) {
        if self.pos < self.source.len() { self.col += 1; self.pos += 1; }
    }

    fn make_token(&self, kind: TokenKind) -> Token {
        Token { kind, span: Span { start: self.pos, end: self.pos, line: self.line, col: self.col } }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn lex(src: &str) -> Vec<TokenKind> {
        let mut l = Lexer::new(src);
        l.lex_all().into_iter().map(|t| t.kind).collect()
    }

    #[test] fn empty() { assert_eq!(lex(""), vec![]); }
    #[test] fn int_lit() { assert_eq!(lex("42"), vec![TokenKind::IntLit(42)]); }
    #[test] fn neg_int() { assert_eq!(lex("-42"), vec![TokenKind::Minus, TokenKind::IntLit(42)]); }
    #[test] fn bool_lit() {
        assert_eq!(lex("true"), vec![TokenKind::BoolLit(true)]);
        assert_eq!(lex("false"), vec![TokenKind::BoolLit(false)]);
    }
    #[test] fn char_lit() {
        assert_eq!(lex("'a'"), vec![TokenKind::CharLit('a')]);
        assert_eq!(lex("'\\n'"), vec![TokenKind::CharLit('\n')]);
    }
    #[test] fn string_lit() {
        assert_eq!(lex("\"hello\""), vec![TokenKind::StringLit("hello".into())]);
    }
    #[test] fn keywords() {
        assert_eq!(lex("def"), vec![TokenKind::Def]);
        assert_eq!(lex("fn"), vec![TokenKind::Fn]);
        assert_eq!(lex("struct"), vec![TokenKind::Struct]);
        assert_eq!(lex("enum"), vec![TokenKind::Enum]);
        assert_eq!(lex("if"), vec![TokenKind::If]);
        assert_eq!(lex("else"), vec![TokenKind::Else]);
        assert_eq!(lex("fix"), vec![TokenKind::Fix]);
        assert_eq!(lex("import"), vec![TokenKind::Import]);
        assert_eq!(lex("Unit"), vec![TokenKind::Unit]);
        assert_eq!(lex("affine"), vec![TokenKind::Affine]);
        assert_eq!(lex("not"), vec![TokenKind::Not]);
    }
    #[test] fn ident() {
        assert_eq!(lex("hello_world"), vec![TokenKind::Ident("hello_world".into())]);
    }
    #[test] fn operators() {
        assert_eq!(lex("+"), vec![TokenKind::Plus]);
        assert_eq!(lex("-"), vec![TokenKind::Minus]);
        assert_eq!(lex("*"), vec![TokenKind::Star]);
        assert_eq!(lex("/"), vec![TokenKind::Slash]);
        assert_eq!(lex("%"), vec![TokenKind::Percent]);
    }
    #[test] fn comparisons() {
        assert_eq!(lex("<="), vec![TokenKind::Le]);
        assert_eq!(lex(">="), vec![TokenKind::Ge]);
        assert_eq!(lex("=="), vec![TokenKind::EqEq]);
        assert_eq!(lex("!="), vec![TokenKind::Ne]);
    }
    #[test] fn logicals() {
        assert_eq!(lex("&&"), vec![TokenKind::AndAnd]);
        assert_eq!(lex("||"), vec![TokenKind::OrOr]);
        assert_eq!(lex("!"), vec![TokenKind::Bang]);
    }
    #[test] fn arrow() { assert_eq!(lex("->"), vec![TokenKind::Arrow]); }
    #[test] fn delimiters() {
        assert_eq!(lex(";"), vec![TokenKind::Semicolon]);
        assert_eq!(lex(":"), vec![TokenKind::Colon]);
        assert_eq!(lex(","), vec![TokenKind::Comma]);
        assert_eq!(lex("("), vec![TokenKind::LParen]);
        assert_eq!(lex(")"), vec![TokenKind::RParen]);
        assert_eq!(lex("{"), vec![TokenKind::LBrace]);
        assert_eq!(lex("}"), vec![TokenKind::RBrace]);
        assert_eq!(lex("["), vec![TokenKind::LBracket]);
        assert_eq!(lex("]"), vec![TokenKind::RBracket]);
        assert_eq!(lex("&"), vec![TokenKind::Amp]);
    }
    #[test] fn comment() {
        assert_eq!(lex("// hi\n42"), vec![TokenKind::IntLit(42)]);
    }
    #[test] fn def_bind() {
        assert_eq!(lex("def x = 42"), vec![
            TokenKind::Def, TokenKind::Ident("x".into()), TokenKind::Eq, TokenKind::IntLit(42),
        ]);
    }
    #[test] fn fn_def() {
        let t = lex("fn(x: Int, y: Int) -> Int { x + y }");
        assert_eq!(t, vec![
            TokenKind::Fn, TokenKind::LParen, TokenKind::Ident("x".into()),
            TokenKind::Colon, TokenKind::Ident("Int".into()), TokenKind::Comma,
            TokenKind::Ident("y".into()), TokenKind::Colon, TokenKind::Ident("Int".into()),
            TokenKind::RParen, TokenKind::Arrow, TokenKind::Ident("Int".into()),
            TokenKind::LBrace, TokenKind::Ident("x".into()), TokenKind::Plus,
            TokenKind::Ident("y".into()), TokenKind::RBrace,
        ]);
    }
    #[test] fn pipeline() {
        assert_eq!(lex("2026 -> stdout"), vec![
            TokenKind::IntLit(2026), TokenKind::Arrow, TokenKind::Ident("stdout".into()),
        ]);
    }
    #[test] fn struct_decl() {
        assert_eq!(lex("struct Point { x: Int, y: Int }"), vec![
            TokenKind::Struct, TokenKind::Ident("Point".into()), TokenKind::LBrace,
            TokenKind::Ident("x".into()), TokenKind::Colon, TokenKind::Ident("Int".into()),
            TokenKind::Comma, TokenKind::Ident("y".into()), TokenKind::Colon,
            TokenKind::Ident("Int".into()), TokenKind::RBrace,
        ]);
    }
    #[test] fn enum_decl() {
        assert_eq!(lex("enum Option { Some(Int), None }"), vec![
            TokenKind::Enum, TokenKind::Ident("Option".into()), TokenKind::LBrace,
            TokenKind::Ident("Some".into()), TokenKind::LParen, TokenKind::Ident("Int".into()),
            TokenKind::RParen, TokenKind::Comma, TokenKind::Ident("None".into()),
            TokenKind::RBrace,
        ]);
    }
    #[test] fn array_lit() {
        assert_eq!(lex("[1, 2, 3]"), vec![
            TokenKind::LBracket, TokenKind::IntLit(1), TokenKind::Comma,
            TokenKind::IntLit(2), TokenKind::Comma, TokenKind::IntLit(3),
            TokenKind::RBracket,
        ]);
    }
    #[test] fn fix_expr() {
        assert_eq!(lex("fix loop { fn(x: Int) -> Int { loop(x + 2) } }"), vec![
            TokenKind::Fix, TokenKind::Ident("loop".into()), TokenKind::LBrace,
            TokenKind::Fn, TokenKind::LParen, TokenKind::Ident("x".into()),
            TokenKind::Colon, TokenKind::Ident("Int".into()), TokenKind::RParen,
            TokenKind::Arrow, TokenKind::Ident("Int".into()), TokenKind::LBrace,
            TokenKind::Ident("loop".into()), TokenKind::LParen, TokenKind::Ident("x".into()),
            TokenKind::Plus, TokenKind::IntLit(2), TokenKind::RParen,
            TokenKind::RBrace, TokenKind::RBrace,
        ]);
    }
}
