// Thunk Graph IR — flat, label-based lazy evaluation IR
//
// Primitives:
//   ThunkAlloc  — allocate thunk cell (→ Suspended)
//   ThunkDef    — define thunk computation body
//   Force       — force evaluation (3-state FSM)
//   Update      — memoize result into thunk
//   Blackhole   — mark Evaluating (cycle detection)
//   Def         — top-level name binding
//
// 2-space indent for text output. No JSON serialization.

use std::fmt;

// ── Label ─────────────────────────────────────────────────

/// Identifies a thunk node in the graph
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct Label(pub String);

impl Label {
  pub fn new(id: usize) -> Self {
    Self(format!("t{id}"))
  }
}

impl fmt::Display for Label {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    write!(f, "%{}", self.0)
  }
}

// ── Module ────────────────────────────────────────────────

/// Top-level IR module: ordered list of graph nodes
#[derive(Debug, Clone)]
pub struct Module {
  pub nodes: Vec<Node>,
}

impl Module {
  pub fn new() -> Self {
    Self { nodes: vec![] }
  }

  pub fn push(&mut self, node: Node) {
    self.nodes.push(node);
  }
}

// ── Nodes ─────────────────────────────────────────────────

#[derive(Debug, Clone)]
pub enum Node {
  /// Allocate thunk cell on heap: %t = ThunkAlloc
  ThunkAlloc { label: Label },
  /// Define thunk computation body: Thunk %t { ... }
  ThunkDef { label: Label, body: Ir },
  /// Force evaluation: %r = Force %t
  Force { label: Label, target: Label },
  /// Memoize result: Update %t, Val
  Update { label: Label, value: ValueRef },
  /// Mark evaluating: Blackhole %t
  Blackhole { label: Label },
  /// Top-level binding: Def "name" %t
  Def { name: String, label: Label },
  /// Strict top-level binding (IO/FFI): StrictDef "name" { ... }
  StrictDef { name: String, value: Ir },
}

// ── IR expressions (inside thunk bodies) ──────────────────

#[derive(Debug, Clone)]
pub enum Ir {
  Lit(Lit),
  Ref(Label),
  Var(String),
  Lambda { params: Vec<String>, body: Box<Ir> },
  Apply { func: Box<Ir>, args: Vec<Ir> },
  Let { name: String, value: Box<Ir>, body: Box<Ir> },
  If { cond: Box<Ir>, then: Box<Ir>, else_: Box<Ir> },
  Prim { op: PrimOp, args: Vec<Ir> },
  Struct { name: String, fields: Vec<Ir> },
  FieldAccess { expr: Box<Ir>, field: String },
  StructUpdate { expr: Box<Ir>, updates: Vec<(String, Ir)> },
  EnumVariant { enum_name: String, variant: String, payload: Option<Box<Ir>> },
  Match { scrutinee: Box<Ir>, arms: Vec<(Pattern, Ir)> },
  Array(Vec<Ir>),
  ArrayAccess { expr: Box<Ir>, index: Box<Ir> },
  ArrayUpdate { expr: Box<Ir>, index: Box<Ir>, value: Box<Ir> },
  Tuple(Vec<Ir>),
  TupleUpdate { expr: Box<Ir>, index: usize, value: Box<Ir> },
  Return(Box<Ir>),
  Fix { name: String, body: Box<Ir> },
}

// ── Supporting types ──────────────────────────────────────

#[derive(Debug, Clone)]
pub enum ValueRef {
  Lit(Lit),
  Label(Label),
}

#[derive(Debug, Clone)]
pub enum Lit {
  Int(i64),
  Bool(bool),
  Char(char),
  Unit,
}

#[derive(Debug, Clone, Copy)]
pub enum PrimOp {
  Add, Sub, Mul, Div, Rem,
  Lt, Gt, Le, Ge,
  Eq, Ne,
  And, Or,
  Not,
}

#[derive(Debug, Clone)]
pub enum Pattern {
  Wildcard,
  Var(String),
  Lit(Lit),
  Struct(String, Vec<Pattern>),
  EnumVariant(String, Option<Box<Pattern>>),
  Tuple(Vec<Pattern>),
}

// ── Display (2-space indent) ───────────────────────────────

impl fmt::Display for Module {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    for node in &self.nodes {
      writeln!(f, "{node}")?;
    }
    Ok(())
  }
}

impl fmt::Display for Node {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    match self {
      Node::ThunkAlloc { label } =>
        write!(f, "{label} = ThunkAlloc"),
      Node::ThunkDef { label, body } =>
        write!(f, "Thunk {label} {{\n  {body}\n}}"),
      Node::Force { label, target } =>
        write!(f, "{label} = Force {target}"),
      Node::Update { label, value } =>
        write!(f, "Update {label}, {value}"),
      Node::Blackhole { label } =>
        write!(f, "Blackhole {label}"),
      Node::Def { name, label } =>
        write!(f, "Def \"{name}\" {label}"),
      Node::StrictDef { name, value } =>
        write!(f, "StrictDef \"{name}\" {{\n  {value}\n}}"),
    }
  }
}

impl fmt::Display for ValueRef {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    match self {
      ValueRef::Lit(lit) => write!(f, "{lit}"),
      ValueRef::Label(l) => write!(f, "{l}"),
    }
  }
}

impl fmt::Display for Lit {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    match self {
      Lit::Int(n) => write!(f, "{n}"),
      Lit::Bool(b) => write!(f, "{b}"),
      Lit::Char(c) => write!(f, "'{c}'"),
      Lit::Unit => write!(f, "Unit"),
    }
  }
}

impl fmt::Display for PrimOp {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    match self {
      PrimOp::Add => write!(f, "add"),
      PrimOp::Sub => write!(f, "sub"),
      PrimOp::Mul => write!(f, "mul"),
      PrimOp::Div => write!(f, "div"),
      PrimOp::Rem => write!(f, "rem"),
      PrimOp::Lt => write!(f, "lt"),
      PrimOp::Gt => write!(f, "gt"),
      PrimOp::Le => write!(f, "le"),
      PrimOp::Ge => write!(f, "ge"),
      PrimOp::Eq => write!(f, "eq"),
      PrimOp::Ne => write!(f, "ne"),
      PrimOp::And => write!(f, "and"),
      PrimOp::Or => write!(f, "or"),
      PrimOp::Not => write!(f, "not"),
    }
  }
}

impl fmt::Display for Ir {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    match self {
      Ir::Lit(lit) => write!(f, "Lit {lit}"),
      Ir::Ref(l) => write!(f, "Ref {l}"),
      Ir::Var(name) => write!(f, "%{name}"),
      Ir::Lambda { params, body } => {
        write!(f, "Lambda [{}] ", params.join(", "))?;
        write!(f, "{body}")
      }
      Ir::Apply { func, args } => {
        write!(f, "Apply {func}")?;
        for (i, a) in args.iter().enumerate() {
          if i == 0 { write!(f, " [")?; }
          else { write!(f, ", ")?; }
          write!(f, "{a}")?;
        }
        write!(f, "]")
      }
      Ir::Let { name, value, body } => {
        write!(f, "Let {name} = {value}")?;
        write!(f, " {body}")
      }
      Ir::If { cond, then, else_ } => {
        write!(f, "If {cond}")?;
        write!(f, " Then {then}")?;
        write!(f, " Else {else_}")
      }
      Ir::Prim { op, args } => {
        write!(f, "Prim {op}")?;
        for a in args { write!(f, " {a}")?; }
        Ok(())
      }
      Ir::Struct { name, fields } if fields.is_empty() =>
        write!(f, "Struct {name}"),
      Ir::Struct { name, fields } => {
        write!(f, "Struct {name} [")?;
        for (i, v) in fields.iter().enumerate() {
          if i > 0 { write!(f, ", ")?; }
          write!(f, "{v}")?;
        }
        write!(f, "]")
      }
      Ir::FieldAccess { expr, field } =>
        write!(f, "FieldAccess {expr} .{field}"),
      Ir::EnumVariant { enum_name, variant, payload } => {
        write!(f, "EnumVariant {enum_name}::{variant}")?;
        if let Some(p) = payload { write!(f, " {p}")?; }
        Ok(())
      }
      Ir::Array(items) => {
        write!(f, "Array [")?;
        for (i, v) in items.iter().enumerate() {
          if i > 0 { write!(f, ", ")?; }
          write!(f, "{v}")?;
        }
        write!(f, "]")
      }
      Ir::Tuple(items) => {
        write!(f, "Tuple [")?;
        for (i, v) in items.iter().enumerate() {
          if i > 0 { write!(f, ", ")?; }
          write!(f, "{v}")?;
        }
        write!(f, "]")
      }
      Ir::Return(inner) => write!(f, "Return {inner}"),
      Ir::Match { scrutinee, arms } => {
        write!(f, "Match {scrutinee} [")?;
        for (pat, body) in arms {
          write!(f, "  {pat} => {body}")?;
        }
        write!(f, "]")
      }
      Ir::Fix { name, body } =>
        write!(f, "Fix {name} {body}"),
      _ => write!(f, "<ir>"),
    }
  }
}

impl fmt::Display for Pattern {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    match self {
      Pattern::Wildcard => write!(f, "_"),
      Pattern::Var(name) => write!(f, "{name}"),
      Pattern::Lit(lit) => write!(f, "{lit}"),
      Pattern::Struct(name, fields) => {
        write!(f, "{name}(")?;
        for (i, p) in fields.iter().enumerate() {
          if i > 0 { write!(f, ", ")?; }
          write!(f, "{p}")?;
        }
        write!(f, ")")
      }
      Pattern::EnumVariant(name, payload) => {
        write!(f, "{name}")?;
        if let Some(p) = payload { write!(f, "({p})")?; }
        Ok(())
      }
      Pattern::Tuple(items) => {
        write!(f, "(")?;
        for (i, p) in items.iter().enumerate() {
          if i > 0 { write!(f, ", ")?; }
          write!(f, "{p}")?;
        }
        write!(f, ")")
      }
    }
  }
}
