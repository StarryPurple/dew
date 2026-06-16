use super::instr::{Instr, Label, Terminator};
use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BasicBlock {
    pub label: Label,
    pub instrs: Vec<Instr>,
    pub terminator: Terminator,
}

impl BasicBlock {
    pub fn new(label: Label) -> Self {
        BasicBlock { label, instrs: Vec::new(), terminator: Terminator::Jmp("entry".into()) }
    }
}
