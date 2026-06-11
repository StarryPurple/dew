/// Evaluator + lazy thunk runtime for Dew IR.

use crate::diagnostics::DiagnosticCollector;
use crate::ir::{Ir, IrOp, ThunkId};
use crate::value::{Env, Value};
use std::collections::HashMap;

#[derive(Debug, Clone)]
enum ThunkState {
    Unevaluated(Ir, Env),
    Evaluating,
    Evaluated(Value),
}

pub struct Evaluator<'a> {
    env: Env,
    thunks: HashMap<ThunkId, ThunkState>,
    next_thunk_id: ThunkId,
    diag: &'a mut DiagnosticCollector,
    trace_log: Vec<String>,
    step: usize,
}

impl<'a> Evaluator<'a> {
    pub fn new(diag: &'a mut DiagnosticCollector) -> Self {
        Evaluator {
            env: HashMap::new(),
            thunks: HashMap::new(),
            next_thunk_id: 0,
            diag,
            trace_log: Vec::new(),
            step: 0,
        }
    }

    pub fn eval(&mut self, ir: &Ir) -> Result<Value, String> {
        let result = self.eval_ir(ir)?;

        // If `main` is defined, call it to get the program result.
        if let Some(main_val) = self.env.get("main") {
            return self.call_main(main_val.clone());
        }

        self.diag.finalize();
        Ok(result)
    }

    /// Call main() with unit argument and return the result.
    fn call_main(&mut self, main: Value) -> Result<Value, String> {
        match main {
            Value::Closure(param, body, mut closure_env) => {
                closure_env.insert(param, Value::Unit);
                let saved_env = std::mem::replace(&mut self.env, closure_env);
                let result = self.eval_ir(&body)?;
                self.env = saved_env;
                self.diag.finalize();
                // Force if the body was a thunk (lazy context).
                match result {
                    Value::Thunk(id) => self.force_thunk(id),
                    other => Ok(other),
                }
            }
            Value::Thunk(id) => {
                let forced = self.force_thunk(id)?;
                self.call_main(forced)
            }
            other => Err(format!("main must be a function (fn ()), found {}", other.type_name())),
        }
    }

    pub fn trace(&self) -> String { self.trace_log.join("\n") }

    fn eval_ir(&mut self, ir: &Ir) -> Result<Value, String> {
        self.step += 1;
        self.trace_log.push(format!("[step {:03}] {:?}", self.step, ir));

        match ir {
            Ir::Lit(n) => Ok(Value::Int(*n)),
            Ir::Bool(b) => Ok(Value::Bool(*b)),
            Ir::Unit => Ok(Value::Unit),
            Ir::Var(name) => {
                self.env.get(name).cloned().ok_or_else(|| format!("unbound variable '{name}'"))
            }
            Ir::Let(name, bind, body, _ty) => {
                let bind_val = self.eval_ir(bind)?;
                self.env.insert(name.clone(), bind_val);
                self.eval_ir(body)
            }
            Ir::Lam(param, body, _, _, _) => {
                let closure_env = self.env.clone();
                Ok(Value::Closure(param.clone(), (**body).clone(), closure_env))
            }
            Ir::App(fn_expr, arg) => {
                let fn_val = self.eval_ir(fn_expr)?;
                match fn_val {
                    Value::Closure(param, body, mut closure_env) => {
                        let arg_val = self.eval_ir(arg)?;
                        closure_env.insert(param, arg_val);
                        let saved_env = std::mem::replace(&mut self.env, closure_env);
                        let result = self.eval_ir(&body);
                        self.env = saved_env;
                        result
                    }
                    v => Err(format!("expected function, got {v:?}")),
                }
            }
            Ir::If(cond, then_, else_) => {
                let cond_val = self.eval_ir(cond)?;
                match cond_val {
                    Value::Bool(true) => self.eval_ir(then_),
                    Value::Bool(false) => self.eval_ir(else_),
                    v => Err(format!("if condition must be Bool, got {v:?}")),
                }
            }
            Ir::BinOp(op, left, right) => {
                let l = self.eval_ir(left)?;
                let r = self.eval_ir(right)?;
                Evaluator::eval_binop(op.clone(), l, r)
            }
            Ir::Dup(inner) => {
                let val = self.eval_ir(inner)?;
                match &val {
                    // Deep-copy: Box gets cloned with its contents duplicated
                    Value::Box(boxed) => {
                        let inner_clone = self.clone_value(boxed);
                        Ok(Value::Box(Box::new(inner_clone)))
                    }
                    _ => Ok(val.clone()),
                }
            }
            Ir::Suspend(body, captures, _ty, _source) => {
                let thunk_id = self.next_thunk_id;
                self.next_thunk_id += 1;
                let name = format!("%t{thunk_id}");
                self.diag.record_thunk_create(&name, captures.len(), _source.as_deref());
                let captured_env = self.env.clone();
                self.thunks.insert(thunk_id, ThunkState::Unevaluated((**body).clone(), captured_env));
                Ok(Value::Thunk(thunk_id))
            }
            Ir::Force(inner) => {
                let val = self.eval_ir(inner)?;
                match val {
                    Value::Thunk(id) => {
                        let name = format!("%t{id}");
                        self.diag.record_thunk_force(&name);
                        self.force_thunk(id)
                    }
                    v => Ok(v),
                }
            }
            Ir::Fix(name, body, _ty) => {
                let thunk_id = self.next_thunk_id;
                self.next_thunk_id += 1;
                let name_thunk = format!("%t{thunk_id}");
                self.diag.record_thunk_create(&name_thunk, 0, Some(&format!("fix {name}")));
                let mut rec_env = self.env.clone();
                rec_env.insert(name.clone(), Value::Thunk(thunk_id));
                self.thunks.insert(thunk_id, ThunkState::Unevaluated((**body).clone(), rec_env));
                Ok(Value::Thunk(thunk_id))
            }
            Ir::Alloc(inner) => {
                let val = self.eval_ir(inner)?;
                Ok(Value::Box(Box::new(val)))
            }
            Ir::Dealloc(inner) => {
                let val = self.eval_ir(inner)?;
                match val {
                    Value::Box(inner_val) => Ok(*inner_val),
                    v => Err(format!("unbox requires Box, got {v:?}")),
                }
            }
            Ir::Nil => Ok(Value::Nil),
            Ir::Cons(head, tail) => {
                let h = self.eval_ir(head)?;
                let t = self.eval_ir(tail)?;
                Ok(Value::Cons(Box::new(h), Box::new(t)))
            }
            Ir::Head(list) => {
                let val = self.eval_ir(list)?;
                match val {
                    Value::Cons(head, _) => Ok(*head),
                    Value::Thunk(id) => {
                        // Force the thunk, then retry.
                        let forced = self.force_thunk(id)?;
                        match forced {
                            Value::Cons(head, _) => Ok(*head),
                            _ => Err(format!("head requires non-empty list")),
                        }
                    }
                    _ => Err(format!("head requires non-empty list, got {val:?}")),
                }
            }
            Ir::Tail(list) => {
                let val = self.eval_ir(list)?;
                match val {
                    Value::Cons(_, tail) => Ok(*tail),
                    Value::Thunk(id) => {
                        let forced = self.force_thunk(id)?;
                        match forced {
                            Value::Cons(_, tail) => Ok(*tail),
                            _ => Err(format!("tail requires non-empty list")),
                        }
                    }
                    _ => Err(format!("tail requires non-empty list, got {val:?}")),
                }
            }
            Ir::IsNil(list) => {
                let val = self.eval_ir(list)?;
                match val {
                    Value::Nil => Ok(Value::Bool(true)),
                    Value::Cons(_, _) => Ok(Value::Bool(false)),
                    Value::Thunk(id) => {
                        let forced = self.force_thunk(id)?;
                        match forced {
                            Value::Nil => Ok(Value::Bool(true)),
                            Value::Cons(_, _) => Ok(Value::Bool(false)),
                            _ => Err(format!("isnil requires a list")),
                        }
                    }
                    _ => Err(format!("isnil requires a list, got {val:?}")),
                }
            }

            Ir::Variant(name, tag, fields) => {
                let mut vals = Vec::new();
                for f in fields {
                    vals.push(self.eval_ir(f)?);
                }
                Ok(Value::Variant(name.clone(), *tag, vals))
            }

            Ir::Match(scrutinee, arms, default) => {
                let val = self.eval_ir(scrutinee)?;
                self.eval_match_value(&val, arms, default)
            }
        }
    }

    fn eval_match_value(&mut self, val: &Value, arms: &[(usize, Box<Ir>, Vec<String>)], default: &Box<Ir>) -> Result<Value, String> {
        match val {
            Value::Variant(_name, tag, fields) => {
                for (arm_tag, body, bindings) in arms {
                    if arm_tag == tag {
                        let saved_env = self.env.clone();
                        for (i, bv) in bindings.iter().enumerate() {
                            if i < fields.len() {
                                self.env.insert(bv.clone(), fields[i].clone());
                            }
                        }
                        let result = self.eval_ir(body);
                        self.env = saved_env;
                        return result;
                    }
                }
                self.eval_ir(default)
            }
            Value::Thunk(id) => {
                let forced = self.force_thunk(*id)?;
                // Need to clone arms and default to avoid borrow issues
                let arms_clone: Vec<(usize, Box<Ir>, Vec<String>)> = arms.iter().map(|(t, b, v)| (*t, b.clone(), v.clone())).collect();
                let default_clone = default.clone();
                self.eval_match_value(&forced, &arms_clone, &default_clone)
            }
            _ => Err(format!("match requires a variant, got {:?}", val)),
        }
    }

    fn force_thunk(&mut self, id: ThunkId) -> Result<Value, String> {
        let state = self.thunks.remove(&id)
            .ok_or_else(|| format!("thunk %t{id} not found"))?;

        match state {
            ThunkState::Evaluating => {
                Err(format!("circular dependency detected when forcing thunk %t{id}"))
            }
            ThunkState::Evaluated(value) => {
                self.thunks.insert(id, ThunkState::Evaluated(value.clone()));
                Ok(value)
            }
            ThunkState::Unevaluated(body, captured_env) => {
                self.thunks.insert(id, ThunkState::Evaluating);
                let saved_env = std::mem::replace(&mut self.env, captured_env);
                let result = self.eval_ir(&body);
                self.env = saved_env;
                match result {
                    Ok(value) => {
                        self.thunks.insert(id, ThunkState::Evaluated(value.clone()));
                        Ok(value)
                    }
                    Err(e) => {
                        self.thunks.insert(id, ThunkState::Evaluating);
                        Err(e)
                    }
                }
            }
        }
    }

    /// Deep-clone a value — used for dup on Box contents.
    fn clone_value(&self, val: &Value) -> Value {
        match val {
            Value::Int(n) => Value::Int(*n),
            Value::Bool(b) => Value::Bool(*b),
            Value::Unit => Value::Unit,
            Value::Box(inner) => Value::Box(Box::new(self.clone_value(inner))),
            Value::Nil => Value::Nil,
            Value::Cons(head, tail) => Value::Cons(
                Box::new(self.clone_value(head)),
                Box::new(self.clone_value(tail)),
            ),
            Value::Closure(p, b, env) => Value::Closure(p.clone(), b.clone(), env.clone()),
            Value::Thunk(id) => Value::Thunk(*id),
            Value::Variant(n, t, fields) => {
                Value::Variant(n.clone(), *t, fields.iter().map(|f| self.clone_value(f)).collect())
            }
        }
    }

    fn eval_binop(op: IrOp, left: Value, right: Value) -> Result<Value, String> {
        match op {
            IrOp::Add => {
                let l = left.as_int().ok_or_else(|| format!("expected Int, got {:?}", left))?;
                let r = right.as_int().ok_or_else(|| format!("expected Int, got {:?}", right))?;
                Ok(Value::Int(l + r))
            }
            IrOp::Sub => {
                let l = left.as_int().ok_or_else(|| format!("expected Int, got {:?}", left))?;
                let r = right.as_int().ok_or_else(|| format!("expected Int, got {:?}", right))?;
                Ok(Value::Int(l - r))
            }
            IrOp::Mul => {
                let l = left.as_int().ok_or_else(|| format!("expected Int, got {:?}", left))?;
                let r = right.as_int().ok_or_else(|| format!("expected Int, got {:?}", right))?;
                Ok(Value::Int(l * r))
            }
            IrOp::Div => {
                let l = left.as_int().ok_or_else(|| format!("expected Int, got {:?}", left))?;
                let r = right.as_int().ok_or_else(|| format!("expected Int, got {:?}", right))?;
                if r == 0 { return Err("division by zero".to_string()); }
                Ok(Value::Int(l / r))
            }
            IrOp::Eq => match (&left, &right) {
                (Value::Int(l), Value::Int(r)) => Ok(Value::Bool(l == r)),
                (Value::Bool(l), Value::Bool(r)) => Ok(Value::Bool(l == r)),
                _ => Err(format!("cannot compare {left:?} and {right:?}")),
            },
            IrOp::Lt => {
                let l = left.as_int().ok_or_else(|| format!("expected Int, got {:?}", left))?;
                let r = right.as_int().ok_or_else(|| format!("expected Int, got {:?}", right))?;
                Ok(Value::Bool(l < r))
            }
            IrOp::Gt => {
                let l = left.as_int().ok_or_else(|| format!("expected Int, got {:?}", left))?;
                let r = right.as_int().ok_or_else(|| format!("expected Int, got {:?}", right))?;
                Ok(Value::Bool(l > r))
            }
        }
    }
}
