// IR types — mapping from Dew types to IR type representations.
// All type variables are monomorphized before IR generation.

use serde::{Deserialize, Serialize};

/// An IR-level type. No type variables — all generics are resolved before IR gen.
#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub enum IrType {
    Int,
    Bool,
    Char,
    Unit,
    /// Named struct type, e.g., "Point"
    Struct(String),
    /// Named enum type, e.g., "Option"
    Enum(String),
    /// Function type: (param_types) -> return_type
    Fun(Vec<IrType>, Box<IrType>),
    /// Tuple type
    Tuple(Vec<IrType>),
    /// Array type with element type and size
    Array(Box<IrType>, usize),
    /// Thunk reference (pointer to thunk cell)
    ThunkRef(Box<IrType>),
}
