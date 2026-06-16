// Name Resolution: Core AST → Resolved AST.
// Establishes lexical scoping: what does each name refer to?
// Handles imports, detects shadowing, resolves self-references for recursion.

pub struct NameResolver;

impl NameResolver {
    pub fn new() -> Self {
        NameResolver
    }
}
