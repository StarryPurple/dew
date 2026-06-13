// Tree IR definition
//
// The IR sits between type-checked AST and evaluator.
// It is a simplified, desugared form with explicit Suspend/Force nodes
// injected by strictness analysis.

use serde::Serialize;
use std::fmt;

/// Tree IR expression node
#[derive(Debug, Clone, Serialize)]
pub enum Ir {
    // Values
    Int(i64),
    Bool(bool),
    Char(char),
    Unit,

    // Variable reference
    Var(String),

    // Lambda
    Lambda {
        params: Vec<String>,
        body: Box<Ir>,
    },

    // Application
    Apply {
        func: Box<Ir>,
        args: Vec<Ir>,
    },

    // Let binding
    Let {
        name: String,
        value: Box<Ir>,
        body: Box<Ir>,
    },

    // Conditional
    If {
        cond: Box<Ir>,
        then: Box<Ir>,
        else_: Box<Ir>,
    },

    // Pattern match
    Match {
        scrutinee: Box<Ir>,
        arms: Vec<(IrPattern, Ir)>,
    },

    // Explicit thunk suspension (lazy)
    Suspend(Box<Ir>),

    // Explicit thunk forcing (strict)
    Force(Box<Ir>),

    // Binary operation
    BinOp {
        op: IrBinOp,
        left: Box<Ir>,
        right: Box<Ir>,
    },

    // Struct construction
    Struct {
        name: String,
        fields: Vec<Ir>,
    },

    // Field access
    FieldAccess {
        expr: Box<Ir>,
        field: String,
    },

    // Struct update
    StructUpdate {
        expr: Box<Ir>,
        updates: Vec<(String, Ir)>,
    },

    // Enum variant construction
    EnumVariant {
        enum_name: String,
        variant: String,
        payload: Option<Box<Ir>>,
    },

    // Array literal
    Array(Vec<Ir>),

    // Array access
    ArrayAccess {
        expr: Box<Ir>,
        index: Box<Ir>,
    },

    // Tuple literal
    Tuple(Vec<Ir>),

    // Fix-point combinator (for fix expressions)
    Fix {
        name: String,
        body: Box<Ir>,
    },

    // Return
    Return(Box<Ir>),
}

#[derive(Debug, Clone, Copy, Serialize)]
pub enum IrBinOp {
    Add,
    Sub,
    Mul,
    Div,
    Rem,
    Lt,
    Gt,
    Le,
    Ge,
    Eq,
    Ne,
    And,
    Or,
}

#[derive(Debug, Clone, Serialize)]
pub enum IrPattern {
    Wildcard,
    Var(String),
    Int(i64),
    Bool(bool),
    Char(char),
    Unit,
    Struct(String, Vec<IrPattern>),
    EnumVariant(String, Option<Box<IrPattern>>),
    Tuple(Vec<IrPattern>),
}

impl fmt::Display for Ir {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        // Pretty-print IR for --emit=text
        match self {
            Ir::Int(n) => write!(f, "{n}"),
            Ir::Bool(b) => write!(f, "{b}"),
            Ir::Char(c) => write!(f, "'{c}'"),
            Ir::Unit => write!(f, "()"),
            Ir::Var(name) => write!(f, "{name}"),
            Ir::Lambda { params, body } => {
                write!(f, "λ(")?;
                for (i, p) in params.iter().enumerate() {
                    if i > 0 { write!(f, ", ")?; }
                    write!(f, "{p}")?;
                }
                write!(f, ") {{ {body} }}")
            }
            Ir::Apply { func, args } => {
                write!(f, "({func}")?;
                for a in args { write!(f, " {a}")?; }
                write!(f, ")")
            }
            Ir::Let { name, value, body } => write!(f, "let {name} = {value} in {body}"),
            Ir::If { cond, then, else_ } => write!(f, "if {cond} then {then} else {else_}"),
            Ir::Suspend(ir) => write!(f, "~({ir})"),
            Ir::Force(ir) => write!(f, "!({ir})"),
            _ => write!(f, "<ir>"),
        }
    }
}
