use super::func::Fn;
use super::types::TypeTable;
use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Module {
    pub types: TypeTable,
    pub fns: Vec<Fn>,
}

impl Module {
    pub fn new() -> Self {
        Module { types: TypeTable::new(), fns: vec![] }
    }
}
