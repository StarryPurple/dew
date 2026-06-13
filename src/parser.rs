// Lexer and recursive descent parser for the Dew language

use crate::ast::*;

/// Parses a Dew source string into a list of declarations
pub fn parse_program(source: &str) -> Result<Vec<Decl>, String> {
    let tokens = tokenize(source)?;
    let mut parser = Parser::new(tokens);
    parser.parse_decls()
}

/// Token types
#[derive(Debug, Clone, PartialEq)]
pub enum Token {
    // Keywords
    Def,
    Fn,
    Struct,
    Enum,
    Match,
    If,
    Else,
    Return,
    Fix,
    Import,
    Force,
    True,
    False,

    // Literals
    IntLit(i64),
    BoolLit(bool),
    CharLit(char),
    StringLit(String),

    // Identifiers
    Ident(String),

    // Operators
    Plus,
    Minus,
    Star,
    Slash,
    Percent,
    Lt,
    Gt,
    Le,
    Ge,
    EqEq,
    Ne,
    AndAnd,
    OrOr,
    Not,
    Arrow,   // ->
    Dot,     // .
    Amp,     // &
    Pipe,    // (used as operator identifier)

    // Delimiters
    LParen,
    RParen,
    LBrace,
    RBrace,
    LBracket,
    RBracket,
    Comma,
    Semicolon,
    Colon,
    Underscore,
}

/// Lexer: convert source text into tokens
fn tokenize(source: &str) -> Result<Vec<Token>, String> {
    // TODO: Implement full lexer
    let _ = source;
    Ok(vec![])
}

/// Recursive descent parser
struct Parser {
    tokens: Vec<Token>,
    pos: usize,
}

impl Parser {
    fn new(tokens: Vec<Token>) -> Self {
        Self { tokens, pos: 0 }
    }

    fn parse_decls(&mut self) -> Result<Vec<Decl>, String> {
        // TODO: Implement
        Ok(vec![])
    }
}
