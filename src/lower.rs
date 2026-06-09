/// Tree IR → Flat IR lowering pass.
///
/// Walks the tree IR and produces a flat, SSA-like module with basic blocks,
/// explicit temporaries, and separate functions for closures and thunks.

use crate::flat_ir::*;
use crate::ir::{Ir, IrOp};

/// Lower tree IR to flat module.
pub fn lower(ir: &Ir) -> Module {
    let mut ctx = LowerCtx::new();
    // Initialize the top-level function.
    ctx.cur_func_name = "@top".to_string();
    ctx.cur_func_kind = FnKind::UserFn;
    let result = ctx.lower_expr(ir);
    ctx.finish_block(Terminator::Ret { arg: result });
    ctx.finish_function();
    Module { functions: ctx.functions }
}

struct LowerCtx {
    functions: Vec<Function>,
    /// Current function being built.
    cur_func_name: String,
    cur_func_kind: FnKind,
    cur_func_params: Vec<String>,
    cur_func_captures: Vec<String>,
    cur_blocks: Vec<BasicBlock>,
    cur_instructions: Vec<Instruction>,
    /// Counters.
    temp_n: usize,
    func_n: usize,
    block_n: usize,
    /// Map from tree-level variable names to flat temps.
    env: Vec<(String, String)>,
    /// If set, the next finish_block should use this label.
    pending_join_label: Option<String>,
}

impl LowerCtx {
    fn new() -> Self {
        LowerCtx {
            functions: Vec::new(),
            cur_func_name: String::new(),
            cur_func_kind: FnKind::UserFn,
            cur_func_params: Vec::new(),
            cur_func_captures: Vec::new(),
            cur_blocks: Vec::new(),
            cur_instructions: Vec::new(),
            temp_n: 0,
            func_n: 0,
            block_n: 0,
            env: Vec::new(),
            pending_join_label: None,
        }
    }

    fn fresh_temp(&mut self) -> String {
        let t = format!("%t{}", self.temp_n);
        self.temp_n += 1;
        t
    }

    fn fresh_func(&mut self) -> String {
        let name = format!("@f{}", self.func_n);
        self.func_n += 1;
        name
    }

    fn fresh_block_label(&mut self) -> String {
        let l = format!("B{}", self.block_n);
        self.block_n += 1;
        l
    }

    fn emit(&mut self, op: Op, args: Vec<Arg>) -> String {
        let dest = self.fresh_temp();
        self.cur_instructions.push(Instruction { dest: dest.clone(), op, args });
        dest
    }

    fn lookup(&self, name: &str) -> Arg {
        for (n, t) in self.env.iter().rev() {
            if n == name { return Arg::Temp(t.clone()); }
        }
        // Should have been bound; fallback to treating as temp.
        Arg::Temp(name.to_string())
    }

    fn push_env(&mut self, name: String, temp: String) {
        self.env.push((name, temp));
    }

    /// Emit the current instruction buffer as a finished block with the given label.
    fn finish_block_with_label(&mut self, label: String, term: Terminator) {
        let instructions = std::mem::take(&mut self.cur_instructions);
        self.cur_blocks.push(BasicBlock { label, instructions, terminator: term });
    }

    /// Auto-name a block label.
    fn auto_label(&self) -> String {
        format!("L{}", self.cur_blocks.len())
    }

    fn finish_block(&mut self, term: Terminator) {
        let label = self.pending_join_label.take().unwrap_or_else(|| self.auto_label());
        self.finish_block_with_label(label, term);
    }

    fn finish_function(&mut self) {
        let func = Function {
            name: std::mem::take(&mut self.cur_func_name),
            kind: self.cur_func_kind.clone(),
            params: std::mem::take(&mut self.cur_func_params),
            captures: std::mem::take(&mut self.cur_func_captures),
            blocks: std::mem::take(&mut self.cur_blocks),
        };
        self.functions.push(func);
        // Reset for next function.
        self.cur_instructions = Vec::new();
        self.cur_blocks = Vec::new();
        self.env = Vec::new();
        self.cur_func_kind = FnKind::UserFn;
    }

    fn start_function(&mut self, name: String, kind: FnKind, params: Vec<String>, captures: Vec<String>) {
        self.cur_func_name = name;
        self.cur_func_kind = kind;
        self.cur_func_params = params;
        self.cur_func_captures = captures;
        self.cur_instructions = Vec::new();
        self.cur_blocks = Vec::new();
        self.env = Vec::new();
    }

    /// Lower an expression, returning the Arg that holds the result.
    fn lower_expr(&mut self, ir: &Ir) -> Arg {
        match ir {
            Ir::Lit(n) => {
                let t = self.emit(Op::Lit, vec![Arg::Lit(*n)]);
                Arg::Temp(t)
            }
            Ir::Bool(b) => Arg::LitBool(*b),
            Ir::Unit => Arg::LitUnit,
            Ir::Var(name) => self.lookup(name),

            Ir::BinOp(op, left, right) => {
                let l = self.lower_expr(left);
                let r = self.lower_expr(right);
                let t = self.emit(self.convert_op(op), vec![l, r]);
                Arg::Temp(t)
            }

            Ir::If(cond, then_, else_) => {
                let c = self.lower_expr(cond);
                let then_l = self.fresh_block_label();
                let else_l = self.fresh_block_label();
                let join_l = self.fresh_block_label();
                let join_temp = self.fresh_temp();

                // Condition block: branch to then or else.
                self.finish_block(Terminator::Branch {
                    cond: c,
                    true_label: then_l.clone(),
                    false_label: else_l.clone(),
                });

                // ── Then block ──
                let then_val = self.lower_expr(then_);
                self.cur_instructions.push(Instruction {
                    dest: join_temp.clone(), op: Op::Move, args: vec![then_val],
                });
                self.finish_block_with_label(then_l, Terminator::Jump { label: join_l.clone() });

                // ── Else block ──
                let else_val = self.lower_expr(else_);
                self.cur_instructions.push(Instruction {
                    dest: join_temp.clone(), op: Op::Move, args: vec![else_val],
                });
                self.finish_block_with_label(else_l, Terminator::Jump { label: join_l.clone() });

                // ── Join block ──
                // Re-anchor join_temp. The join block continues with the surrounding
                // expression. Set pending_join_label so the next finish_block uses it.
                let anchor = self.fresh_temp();
                self.cur_instructions.push(Instruction {
                    dest: anchor, op: Op::Move, args: vec![Arg::Temp(join_temp.clone())],
                });
                self.pending_join_label = Some(join_l);
                Arg::Temp(join_temp)
            }

            Ir::Let(name, bind, body, _) => {
                let b = self.lower_expr(bind);
                let t = match b {
                    Arg::Temp(ref s) => s.clone(),
                    other => {
                        let tmp = self.emit(Op::Move, vec![other]);
                        tmp
                    }
                };
                self.push_env(name.clone(), t);
                self.lower_expr(body)
            }

            Ir::Lam(param, body, _, _, _) => {
                // Create a new function for the lambda.
                let func_name = self.fresh_func();
                let saved_env = self.capture_current_env();
                let mut saved_captures: Vec<String> = saved_env.iter().map(|(n, _)| n.clone()).collect();
                saved_captures.sort();
                saved_captures.dedup();

                // Save current function state.
                let saved_name = self.cur_func_name.clone();
                let saved_kind = self.cur_func_kind.clone();
                let saved_params = std::mem::take(&mut self.cur_func_params);
                let saved_captures_outer = std::mem::take(&mut self.cur_func_captures);
                let saved_blocks = std::mem::take(&mut self.cur_blocks);

                // Start the lambda function.
                self.start_function(
                    func_name.clone(),
                    FnKind::UserFn,
                    vec![param.clone()],
                    saved_captures.clone(),
                );
                // Bind captures as params in the env (they're passed implicitly in a real impl).
                for (cap_name, cap_temp) in &saved_env {
                    self.push_env(cap_name.clone(), cap_temp.clone());
                }

                let body_result = self.lower_expr(body);
                self.finish_block(Terminator::Ret { arg: body_result });
                self.finish_function();

                // Restore outer function.
                self.cur_func_name = saved_name;
                self.cur_func_kind = saved_kind;
                self.cur_func_params = saved_params;
                self.cur_func_captures = saved_captures_outer;
                self.cur_blocks = saved_blocks;

                // In the outer function, emit a closure instruction.
                let caps: Vec<Arg> = saved_env.iter().map(|(_, t)| Arg::Temp(t.clone())).collect();
                // closure @func, [captures...]
                let mut args = vec![Arg::Temp(func_name)];
                args.extend(caps);
                let t = self.emit(Op::Closure, args);
                Arg::Temp(t)
            }

            Ir::App(fn_expr, arg) => {
                let f = self.lower_expr(fn_expr);
                let a = self.lower_expr(arg);
                let t = self.emit(Op::Call, vec![f, a]);
                Arg::Temp(t)
            }

            Ir::Suspend(body, captures, _, _) => {
                let func_name = self.fresh_func();
                let cap_params: Vec<String> = captures.iter().map(|_| self.fresh_temp()).collect();

                // Save outer state.
                let saved_name = self.cur_func_name.clone();
                let saved_kind = self.cur_func_kind.clone();
                let saved_params = std::mem::take(&mut self.cur_func_params);
                let saved_captures_outer = std::mem::take(&mut self.cur_func_captures);
                let saved_blocks = std::mem::take(&mut self.cur_blocks);

                // Start thunk function.
                self.start_function(
                    func_name.clone(),
                    FnKind::Thunk,
                    cap_params.clone(),
                    captures.clone(),
                );

                // Bind captured variables.
                for (cap_name, cap_temp) in captures.iter().zip(cap_params.iter()) {
                    self.push_env(cap_name.clone(), cap_temp.clone());
                }

                let body_result = self.lower_expr(body);
                self.finish_block(Terminator::Ret { arg: body_result });
                self.finish_function();

                // Restore outer.
                self.cur_func_name = saved_name;
                self.cur_func_kind = saved_kind;
                self.cur_func_params = saved_params;
                self.cur_func_captures = saved_captures_outer;
                self.cur_blocks = saved_blocks;

                // thunk_alloc @thunk_name, [captured_values...]
                let cap_args: Vec<Arg> = captures.iter().map(|c| self.lookup(c)).collect();
                let mut args = vec![Arg::Temp(func_name)];
                args.extend(cap_args);
                let t = self.emit(Op::ThunkAlloc, args);
                Arg::Temp(t)
            }

            Ir::Force(inner) => {
                let val = self.lower_expr(inner);
                let t = self.emit(Op::ThunkForce, vec![val]);
                Arg::Temp(t)
            }

            Ir::Fix(name, body, _) => {
                // For fix, we lower the body as a lambda but mark `name` as a self-reference.
                // The fix name is pushed as a temp that will be resolved recursively.
                let placeholder = self.fresh_temp();
                self.push_env(name.clone(), placeholder.clone());

                let result = self.lower_expr(body);
                // The placeholder is overwritten by the actual fix value at runtime.
                // In flat IR, we just emit a comment-like note.
                // Actually, the fix body Lowering should handle self-reference via thunks.
                // For simplicity, we just lower the body with the placeholder.
                result
            }

            Ir::Dup(inner) => {
                let v = self.lower_expr(inner);
                let t = self.emit(Op::Dup, vec![v]);
                Arg::Temp(t)
            }

            Ir::Alloc(inner) => {
                let v = self.lower_expr(inner);
                let t = self.emit(Op::Alloc, vec![v]);
                Arg::Temp(t)
            }

            Ir::Dealloc(inner) => {
                let v = self.lower_expr(inner);
                let t = self.emit(Op::Dealloc, vec![v]);
                Arg::Temp(t)
            }

            Ir::Nil => Arg::LitNil,

            Ir::Cons(head, tail) => {
                let h = self.lower_expr(head);
                let t = self.lower_expr(tail);
                let c = self.emit(Op::Cons, vec![h, t]);
                Arg::Temp(c)
            }

            Ir::Head(list) => {
                let l = self.lower_expr(list);
                let t = self.emit(Op::Head, vec![l]);
                Arg::Temp(t)
            }

            Ir::Tail(list) => {
                let l = self.lower_expr(list);
                let t = self.emit(Op::Tail, vec![l]);
                Arg::Temp(t)
            }

            Ir::IsNil(list) => {
                let l = self.lower_expr(list);
                let t = self.emit(Op::IsNil, vec![l]);
                Arg::Temp(t)
            }
        }
    }

    fn convert_op(&self, op: &IrOp) -> Op {
        match op {
            IrOp::Add => Op::Add,
            IrOp::Sub => Op::Sub,
            IrOp::Mul => Op::Mul,
            IrOp::Div => Op::Div,
            IrOp::Eq => Op::Eq,
            IrOp::Lt => Op::Lt,
            IrOp::Gt => Op::Gt,
        }
    }

    /// Get the current environment bindings that a closure would need to capture.
    fn capture_current_env(&self) -> Vec<(String, String)> {
        self.env.clone()
    }
}
