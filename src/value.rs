// Runtime values and environments for the evaluator

use std::collections::HashMap;
use std::fmt;

/// Runtime value
#[derive(Debug, Clone)]
pub enum Value {
    Builtin(String),
    Int(i64),
    Bool(bool),
    Char(char),
    Unit,

    /// Closure: captures its environment by value, body is a thunk name
    Closure {
        params: Vec<String>,
        body: String,
        env: Env,
    },

    /// Thunk: a suspended computation, references thunk by name
    Thunk {
        name: String,
        env: Env,
    },

    /// Struct instance
    Struct {
        name: String,
        field_names: Vec<String>,
        fields: Vec<Value>,
    },

    /// Enum variant instance
    EnumVariant {
        enum_name: String,
        variant: String,
        payload: Option<Box<Value>>,
    },

    /// Tuple
    Tuple(Vec<Value>),

    /// Array
    Array(Vec<Value>),
}

/// Runtime environment: maps variable names to values
#[derive(Debug, Clone, Default)]
pub struct Env {
    bindings: HashMap<String, Value>,
}

impl Env {
    pub fn new() -> Self {
        Self {
            bindings: HashMap::new(),
        }
    }

    pub fn insert(&mut self, name: String, value: Value) {
        self.bindings.insert(name, value);
    }

    pub fn get(&self, name: &str) -> Option<&Value> {
        self.bindings.get(name)
    }

    pub fn contains(&self, name: &str) -> bool {
        self.bindings.contains_key(name)
    }
}

impl fmt::Display for Value {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Value::Int(n) => write!(f, "{n}"),
            Value::Bool(b) => write!(f, "{b}"),
            Value::Char(c) => write!(f, "'{c}'"),
            Value::Unit => write!(f, "Unit"),
      Value::Builtin(name) => write!(f, "<builtin:{name}>"),
            Value::Closure { params, .. } => write!(f, "<fn({})>", params.join(", ")),
            Value::Thunk { .. } => write!(f, "<thunk>"),
            Value::Struct { name, fields, .. } => {
                write!(f, "{name}(")?;
                for (i, v) in fields.iter().enumerate() {
                    if i > 0 { write!(f, ", ")?; }
                    write!(f, "{v}")?;
                }
                write!(f, ")")
            }
            Value::EnumVariant { variant, payload, .. } => {
                if let Some(p) = payload {
                    write!(f, "{variant}({p})")
                } else {
                    write!(f, "{variant}")
                }
            }
            Value::Tuple(vals) => {
                write!(f, "(")?;
                for (i, v) in vals.iter().enumerate() {
                    if i > 0 { write!(f, ", ")?; }
                    write!(f, "{v}")?;
                }
                write!(f, ")")
            }
            Value::Array(vals) => {
                write!(f, "[")?;
                for (i, v) in vals.iter().enumerate() {
                    if i > 0 { write!(f, ", ")?; }
                    write!(f, "{v}")?;
                }
                write!(f, "]")
            }
        }
    }
}
