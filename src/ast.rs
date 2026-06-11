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

/// Source location: (start_line, start_col, end_line, end_col), 1-indexed.
pub type Span = (usize, usize, usize, usize);

#[derive(Debug, Clone, PartialEq)]
pub enum Expr {
    LitInt(i64, Span),
    LitBool(bool, Span),
    LitUnit(Span),
    Var(String, Span),
    BinOp(BinOp, Box<Expr>, Box<Expr>, Span),
    If(Box<Expr>, Box<Expr>, Box<Expr>, Span),
    Lam(String, Type, Box<Expr>, Span),
    App(Box<Expr>, Box<Expr>, Span),
    Let(String, Box<Expr>, Box<Expr>, Span),
    Dup(Box<Expr>, Span),
    Fix(String, Type, Box<Expr>, Span),
    Box(Box<Expr>, Span),
    Unbox(Box<Expr>, Span),
    Nil(Span),
    Cons(Box<Expr>, Box<Expr>, Span),
    Head(Box<Expr>, Span),
    Tail(Box<Expr>, Span),
    IsNil(Box<Expr>, Span),
    /// Explicit strict evaluation: !e — force strict context
    ForceStrict(Box<Expr>, Span),
    /// Pipe-forward: e1 |> e2 — desugared to e2(e1) in type checker
    Pipe(Box<Expr>, Box<Expr>, Span),
    /// Constructor application: Some(42), None
    /// (name, tag_index, args, span) — tag is 0-indexed in type declaration
    Constructor(String, usize, Vec<Expr>, Span),
    /// Pattern match: match e { pat1 => body1, pat2 => body2 }
    Match(Box<Expr>, Vec<(Pattern, Expr)>, Span),
}

/// Pattern for match expressions.
#[derive(Debug, Clone, PartialEq)]
pub enum Pattern {
    /// Constructor pattern: Some(x), None
    Constructor(String, Vec<Pattern>),
    /// Variable binding: x
    Var(String),
    /// Wildcard: _
    Wildcard,
}

/// Variant declaration in a type definition: Some(T)
#[derive(Debug, Clone, PartialEq)]
pub struct VariantDecl {
    pub name: String,
    pub fields: Vec<Type>,
}

/// Type declaration: type Option(T) = None | Some(T)
#[derive(Debug, Clone)]
pub struct TypeDecl {
    pub name: String,
    pub params: Vec<String>,
    pub variants: Vec<VariantDecl>,
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
