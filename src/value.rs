/// Runtime values produced by the evaluator.

use crate::ir::{Ir, Name, ThunkId};
use std::collections::HashMap;

pub type Env = HashMap<Name, Value>;

#[derive(Debug, Clone)]
pub enum Value {
    Int(i64),
    Bool(bool),
    Unit,
    /// A closure: parameter name, body IR, captured environment, affinity.
    Closure(String, Ir, Env),
    /// A boxed value (linear — must be unboxed exactly once).
    Box(Box<Value>),
    /// Empty list.
    Nil,
    /// List cons cell: head value + lazy tail.
    Cons(Box<Value>, Box<Value>),
    /// Reference to a thunk in the thunk store.
    Thunk(ThunkId),
}

impl Value {
    pub fn type_name(&self) -> &'static str {
        match self {
            Value::Int(_) => "Int",
            Value::Bool(_) => "Bool",
            Value::Unit => "()",
            Value::Closure(_, _, _) => "Fn",
            Value::Box(_) => "Box",
            Value::Nil => "Nil",
            Value::Cons(_, _) => "Cons",
            Value::Thunk(_) => "Thunk",
        }
    }

    pub fn as_int(&self) -> Option<i64> {
        match self {
            Value::Int(n) => Some(*n),
            _ => None,
        }
    }

    pub fn as_bool(&self) -> Option<bool> {
        match self {
            Value::Bool(b) => Some(*b),
            _ => None,
        }
    }
}
