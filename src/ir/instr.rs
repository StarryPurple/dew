use super::types::IrType;
use serde::{Deserialize, Serialize};

pub type Reg = usize;
pub type Label = String;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Instr {
    Lit(Reg, LitValue),
    Stdout(Reg),
    Stdin(Reg),
    Lambda(Reg, String, Vec<Reg>),
    ThunkAlloc(Reg, String, IrType),
    Call(Reg, CallTarget, Vec<Reg>, IrType),
    Force(Reg, Reg, IrType),
    Add(Reg, Reg, Reg),
    Sub(Reg, Reg, Reg),
    Mul(Reg, Reg, Reg),
    Div(Reg, Reg, Reg),
    Rem(Reg, Reg, Reg),
    BitAnd(Reg, Reg, Reg),
    BitOr(Reg, Reg, Reg),
    BitXor(Reg, Reg, Reg),
    Shl(Reg, Reg, Reg),
    Shr(Reg, Reg, Reg),
    Lt(Reg, Reg, Reg),
    Gt(Reg, Reg, Reg),
    Le(Reg, Reg, Reg),
    Ge(Reg, Reg, Reg),
    Eq(Reg, Reg, Reg),
    Ne(Reg, Reg, Reg),
    And(Reg, Reg, Reg),
    Or(Reg, Reg, Reg),
    Not(Reg, Reg),
    Phi(Reg, Vec<(Reg, Label)>),
    Fetch(Reg, Reg, Vec<Accessor>),
    Place(Reg, Reg, Vec<Accessor>, Reg),
    Field(Reg, Reg, usize, IrType),
    StructCons(Reg, IrType, Vec<Reg>),
    EnumCons(Reg, String, String, Vec<Reg>),
    EnumDisc(Reg, Reg),
    EnumProj(Reg, IrType, String, String, usize, Reg),
    ArrayLit(Reg, IrType, Vec<Reg>),
    ArrayFill(Reg, IrType, Reg, usize),
    TupleLit(Reg, IrType, Vec<Reg>),
    StructUpdate(Reg, Reg, usize, Reg, IrType, bool),
    ArrayAccess(Reg, IrType, Reg, Reg),
    ArrayUpdate(Reg, IrType, Reg, Reg, Reg, bool),
    TupleUpdate(Reg, Reg, usize, Reg, bool),
    Move(Reg, Reg),
    Update(Reg, Reg, Reg),
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum LitValue {
    Int(i64),
    Bool(bool),
    Char(char),
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum CallTarget {
    Static(String),
    Dynamic(Reg),
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Accessor {
    Field(String),
    Index(Reg),
    TupleIndex(usize),
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Terminator {
    Ret(Reg),
    Br(Reg, Label, Label),
    Jmp(Label),
}
