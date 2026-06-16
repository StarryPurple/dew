use super::block::BasicBlock;
use super::types::IrType;
use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Fn {
    pub name: String,
    pub params: Vec<(usize, IrType)>,
    pub blocks: Vec<BasicBlock>,
    pub return_type: IrType,
}

impl Fn {
    pub fn new(name: String, params: Vec<(usize, IrType)>, return_type: IrType) -> Self {
        Fn { name, params, blocks: vec![], return_type }
    }
}
