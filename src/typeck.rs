// Type Checker: Resolved AST → Typed AST.
// Hindley-Milner type inference with affine type checking and IO effect inference.
// Builds the type table consumed by IR generation and backends.

pub struct TypeChecker;

impl TypeChecker {
    pub fn new() -> Self {
        TypeChecker
    }
}
