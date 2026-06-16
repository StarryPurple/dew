// Strictness Analysis: Typed AST → Annotated AST.
// Classifies each expression context as Strict or Lazy.
// Drives thunk insertion during IR generation.

pub fn classify(_expr: &crate::ast::Span) -> Strictness {
    Strictness::Lazy
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Strictness {
    /// Expression is demanded immediately.
    Strict,
    /// Expression may be deferred.
    Lazy,
}
