/// Intermediate Representation for Dew.
///
/// After strictness analysis inserts suspend/force, the IR includes
/// explicit laziness constructs. This is what the evaluator runs.

use crate::types::{Affinity, Type};
use serde::Serialize;
use std::fmt;

pub type Name = String;
pub type ThunkId = u64;

#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub enum IrOp {
    Add,
    Sub,
    Mul,
    Div,
    Eq,
    Lt,
    Gt,
}

impl IrOp {
    pub fn symbol(&self) -> &'static str {
        match self {
            IrOp::Add => "+",
            IrOp::Sub => "-",
            IrOp::Mul => "*",
            IrOp::Div => "/",
            IrOp::Eq => "==",
            IrOp::Lt => "<",
            IrOp::Gt => ">",
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub enum Ir {
    /// Integer literal.
    Lit(i64),
    /// Boolean literal.
    Bool(bool),
    /// Unit literal.
    Unit,
    /// Variable reference.
    Var(Name),
    /// Let binding: let name = bind in body.
    Let(Name, Box<Ir>, Box<Ir>, Type),
    /// Lambda abstraction with inferred affinity.
    Lam(Name, Box<Ir>, Type, Type, Affinity),
    /// Function application.
    App(Box<Ir>, Box<Ir>),
    /// Conditional.
    If(Box<Ir>, Box<Ir>, Box<Ir>),
    /// Binary operation.
    BinOp(IrOp, Box<Ir>, Box<Ir>),
    /// Duplicate a copyable value.
    Dup(Box<Ir>),
    /// Create a lazy thunk (suspension).
    Suspend(Box<Ir>, Vec<Name>, Type, Option<String>),
    /// Force a thunk.
    Force(Box<Ir>),
    /// Fixed-point combinator.
    Fix(Name, Box<Ir>, Type),
    /// Allocate: box(e) — wrap in linear Box.
    Alloc(Box<Ir>),
    /// Deallocate: unbox(e) — extract from linear Box, consuming it.
    Dealloc(Box<Ir>),
    /// Empty list.
    Nil,
    /// List constructor: cons(head, tail). Tail is lazy.
    Cons(Box<Ir>, Box<Ir>),
    /// List head accessor.
    Head(Box<Ir>),
    /// List tail accessor (forces lazy tail).
    Tail(Box<Ir>),
    /// Test if list is empty.
    IsNil(Box<Ir>),
}

impl fmt::Display for Ir {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.pretty(f, 0)
    }
}

impl Ir {
    pub fn ty(&self) -> Type {
        match self {
            Ir::Lit(_) => Type::Int,
            Ir::Bool(_) => Type::Bool,
            Ir::Unit => Type::Unit,
            Ir::Var(_) => Type::Int,
            Ir::Let(_, _, _, ty) => ty.clone(),
            Ir::Lam(_, _, param_ty, _, affinity) => {
                Type::Fun(Box::new(param_ty.clone()), Box::new(param_ty.clone()), *affinity)
            }
            Ir::App(_, _) => Type::Int,
            Ir::If(_, then_, _) => then_.ty(),
            Ir::BinOp(op, _, _) => match op {
                IrOp::Eq | IrOp::Lt | IrOp::Gt => Type::Bool,
                _ => Type::Int,
            },
            Ir::Dup(inner) => inner.ty(),
            Ir::Suspend(_, _, ty, _) => ty.clone(),
            Ir::Force(inner) => inner.ty(),
            Ir::Fix(_, _, ty) => ty.clone(),
            Ir::Alloc(inner) => Type::Box(Box::new(inner.ty())),
            Ir::Dealloc(_) => Type::Int, // placeholder
            Ir::Nil => Type::List(Box::new(Type::Int)), // placeholder
            Ir::Cons(head, _) => {
                Type::List(Box::new(head.ty()))
            }
            Ir::Head(inner) => {
                match inner.ty() {
                    Type::List(t) => *t,
                    _ => Type::Int,
                }
            }
            Ir::Tail(inner) => inner.ty(),
            Ir::IsNil(_) => Type::Bool, // placeholder — resolved during evaluation
        }
    }

    fn pretty(&self, f: &mut fmt::Formatter<'_>, indent: usize) -> fmt::Result {
        let pad = "  ".repeat(indent);
        match self {
            Ir::Lit(n) => write!(f, "{pad}lit {n}"),
            Ir::Bool(b) => write!(f, "{pad}bool {b}"),
            Ir::Unit => write!(f, "{pad}unit"),
            Ir::Var(x) => write!(f, "{pad}var {x}"),
            Ir::Let(name, bind, body, ty) => {
                writeln!(f, "{pad}let {name} : {ty} =")?;
                bind.pretty(f, indent + 1)?;
                writeln!(f)?;
                write!(f, "{pad}in")?;
                body.pretty(f, indent + 1)
            }
            Ir::Lam(param, body, param_ty, _, affinity) => {
                write!(f, "{pad}fn ({param} : {param_ty})")?;
                if affinity.is_affine() {
                    write!(f, " [FnOnce]")?;
                }
                writeln!(f)?;
                body.pretty(f, indent + 1)
            }
            Ir::App(fn_expr, arg) => {
                writeln!(f, "{pad}app")?;
                fn_expr.pretty(f, indent + 1)?;
                writeln!(f)?;
                write!(f, "{pad}arg")?;
                arg.pretty(f, indent + 1)
            }
            Ir::If(cond, then_, else_) => {
                writeln!(f, "{pad}if")?;
                cond.pretty(f, indent + 1)?;
                writeln!(f)?;
                writeln!(f, "{pad}then")?;
                then_.pretty(f, indent + 1)?;
                writeln!(f)?;
                write!(f, "{pad}else")?;
                else_.pretty(f, indent + 1)
            }
            Ir::BinOp(op, left, right) => {
                writeln!(f, "{pad}{}", op.symbol())?;
                left.pretty(f, indent + 1)?;
                writeln!(f)?;
                right.pretty(f, indent + 1)
            }
            Ir::Dup(inner) => {
                writeln!(f, "{pad}dup")?;
                inner.pretty(f, indent + 1)
            }
            Ir::Suspend(body, captures, ty, source) => {
                if let Some(src) = source {
                    writeln!(f, "{pad}suspend [{captures:?}] : {ty} ({src})")?;
                } else {
                    writeln!(f, "{pad}suspend [{captures:?}] : {ty}")?;
                }
                body.pretty(f, indent + 1)
            }
            Ir::Force(inner) => {
                writeln!(f, "{pad}force")?;
                inner.pretty(f, indent + 1)
            }
            Ir::Fix(name, body, ty) => {
                writeln!(f, "{pad}fix {name} : {ty}")?;
                body.pretty(f, indent + 1)
            }
            Ir::Alloc(inner) => {
                writeln!(f, "{pad}box")?;
                inner.pretty(f, indent + 1)
            }
            Ir::Dealloc(inner) => {
                writeln!(f, "{pad}unbox")?;
                inner.pretty(f, indent + 1)
            }
            Ir::Nil => write!(f, "{pad}nil"),
            Ir::Cons(head, tail) => {
                writeln!(f, "{pad}cons")?;
                head.pretty(f, indent + 1)?;
                writeln!(f)?;
                tail.pretty(f, indent + 1)
            }
            Ir::Head(inner) => {
                writeln!(f, "{pad}head")?;
                inner.pretty(f, indent + 1)
            }
            Ir::Tail(inner) => {
                writeln!(f, "{pad}tail")?;
                inner.pretty(f, indent + 1)
            }
            Ir::IsNil(inner) => {
                writeln!(f, "{pad}isnil")?;
                inner.pretty(f, indent + 1)
            }
        }
    }
}
