// Evaluator for the Thunk Graph IR
//
// Processes Module nodes in order. Maintains a thunk heap (Label -> ThunkState)
// implementing the 3-state FSM: Suspended → Evaluating → Evaluated.

use crate::ir::*;
use crate::value::*;
use crate::diagnostics::DiagnosticCollector;
use std::collections::HashMap;

// ── Thunk states ──────────────────────────────────────────

enum ThunkState {
  Suspended { body: Option<Ir> },
  Evaluating,
  Evaluated(Value),
}

// ── Evaluator ─────────────────────────────────────────────

pub struct Evaluator<'a> {
  env: Env,
  heap: HashMap<Label, ThunkState>,
  diag: &'a mut DiagnosticCollector,
}

impl<'a> Evaluator<'a> {
  pub fn new(diag: &'a mut DiagnosticCollector) -> Self {
    Self {
      env: Env::new(),
      heap: HashMap::new(),
      diag,
    }
  }

  /// Evaluate an entire IR module, returns the main result value
  pub fn eval_module(&mut self, module: &Module) -> Result<Value, String> {
    for node in &module.nodes {
      self.process_node(node)?;
    }
    self.env.get("main")
      .cloned()
      .ok_or_else(|| "no main definition found".to_string())
  }

  fn process_node(&mut self, node: &Node) -> Result<(), String> {
    match node {
      Node::ThunkAlloc { label } => {
        self.heap.insert(label.clone(), ThunkState::Suspended { body: None });
        Ok(())
      }
      Node::ThunkDef { label, body } => {
        match self.heap.get_mut(label) {
          Some(ThunkState::Suspended { body: b }) => {
            *b = Some(body.clone());
            Ok(())
          }
          _ => Err(format!("ThunkDef on non-suspended thunk {label}")),
        }
      }
      Node::Blackhole { label } => {
        match self.heap.get_mut(label) {
          Some(ThunkState::Suspended { .. }) => {
            *self.heap.get_mut(label).unwrap() = ThunkState::Evaluating;
            Ok(())
          }
          Some(ThunkState::Evaluating) => {
            Err(format!("cyclic dependency detected at {label}"))
          }
          _ => Ok(()),
        }
      }
      Node::Force { label: result, target } => {
        let val = self.force_thunk(target)?;
        self.env.insert(result.0.clone(), val);
        Ok(())
      }
      Node::Update { label, value } => {
        let val = match value {
          ValueRef::Lit(lit) => lit_to_value(lit),
          ValueRef::Label(l) => self.env.get(&l.0)
            .cloned()
            .unwrap_or(Value::Unit),
        };
        match self.heap.get_mut(label) {
          Some(state) => {
            *state = ThunkState::Evaluated(val);
            Ok(())
          }
          None => Err(format!("Update on unknown thunk {label}")),
        }
      }
      Node::Def { name, label } => {
        let val = self.heap.get(label)
          .and_then(|s| match s {
            ThunkState::Evaluated(v) => Some(v.clone()),
            _ => None,
          })
          .unwrap_or(Value::Unit);
        self.env.insert(name.clone(), val);
        Ok(())
      }
    }
  }

  /// Force a thunk through the 3-state FSM
  fn force_thunk(&mut self, label: &Label) -> Result<Value, String> {
    if let Some(ThunkState::Evaluated(v)) = self.heap.get(label) {
      return Ok(v.clone());
    }

    match self.heap.get(label) {
      Some(ThunkState::Evaluating) => {
        return Err(format!("cyclic dependency at {label}"));
      }
      Some(ThunkState::Suspended { .. }) => {}
      None => return Err(format!("unknown thunk {label}")),
      _ => {}
    }

    self.heap.insert(label.clone(), ThunkState::Evaluating);

    let body = match self.heap.get(label) {
      Some(ThunkState::Suspended { body: Some(b) }) => b.clone(),
      _ => return Ok(Value::Unit),
    };

    let val = self.eval_ir(&body)?;
    self.heap.insert(label.clone(), ThunkState::Evaluated(val.clone()));
    Ok(val)
  }

  fn eval_ir(&mut self, ir: &Ir) -> Result<Value, String> {
    match ir {
      Ir::Lit(lit) => Ok(lit_to_value(lit)),
      Ir::Var(name) => {
        self.env.get(name)
          .cloned()
          .ok_or_else(|| format!("unbound variable: {name}"))
      }
      Ir::Ref(label) => self.force_thunk(label),
      Ir::Lambda { params, body } => Ok(Value::Closure {
        params: params.clone(),
        body: *body.clone(),
        env: self.env.clone(),
      }),
      Ir::Apply { func, args } => {
        let f = self.eval_ir(func)?;
        match f {
          Value::Closure { params, body, mut env } => {
            for (i, arg) in args.iter().enumerate() {
              if i < params.len() {
                let v = self.eval_ir(arg)?;
                env.insert(params[i].clone(), v);
              }
            }
            let saved_env = std::mem::replace(&mut self.env, env);
            let result = self.eval_ir(&body);
            self.env = saved_env;
            result
          }
          _ => Err(format!("not a function: {f:?}")),
        }
      }
      Ir::Let { name, value, body } => {
        let v = self.eval_ir(value)?;
        self.env.insert(name.clone(), v);
        self.eval_ir(body)
      }
      Ir::If { cond, then, else_ } => {
        let c = self.eval_ir(cond)?;
        match c {
          Value::Bool(true) => self.eval_ir(then),
          Value::Bool(false) => self.eval_ir(else_),
          _ => Err(format!("if condition must be Bool, got {c:?}")),
        }
      }
      Ir::Prim { op, args } => self.eval_prim(*op, args),
      Ir::Return(inner) => self.eval_ir(inner),
      _ => Ok(Value::Unit),
    }
  }

  fn eval_prim(&mut self, op: PrimOp, args: &[Ir]) -> Result<Value, String> {
    let vals: Vec<Value> = args.iter()
      .map(|a| self.eval_ir(a))
      .collect::<Result<_, _>>()?;

    match op {
      PrimOp::Not => match &vals[0] {
        Value::Bool(b) => Ok(Value::Bool(!b)),
        _ => Err("not expects Bool".to_string()),
      },
      _ if vals.len() == 2 => {
        let l = &vals[0];
        let r = &vals[1];
        match (l, r) {
          (Value::Int(l), Value::Int(r)) => match op {
            PrimOp::Add => Ok(Value::Int(l + r)),
            PrimOp::Sub => Ok(Value::Int(l - r)),
            PrimOp::Mul => Ok(Value::Int(l * r)),
            PrimOp::Div if *r != 0 => Ok(Value::Int(l / r)),
            PrimOp::Div => Err("division by zero".to_string()),
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
      _ => Err(format!("wrong arity for primop {op}")),
    }
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
