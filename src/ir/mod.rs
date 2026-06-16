// IR types — Thunk Graph IR.
// Flat, label-based, SSA-like intermediate representation.
// Two kinds of top-level definitions: fns and thunks.

pub mod types;
pub mod module;
pub mod func;
pub mod thunk;
pub mod block;
pub mod instr;
pub mod display;
pub mod verify;
