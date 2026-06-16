// Desugar: Concrete AST → Core AST.
// Eliminates all syntax sugar before type checking.
//   - & borrow parameters → tuple returns
//   - Pipeline (->) → function calls
//   - if/else → match on Bool
//   - { ... } update syntax → place instructions

pub fn desugar(_ast: &crate::ast::Span) -> crate::ast::Span {
    // Placeholder: return dummy span
    crate::ast::Span::DUMMY
}
