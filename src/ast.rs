/// AST types for the Dew language.
///
/// Syntax:
///   e ::= n | true | false | () | x
///       | e1 op e2
///       | if e1 { e2 } else { e3 }
///       | fn (x: Type) { e }
///       | e1 e2
///       | let x = e1; e2
///       | dup(e)
///       | fix f: Type { e }
///       | box(e)
///       | unbox(e)

use crate::types::Type;

#[derive(Debug, Clone, PartialEq)]
pub enum Expr {
    LitInt(i64),
    LitBool(bool),
    LitUnit,
    Var(String),
    BinOp(BinOp, Box<Expr>, Box<Expr>),
    If(Box<Expr>, Box<Expr>, Box<Expr>),
    Lam(String, Type, Box<Expr>),       // fn (param: ty) { body }
    App(Box<Expr>, Box<Expr>),
    Let(String, Box<Expr>, Box<Expr>),  // let x = bind; body
    Dup(Box<Expr>),                     // duplicate a copyable value
    Fix(String, Type, Box<Expr>),       // fix f: ty { body }
    Box(Box<Expr>),                     // box(e) — allocate linear box
    Unbox(Box<Expr>),                   // unbox(e) — deallocate, extract value
    Nil,                                // nil — empty list
    Cons(Box<Expr>, Box<Expr>),         // cons(h, t) — construct list
    Head(Box<Expr>),                    // head(l) — get list head
    Tail(Box<Expr>),                    // tail(l) — get list tail
    IsNil(Box<Expr>),                   // isnil(l) — test if empty
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum BinOp {
    Add,
    Sub,
    Mul,
    Div,
    Eq,
    Lt,
    Gt,
}

impl BinOp {
    pub fn symbol(self) -> &'static str {
        match self {
            BinOp::Add => "+",
            BinOp::Sub => "-",
            BinOp::Mul => "*",
            BinOp::Div => "/",
            BinOp::Eq => "==",
            BinOp::Lt => "<",
            BinOp::Gt => ">",
        }
    }
}
