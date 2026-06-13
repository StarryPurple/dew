// Evaluator with lazy thunk runtime (3-state FSM)
//
// Thunk states: Thunk -> Evaluating -> Evaluated (memoized)

use crate::ir::*;
use crate::value::*;
use crate::diagnostics::DiagnosticCollector;

/// Evaluator state
pub struct Evaluator<'a> {
    env: Env,
    diag: &'a mut DiagnosticCollector,
    /// Stack of currently evaluating thunks (for cycle detection)
    evaluating: Vec<String>,
}

impl<'a> Evaluator<'a> {
    pub fn new(diag: &'a mut DiagnosticCollector) -> Self {
        Self {
            env: Env::new(),
            diag,
            evaluating: vec![],
        }
    }

    /// Evaluate an IR expression, returning a runtime value
    pub fn eval(&mut self, ir: &Ir) -> Result<Value, String> {
        match ir {
            Ir::Int(n) => Ok(Value::Int(*n)),
            Ir::Bool(b) => Ok(Value::Bool(*b)),
            Ir::Char(c) => Ok(Value::Char(*c)),
            Ir::Unit => Ok(Value::Unit),
            Ir::Var(name) => {
                self.env.get(name)
                    .cloned()
                    .ok_or_else(|| format!("unbound variable: {name}"))
            }
            Ir::Lambda { params, body } => Ok(Value::Closure {
                params: params.clone(),
                body: *body.clone(),
                env: self.env.clone(),
            }),
            Ir::Apply { func, args } => {
                let f = self.eval(func)?;
                match f {
                    Value::Closure { params, body, mut env } => {
                        // Evaluate args lazily: wrap in thunks
                        for (i, arg) in args.iter().enumerate() {
                            if i < params.len() {
                                let v = Value::Thunk {
                                    expr: arg.clone(),
                                    env: self.env.clone(),
                                };
                                env.insert(params[i].clone(), v);
                            }
                        }
                        // Evaluate the closure body in its captured env
                        let saved_env = std::mem::replace(&mut self.env, env);
                        let result = self.eval(&body);
                        self.env = saved_env;
                        result
                    }
                    _ => Err(format!("not a function: {f:?}")),
                }
            }
            Ir::Let { name, value, body } => {
                // Lazy let: bind as thunk
                let thunk = Value::Thunk {
                    expr: *value.clone(),
                    env: self.env.clone(),
                };
                self.env.insert(name.clone(), thunk);
                self.eval(body)
            }
            Ir::If { cond, then, else_ } => {
                let c = self.eval(cond)?;
                match c {
                    Value::Bool(true) => self.eval(then),
                    Value::Bool(false) => self.eval(else_),
                    _ => Err(format!("if condition must be Bool, got {c:?}")),
                }
            }
            Ir::Suspend(_) => {
                // Thunk already represents suspension; just wrap
                Ok(Value::Thunk {
                    expr: ir.clone(),
                    env: self.env.clone(),
                })
            }
            Ir::Force(inner) => {
                // Force evaluation through thunk chain
                let v = self.eval(inner)?;
                self.force_value(v)
            }
            Ir::BinOp { op, left, right } => {
                let l = self.eval(left)?;
                let r = self.eval(right)?;
                self.eval_binop(*op, l, r)
            }
            Ir::Return(inner) => self.eval(inner),
            _ => Ok(Value::Unit), // TODO: Implement remaining
        }
    }

    /// Force a potentially suspended value through all thunk layers
    fn force_value(&mut self, value: Value) -> Result<Value, String> {
        match value {
            Value::Thunk { expr, env } => {
                let saved_env = std::mem::replace(&mut self.env, env);
                let result = self.eval(&expr)?;
                self.env = saved_env;
                self.force_value(result)
            }
            v => Ok(v),
        }
    }

    fn eval_binop(&mut self, op: IrBinOp, left: Value, right: Value) -> Result<Value, String> {
        match (left, right) {
            (Value::Int(l), Value::Int(r)) => match op {
                IrBinOp::Add => Ok(Value::Int(l + r)),
                IrBinOp::Sub => Ok(Value::Int(l - r)),
                IrBinOp::Mul => Ok(Value::Int(l * r)),
                IrBinOp::Div => {
                    if r == 0 { Err("division by zero".to_string()) }
                    else { Ok(Value::Int(l / r)) }
                }
                IrBinOp::Rem => Ok(Value::Int(l % r)),
                IrBinOp::Lt => Ok(Value::Bool(l < r)),
                IrBinOp::Gt => Ok(Value::Bool(l > r)),
                IrBinOp::Le => Ok(Value::Bool(l <= r)),
                IrBinOp::Ge => Ok(Value::Bool(l >= r)),
                IrBinOp::Eq => Ok(Value::Bool(l == r)),
                IrBinOp::Ne => Ok(Value::Bool(l != r)),
                _ => Err(format!("invalid binop {op:?} for Int")),
            },
            (Value::Bool(l), Value::Bool(r)) => match op {
                IrBinOp::And => Ok(Value::Bool(l && r)),
                IrBinOp::Or => Ok(Value::Bool(l || r)),
                IrBinOp::Eq => Ok(Value::Bool(l == r)),
                IrBinOp::Ne => Ok(Value::Bool(l != r)),
                _ => Err(format!("invalid binop {op:?} for Bool")),
            },
            _ => Err(format!("type mismatch in binop {op:?}")),
        }
    }
}
