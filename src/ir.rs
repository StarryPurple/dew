// Thunk Graph IR v2 — flat, SSA-like, LLVM-inspired
//
// Three levels:
//   Module    — ordered list of top-level items
//   Thunk     — named entity with basic blocks (like an LLVM function)
//   Instr     — flat single-operation instruction within a block
//
// Text format: 2-space indent, %r = op args, snake_case keywords.

use serde::{Deserialize, Serialize};
use std::fmt;

#[derive(Debug, Clone, PartialEq, Eq, Hash, Serialize, Deserialize)]
pub enum Ty { Int, Bool, Char, Unit, Named(String), Fun(Box<Ty>, Box<Ty>), Tuple(Vec<Ty>), Array(Box<Ty>, usize) }
impl fmt::Display for Ty { fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result { match self { Ty::Int=>write!(f,"Int"),Ty::Bool=>write!(f,"Bool"),Ty::Char=>write!(f,"Char"),Ty::Unit=>write!(f,"Unit"),Ty::Named(n)=>write!(f,"{n}"),Ty::Fun(a,r)=>write!(f,"{a}->{r}"),Ty::Tuple(ts)=>{write!(f,"(")?;for(i,t)in ts.iter().enumerate(){if i>0{write!(f,", ")?}write!(f,"{t}")?}write!(f,")")},Ty::Array(t,n)=>write!(f,"Array({t},{n})") } } }
impl Ty { pub const fn void() -> Self { Ty::Unit } }

// ── Register ──────────────────────────────────────────────

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Serialize, Deserialize)]
pub struct Reg(pub usize);

impl fmt::Display for Reg {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    write!(f, "%{}", self.0)
  }
}

// ── Module ────────────────────────────────────────────────

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Module {
  pub items: Vec<Item>,
}

impl Module {
  pub fn new() -> Self { Self { items: vec![] } }
  pub fn push(&mut self, item: Item) { self.items.push(item); }
  pub fn to_json(&self) -> String { serde_json::to_string(self).unwrap_or_default() }
}

// ── Top-level Items ──────────────────────────────────────

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Item {
  Thunk(Thunk),
  Alloc(Label),
  ThunkDef { label: Label, thunk: String },
  Force { dest: Label, src: Label },
  Update { label: Label, value: ValueRef },
  Def { name: String, label: Label },
  StrictDef { name: String, blocks: Vec<BasicBlock> },
}

// ── Label ─────────────────────────────────────────────────

#[derive(Debug, Clone, PartialEq, Eq, Hash, Serialize, Deserialize)]
pub struct Label(pub String);

impl Label {
  pub fn new(id: usize) -> Self { Self(format!("t{id}")) }
}

impl fmt::Display for Label {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    write!(f, "%{}", self.0)
  }
}

// ── Thunk ─────────────────────────────────────────────────

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Thunk {
  pub name: String,
  pub params: Vec<(String, Ty)>,
  pub ret_ty: Ty,
  pub blocks: Vec<BasicBlock>,
}

// ── Basic Block ───────────────────────────────────────────

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BasicBlock {
  pub label: String,
  pub instrs: Vec<Instr>,
  pub term: Terminator,
}

// ── Instructions ──────────────────────────────────────────

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Instr {
  Lit { dest: Reg, value: Lit },
  Var { dest: Reg, name: String },
  Ref { dest: Reg, label: String },
  Lambda { dest: Reg, thunk: String, param_tys: Vec<(String, Ty)>, ret_ty: Ty },
  LambdaBlock { dest: Reg, params: Vec<String>, blocks: Vec<BasicBlock> },
  Bind { name: String, value: Reg },
  Prim { dest: Reg, op: PrimOp, lhs: Reg, rhs: Reg },
  Call { dest: Reg, func: Reg, args: Vec<Reg> },
  Field { dest: Reg, expr: Reg, field: String },
  StructCons { dest: Reg, name: String, fields: Vec<Reg> },
  EnumCons { dest: Reg, enum_name: String, variant: String, payload: Option<Reg> },
  ArrayLit { dest: Reg, elements: Vec<Reg> },
  TupleLit { dest: Reg, elements: Vec<Reg> },
  StructUpdate { dest: Reg, expr: Reg, updates: Vec<(String, Reg)> },
  ArrayAccess { dest: Reg, expr: Reg, index: Reg },
  ArrayUpdate { dest: Reg, expr: Reg, index: Reg, value: Reg },
  TupleUpdate { dest: Reg, expr: Reg, index: usize, value: Reg },
  Not { dest: Reg, arg: Reg },
}

// ── Terminators ───────────────────────────────────────────

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Terminator {
  Ret(Reg),
  Br { cond: Reg, then_label: String, else_label: String },
  Jmp(String),
}

// ── Supporting types ──────────────────────────────────────

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum ValueRef {
  Lit(Lit),
  Label(Label),
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Lit {
  Int(i64),
  Bool(bool),
  Char(char),
  Unit,
}

#[derive(Debug, Clone, Copy, Serialize, Deserialize)]
pub enum PrimOp {
  Add, Sub, Mul, Div, Rem,
  Lt, Gt, Le, Ge,
  Eq, Ne,
  And, Or,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum Pattern {
  Wildcard,
  Var(String),
  Lit(Lit),
  Struct(String, Vec<Pattern>),
  EnumVariant(String, Option<Box<Pattern>>),
  Tuple(Vec<Pattern>),
}

// ── Context for generating fresh registers ────────────────

pub struct GenCtx {
  pub next_reg: usize,
  pub next_label: usize,
}

impl GenCtx {
  pub fn new() -> Self { Self { next_reg: 0, next_label: 0 } }

  pub fn fresh_reg(&mut self) -> Reg {
    let r = Reg(self.next_reg);
    self.next_reg += 1;
    r
  }

  pub fn fresh_label(&mut self) -> Label {
    let l = Label::new(self.next_label);
    self.next_label += 1;
    l
  }

  pub fn fresh_block_label(&mut self) -> String {
    let l = format!("L{}", self.next_label);
    self.next_label += 1;
    l
  }

  pub fn fresh_block(&mut self, label: String) -> BasicBlock {
    BasicBlock { label, instrs: vec![], term: Terminator::Jmp("__unreachable".into()) }
  }
}

// ── Display ────────────────────────────────────────────────

impl fmt::Display for Module {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    for item in &self.items {
      write!(f, "{item}")?;
    }
    Ok(())
  }
}

impl fmt::Display for Item {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    match self {
      Item::Thunk(thunk) => write!(f, "{thunk}"),
      Item::Alloc(label) => writeln!(f, "alloc {label}"),
      Item::ThunkDef { label, thunk } => writeln!(f, "thunk_def {label} @{thunk}"),
      Item::Force { dest, src } => writeln!(f, "force {dest} {src}"),
      Item::Update { label, value } => writeln!(f, "update {label} {value}"),
      Item::Def { name, label } => writeln!(f, "def {name} {label}"),
      Item::StrictDef { name, blocks } => {
        writeln!(f, "strict_def {name} {{")?;
        for block in blocks { write_block(f, block, 1)?; }
        writeln!(f, "}}")
      }
    }
  }
}

impl fmt::Display for Thunk {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    write!(f, "thunk @{}", self.name)?;
    if !self.params.is_empty() {
      write!(f, "(")?;
      for (i, (n, t)) in self.params.iter().enumerate() {
        if i > 0 { write!(f, ", ")?; }
        write!(f, "{n}: {t}")?;
      }
      write!(f, ")")?;
    }
    writeln!(f, " {{")?;
    for block in &self.blocks {
      write_block(f, block, 1)?;
    }
    writeln!(f, "}}")
  }
}

fn write_block(f: &mut fmt::Formatter<'_>, block: &BasicBlock, indent: usize) -> fmt::Result {
  let pad = "  ".repeat(indent);
  writeln!(f, "{pad}{}:", block.label)?;
  for instr in &block.instrs {
    writeln!(f, "{pad}  {instr}")?;
  }
  writeln!(f, "{pad}  {term}", term = block.term)?;
  Ok(())
}

impl fmt::Display for Instr {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    match self {
      Instr::Lit { dest, value } => write!(f, "{dest} = lit {value}"),
      Instr::Var { dest, name } => write!(f, "{dest} = var @{name}"),
      Instr::Ref { dest, label } => write!(f, "{dest} = ref %{label}"),
      Instr::Lambda { dest, thunk, param_tys, .. } => {
        let pstr: Vec<String> = param_tys.iter().map(|(n, t)| format!("{n}: {t}")).collect();
        write!(f, "{dest} = lambda @{thunk}({})", pstr.join(", "))
      }
      Instr::LambdaBlock { dest, params, blocks } => {
        let pstr = params.join(", ");
        writeln!(f, "{dest} = lambda({pstr}) {{")?;
        for block in blocks { write_block(f, block, 1)?; }
        write!(f, "}}")
      }
      Instr::Bind { name, value } => write!(f, "bind @{name} {value}"),
      Instr::Prim { dest, op, lhs, rhs } => write!(f, "{dest} = prim {op} {lhs} {rhs}"),
      Instr::Call { dest, func, args } => {
        write!(f, "{dest} = call {func}")?;
        for a in args { write!(f, " {a}")?; }
        Ok(())
      }
      Instr::Field { dest, expr, field } => write!(f, "{dest} = field {expr} .{field}"),
      Instr::StructCons { dest, name, fields } => {
        write!(f, "{dest} = struct @{name}")?;
        for r in fields { write!(f, " {r}")?; }
        Ok(())
      }
      Instr::EnumCons { dest, enum_name, variant, payload } => {
        write!(f, "{dest} = enum @{enum_name}::{variant}")?;
        if let Some(p) = payload { write!(f, " {p}")?; }
        Ok(())
      }
      Instr::ArrayLit { dest, elements } => {
        write!(f, "{dest} = array")?;
        for r in elements { write!(f, " {r}")?; }
        Ok(())
      }
      Instr::TupleLit { dest, elements } => {
        write!(f, "{dest} = tuple")?;
        for r in elements { write!(f, " {r}")?; }
        Ok(())
      }
      Instr::StructUpdate { dest, expr, updates } => {
        write!(f, "{dest} = struct_update {expr}")?;
        for (field, r) in updates { write!(f, " .{field}={r}")?; }
        Ok(())
      }
      Instr::ArrayAccess { dest, expr, index } => write!(f, "{dest} = array_access {expr} {index}"),
      Instr::ArrayUpdate { dest, expr, index, value } => write!(f, "{dest} = array_update {expr} {index} {value}"),
      Instr::TupleUpdate { dest, expr, index, value } => write!(f, "{dest} = tuple_update {expr} {index} {value}"),
      Instr::Not { dest, arg } => write!(f, "{dest} = not {arg}"),
    }
  }
}

impl fmt::Display for Terminator {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    match self {
      Terminator::Ret(r) => write!(f, "ret {r}"),
      Terminator::Br { cond, then_label, else_label } => write!(f, "br {cond} {then_label} {else_label}"),
      Terminator::Jmp(label) => write!(f, "jmp {label}"),
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
      Lit::Unit => write!(f, "unit"),
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
    }
  }
}
