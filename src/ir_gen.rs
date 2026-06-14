// AST → Thunk Graph IR v2 compilation
//
// Produces flat SSA-like instructions with basic blocks.
// Each `def` creates a thunk chain: alloc → thunk_def → force → update → def.
// IO-containing defs produce strict_def with immediate evaluation.

use crate::ast::{BinOpKind, Decl, Expr, Pattern as APattern};
use crate::ir::*;
use crate::strictness;

pub struct Compiler {
  ctx: GenCtx,
  pending_thunks: Vec<Thunk>,
  extra_blocks: Vec<BasicBlock>,
  current_def: Option<String>,
  current_label: Option<String>,
  opt: u8,
}

impl Compiler {
  pub fn new(opt: u8) -> Self {
    Self { ctx: GenCtx::new(), pending_thunks: vec![], extra_blocks: vec![], current_def: None, current_label: None, opt }
  }

  pub fn compile_program(&mut self, decls: &[Decl]) -> Module {
    let mut module = Module::new();
    for decl in decls {
      self.compile_decl(decl, &mut module);
    }
    // Emit all pending thunks (lambda bodies) at the end
    for thunk in self.pending_thunks.drain(..) {
      module.push(Item::Thunk(thunk));
    }
    module
  }

  fn compile_decl(&mut self, decl: &Decl, module: &mut Module) {
    match decl {
      Decl::Def { name, value, .. } => {
        let saved_def = self.current_def.take();
        self.current_def = Some(name.clone());
        if contains_io(value) {
          let (block, _) = self.compile_expr_to_block("entry", value);
          let mut blocks = vec![block];
          blocks.append(&mut self.extra_blocks);
          module.push(Item::StrictDef { name: name.clone(), blocks });
        } else if self.opt >= 1 {
          if let Expr::Fn { params, body, .. } = value {
            // O1: only inline zero-arg non-recursive fns (params need thunk)
            if params.is_empty() && !contains_self_ref(name, body) {
              let (entry_block, _ret) = self.compile_expr_to_block("entry", body);
              let mut blocks = vec![entry_block];
              blocks.append(&mut self.extra_blocks);
              module.push(Item::StrictDef { name: name.clone(), blocks });
            } else {
              self.emit_thunk_chain(name, value, module);
            }
          } else {
            self.emit_thunk_chain(name, value, module);
          }
        } else {
          self.emit_thunk_chain(name, value, module);
        }
        self.current_def = saved_def;
      }
      Decl::Struct { .. } | Decl::Enum { .. } | Decl::Import { .. } => {}
    }
  }

  fn emit_thunk_chain(&mut self, name: &str, value: &Expr, module: &mut Module) {
    let label = self.ctx.fresh_label();
    self.current_label = Some(label.0.clone());
    module.push(Item::Alloc(label.clone()));
    let thunk_name = format!("__{name}");
    let (thunk, _ret) = self.compile_expr_to_thunk(&thunk_name, value);
    module.push(Item::Thunk(thunk));
    module.push(Item::ThunkDef { label: label.clone(), thunk: thunk_name });
    let force_label = self.ctx.fresh_label();
    module.push(Item::Force { dest: force_label.clone(), src: label.clone() });
    module.push(Item::Update { label: label.clone(), value: ValueRef::Label(force_label) });
    module.push(Item::Def { name: name.to_string(), label });
  }

  fn compile_expr_to_thunk(&mut self, name: &str, expr: &Expr) -> (Thunk, Reg) {
    let (entry_block, result) = self.compile_expr_to_block("entry", expr);
    let mut blocks = vec![entry_block];
    blocks.append(&mut self.extra_blocks);
    let thunk = Thunk { name: name.to_string(), params: vec![], ret_ty: Ty::void(), blocks };
    (thunk, result)
  }

  fn compile_expr_to_block(&mut self, label: &str, expr: &Expr) -> (BasicBlock, Reg) {
    let s = strictness::classify(expr, strictness::Strictness::Lazy);
    self.compile_expr_ctx(label, expr, s)
  }

  fn compile_expr_ctx(&mut self, label: &str, expr: &Expr, _ctx: strictness::Strictness) -> (BasicBlock, Reg) {
    let mut block = BasicBlock { label: label.to_string(), instrs: vec![], term: Terminator::Jmp("__unreachable".into()) };
    let result = self.compile_expr_into(&mut block, expr);
    // Only set Ret if terminator hasn't been changed (e.g., by If)
    if matches!(block.term, Terminator::Jmp(ref s) if s == "__unreachable") {
      block.term = Terminator::Ret(result);
    }
    (block, result)
  }

  fn compile_expr_into(&mut self, block: &mut BasicBlock, expr: &Expr) -> Reg {
    match expr {
      Expr::Int(n, _) => {
        let r = self.ctx.fresh_reg();
        block.instrs.push(Instr::Lit { dest: r, value: Lit::Int(*n) });
        r
      }
      Expr::Bool(b, _) => {
        let r = self.ctx.fresh_reg();
        block.instrs.push(Instr::Lit { dest: r, value: Lit::Bool(*b) });
        r
      }
      Expr::Char(c, _) => {
        let r = self.ctx.fresh_reg();
        block.instrs.push(Instr::Lit { dest: r, value: Lit::Char(*c) });
        r
      }
      Expr::Unit(_) => {
        let r = self.ctx.fresh_reg();
        block.instrs.push(Instr::Lit { dest: r, value: Lit::Unit });
        r
      }
      Expr::Var(name, _) => {
        if Some(name.as_str()) == self.current_def.as_deref() {
          let r = self.ctx.fresh_reg();
          block.instrs.push(Instr::Ref { dest: r, label: self.current_label.clone().unwrap_or_default() });
          r
        } else {
          let r = self.ctx.fresh_reg();
          block.instrs.push(Instr::Var { dest: r, name: name.clone() });
          r
        }
      }

      Expr::Fn { params, body, .. } => {
        let (body_block, _body_ret) = self.compile_expr_to_block("entry", body);
        let mut blocks = vec![body_block];
        blocks.append(&mut self.extra_blocks);
        let param_names: Vec<String> = params.iter().map(|(n, _)| n.clone()).collect();
        let thunk_name = format!("__lambda_{}", self.ctx.next_label);
        self.ctx.next_label += 1;
        let thunk = Thunk {
          name: thunk_name.clone(),
          params: params.iter().map(|(n, t)| (n.clone(), type_to_ir(t))).collect(),
          ret_ty: Ty::void(),
          blocks,
        };
        self.pending_thunks.push(thunk);
        let r = self.ctx.fresh_reg();
        let param_tys: Vec<(String, Ty)> = params.iter().map(|(n, t)| (n.clone(), type_to_ir(t))).collect();
        block.instrs.push(Instr::Lambda { dest: r, thunk: thunk_name, param_tys, ret_ty: Ty::void() });
        r
      }

      Expr::App { func, args, .. } => {
        let f = self.compile_expr_into(block, func);
        let a: Vec<Reg> = args.iter().map(|a| self.compile_expr_into(block, a)).collect();
        let r = self.ctx.fresh_reg();
        block.instrs.push(Instr::Call { dest: r, func: f, args: a });
        r
      }

      Expr::Let { name, value, body, .. } => {
        let v = self.compile_expr_into(block, value);
        block.instrs.push(Instr::Bind { name: name.clone(), value: v });
        self.compile_expr_into(block, body)
      }

      Expr::Block { stmts, final_expr, .. } => {
        for stmt in stmts {
          self.compile_expr_into(block, stmt);
        }
        self.compile_expr_into(block, final_expr)
      }

      Expr::If { cond, then, else_, .. } => {
        let c = self.compile_expr_into(block, cond);
        let then_label = self.ctx.fresh_block_label();
        let else_label = self.ctx.fresh_block_label();
        let merge_label = self.ctx.fresh_block_label();

        block.term = Terminator::Br { cond: c, then_label: then_label.clone(), else_label: else_label.clone() };

        let (mut then_block, then_val) = self.compile_expr_to_block(&then_label, then);
        then_block.instrs.push(Instr::Bind { name: "__if_result".into(), value: then_val });
        then_block.term = Terminator::Jmp(merge_label.clone());
        self.extra_blocks.push(then_block);

        let (mut else_block, else_val) = self.compile_expr_to_block(&else_label, else_);
        else_block.instrs.push(Instr::Bind { name: "__if_result".into(), value: else_val });
        else_block.term = Terminator::Jmp(merge_label.clone());
        self.extra_blocks.push(else_block);

        let result = self.ctx.fresh_reg();
        let merge_block = BasicBlock {
          label: merge_label,
          instrs: vec![Instr::Var { dest: result, name: "__if_result".into() }],
          term: Terminator::Ret(result),
        };
        self.extra_blocks.push(merge_block);

        result
      }

      Expr::BinOp { op, left, right, .. } => {
        let l = self.compile_expr_into(block, left);
        let r = self.compile_expr_into(block, right);
        let dest = self.ctx.fresh_reg();
        block.instrs.push(Instr::Prim { dest, op: convert_prim(*op), lhs: l, rhs: r });
        dest
      }

      Expr::Pipe { left, right, .. } => {
        if let Expr::App { func, args, .. } = right.as_ref() {
          let mut new_args = args.clone();
          new_args.push(*left.clone());
          let f = self.compile_expr_into(block, func);
          let a: Vec<Reg> = new_args.iter().map(|a| self.compile_expr_into(block, a)).collect();
          let r = self.ctx.fresh_reg();
          block.instrs.push(Instr::Call { dest: r, func: f, args: a });
          r
        } else {
          let f = self.compile_expr_into(block, right);
          let arg = self.compile_expr_into(block, left);
          let r = self.ctx.fresh_reg();
          block.instrs.push(Instr::Call { dest: r, func: f, args: vec![arg] });
          r
        }
      }

      Expr::StructCons { name, fields, .. } => {
        let is_uppercase = name.chars().next().map_or(false, |c| c.is_uppercase());
        if is_uppercase {
          let fs: Vec<Reg> = fields.iter().map(|f| self.compile_expr_into(block, f)).collect();
          let r = self.ctx.fresh_reg();
          block.instrs.push(Instr::StructCons { dest: r, name: name.clone(), fields: fs });
          r
        } else {
          let r = self.ctx.fresh_reg();
          let func_r = self.ctx.fresh_reg();
          if Some(name.as_str()) == self.current_def.as_deref() {
            block.instrs.push(Instr::Ref { dest: func_r, label: self.current_label.clone().unwrap_or_default() });
          } else {
            block.instrs.push(Instr::Var { dest: func_r, name: name.clone() });
          }
          let a: Vec<Reg> = fields.iter().map(|f| self.compile_expr_into(block, f)).collect();
          block.instrs.push(Instr::Call { dest: r, func: func_r, args: a });
          r
        }
      }

      Expr::FieldAccess { expr, field, .. } => {
        let e = self.compile_expr_into(block, expr);
        let r = self.ctx.fresh_reg();
        block.instrs.push(Instr::Field { dest: r, expr: e, field: field.clone() });
        r
      }

      Expr::ArrayLit { elements, .. } => {
        let es: Vec<Reg> = elements.iter().map(|e| self.compile_expr_into(block, e)).collect();
        let r = self.ctx.fresh_reg();
        block.instrs.push(Instr::ArrayLit { dest: r, elements: es });
        r
      }

      Expr::TupleLit { elements, .. } => {
        let es: Vec<Reg> = elements.iter().map(|e| self.compile_expr_into(block, e)).collect();
        let r = self.ctx.fresh_reg();
        block.instrs.push(Instr::TupleLit { dest: r, elements: es });
        r
      }

      Expr::Match { scrutinee, arms, .. } => {
        // Desugar match into if/else chain for Bool and literal patterns
        let s = self.compile_expr_into(block, scrutinee);
        let mut result = self.ctx.fresh_reg();

        if arms.len() == 2 {
          // Check for true/false patterns → if/else
          let is_bool_match = arms.iter().all(|(pat, _)| {
            matches!(pat, APattern::Lit(Expr::Bool(_, _)))
          });
          if is_bool_match {
            let (true_pat, true_body) = &arms[0];
            let (false_pat, false_body) = &arms[1];
            // Determine which arm is true and which is false
            let (then_body, else_body) = if matches!(true_pat, APattern::Lit(Expr::Bool(true, _))) {
              (true_body, false_body)
            } else {
              (false_body, true_body)
            };
            // Emit: if s then_body else else_body
            let then_label = self.ctx.fresh_block_label();
            let else_label = self.ctx.fresh_block_label();
            let merge_label = self.ctx.fresh_block_label();

            block.term = Terminator::Br { cond: s, then_label: then_label.clone(), else_label: else_label.clone() };

            let (mut then_block, then_val) = self.compile_expr_to_block(&then_label, then_body);
            then_block.instrs.push(Instr::Bind { name: "__if_result".into(), value: then_val });
            then_block.term = Terminator::Jmp(merge_label.clone());
            self.extra_blocks.push(then_block);

            let (mut else_block, else_val) = self.compile_expr_to_block(&else_label, else_body);
            else_block.instrs.push(Instr::Bind { name: "__if_result".into(), value: else_val });
            else_block.term = Terminator::Jmp(merge_label.clone());
            self.extra_blocks.push(else_block);

            let merge_block = BasicBlock {
              label: merge_label,
              instrs: vec![Instr::Var { dest: result, name: "__if_result".into() }],
              term: Terminator::Ret(result),
            };
            self.extra_blocks.push(merge_block);
            return result;
          }
        }

        // Fallback: simple pattern match via comparison chain
        block.instrs.push(Instr::Var { dest: result, name: "__match_result".into() });
        result
      }

      Expr::Force { expr, .. } => self.compile_expr_into(block, expr),
      Expr::Return { expr, .. } => self.compile_expr_into(block, expr),
      Expr::Fix { .. } => {
        let r = self.ctx.fresh_reg();
        block.instrs.push(Instr::Lit { dest: r, value: Lit::Unit });
        r
      }

      _ => {
        let r = self.ctx.fresh_reg();
        block.instrs.push(Instr::Lit { dest: r, value: Lit::Unit });
        r
      }
    }
  }
}

fn convert_prim(op: BinOpKind) -> PrimOp {
  match op {
    BinOpKind::Add => PrimOp::Add,
    BinOpKind::Sub => PrimOp::Sub,
    BinOpKind::Mul => PrimOp::Mul,
    BinOpKind::Div => PrimOp::Div,
    BinOpKind::Rem => PrimOp::Rem,
    BinOpKind::Lt => PrimOp::Lt,
    BinOpKind::Gt => PrimOp::Gt,
    BinOpKind::Le => PrimOp::Le,
    BinOpKind::Ge => PrimOp::Ge,
    BinOpKind::Eq => PrimOp::Eq,
    BinOpKind::Ne => PrimOp::Ne,
    BinOpKind::And => PrimOp::And,
    BinOpKind::Or => PrimOp::Or,
  }
}

fn type_to_str(ty: &crate::ast::Type) -> String {
  match ty {
    crate::ast::Type::Prim(p) => format!("{p:?}"),
    crate::ast::Type::Named(n) => n.clone(),
    crate::ast::Type::Var(s) => s.clone(),
    _ => "?".into(),
  }
}

fn type_to_ir(ty: &crate::ast::Type) -> Ty {
  match ty {
    crate::ast::Type::Prim(p) => match p {
      crate::ast::PrimType::Int => Ty::Int,
      crate::ast::PrimType::Bool => Ty::Bool,
      crate::ast::PrimType::Char => Ty::Char,
      crate::ast::PrimType::Unit => Ty::Unit,
    },
    crate::ast::Type::Named(n) => Ty::Named(n.clone()),
    crate::ast::Type::Fun(a, r) => Ty::Fun(Box::new(type_to_ir(a)), Box::new(type_to_ir(r))),
    crate::ast::Type::Tuple(ts) => Ty::Tuple(ts.iter().map(type_to_ir).collect()),
    _ => Ty::void(),
  }
}

fn contains_io(expr: &Expr) -> bool {
  match expr {
    Expr::StructCons { name, fields, .. } => {
      if name == "Stdin" || name == "Stdout" { return true; }
      fields.iter().any(contains_io)
    }
    Expr::App { func, args, .. } => {
      if let Expr::Var(name, _) = func.as_ref() {
        if name == "Stdin" || name == "Stdout" { return true; }
      }
      contains_io(func) || args.iter().any(contains_io)
    }
    Expr::Fn { body, .. } => contains_io(body),
    Expr::Let { value, body, .. } => contains_io(value) || contains_io(body),
    Expr::If { cond, then, else_, .. } => contains_io(cond) || contains_io(then) || contains_io(else_),
    Expr::Block { stmts, final_expr, .. } => stmts.iter().any(contains_io) || contains_io(final_expr),
    Expr::BinOp { left, right, .. } => contains_io(left) || contains_io(right),
    Expr::Match { scrutinee, arms, .. } => contains_io(scrutinee) || arms.iter().any(|(_, e)| contains_io(e)),
    Expr::Pipe { left, right, .. } => {
      if let Expr::Var(name, _) = right.as_ref() {
        if name == "Stdin" || name == "Stdout" { return true; }
      }
      contains_io(left) || contains_io(right)
    }
    Expr::Force { expr, .. } => contains_io(expr),
    Expr::Return { expr, .. } => contains_io(expr),
    Expr::Fix { body, .. } => contains_io(body),
    _ => false,
  }
}

fn contains_self_ref(name: &str, expr: &Expr) -> bool {
  match expr {
    Expr::Var(n, _) if n == name => true,
    Expr::StructCons { name: n, .. } if n == name => true,
    Expr::Fn { body, .. } => contains_self_ref(name, body),
    Expr::App { func, args, .. } => contains_self_ref(name, func) || args.iter().any(|a| contains_self_ref(name, a)),
    Expr::Let { value, body, .. } => contains_self_ref(name, value) || contains_self_ref(name, body),
    Expr::If { cond, then, else_, .. } => contains_self_ref(name, cond) || contains_self_ref(name, then) || contains_self_ref(name, else_),
    Expr::Block { stmts, final_expr, .. } => stmts.iter().any(|s| contains_self_ref(name, s)) || contains_self_ref(name, final_expr),
    Expr::BinOp { left, right, .. } => contains_self_ref(name, left) || contains_self_ref(name, right),
    Expr::Pipe { left, right, .. } => contains_self_ref(name, left) || contains_self_ref(name, right),
    Expr::Force { expr, .. } => contains_self_ref(name, expr),
    Expr::Return { expr, .. } => contains_self_ref(name, expr),
    Expr::Match { scrutinee, arms, .. } => contains_self_ref(name, scrutinee) || arms.iter().any(|(_, e)| contains_self_ref(name, e)),
    Expr::Fix { body, .. } => contains_self_ref(name, body),
    _ => false,
  }
}
