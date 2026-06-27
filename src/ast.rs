// AST node types for the Dew programming language.
//
// This is the **Concrete AST** — syntax sugar (& borrow, pipeline, if/else)
// is preserved at this level. The desugar pass transforms it to Core AST.
//
// All expression, pattern, and type nodes carry Span for source-level error
// reporting. Serde derives support JSON serialization for tooling.

use serde::{Deserialize, Serialize};

// ---------------------------------------------------------------------------
// Span — source location tracking
// ---------------------------------------------------------------------------

/// Source location: byte offsets are 0-based; line and column are 0-based.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Serialize, Deserialize)]
pub struct Span {
    pub start: usize,
    pub end: usize,
    pub line: usize,
    pub col: usize,
}

impl Span {
    pub const DUMMY: Span = Span { start: 0, end: 0, line: 0, col: 0 };

    /// Merge two spans into one covering both (start of self, end of other).
    pub fn merge(self, other: Span) -> Span {
        Span {
            start: self.start.min(other.start),
            end: self.end.max(other.end),
            line: self.line.min(other.line),
            col: self.col.min(other.col),
        }
    }
}

// ---------------------------------------------------------------------------
// Program — top-level compilation unit
// ---------------------------------------------------------------------------

/// A Dew source file: a sequence of top-level declarations.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Program {
    pub decls: Vec<Decl>,
    pub span: Span,
}

// ---------------------------------------------------------------------------
// Attributes
// ---------------------------------------------------------------------------

/// Attribute attached to declarations.
/// Currently only `affine` is supported (applied to struct/enum).
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum Attr {
    Affine,
}

// ---------------------------------------------------------------------------
// Declarations
// ---------------------------------------------------------------------------

/// Top-level declaration.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Decl {
    /// `def name = expr` or `def rec name = expr`
    Def(DefDecl),
    /// `struct Name { field: Type, ... }`
    Struct(StructDecl),
    /// `enum Name { Variant(Type), Variant { ... }, ... }`
    Enum(EnumDecl),
    /// `import "path"`
    Import(ImportDecl),
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DefDecl {
    pub span: Span,
    pub rec: bool,
    pub name: Ident,
    /// For `def (a, b) = expr`: names to bind from tuple destructuring.
    /// When Some, `name` is a synthetic temp, and `destructure` lists the
    /// real variable names to extract via `.0`, `.1`, ...
    pub destructure: Option<Vec<Ident>>,
    pub ty: Option<Type>,
    pub value: Expr,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct StructDecl {
    pub span: Span,
    pub attrs: Vec<Attr>,
    pub name: Ident,
    pub params: Vec<GenericParam>,
    pub fields: Vec<StructField>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct StructField {
    pub span: Span,
    pub name: Ident,
    pub ty: Type,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EnumDecl {
    pub span: Span,
    pub attrs: Vec<Attr>,
    pub name: Ident,
    pub params: Vec<GenericParam>,
    pub variants: Vec<Variant>,
}

/// An enum variant: single positional payload, named fields, or unit.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Variant {
    /// `Variant(Type1, Type2, ...)` — positional payload(s)
    Single { span: Span, name: Ident, payload: Vec<Type> },
    /// `Variant { field: Type, ... }` — named fields
    Struct { span: Span, name: Ident, fields: Vec<StructField> },
    /// `Variant` — no payload
    Unit { span: Span, name: Ident },
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ImportDecl {
    pub span: Span,
    pub path: String,
}

// ---------------------------------------------------------------------------
// Identifiers and Generics
// ---------------------------------------------------------------------------

/// An identifier with source location.
#[derive(Debug, Clone, PartialEq, Eq, Hash, Serialize, Deserialize)]
pub struct Ident {
    pub name: String,
    pub span: Span,
}

impl Ident {
    pub fn new(name: impl Into<String>, span: Span) -> Self {
        Ident { name: name.into(), span }
    }
}

/// Generic parameter: type variable `T` or const generic `N: Int`.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum GenericParam {
    Type(Ident),
    Const(Ident),
}

// ---------------------------------------------------------------------------
// Expressions — 23 variants
// ---------------------------------------------------------------------------

/// A Dew expression.
///
/// Syntax sugar (if/else, pipeline, borrow) is preserved at this level
/// and eliminated by the desugar pass.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Expr {
    /// Integer literal: `42`
    IntLit(IntLit),
    /// Boolean literal: `true`, `false`
    BoolLit(BoolLit),
    /// Character literal: `'a'`, `'字'`
    CharLit(CharLit),
    /// Unit literal: `Unit`
    UnitLit(Span),
    /// Variable reference: `x`, `fact`
    Var(Ident),
    /// Binary operator: `a + b`, `x == y`, `cond && ok`
    Binary(BinaryExpr),
    /// Unary operator: `-x`, `!x`
    Unary(UnaryExpr),
    /// Function definition: `fn(x: Int) -> Int { body }`
    Fn(FnExpr),
    /// Function call: `f(a, b)`
    Call(CallExpr),
    /// If/else: `if cond { then } else { else_ }` — desugars to match
    If(IfExpr),
    /// Match: `match scrutinee { arms... }`
    Match(MatchExpr),
    /// Block: `{ stmt1; stmt2; expr }`
    Block(BlockExpr),
    /// Field access: `expr.field`
    Field(FieldExpr),
    /// Array subscript: `expr[index]`
    Subscript(SubscriptExpr),
    /// Struct/tuple/array update: `expr { .field = val }`
    Update(UpdateExpr),
    /// Pipeline: `expr -> f(args)` — desugars to call
    Pipeline(PipelineExpr),
    /// Borrow rebind: `&p = expr`, `&p { field = val }` — desugars to tuple return
    Borrow(Box<BorrowExpr>),
    /// Force: `!expr` — explicit strict evaluation
    Force(ForceExpr),
    /// Tuple literal: `(a, b, c)`
    TupleLit(TupleLit),
    /// Struct literal: `Point { x: 1, y: 2 }`
    StructLit(StructLit),
    /// Enum variant construction: `Some(42)`, `KeyPress { key: 'a', modifiers: 0 }`
    EnumLit(EnumLit),
    /// Array literal: `[1, 2, 3]`
    ArrayLit(ArrayLit),
    /// Array fill: `[expr; N]`
    ArrayFill(ArrayFill),
    /// Fix expression: `fix loop { fn(x) { ... loop(x+1) } }`
    Fix(FixExpr),
    /// While loop: `while cond { body }` — desugars to def rec + if/else
    While(WhileExpr),
    /// Infinite loop: `forever { body }` — desugars to def rec
    Loop(LoopExpr),
    /// For-in: `for x : expr { body }` — deferred (needs self-ref closures)
    ForIn(ForInExpr),
    /// Cast: `expr as Type` (primitive types only, Unit forbidden)
    Cast(Box<CastExpr>),
}

// --- Literals ---

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct IntLit { pub span: Span, pub value: i64 }

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BoolLit { pub span: Span, pub value: bool }

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CharLit { pub span: Span, pub value: char }

// --- Operators ---

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum BinaryOp {
    Add, Sub, Mul, Div, Rem,   // arithmetic
    Lt, Gt, Le, Ge, Eq, Ne,    // comparison
    And, Or,                    // logic
    BitAnd, BitOr, BitXor, Shl, Shr, // bitwise
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum UnaryOp {
    Neg,   // -x
    Not,   // not x (built-in function form; !x is Force, see ForceExpr)
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BinaryExpr {
    pub span: Span,
    pub op: BinaryOp,
    pub left: Box<Expr>,
    pub right: Box<Expr>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct UnaryExpr {
    pub span: Span,
    pub op: UnaryOp,
    pub expr: Box<Expr>,
}

// --- Functions ---

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FnExpr {
    pub span: Span,
    pub params: Vec<FnParam>,
    pub return_ty: Option<Type>,
    pub body: Box<Expr>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FnParam {
    pub span: Span,
    pub name: Ident,
    pub ty: Option<Type>,
    /// true for `&p: T` borrow parameter
    pub is_borrow: bool,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CallExpr {
    pub span: Span,
    pub func: Box<Expr>,
    pub args: Vec<ExprArg>,
}

/// Call argument: a normal value or a borrow `&lvalue`.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum ExprArg {
    Value(Box<Expr>),
    Borrow(Box<BorrowExpr>),
}

// --- Control Flow ---

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct IfExpr {
    pub span: Span,
    /// Borrow variables declared on `if` branch: `(&x, &y; cond)`. Empty = no borrow.
    pub if_borrow: Vec<Ident>,
    /// Borrow variables declared on `else` branch. None = inherit from if_borrow.
    pub else_borrow: Option<Vec<Ident>>,
    pub condition: Box<Expr>,
    pub then_branch: Box<Expr>,
    /// None when then_branch has type Unit (else defaults to Unit)
    pub else_branch: Option<Box<Expr>>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MatchExpr {
    pub span: Span,
    pub scrutinee: Box<Expr>,
    pub arms: Vec<MatchArm>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MatchArm {
    pub span: Span,
    pub pattern: Pattern,
    pub body: Expr,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BlockExpr {
    pub span: Span,
    pub stmts: Vec<BlockStmt>,
    /// Final expression (no `;`). None if block yields Unit implicitly.
    pub final_expr: Option<Box<Expr>>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BlockStmt {
    pub span: Span,
    pub expr: Expr,
    pub def: Option<DefDecl>,
}

// --- Access and Mutation ---

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FieldExpr {
    pub span: Span,
    pub object: Box<Expr>,
    pub field: Ident,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SubscriptExpr {
    pub span: Span,
    pub array: Box<Expr>,
    pub index: Box<Expr>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct UpdateExpr {
    pub span: Span,
    pub base: Box<Expr>,
    pub updates: Vec<UpdateField>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum UpdateField {
    NamedField { span: Span, name: Ident, value: Expr },
    ArrayIndex { span: Span, index: Expr, value: Expr },
    TupleIndex { span: Span, index: usize, value: Expr },
}

// --- Pipeline and Borrow (syntax sugar) ---

/// Pipeline: `expr -> f(args)`.
/// Left-associative, lowest precedence. Desugars to `f(args..., expr)`.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PipelineExpr {
    pub span: Span,
    pub value: Box<Expr>,
    pub func: Box<Expr>,
}

/// Borrow sugar: `&LValue = expr` or `&LValue { update }`.
/// LValue grammar: `IDENT ("." IDENT | "[" Expr "]" | "." INT)*`
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BorrowExpr {
    pub span: Span,
    pub lvalue: LValue,
    pub rhs: Option<Box<BorrowRhs>>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum BorrowRhs {
    Assign(Box<Expr>),
    Update(Vec<UpdateField>),
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct LValue {
    pub span: Span,
    pub root: Ident,
    pub path: Vec<LValueAccessor>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum LValueAccessor {
    Field(Ident),
    Index(Expr),
    TupleIndex(usize),
}

// --- Other Expressions ---

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ForceExpr {
    pub span: Span,
    pub expr: Box<Expr>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TupleLit {
    pub span: Span,
    pub elements: Vec<Expr>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct StructLit {
    pub span: Span,
    pub name: Ident,
    pub fields: Vec<StructLitField>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct StructLitField {
    pub span: Span,
    pub name: Ident,
    /// None for shorthand (`name` is also the variable to bind)
    pub value: Option<Expr>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EnumLit {
    pub span: Span,
    pub name: Ident,
    pub payload: EnumPayload,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum EnumPayload {
    /// `Some(42)` or `Node(e1, e2)` (positional payload expressions)
    Single(Vec<Box<Expr>>),
    /// `KeyPress { key: 'a', modifiers: 0 }`
    Struct(Vec<StructLitField>),
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ArrayLit {
    pub span: Span,
    pub elements: Vec<Expr>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ArrayFill {
    pub span: Span,
    pub value: Box<Expr>,
    pub count: usize,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FixExpr {
    pub span: Span,
    pub loop_var: Ident,
    pub body: Box<Expr>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct WhileExpr {
    pub span: Span,
    /// Borrow variables: `while (&x, &y; cond) { ... }`. Empty = traditional while.
    pub borrow_vars: Vec<Ident>,
    pub condition: Box<Expr>,
    pub body: Box<Expr>,
}
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct LoopExpr {
    pub span: Span,
    pub body: Box<Expr>,
}
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ForInExpr {
    pub span: Span,
    pub var: Ident,
    pub collection: Box<Expr>,
    pub body: Box<Expr>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CastExpr {
    pub span: Span,
    pub expr: Box<Expr>,
    pub target_ty: Type,
}

// ---------------------------------------------------------------------------
// Patterns (for match arms and def destructuring)
// ---------------------------------------------------------------------------

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Pattern {
    Wildcard(Span),
    Var(Ident),
    Lit(LitPattern),
    Struct(StructPattern),
    Variant(VariantPattern),
    Tuple(TuplePattern),
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct LitPattern {
    pub span: Span,
    pub value: LitValue,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum LitValue {
    Int(i64),
    Bool(bool),
    Char(char),
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct StructPattern {
    pub span: Span,
    pub name: Ident,
    pub fields: Vec<PatternField>,
    /// true if `..` rest pattern is present
    pub has_rest: bool,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct VariantPattern {
    pub span: Span,
    pub name: Ident,
    pub payload: Vec<Pattern>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TuplePattern {
    pub span: Span,
    pub elements: Vec<Pattern>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum PatternField {
    /// `x` — shorthand: field name = variable name
    Shorthand { span: Span, name: Ident },
    /// `x: a` — rename: bind field `x` to variable `a`
    Rename { span: Span, field: Ident, var: Ident },
}

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

/// A Dew type annotation. HM infers where omitted.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Type {
    /// Named type: `Int`, `Bool`, `Char`, `Unit`, `Point`, `Option(Int)`
    Named(NamedType),
    /// Function type: `(Int, Bool) -> Char`, `Int -> Bool -> Char`
    Fun(FunType),
    /// Tuple type: `(Int, Bool)`
    Tuple(TupleType),
    /// Array type: `[Int; 3]`
    Array(ArrayType),
    /// `_` — infer this type variable
    Wildcard(Span),
    /// `typeof(expr)` — compile-time type resolution
    TypeOf(TypeOfType),
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct NamedType {
    pub span: Span,
    pub name: Ident,
    pub args: Option<Vec<TypeArg>>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum TypeArg {
    Type(Type),
    Const(usize),
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FunType {
    pub span: Span,
    pub params: Vec<FunParamType>,
    pub return_ty: Option<Box<Type>>,
    pub is_io: bool,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FunParamType {
    pub span: Span,
    pub ty: Type,
    pub is_borrow: bool,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TupleType {
    pub span: Span,
    pub elements: Vec<Type>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ArrayType {
    pub span: Span,
    pub element: Box<Type>,
    pub size: usize,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TypeOfType {
    pub span: Span,
    pub expr: Box<Expr>,
}

// ---------------------------------------------------------------------------
// Semantic Tokens — for LSP semantic highlighting
// ---------------------------------------------------------------------------

/// Token types for LSP semantic highlighting.
/// Indices correspond to the legend declared in the LSP initialize response.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum SemanticTokenType {
    /// Generic variable
    Variable = 0,
    /// Borrow parameter or borrow-rebound variable (`&p: T`, `&x = expr`)
    BorrowVariable = 1,
    /// Affine-typed variable
    AffineVariable = 2,
    /// Function name
    Function = 3,
    /// IO-marked function
    IoFunction = 4,
    /// Type name (struct, enum, variant constructor)
    Type = 5,
    /// Affine type declaration (`affine struct`, `affine enum`)
    AffineType = 6,
    /// Keyword (`def`, `fn`, `struct`, `enum`, `match`, `if`, `else`, `fix`, etc.)
    Keyword = 7,
    /// Borrow operator `&`
    BorrowOperator = 8,
    /// Force operator `!`
    ForceOperator = 9,
    /// String/array literal
    String = 10,
    /// Numeric literal
    Number = 11,
    /// Comment
    Comment = 12,
}

/// Bit-flag modifiers for semantic tokens.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct SemanticTokenModifiers(u16);

impl SemanticTokenModifiers {
    pub const NONE: SemanticTokenModifiers = SemanticTokenModifiers(0);
    pub const DEFINITION: SemanticTokenModifiers = SemanticTokenModifiers(1 << 0);
    pub const CONSUMED: SemanticTokenModifiers = SemanticTokenModifiers(1 << 1);

    pub fn bits(self) -> u16 { self.0 }
    pub fn is(self, flag: SemanticTokenModifiers) -> bool { self.0 & flag.0 != 0 }
}

/// A single semantic token: span + type + modifiers.
#[derive(Debug, Clone)]
pub struct SemanticToken {
    pub span: Span,
    pub token_type: SemanticTokenType,
    pub modifiers: SemanticTokenModifiers,
}

// ---------------------------------------------------------------------------
// Pretty-print desugared AST back to Dew source text
// ---------------------------------------------------------------------------

fn pad(depth: usize) -> String { "  ".repeat(depth) }

/// Indent all lines of `text` by `prefix`, except completely empty lines.
fn indent(text: &str, prefix: &str) -> String {
    text.lines().map(|line| {
        if line.is_empty() { String::new() } else { format!("{}{}", prefix, line) }
    }).collect::<Vec<_>>().join("\n")
}

fn display_type(ty: &Type) -> String {
    match ty {
        Type::Named(n) => {
            let mut s = n.name.name.clone();
            if let Some(args) = &n.args {
                let inner: Vec<String> = args.iter().map(|a| match a {
                    TypeArg::Type(t) => display_type(t),
                    TypeArg::Const(c) => c.to_string(),
                }).collect();
                s.push_str(&format!("({})", inner.join(", ")));
            }
            s
        }
        Type::Fun(f) => {
            let params: Vec<String> = f.params.iter().map(|p| display_type(&p.ty)).collect();
            if let Some(ret) = &f.return_ty {
                if f.is_io {
                    format!("({}) -> IO({})", params.join(", "), display_type(ret))
                } else {
                    format!("({}) -> {}", params.join(", "), display_type(ret))
                }
            } else {
                format!("({}) -> Unit", params.join(", "))
            }
        }
        Type::Tuple(t) => {
            let inner: Vec<String> = t.elements.iter().map(display_type).collect();
            format!("({})", inner.join(", "))
        }
        Type::Array(a) => format!("[{}; {}]", display_type(&a.element), a.size),
        Type::Wildcard(_) => "_".to_string(),
        Type::TypeOf(t) => format!("typeof({})", display_expr(&t.expr, 0)),
    }
}

fn display_pattern(pat: &Pattern) -> String {
    match pat {
        Pattern::Wildcard(_) => "_".to_string(),
        Pattern::Var(ident) => ident.name.clone(),
        Pattern::Lit(l) => display_lit_value(&l.value),
        Pattern::Struct(s) => {
            let fields: Vec<String> = s.fields.iter().map(|f| match f {
                PatternField::Shorthand { name, .. } => name.name.clone(),
                PatternField::Rename { field, var, .. } => format!("{}: {}", field.name, var.name),
            }).collect();
            let rest = if s.has_rest { ", ..".to_string() } else { String::new() };
            format!("{} {{ {}{} }}", s.name.name, fields.join(", "), rest)
        }
        Pattern::Variant(v) => {
            let payload: Vec<String> = v.payload.iter().map(display_pattern).collect();
            if payload.is_empty() {
                v.name.name.clone()
            } else {
                format!("{}({})", v.name.name, payload.join(", "))
            }
        }
        Pattern::Tuple(t) => {
            let inner: Vec<String> = t.elements.iter().map(display_pattern).collect();
            format!("({})", inner.join(", "))
        }
    }
}

fn display_lit_value(lit: &LitValue) -> String {
    match lit {
        LitValue::Int(n) => n.to_string(),
        LitValue::Bool(b) => b.to_string(),
        LitValue::Char(c) => format!("'{}'", c),
    }
}

/// Render an expression as Dew source text.
/// 
/// Convention: the first line is NOT indented (the caller adds its own prefix).
/// Subsequent lines are indented at `depth` (via `pad(depth)`) so the caller
/// can indent ALL lines uniformly by prepending its prefix to every line.
fn display_expr(expr: &Expr, depth: usize) -> String {
    match expr {
        Expr::IntLit(l) => l.value.to_string(),
        Expr::BoolLit(l) => l.value.to_string(),
        Expr::CharLit(l) => {
            let ch = l.value;
            let s = match ch {
                '\n' => "\\n".to_string(),
                '\r' => "\\r".to_string(),
                '\t' => "\\t".to_string(),
                '\\' => "\\\\".to_string(),
                '\'' => "\\'".to_string(),
                c if c.is_ascii_control() => format!("\\x{:02x}", c as u8),
                c => c.to_string(),
            };
            format!("'{}'", s)
        }
        Expr::UnitLit(_) => "Unit".to_string(),
        Expr::Var(ident) => ident.name.clone(),

        Expr::Binary(b) => {
            let op = match b.op {
                BinaryOp::Add => "+", BinaryOp::Sub => "-", BinaryOp::Mul => "*",
                BinaryOp::Div => "/", BinaryOp::Rem => "%", BinaryOp::Lt => "<",
                BinaryOp::Gt => ">", BinaryOp::Le => "<=", BinaryOp::Ge => ">=",
                BinaryOp::Eq => "==", BinaryOp::Ne => "!=", BinaryOp::And => "&&",
                BinaryOp::Or => "||", BinaryOp::BitAnd => "&", BinaryOp::BitOr => "|",
                BinaryOp::BitXor => "^", BinaryOp::Shl => "<<", BinaryOp::Shr => ">>",
            };
            format!("({} {} {})", display_expr(&b.left, depth), op, display_expr(&b.right, depth))
        }
        Expr::Unary(u) => {
            let op = match u.op {
                UnaryOp::Neg => "-",
                UnaryOp::Not => "not ",
            };
            format!("{}{}", op, display_expr(&u.expr, depth))
        }
        Expr::Fn(f) => {
            let params: Vec<String> = f.params.iter().map(|p| {
                let ty = p.ty.as_ref().map(|t| display_type(t)).unwrap_or_default();
                if p.is_borrow {
                    format!("&{}: {}", p.name.name, ty)
                } else if !ty.is_empty() {
                    format!("{}: {}", p.name.name, ty)
                } else {
                    p.name.name.clone()
                }
            }).collect();
            let ret = f.return_ty.as_ref().map(|t| format!(" -> {}", display_type(t))).unwrap_or_default();
            let body = display_expr(&f.body, depth + 1);
            format!("fn({}){} {{\n{}\n{}}}", params.join(", "), ret, indent(&body, &pad(depth + 1)), pad(depth))
        }
        Expr::Call(c) => {
            let args: Vec<String> = c.args.iter().map(|a| match a {
                ExprArg::Value(e) => display_expr(e, depth),
                ExprArg::Borrow(b) => display_borrow_expr(b),
            }).collect();
            format!("{}({})", display_expr(&c.func, depth), args.join(", "))
        }
        Expr::Match(m) => {
            let scrutinee = display_expr(&m.scrutinee, depth);
            let arms: Vec<String> = m.arms.iter().map(|arm| {
                let pat = display_pattern(&arm.pattern);
                let body = display_expr(&arm.body, depth + 1);
                if body.contains('\n') {
                    format!("{}{} =>\n{}", pad(depth), pat, indent(&body, &pad(depth + 1)))
                } else {
                    format!("{}{} => {}", pad(depth), pat, body)
                }
            }).collect();
            format!("match {} {{\n{}\n{}}}", scrutinee, arms.join(",\n"), pad(depth))
        }
        Expr::Block(b) => {
            let mut out = String::new();
            let has_final = b.final_expr.is_some();
            for (idx, stmt) in b.stmts.iter().enumerate() {
                if idx > 0 { out.push('\n'); }
                if stmt.def.is_some() {
                    if let Some(ref def) = stmt.def {
                        let rec = if def.rec { " rec" } else { "" };
                        let destr = def.destructure.as_ref().map(|d| {
                            let pats: Vec<String> = d.iter().map(|id| id.name.clone()).collect();
                            format!("({})", pats.join(", "))
                        }).unwrap_or_default();
                        let name = def.name.name.clone();
                        out.push_str(&format!("def{}{} = {}", rec,
                            if destr.is_empty() { format!(" {}", name) } else { format!(" {}", destr) },
                            display_expr(&stmt.expr, depth)));
                    }
                } else {
                    out.push_str(&display_expr(&stmt.expr, depth));
                }
            }
            if let Some(fe) = &b.final_expr {
                if out.is_empty() {
                    return display_expr(fe, depth);
                }
                out.push_str(&format!("\n{}", display_expr(fe, depth)));
            } else if b.stmts.is_empty() && !has_final {
                return "Unit".to_string();
            }
            out
        }
        Expr::If(i) => {
            let cond = display_expr(&i.condition, depth);
            let then_body = display_expr(&i.then_branch, depth + 1);
            let mut out = format!("if ({}) {{\n{}\n{}}}", cond, indent(&then_body, &pad(depth + 1)), pad(depth));
            if let Some(eb) = &i.else_branch {
                let else_body = display_expr(eb, depth + 1);
                out.push_str(&format!(" else {{\n{}\n{}}}", indent(&else_body, &pad(depth + 1)), pad(depth)));
            }
            out
        }
        Expr::Pipeline(pi) => {
            format!("{} -> {}", display_expr(&pi.value, depth), display_expr(&pi.func, depth))
        }
        Expr::Borrow(b) => display_borrow_expr(b),
        Expr::Field(f) => format!("{}.{}", display_expr(&f.object, depth), f.field.name),
        Expr::Subscript(s) => format!("{}[{}]", display_expr(&s.array, depth), display_expr(&s.index, depth)),
        Expr::Update(u) => {
            let updates: Vec<String> = u.updates.iter().map(|up| match up {
                UpdateField::NamedField { name, value, .. } =>
                    format!(".{} = {}", name.name, display_expr(value, depth)),
                UpdateField::ArrayIndex { index, value, .. } =>
                    format!("[{}] = {}", display_expr(index, depth), display_expr(value, depth)),
                UpdateField::TupleIndex { index, value, .. } =>
                    format!(".{} = {}", index, display_expr(value, depth)),
            }).collect();
            format!("{} {{ {} }}", display_expr(&u.base, depth), updates.join(", "))
        }
        Expr::TupleLit(t) => {
            let inner: Vec<String> = t.elements.iter().map(|e| display_expr(e, depth)).collect();
            format!("({})", inner.join(", "))
        }
        Expr::StructLit(s) => {
            let fields: Vec<String> = s.fields.iter().map(|f| {
                if let Some(val) = &f.value {
                    if let Expr::Var(ident) = val {
                        if ident.name == f.name.name {
                            return f.name.name.clone();
                        }
                    }
                    format!("{}: {}", f.name.name, display_expr(val, depth))
                } else {
                    f.name.name.clone()
                }
            }).collect();
            format!("{}({})", s.name.name, fields.join(", "))
        }
        Expr::EnumLit(e) => {
            match &e.payload {
                EnumPayload::Single(exprs) => {
                    let inner: Vec<String> = exprs.iter().map(|e| display_expr(e.as_ref(), depth)).collect();
                    format!("{}({})", e.name.name, inner.join(", "))
                }
                EnumPayload::Struct(fields) => {
                    let inner: Vec<String> = fields.iter().map(|f| {
                        if let Some(val) = &f.value {
                            format!("{}: {}", f.name.name, display_expr(val, depth))
                        } else {
                            f.name.name.clone()
                        }
                    }).collect();
                    format!("{} {{ {} }}", e.name.name, inner.join(", "))
                }
            }
        }
        Expr::ArrayLit(a) => {
            let inner: Vec<String> = a.elements.iter().map(|e| display_expr(e, depth)).collect();
            format!("[{}]", inner.join(", "))
        }
        Expr::ArrayFill(a) => {
            format!("[{}; {}]", display_expr(&a.value, depth), a.count)
        }
        Expr::Fix(fx) => {
            let name = if fx.loop_var.name.starts_with('%') {
                fx.loop_var.name.clone()
            } else {
                format!("%{}", fx.loop_var.name)
            };
            let body = display_expr(&fx.body, depth);
            format!("fix {} = {}", name, body)
        }
        Expr::While(w) => {
            let vars: Vec<String> = w.borrow_vars.iter().map(|v| format!("&{}", v.name)).collect();
            let cond = display_expr(&w.condition, depth);
            let body = display_expr(&w.body, depth + 1);
            if vars.is_empty() {
                format!("while ({}) {{\n{}\n{}}}", cond, indent(&body, &pad(depth + 1)), pad(depth))
            } else {
                format!("while ({}; {}) {{\n{}\n{}}}", vars.join(", "), cond, indent(&body, &pad(depth + 1)), pad(depth))
            }
        }
        Expr::Loop(l) => {
            let body = display_expr(&l.body, depth + 1);
            format!("forever {{\n{}\n{}}}", indent(&body, &pad(depth + 1)), pad(depth))
        }
        Expr::ForIn(fi) => {
            let body = display_expr(&fi.body, depth + 1);
            format!("for {} : {} {{\n{}\n{}}}", fi.var.name, display_expr(&fi.collection, depth), indent(&body, &pad(depth + 1)), pad(depth))
        }
        Expr::Cast(c) => {
            format!("({} as {})", display_expr(&c.expr, depth), display_type(&c.target_ty))
        }
        Expr::Force(fo) => {
            format!("!{}", display_expr(&fo.expr, depth))
        }
    }
}

fn display_borrow_expr(b: &BorrowExpr) -> String {
    let lv = display_lvalue(&b.lvalue);
    match &b.rhs {
        Some(rhs) => match &**rhs {
            BorrowRhs::Assign(e) => format!("&{} = {}", lv, display_expr(e, 0)),
            BorrowRhs::Update(updates) => {
                let ups: Vec<String> = updates.iter().map(|u| match u {
                    UpdateField::NamedField { name, value, .. } =>
                        format!("{} = {}", name.name, display_expr(value, 0)),
                    UpdateField::ArrayIndex { index, value, .. } =>
                        format!("[{}] = {}", display_expr(index, 0), display_expr(value, 0)),
                    UpdateField::TupleIndex { index, value, .. } =>
                        format!(".{} = {}", index, display_expr(value, 0)),
                }).collect();
                format!("&{} {{ {} }}", lv, ups.join(", "))
            }
        },
        None => format!("&{}", lv),
    }
}

fn display_lvalue(lv: &LValue) -> String {
    let mut s = lv.root.name.clone();
    for seg in &lv.path {
        match seg {
            LValueAccessor::Field(ident) => s.push_str(&format!(".{}", ident.name)),
            LValueAccessor::Index(e) => s.push_str(&format!("[{}]", display_expr(e, 0))),
            LValueAccessor::TupleIndex(i) => s.push_str(&format!(".{}", i)),
        }
    }
    s
}

pub fn display_program(prog: &Program) -> String {
    let mut out = String::new();
    for decl in &prog.decls {
        match decl {
            Decl::Def(d) => {
                let rec = if d.rec { " rec" } else { "" };
                let destr = d.destructure.as_ref().map(|d| {
                    let pats: Vec<String> = d.iter().map(|id| id.name.clone()).collect();
                    format!("({})", pats.join(", "))
                }).unwrap_or_default();
                let name = d.name.name.clone();
                let ty = d.ty.as_ref().map(|t| format!(": {}", display_type(t))).unwrap_or_default();
                let value = display_expr(&d.value, 0);
                out.push_str(&format!("def{}{}{} = {};\n\n", rec, if destr.is_empty() { format!(" {}", name) } else { format!(" {}", destr) }, ty, value));
            }
            Decl::Struct(s) => {
                out.push_str(&format!("struct {} {{\n", s.name.name));
                for field in &s.fields {
                    out.push_str(&format!("  {}: {},\n", field.name.name, display_type(&field.ty)));
                }
                out.push_str("}\n\n");
            }
            Decl::Enum(e) => {
                let attrs: String = e.attrs.iter().map(|a| match a {
                    Attr::Affine => "#[affine]\n".to_string(),
                }).collect();
                out.push_str(&format!("{}enum {} {{\n", attrs, e.name.name));
                for variant in &e.variants {
                    match variant {
                        Variant::Single { name, payload, .. } => {
                            let inner: Vec<String> = payload.iter().map(display_type).collect();
                            out.push_str(&format!("  {}({}),\n", name.name, inner.join(", ")));
                        }
                        Variant::Struct { name, fields, .. } => {
                            let inner: Vec<String> = fields.iter().map(|f| format!("{}: {}", f.name.name, display_type(&f.ty))).collect();
                            out.push_str(&format!("  {} {{ {} }},\n", name.name, inner.join(", ")));
                        }
                        Variant::Unit { name, .. } => {
                            out.push_str(&format!("  {},\n", name.name));
                        }
                    }
                }
                out.push_str("}\n\n");
            }
            Decl::Import(i) => {
                out.push_str(&format!("import {};\n\n", i.path));
            }
        }
    }
    out
}
