/// Runtime values for the tree-walking evaluator.
use std::collections::HashMap;

#[derive(Debug, Clone)]
pub enum Value {
    Int(i64),
    Bool(bool),
    Char(char),
    Unit,
    Struct(String, Vec<(String, Value)>),
    Enum(String, String, usize, Vec<Value>),
    Tuple(Vec<Value>),
    Array(Vec<Value>),
    Closure(ClosureValue),
    ThunkRef(ThunkRef),
}

#[derive(Debug, Clone)]
pub struct ClosureValue {
    pub fn_name: String,
    pub captures: Vec<Value>,
}

#[derive(Debug, Clone)]
pub struct ThunkRef {
    pub name: String,
}

impl Value {
    pub fn as_int(&self) -> Option<i64> {
        match self { Value::Int(n) => Some(*n), _ => None }
    }

    pub fn as_bool(&self) -> Option<bool> {
        match self { Value::Bool(b) => Some(*b), _ => None }
    }

    pub fn compare_key(&self) -> Option<i64> {
        match self {
            Value::Int(n) => Some(*n),
            Value::Char(c) => Some(*c as i64),
            Value::Bool(b) => Some(if *b { 1 } else { 0 }),
            _ => None,
        }
    }
}

/// Thunk state for lazy evaluation.
#[derive(Debug, Clone)]
pub enum ThunkState {
    Suspended,
    Evaluating,
    Evaluated(Value),
}

/// The evaluator's runtime state.
#[derive(Debug, Clone)]
pub struct Runtime {
    pub thunks: HashMap<String, ThunkState>,
}

impl Runtime {
    pub fn new() -> Self {
        Runtime { thunks: HashMap::new() }
    }
}

