// AST types for the Dew language
// Covers: expressions, patterns, types, declarations, programs

use std::fmt;

/// Span in source code
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct Span {
    pub start: usize,
    pub end: usize,
}

impl Span {
    pub const fn new(start: usize, end: usize) -> Self {
        Self { start, end }
    }
}

/// Top-level declarations in a Dew program
#[derive(Debug, Clone)]
pub enum Decl {
    Def {
        name: String,
        type_ann: Option<Type>,
        value: Expr,
    },
    Struct {
        name: String,
        fields: Vec<(String, Type, bool)>,  // (name, type, is_affine)
        attrs: Vec<Attr>,
    },
    Enum {
        name: String,
        variants: Vec<Variant>,
        attrs: Vec<Attr>,
    },
    Import {
        path: String,
    },
}

/// Attribute: #[name] or #[name(value)]
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Attr {
    Affine,
}

/// Enum variant
#[derive(Debug, Clone)]
pub struct Variant {
    pub name: String,
    pub payload: Option<Type>,
}

/// Expressions in the Dew language
#[derive(Debug, Clone)]
pub enum Expr {
    // Literals
    Int(i64, Span),
    Bool(bool, Span),
    Char(char, Span),
    Unit(Span),

    // Variable reference
    Var(String, Span),

    // Function definition: fn(params) -> ret { body }
    Fn {
        params: Vec<(String, Type)>,
        ret_ty: Option<Type>,
        body: Box<Expr>,
        span: Span,
    },

    // Function application: f(args...)
    App {
        func: Box<Expr>,
        args: Vec<Expr>,
        span: Span,
    },

    // let binding
    Let {
        name: String,
        value: Box<Expr>,
        body: Box<Expr>,
        span: Span,
    },

    // if/else expression
    If {
        cond: Box<Expr>,
        then: Box<Expr>,
        else_: Box<Expr>,
        span: Span,
    },

    // Match expression
    Match {
        scrutinee: Box<Expr>,
        arms: Vec<(Pattern, Expr)>,
        span: Span,
    },

    // Block: { stmts; final_expr }
    Block {
        stmts: Vec<Expr>,
        final_expr: Box<Expr>,
        span: Span,
    },

    // Struct construction: Name(field1, field2, ...)
    StructCons {
        name: String,
        fields: Vec<Expr>,
        span: Span,
    },

    // Field access: expr.field_name
    FieldAccess {
        expr: Box<Expr>,
        field: String,
        span: Span,
    },

    // Struct update: expr { field1 = val1, ... }
    StructUpdate {
        expr: Box<Expr>,
        updates: Vec<(String, Expr)>,
        span: Span,
    },

    // Array literal: [e1, e2, ...]
    ArrayLit {
        elements: Vec<Expr>,
        span: Span,
    },

    // Array access: expr[index]
    ArrayAccess {
        expr: Box<Expr>,
        index: Box<Expr>,
        span: Span,
    },

    // Array update: expr { [index] = value }
    ArrayUpdate {
        expr: Box<Expr>,
        index: Box<Expr>,
        value: Box<Expr>,
        span: Span,
    },

    // Tuple literal: (e1, e2, ...)
    TupleLit {
        elements: Vec<Expr>,
        span: Span,
    },

    // Tuple update: expr { index = value }
    TupleUpdate {
        expr: Box<Expr>,
        index: usize,
        value: Box<Expr>,
        span: Span,
    },

    // Binary operator
    BinOp {
        op: BinOpKind,
        left: Box<Expr>,
        right: Box<Expr>,
        span: Span,
    },

    // Return statement
    Return {
        expr: Box<Expr>,
        span: Span,
    },

    // Force evaluation
    Force {
        expr: Box<Expr>,
        span: Span,
    },

    // fix loop { fn(args) { body } }
    Fix {
        name: String,
        body: Box<Expr>,
        span: Span,
    },

    // Borrow sugar: &x in patterns / call sites
    Borrow {
        name: String,
        span: Span,
    },

    // Pipe: e -> f
    Pipe {
        left: Box<Expr>,
        right: Box<Expr>,
        span: Span,
    },
}

/// Binary operator kinds
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum BinOpKind {
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

impl fmt::Display for BinOpKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let s = match self {
            BinOpKind::Add => "+",
            BinOpKind::Sub => "-",
            BinOpKind::Mul => "*",
            BinOpKind::Div => "/",
            BinOpKind::Rem => "%",
            BinOpKind::Lt => "<",
            BinOpKind::Gt => ">",
            BinOpKind::Le => "<=",
            BinOpKind::Ge => ">=",
            BinOpKind::Eq => "==",
            BinOpKind::Ne => "!=",
            BinOpKind::And => "&&",
            BinOpKind::Or => "||",
        };
        write!(f, "{s}")
    }
}

/// Pattern for match/let destructuring
#[derive(Debug, Clone)]
pub enum Pattern {
    /// Wildcard: _
    Wildcard,
    /// Variable binding: x
    Var(String),
    /// Literal match: 42, True, 'x'
    Lit(Expr),
    /// Struct pattern: Point(x, y)
    Struct(String, Vec<Pattern>),
    /// Enum variant: Some(x), None
    EnumVariant(String, Option<Box<Pattern>>),
    /// Tuple pattern: (x, y)
    Tuple(Vec<Pattern>),
}

/// Type expressions (user-facing and inferred)
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Type {
    /// Primitive: Int, Bool, Char, Unit
    Prim(PrimType),
    /// Type variable for HM inference
    Var(String),
    /// Function type: T1 -> T2
    Fun(Box<Type>, Box<Type>),
    /// Named type: Point, Option, etc.
    Named(String),
    /// Parameterized type: List(Int), Array(Char, 5)
    App(String, Vec<Type>),
    /// Tuple type: (T1, T2)
    Tuple(Vec<Type>),
    /// Array type: Array(T, N) — N is a compile-time constant
    ArrayType(Box<Type>, usize),
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum PrimType {
    Int,
    Bool,
    Char,
    Unit,
}
