use super::block::BasicBlock;
use super::types::IrType;
use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Thunk {
    pub name: String,
    pub blocks: Vec<BasicBlock>,
    pub result_type: IrType,
}

impl Thunk {
    pub fn new(name: String, result_type: IrType) -> Self {
        Thunk { name, blocks: vec![], result_type }
    }
}
