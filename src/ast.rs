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
    pub condition: Box<Expr>,
    pub then_branch: Box<Expr>,
    /// `else` is always required
    pub else_branch: Box<Expr>,
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
    /// Array type: `Array(Int, 3)`
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
