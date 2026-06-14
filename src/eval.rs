// Evaluator for Thunk Graph IR v2
//
// Processes top-level Items, evaluates thunks by walking basic blocks,
// and uses a register file for SSA-like evaluation.

use crate::ir::*;
use crate::value::*;
use crate::diagnostics::DiagnosticCollector;
use std::collections::HashMap;
use std::io::{self, Write, BufRead};

enum ThunkState {
  Suspended { blocks: Option<Vec<BasicBlock>>, params: Option<Vec<String>> },
  Evaluating,
  Evaluated(Value),
}

pub struct Evaluator<'a> {
  env: Env,
  heap: HashMap<Label, ThunkState>,
  thunks: HashMap<String, (Vec<BasicBlock>, Vec<String>)>,  // thunk_name → (blocks, param_names)
  struct_fields: HashMap<String, Vec<String>>,
  diag: &'a mut DiagnosticCollector,
}

impl<'a> Evaluator<'a> {
  pub fn new(diag: &'a mut DiagnosticCollector) -> Self {
    Self {
      env: Env::new(),
      heap: HashMap::new(),
      thunks: HashMap::new(),
      struct_fields: HashMap::new(),
      diag,
    }
  }

  pub fn register_struct(&mut self, name: String, field_names: Vec<String>) {
    self.struct_fields.insert(name, field_names);
  }

  pub fn eval_module(&mut self, module: &Module) -> Result<(), String> {
    // First pass: collect thunk definitions
    for item in &module.items {
      if let Item::Thunk(thunk) = item {
        let param_names: Vec<String> = thunk.params.iter().map(|(n, _)| n.clone()).collect();
        self.thunks.insert(thunk.name.clone(), (thunk.blocks.clone(), param_names));
      }
    }
    // Second pass: process items in order
    for item in &module.items {
      self.process_item(item)?;
    }
    Ok(())
  }

  pub fn call_main(&mut self) -> Result<Value, String> {
    let main_val = self.env.get("main").cloned()
      .ok_or_else(|| "no main definition found".to_string())?;
    match main_val {
      Value::Closure { params, blocks, env } if params.is_empty() => {
        let saved = std::mem::replace(&mut self.env, env);
        let result = self.eval_blocks(&blocks, &[]);
        self.env = saved;
        result
      }
      other => Ok(other),
    }
  }

  fn process_item(&mut self, item: &Item) -> Result<(), String> {
    match item {
      Item::Alloc(label) => {
        self.heap.insert(label.clone(), ThunkState::Suspended { blocks: None, params: None });
        Ok(())
      }
      Item::Thunk(_) => Ok(()),  // Already collected in first pass
      Item::ThunkDef { label, thunk } => {
        match self.heap.get_mut(label) {
          Some(ThunkState::Suspended { blocks, params }) => {
            if let Some((b, p)) = self.thunks.get(thunk) {
              *blocks = Some(b.clone());
              *params = Some(p.clone());
            }
            Ok(())
          }
          _ => Err(format!("thunk_def on non-suspended thunk {label}")),
        }
      }
      Item::Force { dest, src } => {
        let val = self.force_thunk(src)?;
        self.env.insert(dest.0.clone(), val);
        Ok(())
      }
      Item::Update { label, value } => {
        let val = match value {
          ValueRef::Lit(lit) => lit_to_value(lit),
          ValueRef::Label(l) => self.env.get(&l.0).cloned().unwrap_or(Value::Unit),
        };
        match self.heap.get_mut(label) {
          Some(state) => { *state = ThunkState::Evaluated(val); Ok(()) }
          None => Err(format!("update on unknown thunk {label}")),
        }
      }
      Item::Def { name, label } => {
        let val = self.heap.get(label)
          .and_then(|s| match s { ThunkState::Evaluated(v) => Some(v.clone()), _ => None })
          .unwrap_or(Value::Unit);
        self.env.insert(name.clone(), val);
        Ok(())
      }
      Item::StrictDef { name, blocks } => {
        let result = self.eval_blocks(blocks, &[])?;
        self.env.insert(name.clone(), result);
        Ok(())
      }
    }
  }

  fn force_thunk(&mut self, label: &Label) -> Result<Value, String> {
    if let Some(ThunkState::Evaluated(v)) = self.heap.get(label) {
      return Ok(v.clone());
    }
    match self.heap.get(label) {
      Some(ThunkState::Evaluating) => return Err(format!("cyclic dependency at {label}")),
      Some(ThunkState::Suspended { .. }) => {}
      None => return Err(format!("unknown thunk {label}")),
      _ => {}
    }
    let (blocks, _params) = match self.heap.get(label) {
      Some(ThunkState::Suspended { blocks: Some(b), params: Some(p) }) => (b.clone(), p.clone()),
      _ => return Ok(Value::Unit),
    };
    self.heap.insert(label.clone(), ThunkState::Evaluating);
    let val = self.eval_blocks(&blocks, &[])?;
    self.heap.insert(label.clone(), ThunkState::Evaluated(val.clone()));
    Ok(val)
  }

  /// Evaluate a sequence of basic blocks starting from the first block.
  /// args: pre-bound argument values for parameter registers %0, %1, ...
  fn eval_blocks(&mut self, blocks: &[BasicBlock], args: &[Value]) -> Result<Value, String> {
    let mut regs: HashMap<usize, Value> = HashMap::new();
    let mut block_map: HashMap<&str, &BasicBlock> = HashMap::new();
    for b in blocks {
      block_map.insert(&b.label, b);
    }

    // Bind arguments to parameter registers (positional: %0 = first arg, etc.)
    for (i, arg) in args.iter().enumerate() {
      regs.insert(i, arg.clone());
    }

    // Find parameter names and bind them in env
    for (name, (b, param_names)) in &self.thunks {
      if b.len() == blocks.len() && b.first().map(|bb| &bb.label) == blocks.first().map(|bb| &bb.label) {
        for (i, pname) in param_names.iter().enumerate() {
          if i < args.len() {
            self.env.insert(pname.clone(), args[i].clone());
          }
        }
        break;
      }
    }

    let mut current_label = blocks.first().map(|b| b.label.as_str()).unwrap_or("entry");
    let mut result = Value::Unit;

    loop {
      let block = match block_map.get(current_label) {
        Some(b) => b,
        None => {
          // __unreachable or missing block — return unit
          return Ok(result);
        }
      };

      for instr in &block.instrs {
        self.eval_instr(instr, &mut regs, blocks, args)?;
      }

      match &block.term {
        Terminator::Ret(r) => {
          result = regs.get(&r.0).cloned().unwrap_or(Value::Unit);
          return Ok(result);
        }
        Terminator::Br { cond, then_label, else_label } => {
          let c = regs.get(&cond.0).cloned().unwrap_or(Value::Bool(false));
          current_label = match c {
            Value::Bool(true) => then_label,
            _ => else_label,
          };
        }
        Terminator::Jmp(label) => {
          current_label = label;
        }
      }
    }
  }

  fn eval_instr(&mut self, instr: &Instr, regs: &mut HashMap<usize, Value>, _blocks: &[BasicBlock], _args: &[Value]) -> Result<(), String> {
    match instr {
      Instr::Lit { dest, value } => {
        regs.insert(dest.0, lit_to_value(value));
        Ok(())
      }
      Instr::Var { dest, name } => {
        let val = match name.as_str() {
          "Stdin" => Value::Builtin("Stdin".into()),
          "Stdout" => Value::Builtin("Stdout".into()),
          "not" => Value::Builtin("not".into()),
          _ => self.env.get(name).cloned().unwrap_or(Value::Unit),
        };
        regs.insert(dest.0, val);
        Ok(())
      }
      Instr::Ref { dest, label } => {
        let l = Label(label.clone());
        let val = self.force_thunk(&l).unwrap_or(Value::Unit);
        regs.insert(dest.0, val);
        Ok(())
      }
      Instr::Lambda { dest, thunk, .. } => {
        let (blocks, params) = self.thunks.get(thunk.as_str())
          .map(|(b, p)| (b.clone(), p.clone()))
          .unwrap_or_default();
        regs.insert(dest.0, Value::Closure { params, blocks, env: self.env.clone() });
        Ok(())
      }
      Instr::Bind { name, value } => {
        let val = regs.get(&value.0).cloned().unwrap_or(Value::Unit);
        self.env.insert(name.clone(), val);
        Ok(())
      }
      Instr::Prim { dest, op, lhs, rhs } => {
        let l = regs.get(&lhs.0).cloned().unwrap_or(Value::Unit);
        let r = regs.get(&rhs.0).cloned().unwrap_or(Value::Unit);
        let result = eval_prim(*op, &l, &r)?;
        regs.insert(dest.0, result);
        Ok(())
      }
      Instr::Call { dest, func, args } => {
        let func_val = regs.get(&func.0).cloned().unwrap_or(Value::Unit);
        let arg_vals: Vec<Value> = args.iter()
          .map(|a| regs.get(&a.0).cloned().unwrap_or(Value::Unit))
          .collect();
        let result = self.eval_call(&func_val, &arg_vals)?;
        regs.insert(dest.0, result);
        Ok(())
      }
      Instr::Field { dest, expr, field } => {
        let val = regs.get(&expr.0).cloned().unwrap_or(Value::Unit);
        match val {
          Value::Struct { field_names, fields, .. } => {
            let idx = field_names.iter().position(|n| n == field)
              .or_else(|| field.parse::<usize>().ok().and_then(|i| if i < fields.len() { Some(i) } else { None }))
              .ok_or_else(|| format!("no field '{field}' in struct"))?;
            regs.insert(dest.0, fields[idx].clone());
            Ok(())
          }
          _ => Err("field access on non-struct".into()),
        }
      }
      Instr::StructCons { dest, name, fields } => {
        let field_vals: Vec<Value> = fields.iter()
          .map(|r| regs.get(&r.0).cloned().unwrap_or(Value::Unit))
          .collect();
        let field_names = self.struct_fields.get(name).cloned().unwrap_or_default();
        regs.insert(dest.0, Value::Struct { name: name.clone(), field_names, fields: field_vals });
        Ok(())
      }
      Instr::EnumCons { dest, enum_name, variant, payload } => {
        let p = payload.and_then(|r| regs.get(&r.0).cloned().map(Box::new));
        regs.insert(dest.0, Value::EnumVariant {
          enum_name: enum_name.clone(),
          variant: variant.clone(),
          payload: p,
        });
        Ok(())
      }
      Instr::ArrayLit { dest, elements } => {
        let vals: Vec<Value> = elements.iter()
          .map(|r| regs.get(&r.0).cloned().unwrap_or(Value::Unit))
          .collect();
        regs.insert(dest.0, Value::Array(vals));
        Ok(())
      }
      Instr::TupleLit { dest, elements } => {
        let vals: Vec<Value> = elements.iter()
          .map(|r| regs.get(&r.0).cloned().unwrap_or(Value::Unit))
          .collect();
        regs.insert(dest.0, Value::Tuple(vals));
        Ok(())
      }
      Instr::StructUpdate { dest, expr, updates } => {
        let val = regs.get(&expr.0).cloned().unwrap_or(Value::Unit);
        match val {
          Value::Struct { name, field_names, mut fields } => {
            for (field_name, r) in updates {
              if let Some(idx) = field_names.iter().position(|n| n == field_name) {
                fields[idx] = regs.get(&r.0).cloned().unwrap_or(Value::Unit);
              }
            }
            regs.insert(dest.0, Value::Struct { name, field_names, fields });
            Ok(())
          }
          _ => Err("struct update on non-struct".into()),
        }
      }
      Instr::ArrayAccess { dest, expr, index } => {
        let arr = regs.get(&expr.0).cloned().unwrap_or(Value::Unit);
        let idx = regs.get(&index.0).cloned().unwrap_or(Value::Unit);
        match (arr, idx) {
          (Value::Array(vals), Value::Int(i)) => {
            if i >= 0 && (i as usize) < vals.len() {
              regs.insert(dest.0, vals[i as usize].clone());
              Ok(())
            } else { Err(format!("index {i} out of bounds")) }
          }
          _ => Err("array access on non-array".into()),
        }
      }
      Instr::ArrayUpdate { dest, expr, index, value } => {
        let arr = regs.get(&expr.0).cloned().unwrap_or(Value::Unit);
        let idx = regs.get(&index.0).cloned().unwrap_or(Value::Unit);
        let val = regs.get(&value.0).cloned().unwrap_or(Value::Unit);
        match (arr, idx) {
          (Value::Array(mut vals), Value::Int(i)) => {
            if i >= 0 && (i as usize) < vals.len() {
              vals[i as usize] = val;
              regs.insert(dest.0, Value::Array(vals));
              Ok(())
            } else { Err(format!("index {i} out of bounds")) }
          }
          _ => Err("array update on non-array".into()),
        }
      }
      Instr::TupleUpdate { dest, expr, index, value } => {
        let tup = regs.get(&expr.0).cloned().unwrap_or(Value::Unit);
        let val = regs.get(&value.0).cloned().unwrap_or(Value::Unit);
        match tup {
          Value::Tuple(mut vals) => {
            if *index < vals.len() {
              vals[*index] = val;
              regs.insert(dest.0, Value::Tuple(vals));
              Ok(())
            } else { Err(format!("tuple index {index} out of bounds")) }
          }
          _ => Err("tuple update on non-tuple".into()),
        }
      }
      Instr::Not { dest, arg } => {
        let v = regs.get(&arg.0).cloned().unwrap_or(Value::Unit);
        match v {
          Value::Bool(b) => { regs.insert(dest.0, Value::Bool(!b)); Ok(()) }
          _ => Err("not: expected Bool".into()),
        }
      }
    }
  }

  fn eval_call(&mut self, func: &Value, args: &[Value]) -> Result<Value, String> {
    match func {
      Value::Builtin(name) if name == "Stdin" => {
        let stdin = io::stdin();
        let mut line = String::new();
        stdin.lock().read_line(&mut line).map_err(|e| format!("stdin: {e}"))?;
        let n: i64 = line.trim().parse().unwrap_or(0);
        Ok(Value::Int(n))
      }
      Value::Builtin(name) if name == "Stdout" => {
        if let Some(arg) = args.first() {
          println!("{arg}");
          io::stdout().flush().ok();
        }
        Ok(Value::Unit)
      }
      Value::Builtin(name) if name == "not" => {
        match args.first() {
          Some(Value::Bool(b)) => Ok(Value::Bool(!b)),
          _ => Err("not: expected Bool".into()),
        }
      }
      Value::Closure { params, blocks, env } => {
        let mut env = env.clone();
        for (i, arg) in args.iter().enumerate() {
          if i < params.len() {
            env.insert(params[i].clone(), arg.clone());
          }
        }
        let saved = std::mem::replace(&mut self.env, env);
        let result = if blocks.is_empty() {
          Ok(Value::Unit)
        } else {
          self.eval_blocks(blocks, args)
        };
        self.env = saved;
        result
      }
      _ => Err(format!("not a function")),
    }
  }
}

fn eval_prim(op: PrimOp, l: &Value, r: &Value) -> Result<Value, String> {
  match (l, r) {
    (Value::Int(l), Value::Int(r)) => match op {
      PrimOp::Add => Ok(Value::Int(l + r)),
      PrimOp::Sub => Ok(Value::Int(l - r)),
      PrimOp::Mul => Ok(Value::Int(l * r)),
      PrimOp::Div if *r != 0 => Ok(Value::Int(l / r)),
      PrimOp::Div => Err("division by zero".into()),
      PrimOp::Rem => Ok(Value::Int(l % r)),
      PrimOp::Lt => Ok(Value::Bool(l < r)),
      PrimOp::Gt => Ok(Value::Bool(l > r)),
      PrimOp::Le => Ok(Value::Bool(l <= r)),
      PrimOp::Ge => Ok(Value::Bool(l >= r)),
      PrimOp::Eq => Ok(Value::Bool(l == r)),
      PrimOp::Ne => Ok(Value::Bool(l != r)),
      _ => Err(format!("invalid primop {op} for Int")),
    },
    (Value::Bool(l), Value::Bool(r)) => match op {
      PrimOp::And => Ok(Value::Bool(*l && *r)),
      PrimOp::Or => Ok(Value::Bool(*l || *r)),
      PrimOp::Eq => Ok(Value::Bool(l == r)),
      PrimOp::Ne => Ok(Value::Bool(l != r)),
      _ => Err(format!("invalid primop {op} for Bool")),
    },
    _ => Err(format!("type mismatch in primop {op}")),
  }
}

fn lit_to_value(lit: &Lit) -> Value {
  match lit {
    Lit::Int(n) => Value::Int(*n),
    Lit::Bool(b) => Value::Bool(*b),
    Lit::Char(c) => Value::Char(*c),
    Lit::Unit => Value::Unit,
  }
}
