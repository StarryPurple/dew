// Evaluator for the Thunk Graph IR

use crate::ir::*;
use crate::value::*;
use crate::diagnostics::DiagnosticCollector;
use std::collections::HashMap;
use std::io::{self, Write, BufRead};

enum ThunkState {
  Suspended { body: Option<Ir> },
  Evaluating,
  Evaluated(Value),
}

pub struct Evaluator<'a> {
  env: Env,
  heap: HashMap<Label, ThunkState>,
  struct_fields: HashMap<String, Vec<String>>,
  diag: &'a mut DiagnosticCollector,
}

impl<'a> Evaluator<'a> {
  pub fn new(diag: &'a mut DiagnosticCollector) -> Self {
    Self { env: Env::new(), heap: HashMap::new(), struct_fields: HashMap::new(), diag }
  }

  pub fn register_struct(&mut self, name: String, field_names: Vec<String>) {
    self.struct_fields.insert(name, field_names);
  }

  pub fn eval_module(&mut self, module: &Module) -> Result<(), String> {
    for node in &module.nodes {
      self.process_node(node)?;
    }
    Ok(())
  }

  pub fn call_main(&mut self) -> Result<Value, String> {
    let main_val = self.env.get("main").cloned()
      .ok_or_else(|| "no main definition found".to_string())?;    match main_val {
      Value::Closure { params, body, env } if params.is_empty() => {
        let saved = std::mem::replace(&mut self.env, env);
        let result = self.eval_ir(&body);
        self.env = saved;
        result
      }
      other => Ok(other),
    }
  }

  fn process_node(&mut self, node: &Node) -> Result<(), String> {
    match node {
      Node::ThunkAlloc { label } => {
        self.heap.insert(label.clone(), ThunkState::Suspended { body: None });        Ok(())
      }
      Node::ThunkDef { label, body } => match self.heap.get_mut(label) {
        Some(ThunkState::Suspended { body: b }) => { *b = Some(body.clone()); Ok(()) }
        _ => Err(format!("ThunkDef on non-suspended thunk {label}")),
      },
      Node::Blackhole { label } => match self.heap.get_mut(label) {
        Some(ThunkState::Suspended { .. }) => { *self.heap.get_mut(label).unwrap() = ThunkState::Evaluating; Ok(()) }
        Some(ThunkState::Evaluating) => Err(format!("cyclic dependency at {label}")),
        _ => Ok(()),
      },
      Node::Force { label: result, target } => {
        let val = self.force_thunk(target)?;        self.env.insert(result.0.clone(), val);
        Ok(())
      }
      Node::Update { label, value } => {
        let val = match value {
          ValueRef::Lit(lit) => lit_to_value(lit),
          ValueRef::Label(l) => self.env.get(&l.0).cloned().unwrap_or(Value::Unit),
        };        match self.heap.get_mut(label) {
          Some(state) => { *state = ThunkState::Evaluated(val); Ok(()) }
          None => Err(format!("Update on unknown thunk {label}")),
        }
      }
      Node::Def { name, label } => {
            let val = self.heap.get(label)
          .and_then(|s| match s { ThunkState::Evaluated(v) => Some(v.clone()), _ => None })
          .unwrap_or(Value::Unit);        self.env.insert(name.clone(), val);
        Ok(())
      }
    }
  }

  fn force_thunk(&mut self, label: &Label) -> Result<Value, String> {
    if let Some(ThunkState::Evaluated(v)) = self.heap.get(label) { return Ok(v.clone()); }
    match self.heap.get(label) {
      Some(ThunkState::Evaluating) => return Err(format!("cyclic dependency at {label}")),
      Some(ThunkState::Suspended { .. }) => {}
      None => return Err(format!("unknown thunk {label}")),
      _ => {}
    }
    let body = match self.heap.get(label) {
      Some(ThunkState::Suspended { body: Some(b) }) => b.clone(),
      _ => return Ok(Value::Unit),
    };
    self.heap.insert(label.clone(), ThunkState::Evaluating);
    let val = self.eval_ir(&body)?;
    self.heap.insert(label.clone(), ThunkState::Evaluated(val.clone()));
    Ok(val)
  }

  fn eval_ir(&mut self, ir: &Ir) -> Result<Value, String> {
    match ir {
      Ir::Lit(lit) => Ok(lit_to_value(lit)),
      Ir::Var(name) => match name.as_str() {
        "Stdin" => Ok(Value::Builtin("Stdin".into())),
        "Stdout" => Ok(Value::Builtin("Stdout".into())),
        "not" => Ok(Value::Builtin("not".into())),
        _ => self.env.get(name).cloned().ok_or_else(|| format!("unbound: {name}")),
      },
      Ir::Ref(label) => self.force_thunk(label),
      Ir::Lambda { params, body } => Ok(Value::Closure {
        params: params.clone(), body: *body.clone(), env: self.env.clone(),
      }),
      Ir::Apply { func, args } => self.eval_apply(func, args),
      Ir::Let { name, value, body } => {
        let v = self.eval_ir(value)?; self.env.insert(name.clone(), v); self.eval_ir(body)
      }
      Ir::If { cond, then, else_ } => {
        match self.eval_ir(cond)? {
          Value::Bool(true) => self.eval_ir(then),
          Value::Bool(false) => self.eval_ir(else_),
          _ => Err("if condition must be Bool".into()),
        }
      }
      Ir::Prim { op, args } => self.eval_prim(*op, args),
      Ir::Return(inner) => self.eval_ir(inner),
      Ir::Match { scrutinee, arms } => {
        let val = self.eval_ir(scrutinee)?;
        for (pat, body) in arms {
          if self.pattern_matches(pat, &val) {
            return self.eval_ir(body);
          }
        }
        Err("no match arm matched".into())
      }
      Ir::FieldAccess { expr, field } => {
        let val = self.eval_ir(expr)?;
        match val {
          Value::Struct { name: _, field_names, fields } => {
            // Search by name
            if let Some(idx) = field_names.iter().position(|n| n == field) {
              fields.get(idx).cloned().ok_or("field index out of bounds".into())
            } else if let Ok(idx) = field.parse::<usize>() {
              fields.get(idx).cloned().ok_or("field index out of bounds".into())
            } else {
              Err(format!("no field '{field}' in struct"))
            }
          }
          _ => Err("field access on non-struct".into()),
        }
      }
      _ => Ok(Value::Unit),
    }
  }

  fn eval_apply(&mut self, func: &Ir, args: &[Ir]) -> Result<Value, String> {
    match func {
      Ir::Var(name) if name == "Stdin" => {
        let stdin = io::stdin();
        let mut line = String::new();
        stdin.lock().read_line(&mut line).map_err(|e| format!("stdin: {e}"))?;
        let n: i64 = line.trim().parse().unwrap_or(0);
        if let Some(Ir::Var(vname)) = args.first() { self.env.insert(vname.clone(), Value::Int(n)); }
        Ok(Value::Int(n))
      }
      Ir::Var(name) if name == "Stdout" => {
        if let Some(arg) = args.first() { let v = self.eval_ir(arg)?; println!("{v}"); io::stdout().flush().ok(); }
        Ok(Value::Unit)
      }
      Ir::Var(name) if name == "not" => {
        let v = self.eval_ir(args.first().ok_or("not: 1 arg")?)?;
        match v { Value::Bool(b) => Ok(Value::Bool(!b)), _ => Err("not: Bool".into()) }
      }
      Ir::Var(name) if name == "Affine" => {
        let v = self.eval_ir(args.first().ok_or("Affine: 1 arg")?)?;
        Ok(Value::Affine(Box::new(v)))
      }
      Ir::Var(name) if name == "consume" => {
        let v = self.eval_ir(args.first().ok_or("consume: 1 arg")?)?;
        match v { Value::Affine(inner) => Ok(*inner), _ => Err("consume: expected Affine value".into()) }
      }
      Ir::Var(name) if name.chars().next().map_or(false, |c| c.is_uppercase()) => {
        let fields: Vec<Value> = args.iter().map(|a| self.eval_ir(a)).collect::<Result<_, _>>()?;
        Ok(Value::Struct { name: name.clone(), field_names: self.struct_fields.get(name).cloned().unwrap_or_default(), fields })
      }
      _ => {
        let f = self.eval_ir(func)?;
        match f {
          Value::Closure { params, body, env } => {
            let mut env = env;
            for (i, arg) in args.iter().enumerate() {
              if i < params.len() {
                let v = self.eval_ir(arg)?;
                env.insert(params[i].clone(), unwrap_affine(v));
              }
            }
            let saved = std::mem::replace(&mut self.env, env);
            let result = self.eval_ir(&body);
            self.env = saved;
            result
          }
          _ => Err(format!("not a function")),
        }
      }
    }
  }

  fn pattern_matches(&self, pat: &Pattern, val: &Value) -> bool {
    match pat {
      Pattern::Wildcard => true,
      Pattern::Var(_) => true,
      Pattern::Lit(Lit::Int(n)) => matches!(val, Value::Int(x) if *x == *n),
      Pattern::Lit(Lit::Bool(b)) => matches!(val, Value::Bool(x) if *x == *b),
      Pattern::Lit(Lit::Char(c)) => matches!(val, Value::Char(x) if *x == *c),
      Pattern::Lit(Lit::Unit) => matches!(val, Value::Unit),
      Pattern::Struct(_, _) => false,
      Pattern::EnumVariant(_, _) => false,
      Pattern::Tuple(ps) => {
        if let Value::Tuple(vs) = val {
          ps.len() == vs.len() && ps.iter().zip(vs).all(|(p, v)| self.pattern_matches(p, v))
        } else { false }
      }
    }
  }

  fn eval_prim(&mut self, op: PrimOp, args: &[Ir]) -> Result<Value, String> {
    let vals: Vec<Value> = args.iter()
      .map(|a| self.eval_ir(a).map(unwrap_affine))
      .collect::<Result<_, _>>()?;
    if vals.len() == 2 {
      let l = &vals[0]; let r = &vals[1];
      return match (l, r) {
        (Value::Int(l), Value::Int(r)) => match op {
          PrimOp::Add => Ok(Value::Int(l + r)), PrimOp::Sub => Ok(Value::Int(l - r)),
          PrimOp::Mul => Ok(Value::Int(l * r)), PrimOp::Div if *r != 0 => Ok(Value::Int(l / r)),
          PrimOp::Div => Err("division by zero".into()), PrimOp::Rem => Ok(Value::Int(l % r)),
          PrimOp::Lt => Ok(Value::Bool(l < r)), PrimOp::Gt => Ok(Value::Bool(l > r)),
          PrimOp::Le => Ok(Value::Bool(l <= r)), PrimOp::Ge => Ok(Value::Bool(l >= r)),
          PrimOp::Eq => Ok(Value::Bool(l == r)), PrimOp::Ne => Ok(Value::Bool(l != r)),
          _ => Err(format!("invalid primop {op} for Int")),
        },
        (Value::Bool(l), Value::Bool(r)) => match op {
          PrimOp::And => Ok(Value::Bool(*l && *r)), PrimOp::Or => Ok(Value::Bool(*l || *r)),
          PrimOp::Eq => Ok(Value::Bool(l == r)), PrimOp::Ne => Ok(Value::Bool(l != r)),
          _ => Err(format!("invalid primop {op} for Bool")),
        },
        _ => Err(format!("type mismatch in primop {op}")),
      };
    }
    Err(format!("wrong arity for primop {op}"))
  }
}

fn lit_to_value(lit: &Lit) -> Value {
  match lit {
    Lit::Int(n) => Value::Int(*n), Lit::Bool(b) => Value::Bool(*b),
    Lit::Char(c) => Value::Char(*c), Lit::Unit => Value::Unit,
  }
}

fn unwrap_affine(v: Value) -> Value {
  match v {
    Value::Affine(inner) => *inner,
    other => other,
  }
}
