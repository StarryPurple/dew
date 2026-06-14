// AST -> Thunk Graph IR compilation
//
// Uses strictness analysis to determine Force/Lazy edges.
// Each `def` produces: ThunkAlloc -> ThunkDef -> Force -> Update -> Def.

use crate::ast::{BinOpKind, Decl, Expr, Pattern as APattern};
use crate::ir::{Ir, Lit, Module, Node, Pattern, PrimOp, ValueRef};
use crate::strictness;

pub struct GenCtx {
  next_id: usize,
  current_def: Option<(String, crate::ir::Label)>,
}

impl GenCtx {
  pub fn new() -> Self {
    Self { next_id: 0, current_def: None }
  }

  fn fresh_label(&mut self) -> crate::ir::Label {
    let l = crate::ir::Label::new(self.next_id);
    self.next_id += 1;
    l
  }

  pub fn compile_program(&mut self, decls: &[Decl]) -> Module {
    let mut module = Module::new();
    for decl in decls {
      self.compile_decl(decl, &mut module);
    }
    module
  }

  fn compile_decl(&mut self, decl: &Decl, module: &mut Module) {
    match decl {
      Decl::Def { name, value, .. } => {
        if contains_io(value) {
          let ir = self.compile_expr(value);
          module.push(Node::StrictDef { name: name.clone(), value: ir });
        } else {
          let thunk_label = self.fresh_label();
          let saved = self.current_def.take();
          self.current_def = Some((name.clone(), thunk_label.clone()));
          module.push(Node::ThunkAlloc { label: thunk_label.clone() });
          let body = self.compile_expr(value);
          module.push(Node::ThunkDef { label: thunk_label.clone(), body });
          let force_label = self.fresh_label();
          module.push(Node::Force { label: force_label.clone(), target: thunk_label.clone() });
          module.push(Node::Update { label: thunk_label.clone(), value: ValueRef::Label(force_label) });
          module.push(Node::Def { name: name.clone(), label: thunk_label });
          self.current_def = saved;
        }
      }
      Decl::Struct { .. } | Decl::Enum { .. } | Decl::Import { .. } => {}
    }
  }

  fn compile_expr(&mut self, expr: &Expr) -> Ir {
    let s = strictness::classify(expr, strictness::Strictness::Lazy);
    self.compile_expr_ctx(expr, s)
  }

  fn compile_expr_ctx(&mut self, expr: &Expr, ctx: strictness::Strictness) -> Ir {
    let inner = self.compile_expr_inner(expr);
    match ctx {
      strictness::Strictness::Strict => {
        inner
      }
      strictness::Strictness::Lazy => inner,
    }
  }

  fn compile_expr_inner(&mut self, expr: &Expr) -> Ir {
    match expr {
      Expr::Int(n, _) => Ir::Lit(Lit::Int(*n)),
      Expr::Bool(b, _) => Ir::Lit(Lit::Bool(*b)),
      Expr::Char(c, _) => Ir::Lit(Lit::Char(*c)),
      Expr::Unit(_) => Ir::Lit(Lit::Unit),
      Expr::Var(name, _) => {
        if let Some((def_name, label)) = &self.current_def {
          if name == def_name {
            return Ir::Ref(label.clone());
          }
        }
        Ir::Var(name.clone())
      },

      Expr::Fn { params, body, .. } => {
        let names: Vec<String> = params.iter().map(|(n, _)| n.clone()).collect();
        let b = self.compile_expr_ctx(body, strictness::Strictness::Lazy);
        Ir::Lambda { params: names, body: Box::new(b) }
      }

      Expr::App { func, args, .. } => {
        let f = self.compile_expr_ctx(func, strictness::Strictness::Strict);
        let a: Vec<Ir> = args.iter()
          .map(|a| self.compile_expr_ctx(a, strictness::Strictness::Lazy))
          .collect();
        Ir::Apply { func: Box::new(f), args: a }
      }

      Expr::Let { name, value, body, .. } => {
        let v = self.compile_expr_ctx(value, strictness::Strictness::Lazy);
        let b = self.compile_expr(body);
        Ir::Let { name: name.clone(), value: Box::new(v), body: Box::new(b) }
      }

      Expr::If { cond, then, else_, .. } => {
        let c = self.compile_expr_ctx(cond, strictness::Strictness::Strict);
        let t = self.compile_expr(then);
        let e = self.compile_expr(else_);
        Ir::If { cond: Box::new(c), then: Box::new(t), else_: Box::new(e) }
      }

      Expr::BinOp { op, left, right, .. } => {
        let l = self.compile_expr_ctx(left, strictness::Strictness::Strict);
        let r = self.compile_expr_ctx(right, strictness::Strictness::Strict);
        Ir::Prim { op: convert_prim(*op), args: vec![l, r] }
      }

      Expr::Force { expr, .. } => {
        let inner = self.compile_expr_ctx(expr, strictness::Strictness::Strict);
        inner
      }

      Expr::Return { expr, .. } => {
        let e = self.compile_expr_ctx(expr, strictness::Strictness::Strict);
        Ir::Return(Box::new(e))
      }

      Expr::Pipe { left, right, .. } => {
        if let Expr::App { func, args, .. } = right.as_ref() {
          let mut new_args = args.clone();
          new_args.push(*left.clone());
          let f = self.compile_expr_ctx(func, strictness::Strictness::Strict);
          let a: Vec<Ir> = new_args.iter()
            .map(|a| self.compile_expr_ctx(a, strictness::Strictness::Lazy))
            .collect();
          Ir::Apply { func: Box::new(f), args: a }
        } else {
          let f = self.compile_expr_ctx(right, strictness::Strictness::Strict);
          let arg = self.compile_expr_ctx(left, strictness::Strictness::Lazy);
          Ir::Apply { func: Box::new(f), args: vec![arg] }
        }
      }

      Expr::Fix { name, body, .. } => {
        let b = self.compile_expr(body);
        Ir::Fix { name: name.clone(), body: Box::new(b) }
      }

      Expr::Match { scrutinee, arms, .. } => {
        let s = self.compile_expr_ctx(scrutinee, strictness::Strictness::Strict);
        let ir_arms: Vec<(Pattern, Ir)> = arms.iter()
          .map(|(pat, body)| (convert_pattern(pat), self.compile_expr(body)))
          .collect();
        Ir::Match { scrutinee: Box::new(s), arms: ir_arms }
      }

      Expr::StructCons { name, fields, .. } => {
        // Struct construction is function application to the struct constructor
        let fs: Vec<Ir> = fields.iter()
          .map(|f| self.compile_expr_ctx(f, strictness::Strictness::Lazy))
          .collect();
        // Check recursive reference
        let func = if let Some((def_name, label)) = &self.current_def {
          if name == def_name {
            Ir::Ref(label.clone())
          } else {
            Ir::Var(name.clone())
          }
        } else {
          Ir::Var(name.clone())
        };
        Ir::Apply { func: Box::new(func), args: fs }
      }

      Expr::FieldAccess { expr, field, .. } => {
        let e = self.compile_expr_ctx(expr, strictness::Strictness::Strict);
        Ir::FieldAccess { expr: Box::new(e), field: field.clone() }
      }

      Expr::StructUpdate { expr, updates, .. } => {
        let e = self.compile_expr_ctx(expr, strictness::Strictness::Strict);
        let us: Vec<(String, Ir)> = updates.iter()
          .map(|(name, val)| (name.clone(), self.compile_expr_ctx(val, strictness::Strictness::Lazy)))
          .collect();
        Ir::StructUpdate { expr: Box::new(e), updates: us }
      }

      Expr::ArrayLit { elements, .. } => {
        let items: Vec<Ir> = elements.iter()
          .map(|e| self.compile_expr_ctx(e, strictness::Strictness::Lazy))
          .collect();
        Ir::Array(items)
      }

      Expr::ArrayAccess { expr, index, .. } => {
        let a = self.compile_expr_ctx(expr, strictness::Strictness::Strict);
        let i = self.compile_expr_ctx(index, strictness::Strictness::Strict);
        Ir::ArrayAccess { expr: Box::new(a), index: Box::new(i) }
      }

      Expr::TupleLit { elements, .. } => {
        let items: Vec<Ir> = elements.iter()
          .map(|e| self.compile_expr_ctx(e, strictness::Strictness::Lazy))
          .collect();
        Ir::Tuple(items)
      }

      Expr::Block { stmts, final_expr, .. } => {
        let mut body = self.compile_expr(final_expr);
        for stmt in stmts.iter().rev() {
          let ir = self.compile_expr_ctx(stmt, strictness::Strictness::Lazy);
          body = Ir::Let {
            name: "_".to_string(),
            value: Box::new(ir),
            body: Box::new(body),
          };
        }
        body
      }

      _ => Ir::Lit(Lit::Unit),
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

fn convert_pattern(pat: &APattern) -> Pattern {
  match pat {
    APattern::Wildcard => Pattern::Wildcard,
    APattern::Var(name) => Pattern::Var(name.clone()),
    APattern::Lit(Expr::Int(n, _)) => Pattern::Lit(Lit::Int(*n)),
    APattern::Lit(Expr::Bool(b, _)) => Pattern::Lit(Lit::Bool(*b)),
    APattern::Lit(Expr::Char(c, _)) => Pattern::Lit(Lit::Char(*c)),
    APattern::Lit(Expr::Unit(_)) => Pattern::Lit(Lit::Unit),
    APattern::Struct(name, fields) =>
      Pattern::Struct(name.clone(), fields.iter().map(convert_pattern).collect()),
    APattern::EnumVariant(name, payload) =>
      Pattern::EnumVariant(name.clone(), payload.as_ref().map(|p| Box::new(convert_pattern(p)))),
    APattern::Tuple(items) =>
      Pattern::Tuple(items.iter().map(convert_pattern).collect()),
    _ => Pattern::Wildcard,
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
