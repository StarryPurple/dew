// Parser: token stream → Concrete AST.
// Uses Pratt parsing for operator precedence.
// Two-phase block parsing: def bindings → & mutation bindings → expressions.

pub struct Parser;

impl Parser {
    pub fn new(_lexer: &crate::lexer::Lexer) -> Self {
        Parser
    }
}
