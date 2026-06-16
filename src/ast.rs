// AST node types for the Dew programming language.
// All expression nodes carry Span for source-level error reporting.
// This module defines the Concrete AST — syntax sugar is preserved at this level.

use serde::{Deserialize, Serialize};

/// Source location: (byte_offset, line, column).
/// Byte offsets are 0-based; line and column are 0-based within the file.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub struct Span {
    pub start: usize,
    pub end: usize,
    pub line: usize,
    pub col: usize,
}

impl Span {
    pub const DUMMY: Span = Span { start: 0, end: 0, line: 0, col: 0 };
}
