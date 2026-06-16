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
    Call(Reg, CallTarget, Vec<Reg>),
    Force(Reg, ForceTarget),
    Add(Reg, Reg, Reg),
    Sub(Reg, Reg, Reg),
    Mul(Reg, Reg, Reg),
    Div(Reg, Reg, Reg),
    Rem(Reg, Reg, Reg),
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
    Field(Reg, Reg, String),
    StructCons(Reg, String, Vec<Reg>),
    EnumCons(Reg, String, String, Vec<Reg>),
    EnumDisc(Reg, Reg),
    EnumProj(Reg, String, String, Reg),
    ArrayLit(Reg, IrType, Vec<Reg>),
    ArrayFill(Reg, IrType, Reg, usize),
    TupleLit(Reg, IrType, Vec<Reg>),
    StructUpdate(Reg, Reg, String, Reg),
    ArrayAccess(Reg, Reg, Reg),
    ArrayUpdate(Reg, Reg, Reg, Reg),
    TupleUpdate(Reg, Reg, usize, Reg),
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
pub enum ForceTarget {
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
