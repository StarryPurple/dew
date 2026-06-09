/// Flat SSA-like IR for Dew.
///
/// All arguments are atoms (temporaries or immediates). Every sub-expression
/// is named. Functions and thunks are separate entities with their own
/// instruction lists. Control flow uses explicit basic blocks and branches.
///
/// This is the IR you'd translate to assembly — flat, explicit, block-structured.

use serde::Serialize;
use std::fmt;

// ── Core types ─────────────────────────────────────────────────────────

#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct Module {
    pub functions: Vec<Function>,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct Function {
    pub name: String,
    pub kind: FnKind,
    pub params: Vec<String>,
    pub captures: Vec<String>,
    pub blocks: Vec<BasicBlock>,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub enum FnKind {
    /// Regular function / closure.
    UserFn,
    /// Lazy thunk (memoized on force).
    Thunk,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct BasicBlock {
    pub label: String,
    pub instructions: Vec<Instruction>,
    pub terminator: Terminator,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct Instruction {
    pub dest: String,
    pub op: Op,
    pub args: Vec<Arg>,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
#[serde(tag = "kind")]
pub enum Terminator {
    /// Return a value from the function.
    Ret { arg: Arg },
    /// Conditional branch: if arg is true, go to true_label.
    Branch { cond: Arg, true_label: String, false_label: String },
    /// Unconditional jump.
    Jump { label: String },
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
#[serde(untagged)]
pub enum Arg {
    Temp(String),
    Lit(i64),
    LitBool(bool),
    LitUnit,
    LitNil,
}

// ── Operations ──────────────────────────────────────────────────────────

#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub enum Op {
    // ── Data ──
    #[serde(rename = "lit")]
    Lit,
    #[serde(rename = "move")]
    Move,

    // ── Arithmetic ──
    #[serde(rename = "add")] Add,
    #[serde(rename = "sub")] Sub,
    #[serde(rename = "mul")] Mul,
    #[serde(rename = "div")] Div,
    #[serde(rename = "eq")] Eq,
    #[serde(rename = "lt")] Lt,
    #[serde(rename = "gt")] Gt,

    // ── Functions ──
    /// Create a closure value (code pointer + captured env).
    #[serde(rename = "closure")]
    Closure,
    /// Call a function with one argument.
    #[serde(rename = "call")]
    Call,

    // ── Thunks ──
    /// Allocate a lazy thunk.
    #[serde(rename = "thunk_alloc")]
    ThunkAlloc,
    /// Force a thunk to get its value.
    #[serde(rename = "thunk_force")]
    ThunkForce,

    // ── Box ──
    #[serde(rename = "box")] Alloc,
    #[serde(rename = "unbox")] Dealloc,

    // ── Lists ──
    #[serde(rename = "cons")] Cons,
    #[serde(rename = "head")] Head,
    #[serde(rename = "tail")] Tail,
    #[serde(rename = "isnil")] IsNil,

    // ── Misc ──
    #[serde(rename = "dup")]
    Dup,
}

// ── Display (text IR, LLVM-style) ──────────────────────────────────────

impl fmt::Display for Module {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        for func in &self.functions {
            write!(f, "{func}")?;
        }
        Ok(())
    }
}

impl fmt::Display for Function {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let kind_str = match self.kind {
            FnKind::UserFn => "func",
            FnKind::Thunk => "thunk",
        };
        let params_str = self.params.join(", ");
        let captures_str = if self.captures.is_empty() {
            String::new()
        } else {
            format!(" [captures: {}]", self.captures.join(", "))
        };
        writeln!(f, "{kind_str} {}({params_str}){captures_str}:", self.name)?;
        for block in &self.blocks {
            write!(f, "{block}")?;
        }
        writeln!(f)
    }
}

impl fmt::Display for BasicBlock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        writeln!(f, "  {}:", self.label)?;
        for inst in &self.instructions {
            writeln!(f, "    {inst}")?;
        }
        writeln!(f, "    {term}", term = self.terminator)
    }
}

impl fmt::Display for Instruction {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let args_str = self.args.iter().map(|a| a.to_string()).collect::<Vec<_>>().join(", ");
        let op_str = self.op.to_string();
        if args_str.is_empty() {
            write!(f, "{} = {op_str}", self.dest)
        } else {
            write!(f, "{} = {op_str} {args_str}", self.dest)
        }
    }
}

impl fmt::Display for Op {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Op::Lit => write!(f, "lit"),
            Op::Move => write!(f, "move"),
            Op::Add => write!(f, "add"),
            Op::Sub => write!(f, "sub"),
            Op::Mul => write!(f, "mul"),
            Op::Div => write!(f, "div"),
            Op::Eq => write!(f, "eq"),
            Op::Lt => write!(f, "lt"),
            Op::Gt => write!(f, "gt"),
            Op::Closure => write!(f, "closure"),
            Op::Call => write!(f, "call"),
            Op::ThunkAlloc => write!(f, "thunk_alloc"),
            Op::ThunkForce => write!(f, "thunk_force"),
            Op::Alloc => write!(f, "box"),
            Op::Dealloc => write!(f, "unbox"),
            Op::Cons => write!(f, "cons"),
            Op::Head => write!(f, "head"),
            Op::Tail => write!(f, "tail"),
            Op::IsNil => write!(f, "isnil"),
            Op::Dup => write!(f, "dup"),
        }
    }
}

impl fmt::Display for Terminator {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Terminator::Ret { arg } => {
                if let Arg::LitUnit = arg {
                    write!(f, "ret")
                } else {
                    write!(f, "ret {arg}")
                }
            }
            Terminator::Branch { cond, true_label, false_label } => {
                write!(f, "branch {cond}, {true_label}, {false_label}")
            }
            Terminator::Jump { label } => write!(f, "jump {label}"),
        }
    }
}

impl fmt::Display for Arg {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Arg::Temp(s) => write!(f, "{s}"),
            Arg::Lit(n) => write!(f, "{n}"),
            Arg::LitBool(b) => write!(f, "{b}"),
            Arg::LitUnit => write!(f, "()"),
            Arg::LitNil => write!(f, "nil"),
        }
    }
}
