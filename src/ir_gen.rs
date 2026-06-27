// IR Generation: AST → IR Module.
//
// Lowers expressions to SSA instructions in basic blocks.
// Determines fn vs thunk based on definition arity and IO.
// Handles closure conversion (lambda lifting) during IR gen.

use crate::ast::*;
use crate::diagnostics::DiagnosticCollector;
use crate::ir::block::BasicBlock;
use crate::ir::func::Fn;
use crate::ir::instr::{self, Instr, Terminator, CallTarget, ForceTarget, Accessor, LitValue as IrLitValue};
use crate::ir::module::Module;
use crate::ir::thunk::Thunk;
use crate::ir::types::*;

pub struct IrGenerator<'a> {
    diag: &'a mut DiagnosticCollector,
    module: Module,
    next_reg: usize,
    next_label: usize,
    next_closure: usize,
    next_thunk: usize,
    var_map: std::collections::HashMap<String, usize>,
    thunk_names: std::collections::HashSet<String>,
    thunk_name_map: std::collections::HashMap<String, String>,
    rec_fn_names: std::collections::HashSet<String>,
    current_fn_return_ty: IrType,
    fn_param_names: std::collections::HashSet<String>,
    extra_blocks: Vec<BasicBlock>,
    reg_struct: std::collections::HashMap<usize, String>,
    tuple_elem_types: std::collections::HashMap<usize, Vec<IrType>>,
    param_array_elem_types: std::collections::HashMap<usize, IrType>,
    fn_param_regs: std::collections::HashMap<String, usize>,
    reg_type: std::collections::HashMap<usize, IrType>,
}

impl<'a> IrGenerator<'a> {
    pub fn new(diag: &'a mut DiagnosticCollector) -> Self {
        IrGenerator {
            diag,
            module: Module::new(),
            next_reg: 0,
            next_label: 0,
            next_closure: 0,
            next_thunk: 0,
            var_map: std::collections::HashMap::new(),
            thunk_names: std::collections::HashSet::new(),
            thunk_name_map: std::collections::HashMap::new(),
            rec_fn_names: std::collections::HashSet::new(),
            current_fn_return_ty: IrType::Int,
            fn_param_names: std::collections::HashSet::new(),
            extra_blocks: Vec::new(),
            reg_struct: std::collections::HashMap::new(),
            tuple_elem_types: std::collections::HashMap::new(),
            param_array_elem_types: std::collections::HashMap::new(),
            fn_param_regs: std::collections::HashMap::new(),
            reg_type: std::collections::HashMap::new(),
        }
    }

    pub fn generate(mut self, prog: &Program) -> Module {
        for decl in &prog.decls {
            match decl {
                Decl::Struct(s) => self.register_struct(s),
                Decl::Enum(e) => self.register_enum(e),
                Decl::Def(d) => self.compile_def(d),
                Decl::Import(_) => {}
            }
        }
        self.module
    }

    fn fresh_reg(&mut self) -> usize {
        let r = self.next_reg;
        self.next_reg += 1;
        r
    }

    fn fresh_label(&mut self, prefix: &str) -> String {
        let l = format!("{}{}", prefix, self.next_label);
        self.next_label += 1;
        l
    }

    fn register_struct(&mut self, s: &StructDecl) {
        let fields: Vec<(String, IrType)> = s.fields.iter().map(|f| {
            (f.name.name.clone(), self.ast_ty_to_ir(&f.ty))
        }).collect();
        let size = fields.len() * 8;
        self.module.types.add_struct(StructDef {
            name: s.name.name.clone(), fields, size,
        });
    }

    fn register_enum(&mut self, e: &EnumDecl) {
        let variants: Vec<VariantDef> = e.variants.iter().enumerate().map(|(i, v)| {
            let fields = match v {
                Variant::Single { payload, .. } => {
                    payload.iter().enumerate().map(|(j, ty)| {
                        (format!("{}", j), self.ast_ty_to_ir(ty))
                    }).collect()
                }
                Variant::Struct { fields, .. } => {
                    fields.iter().map(|f| (f.name.name.clone(), self.ast_ty_to_ir(&f.ty))).collect()
                }
                Variant::Unit { .. } => vec![],
            };
            let name = match v {
                Variant::Single { name, .. } | Variant::Struct { name, .. } | Variant::Unit { name, .. } => name.name.clone(),
            };
            VariantDef { name, tag: i, fields }
        }).collect();
        let size = 8 + variants.iter().map(|v| v.fields.len() * 8).max().unwrap_or(0);
        self.module.types.add_enum(EnumDef {
            name: e.name.name.clone(), variants, size,
        });
    }

    fn compile_def(&mut self, d: &DefDecl) {
        match &d.value {
            Expr::Fn(_) => self.compile_fn(d),
            _ => self.compile_thunk(d),
        }
    }

    fn compile_fn(&mut self, d: &DefDecl) {
        let f = match &d.value {
            Expr::Fn(f) => f,
            _ => return,
        };

        let params: Vec<(usize, IrType)> = f.params.iter().enumerate().map(|(i, p)| {
            (i, p.ty.as_ref().map(|t| self.ast_ty_to_ir(t)).unwrap_or(IrType::Int))
        }).collect();

        let fn_name = d.name.name.clone();
        let return_ty = f.return_ty.as_ref().map(|t| self.ast_ty_to_ir(t)).unwrap_or(IrType::Int);

        // Register parameter struct types in reg_struct before params is moved
        for (i, (_, ty)) in params.iter().enumerate() {
            self.reg_type.insert(i, ty.clone());
            if let IrType::Struct(name) = ty {
                self.reg_struct.insert(i, name.clone());
            } else if let IrType::Tuple(_) = ty {
                self.reg_struct.insert(i, "%tuple".into());
            } else if let IrType::Array(elem_ty, _) = ty {
                self.param_array_elem_types.insert(i, *elem_ty.clone());
            }
        }

        // Track rec-defining fn names so self-referencing calls inside the
        // body resolve via Static call (not thunk Force, which blackholes).
        self.rec_fn_names.insert(fn_name.clone());
        self.current_fn_return_ty = return_ty.clone();

        let mut ir_fn = Fn::new(fn_name, params, return_ty.clone());
        let fn_return_ty = return_ty.clone();
        let mut block = BasicBlock::new("entry".into());
        self.next_reg = f.params.len();
        self.var_map.clear();

        for (i, param) in f.params.iter().enumerate() {
            self.var_map.insert(param.name.name.clone(), i);
            self.fn_param_names.insert(param.name.name.clone());
        }
        self.fn_param_names.retain(|n| !n.starts_with('%'));
        self.fn_param_regs = self.var_map.clone();

        let result_reg = self.compile_expr(&f.body, &mut block);
        self.compile_finish(&mut block, &mut ir_fn.blocks, result_reg);
        self.extra_blocks.clear();

        let fn_name = ir_fn.name.clone();
        self.rec_fn_names.remove(&fn_name);
        self.module.fns.push(ir_fn);
    }

    fn compile_thunk(&mut self, d: &DefDecl) {
        let val_ty = match &d.ty {
            Some(t) => self.ast_ty_to_ir(t),
            None => IrType::Int,
        };

        let name = d.name.name.clone();
        self.thunk_names.insert(name.clone());

        let mut t = Thunk::new(name, val_ty.clone());
        let mut block = BasicBlock::new("entry".into());
        self.next_reg = 0;

        let result_reg = self.compile_expr(&d.value, &mut block);
        self.compile_finish(&mut block, &mut t.blocks, result_reg);
        self.extra_blocks.clear();

        self.module.thunks.push(t);
    }

    fn compile_expr(&mut self, expr: &Expr, block: &mut BasicBlock) -> usize {
        match expr {
            Expr::IntLit(l) => {
                let r = self.fresh_reg();
                block.instrs.push(Instr::Lit(r, IrLitValue::Int(l.value)));
                r
            }
            Expr::BoolLit(l) => {
                let r = self.fresh_reg();
                block.instrs.push(Instr::Lit(r, IrLitValue::Bool(l.value)));
                r
            }
            Expr::CharLit(l) => {
                let r = self.fresh_reg();
                block.instrs.push(Instr::Lit(r, IrLitValue::Char(l.value)));
                r
            }
            Expr::UnitLit(_) => 0,
            Expr::Var(ident) => {
                if self.thunk_names.contains(&ident.name) {
                    // Use unique thunk name to avoid collisions across
                    // multiple fix expressions with the same loop variable.
                    let thunk_target = self.thunk_name_map.get(&ident.name)
                        .cloned()
                        .unwrap_or_else(|| ident.name.clone());
                    let r = self.fresh_reg();
                    block.instrs.push(Instr::Force(r, ForceTarget::Static(thunk_target)));
                    r
                } else if let Some(&reg) = self.var_map.get(&ident.name) {
                    reg
                } else if let Some((enum_name, variant_name)) =
                    self.module.types.find_zero_payload_variant(&ident.name)
                {
                    let r = self.fresh_reg();
                    block.instrs.push(Instr::EnumCons(r, enum_name, variant_name, vec![]));
                    r
                } else {
                    self.diag.error("E007",
                        format!("unresolved variable '{}' in IR gen", ident.name),
                        Some(ident.span));
                    let r = self.fresh_reg();
                    block.instrs.push(Instr::Lit(r, IrLitValue::Int(0)));
                    r
                }
            }

            Expr::Binary(b) => {
                let left_r = self.compile_expr(&b.left, block);
                let right_r = self.compile_expr(&b.right, block);
                let result_r = self.fresh_reg();

                let instr = match b.op {
                    BinaryOp::Add => Instr::Add(result_r, left_r, right_r),
                    BinaryOp::Sub => Instr::Sub(result_r, left_r, right_r),
                    BinaryOp::Mul => Instr::Mul(result_r, left_r, right_r),
                    BinaryOp::Div => Instr::Div(result_r, left_r, right_r),
                    BinaryOp::Rem => Instr::Rem(result_r, left_r, right_r),
                    BinaryOp::Lt => Instr::Lt(result_r, left_r, right_r),
                    BinaryOp::Gt => Instr::Gt(result_r, left_r, right_r),
                    BinaryOp::Le => Instr::Le(result_r, left_r, right_r),
                    BinaryOp::Ge => Instr::Ge(result_r, left_r, right_r),
                    BinaryOp::Eq => Instr::Eq(result_r, left_r, right_r),
                    BinaryOp::Ne => Instr::Ne(result_r, left_r, right_r),
                    BinaryOp::And => Instr::And(result_r, left_r, right_r),
                    BinaryOp::Or => Instr::Or(result_r, left_r, right_r),
                    BinaryOp::BitAnd => Instr::BitAnd(result_r, left_r, right_r),
                    BinaryOp::BitOr => Instr::BitOr(result_r, left_r, right_r),
                    BinaryOp::BitXor => Instr::BitXor(result_r, left_r, right_r),
                    BinaryOp::Shl => Instr::Shl(result_r, left_r, right_r),
                    BinaryOp::Shr => Instr::Shr(result_r, left_r, right_r),
                };
                block.instrs.push(instr);
                result_r
            }

            Expr::Unary(u) => {
                let operand = self.compile_expr(&u.expr, block);
                let result_r = self.fresh_reg();
                match u.op {
                    UnaryOp::Neg => {
                        let zero_r = self.fresh_reg();
                        block.instrs.push(Instr::Lit(zero_r, IrLitValue::Int(0)));
                        block.instrs.push(Instr::Sub(result_r, zero_r, operand));
                    }
                    UnaryOp::Not => {
                        block.instrs.push(Instr::Not(result_r, operand));
                    }
                }
                result_r
            }

            Expr::Call(c) => {
                // IIFE: fn(params) { body }(args) — inline the anonymous function
                if let Expr::Fn(fn_expr) = &*c.func {
                let mut saved_var_map = self.var_map.clone();
                    for (i, param) in fn_expr.params.iter().enumerate() {
                        if let Some(ExprArg::Value(e)) = c.args.get(i) {
                            let arg_reg = self.compile_expr(e, block);
                            self.var_map.insert(param.name.name.clone(), arg_reg);
                        }
                    }
                    let result = self.compile_expr(&fn_expr.body, block);
                    self.var_map = saved_var_map;
                    return result;
                }

                let is_enum_variant = match &*c.func {
                    Expr::Var(ident) => self.module.types.find_enum_for_variant(&ident.name).is_some(),
                    _ => false,
                };
                if is_enum_variant {
                    let variant_name = match &*c.func {
                        Expr::Var(ident) => ident.name.clone(),
                        _ => return 0,
                    };
                    let enum_name = self.module.types.find_enum_for_variant(&variant_name)
                        .map(|e| e.name.clone())
                        .unwrap_or_default();
                    let mut field_regs = Vec::new();
                    for arg in &c.args {
                        if let ExprArg::Value(e) = arg {
                            field_regs.push(self.compile_expr(e, block));
                        }
                    }
                    let result_r = self.fresh_reg();
                    block.instrs.push(Instr::EnumCons(result_r, enum_name, variant_name, field_regs));
                    return result_r;
                }

                let is_builtin = match &*c.func {
                    Expr::Var(ident) => {
                        matches!(ident.name.as_str(), "stdout" | "stdin")
                    }
                    _ => false,
                };

                if is_builtin {
                    let name = match &*c.func {
                        Expr::Var(ident) => ident.name.clone(),
                        _ => String::new(),
                    };
                    match name.as_str() {
                        "stdout" => {
                            let arg_reg = if let Some(ExprArg::Value(e)) = c.args.first() {
                                self.compile_expr(e, block)
                            } else { 0 };
                            block.instrs.push(Instr::Stdout(arg_reg));
                            arg_reg
                        }
                        "stdin" => {
                            // For &n -> stdin, read into the variable's register
                            let arg_reg = if let Some(arg) = c.args.first() {
                                match arg {
                                    ExprArg::Value(e) => self.compile_expr(e, block),
                                    ExprArg::Borrow(b) => {
                                        // Find the root variable's register
                                        let name = &b.lvalue.root.name;
                                        if let Some(&reg) = self.var_map.get(name) {
                                            reg
                                        } else {
                                            let r = self.fresh_reg();
                                            block.instrs.push(Instr::Lit(r, IrLitValue::Int(0)));
                                            r
                                        }
                                    }
                                }
                            } else {
                                self.fresh_reg()
                            };
                            block.instrs.push(Instr::Stdin(arg_reg));
                            arg_reg
                        }
                        _ => 0,
                    }
                } else {
                    let mut arg_regs = Vec::new();
                    // Compile func expression first for non-trivial targets (IIFE Block, etc.)
                    let func_is_trivial = matches!(&*c.func, Expr::Fn(_) | Expr::Var(_));
                    let func_reg = if !func_is_trivial {
                        Some(self.compile_expr(&c.func, block))
                    } else {
                        None
                    };
                    for arg in &c.args {
                        if let ExprArg::Value(e) = arg {
                            arg_regs.push(self.compile_expr(e, block));
                        }
                    }
                    let result_r = self.fresh_reg();
                    let (target, ret_ty) = match &*c.func {
                        Expr::Var(ident) => {
                            // If var is in var_map (closure), use Dynamic call
                            if let Some(&reg) = self.var_map.get(&ident.name) {
                                if !self.module.fns.iter().any(|f| f.name == ident.name) {
                                    (CallTarget::Dynamic(reg), IrType::Int)
                                } else {
                                    let ret = self.module.fns.iter()
                                        .find(|f| f.name == ident.name)
                                        .map(|f| f.return_type.clone())
                                        .unwrap_or(IrType::Int);
                                    (CallTarget::Static(ident.name.clone()), ret)
                                }
                            } else if self.rec_fn_names.contains(&ident.name) {
                                (CallTarget::Static(ident.name.clone()), self.current_fn_return_ty.clone())
                            } else if self.thunk_names.contains(&ident.name) {
                                // Self-referencing closure: force thunk then Dynamic call.
                                // Use the unique thunk name to avoid collisions.
                                let thunk_target = self.thunk_name_map.get(&ident.name)
                                    .cloned()
                                    .unwrap_or_else(|| ident.name.clone());
                                let fr = self.fresh_reg();
                                block.instrs.push(Instr::Force(fr, ForceTarget::Static(thunk_target)));
                                (CallTarget::Dynamic(fr), IrType::Int)
                            } else {
                                let ret = self.module.fns.iter()
                                    .find(|f| f.name == ident.name)
                                    .map(|f| f.return_type.clone())
                                    .unwrap_or(IrType::Int);
                                (CallTarget::Static(ident.name.clone()), ret)
                            }
                        }
                        _ => {
                            if let Some(fr) = func_reg {
                                (CallTarget::Dynamic(fr), IrType::Int)
                            } else {
                                (CallTarget::Dynamic(0), IrType::Int)
                            }
                        }
                    };
                    block.instrs.push(Instr::Call(result_r, target, arg_regs, ret_ty.clone()));
                    // Track return type so Field can resolve tuple element types
                    if let IrType::Tuple(elements) = &ret_ty {
                        self.reg_struct.insert(result_r, "%tuple".into());
                        self.tuple_elem_types.insert(result_r, elements.clone());
                    } else if let IrType::Struct(s) = &ret_ty {
                        self.reg_struct.insert(result_r, s.clone());
                    }
                    result_r
                }
            }

            Expr::Block(b) => {
                let mut saved_var_map = self.var_map.clone();
                let saved_reg_struct = self.reg_struct.clone();
                let mut last_reg = 0;
                for stmt in &b.stmts {
                    if let Some(def) = &stmt.def {
                        if def.rec {
                            self.thunk_names.insert(def.name.name.clone());
                            // Create a placeholder thunk with unique name for
                            // self-referencing closures. Multiple fix expressions
                            // may share the same loop_var name (e.g. "__while_loop"),
                            // so we need unique thunk names to avoid collisions.
                            let val_ty = def.ty.as_ref()
                                .map(|t| self.ast_ty_to_ir(t))
                                .unwrap_or(IrType::Int);
                            let thunk_name = format!("{}@{}", def.name.name, self.next_thunk);
                            self.next_thunk += 1;
                            self.thunk_name_map.insert(def.name.name.clone(), thunk_name.clone());
                            self.module.thunks.push(Thunk::new(thunk_name.clone(), val_ty));
                            // Add a dummy block to prevent "thunk has no blocks" in LLVM backend.
                            // The evaluator Never runs this block (Update stores the closure before
                            // any Force), but the LLVM backend needs valid blocks to compile.
                            if let Some(t) = self.module.thunks.iter_mut().find(|t| t.name == thunk_name) {
                                let mut db = BasicBlock::new("entry".into());
                                db.terminator = Terminator::Ret(0);
                                t.blocks.push(db);
                            }
                        }
                    }
                }
                for stmt in &b.stmts {
                    // For recursive defs, pre-register the name so that the body
                    // can reference itself (e.g., def rec f = fn(x) { ... f(x) ... }).
                    if let Some(def) = &stmt.def {
                        if def.rec {
                            // Do NOT pre-register in var_map. The closure body's self-referencing
                            // calls go through the thunk_names path (Force thunk + Dynamic call).
                            // The thunk is already Evaluated by the time the closure runs.
                        }
                    }
                    last_reg = self.compile_expr(&stmt.expr, block);
                    if let Some(def) = &stmt.def {
                        if def.rec {
                            if let Some(thunk_name) = self.thunk_name_map.get(&def.name.name) {
                                block.instrs.push(Instr::Update(last_reg, ForceTarget::Static(thunk_name.clone())));
                            }
                            self.var_map.insert(def.name.name.clone(), last_reg);
                        } else {
                            self.var_map.insert(def.name.name.clone(), last_reg);
                        }
                        // Propagate array element type for immediate use by next statement
                        if self.fn_param_names.contains(&def.name.name) {
                            if let Some(&outer_reg) = saved_var_map.get(&def.name.name) {
                                if outer_reg != last_reg {
                                    if let Some(elem_ty) = self.param_array_elem_types.get(&outer_reg) {
                                        self.param_array_elem_types.insert(last_reg, elem_ty.clone());
                                    }
                                }
                            }
                        }
                    }
                }
                if let Some(final_expr) = &b.final_expr {
                    last_reg = self.compile_expr(final_expr, block);
                }
                // Before restoring, propagate var_map updates for function
                // parameter names that were rebound inside this block. This
                // allows borrow-param rebindings (e.g. `def pool = %_btmp.0`
                // inside if-else branches) to escape their enclosing block
                // and be visible in the function's return tuple. Regular
                // local variables (non-params) are NOT propagated, preserving
                // lexical shadowing semantics.
                if !self.fn_param_names.is_empty() {
                    for (name, reg) in std::mem::take(&mut self.var_map) {
                        if self.fn_param_names.contains(&name) {
                            if let Some(&outer_reg) = saved_var_map.get(&name) {
                                if outer_reg != reg {
                                    saved_var_map.insert(name.clone(), reg);
                                    // Propagate array element type for named field access
                                    if let Some(elem_ty) = self.param_array_elem_types.get(&outer_reg) {
                                        self.param_array_elem_types.insert(reg, elem_ty.clone());
                                    }
                                }
                            }
                        }
                    }
                }
                self.var_map = saved_var_map;
                self.reg_struct = saved_reg_struct;
                last_reg
            }

            Expr::Fn(f) => self.compile_closure(f, block),

            Expr::Match(m) => {
                self.compile_match(m, block)
            }

            Expr::StructLit(s) => {
                let mut field_regs = Vec::new();
                for f in &s.fields {
                    if let Some(v) = &f.value {
                        field_regs.push(self.compile_expr(v, block));
                    } else {
                        // shorthand: `x` → `x: x`
                        field_regs.push(self.compile_expr(&Expr::Var(f.name.clone()), block));
                    }
                }
                let result_r = self.fresh_reg();
                // Check if name is an enum variant (named-field variant construction)
                if let Some(enum_def) = self.module.types.find_enum_for_variant(&s.name.name) {
                    block.instrs.push(Instr::EnumCons(result_r, enum_def.name.clone(), s.name.name.clone(), field_regs));
                } else {
                    block.instrs.push(Instr::StructCons(result_r, s.name.name.clone(), field_regs));
                    self.reg_struct.insert(result_r, s.name.name.clone());
                }
                result_r
            }

            Expr::TupleLit(t) => {
                let mut field_regs = Vec::new();
                for e in &t.elements {
                    field_regs.push(self.compile_expr(e, block));
                }
                let result_r = self.fresh_reg();
                block.instrs.push(Instr::StructCons(result_r, "%tuple".into(), field_regs));
                self.reg_struct.insert(result_r, "%tuple".into());
                result_r
            }

            Expr::Field(f) => {
                let obj_r = self.compile_expr(&f.object, block);
                let result_r = self.fresh_reg();
                let (field_idx, field_struct_name) = self.reg_struct.get(&obj_r)
                    .and_then(|struct_name| {
                        let idx = self.module.types.struct_field_index(struct_name, &f.field.name);
                        idx.map(|i| {
                            let field_ty = self.module.types.structs.iter()
                                .find(|s| s.name == *struct_name)
                                .and_then(|s| s.fields.get(i))
                                .map(|(_, ty)| ty.clone());
                            (i, field_ty)
                        })
                    })
                    .or_else(|| f.field.name.parse::<usize>().ok().map(|i| {
                        // For numeric field access on a tuple, look up element type
                        let field_ty = self.tuple_elem_types.get(&obj_r)
                            .and_then(|types| types.get(i))
                            .cloned();
                        (i, field_ty)
                    }))
                    .unwrap_or((0, None));
                let field_ty = field_struct_name.clone().unwrap_or(IrType::Int);
                self.reg_type.insert(result_r, field_ty.clone());
                block.instrs.push(Instr::Field(result_r, obj_r, field_idx, field_ty));
                if let Some(IrType::Struct(name)) = field_struct_name {
                    self.reg_struct.insert(result_r, name);
                } else if let Some(IrType::Tuple(_)) = field_struct_name {
                    self.reg_struct.insert(result_r, "%tuple".into());
                }
                result_r
            }

            Expr::Update(u) => {
                let base_r = self.compile_expr(&u.base, block);
                let struct_name = self.reg_struct.get(&base_r).cloned()
                    .unwrap_or_else(|| "%tuple".into());
                let mut current_r = base_r;
                for uf in &u.updates {
                    if let UpdateField::NamedField { name, value, .. } = uf {
                        let val_r = self.compile_expr(value, block);
                        let result_r = self.fresh_reg();
                        let fidx = self.module.types.struct_field_index(&struct_name, &name.name)
                            .unwrap_or(0);
                        let s_ty = IrType::Struct(struct_name.clone());
                        block.instrs.push(Instr::StructUpdate(result_r, current_r, fidx, val_r, s_ty));
                        current_r = result_r;
                    }
                    if let UpdateField::ArrayIndex { index, value, .. } = uf {
                        let idx_r = self.compile_expr(index, block);
                        let val_r = self.compile_expr(value, block);
                        let result_r = self.fresh_reg();
                        block.instrs.push(Instr::ArrayUpdate(result_r, current_r, idx_r, val_r));
                        current_r = result_r;
                    }
                }
                self.reg_struct.insert(current_r, struct_name.clone());
                current_r
            }

            Expr::EnumLit(e) => {
                let enum_name = self.module.types.find_enum_for_variant(&e.name.name)
                    .map(|ed| ed.name.clone())
                    .unwrap_or_else(|| e.name.name.clone());
                let mut field_regs = Vec::new();
                match &e.payload {
                    EnumPayload::Single(exprs) => {
                        for expr in exprs {
                            field_regs.push(self.compile_expr(expr, block));
                        }
                    }
                    EnumPayload::Struct(fields) => {
                        for f in fields {
                            if let Some(v) = &f.value {
                                field_regs.push(self.compile_expr(v, block));
                            }
                        }
                    }
                }
                let result_r = self.fresh_reg();
                block.instrs.push(Instr::EnumCons(result_r, enum_name, e.name.name.clone(), field_regs));
                result_r
            }

            Expr::Force(f) => self.compile_expr(&f.expr, block),

            Expr::ArrayLit(a) => {
                let mut elem_regs = Vec::new();
                for e in &a.elements {
                    elem_regs.push(self.compile_expr(e, block));
                }
                let result_r = self.fresh_reg();
                let ty = self.ast_tys_to_ir_array(&a.elements);
                block.instrs.push(Instr::ArrayLit(result_r, ty, elem_regs));
                result_r
            }
            Expr::ArrayFill(a) => {
                let val_r = self.compile_expr(&a.value, block);
                let result_r = self.fresh_reg();
                let ty = IrType::Array(Box::new(IrType::Int), a.count);
                block.instrs.push(Instr::ArrayFill(result_r, ty, val_r, a.count));
                result_r
            }
            Expr::Subscript(s) => {
                let arr_r = self.compile_expr(&s.array, block);
                let idx_r = self.compile_expr(&s.index, block);
                let result_r = self.fresh_reg();
                // Skip subscript on tuple field access (t.0[i]) where the field
                // is NOT an array. Struct array fields like Node.fa[i] must NOT
                // be skipped.
                if let Expr::Field(f) = &*s.array {
                    if f.field.name.parse::<usize>().is_ok()
                        && !self.param_array_elem_types.contains_key(&arr_r)
                    {
                        return 0;
                    }
                }
                block.instrs.push(Instr::ArrayAccess(result_r, arr_r, idx_r));
                // Track element type for subsequent field access on array elements
                if let Some(elem_ty) = self.param_array_elem_types.get(&arr_r) {
                    if let IrType::Struct(name) = elem_ty {
                        self.reg_struct.insert(result_r, name.clone());
                    }
                }
                result_r
            }
            Expr::Cast(c) => self.compile_expr(&c.expr, block),
            _ => {
                self.diag.error("E003",
                    format!("IR gen not implemented for this expression"),
                    None);
                0
            }
        }
    }

    fn compile_finish(&mut self, block: &mut BasicBlock, blocks: &mut Vec<BasicBlock>, result_reg: usize) {
        block.terminator = Terminator::Ret(result_reg);
        blocks.append(&mut self.extra_blocks);
        blocks.push(block.clone());
    }

    fn compile_closure(&mut self, f: &FnExpr, block: &mut BasicBlock) -> usize {
        // Find free variables: vars used in body but not params or locally defined
        let param_names: std::collections::HashSet<&str> =
            f.params.iter().map(|p| p.name.name.as_str()).collect();
        let free_vars = collect_free_vars(&f.body, &param_names);

        // Generate unique closure name
        let closure_name = format!("closure_{}", self.next_closure);
        self.next_closure += 1;

        // Build Fn IR: params = original params + captured vars
        let mut all_params: Vec<(usize, IrType)> = f.params.iter().enumerate()
            .map(|(i, p)| {
                let ty = p.ty.as_ref().map(|t| self.ast_ty_to_ir(t))
                    .or_else(|| {
                        self.fn_param_regs.get(&p.name.name)
                            .and_then(|&reg| self.reg_type.get(&reg))
                            .cloned()
                    })
                    .or_else(|| {
                        self.var_map.get(&p.name.name)
                            .and_then(|&reg| self.reg_type.get(&reg))
                            .cloned()
                    })
                    .unwrap_or(IrType::Int);
                (i, ty)
            })
            .collect();
        let capture_start = all_params.len();

        // Resolve capture registers from outer scope BEFORE saving var_map
        let mut lambda_captures: Vec<usize> = Vec::new();
        for cap_name in &free_vars {
            let outer_reg = self.var_map.get(cap_name)
                .copied()
                .or_else(|| self.fn_param_regs.get(cap_name).copied());
            if let Some(outer_reg) = outer_reg {
                lambda_captures.push(outer_reg);
                let cap_ty = self.reg_type.get(&outer_reg).cloned()
                    .or_else(|| self.reg_struct.get(&outer_reg)
                        .map(|n| IrType::Struct(n.clone())))
                    .or_else(|| self.tuple_elem_types.get(&outer_reg)
                        .map(|types| IrType::Tuple(types.clone())))
                    .unwrap_or(IrType::Int);
                all_params.push((capture_start + lambda_captures.len() - 1, cap_ty));
            }
        }

        // Register struct/array types for closure params so field access
        // and array element access within the closure body resolve correctly.
        for (i, (_, ty)) in all_params.iter().enumerate() {
            if let IrType::Struct(name) = ty {
                self.reg_struct.insert(i, name.clone());
            } else if let IrType::Array(elem_ty, _) = ty {
                self.param_array_elem_types.insert(i, *elem_ty.clone());
            }
        }

        let return_ty = f.return_ty.as_ref().map(|t| self.ast_ty_to_ir(t)).unwrap_or(IrType::Int);

        let mut ir_fn = Fn::new(closure_name.clone(), all_params, return_ty);
        let mut fn_block = BasicBlock::new("entry".into());

        // Save IR gen state
        let saved_var_map = self.var_map.clone();
        let saved_reg_struct = self.reg_struct.clone();
        let saved_tuple_types = self.tuple_elem_types.clone();
        let saved_reg = self.next_reg;
        let saved_extra = std::mem::take(&mut self.extra_blocks);

        self.next_reg = f.params.len() + free_vars.len();
        self.var_map.clear();
        for (i, param) in f.params.iter().enumerate() {
            self.var_map.insert(param.name.name.clone(), i);
        }
        // Map resolved captures into var_map. Check both saved_var_map and
        // fn_param_regs so captures work even when the outer Block has
        // restored var_map (e.g., inside thunk/fix scopes).
        let mut capture_idx = 0;
        for cap_name in free_vars.iter() {
            if saved_var_map.get(cap_name).is_some()
                || self.fn_param_regs.get(cap_name).is_some()
            {
                let reg = capture_start + capture_idx;
                self.var_map.insert(cap_name.clone(), reg);
                capture_idx += 1;
            }
        }

        let result_reg = self.compile_expr(&f.body, &mut fn_block);
        self.compile_finish(&mut fn_block, &mut ir_fn.blocks, result_reg);

        // Restore IR gen state
        self.var_map = saved_var_map;
        self.reg_struct = saved_reg_struct;
        self.tuple_elem_types = saved_tuple_types;
        self.next_reg = saved_reg;
        self.extra_blocks = saved_extra;

        // Emit Lambda instruction with outer-scope capture registers
        let result_r = self.fresh_reg();
        self.module.fns.push(ir_fn);
        block.instrs.push(Instr::Lambda(result_r, closure_name, lambda_captures));
        result_r
    }

    fn compile_match(&mut self, m: &MatchExpr, block: &mut BasicBlock) -> usize {
        let is_bool_match = m.arms.len() == 2
            && matches!(&m.arms[0].pattern, Pattern::Lit(LitPattern { value: LitValue::Bool(true), .. }))
            && matches!(&m.arms[1].pattern, Pattern::Lit(LitPattern { value: LitValue::Bool(false), .. }));
        if is_bool_match {
            return self.compile_match_bool(m, block);
        }
        self.compile_match_enum(m, block)
    }

    fn compile_match_bool(&mut self, m: &MatchExpr, block: &mut BasicBlock) -> usize {
        let cond_reg = self.compile_expr(&m.scrutinee, block);
        let l_merge = self.fresh_label("merge");
        let l_true = self.fresh_label("L");
        let l_false = self.fresh_label("L");

        block.terminator = Terminator::Br(cond_reg, l_true.clone(), l_false.clone());
        self.extra_blocks.push(block.clone());

        let outer_var_map = self.var_map.clone();

        // Compile true arm
        let mut block_true = BasicBlock::new(l_true.clone());
        let true_reg = self.compile_expr(&m.arms[0].body, &mut block_true);
        block_true.terminator = Terminator::Jmp(l_merge.clone());
        let true_label = block_true.label.clone();
        let true_var_map = self.var_map.clone();
        self.extra_blocks.push(block_true);

        // Reset var_map for false arm
        self.var_map = outer_var_map.clone();

        // Compile false arm
        let mut block_false = BasicBlock::new(l_false.clone());
        let false_reg = self.compile_expr(&m.arms[1].body, &mut block_false);
        block_false.terminator = Terminator::Jmp(l_merge.clone());
        let false_label = block_false.label.clone();
        let false_var_map = self.var_map.clone();
        self.extra_blocks.push(block_false);

        // Create merge block with phi nodes
        let mut block_merge = BasicBlock::new(l_merge);
        let result_r = self.fresh_reg();
        block_merge.instrs.push(Instr::Phi(result_r, vec![
            (true_reg, true_label.clone()),
            (false_reg, false_label.clone()),
        ]));

        // Find variables that diverged between branches (borrow-param rebindings
        // inside if-else arms) and create phi nodes for each.
        let mut merged_map = outer_var_map.clone();
        for (name, &t_reg) in &true_var_map {
            if let Some(&f_reg) = false_var_map.get(name) {
                if t_reg != f_reg && !name.starts_with('%') {
                    let phi_reg = self.fresh_reg();
                    block_merge.instrs.push(Instr::Phi(phi_reg, vec![
                        (t_reg, true_label.clone()),
                        (f_reg, false_label.clone()),
                    ]));
                    // Propagate array element type through phi for named field access
                    if let Some(elem_ty) = self.param_array_elem_types.get(&t_reg)
                        .or_else(|| self.param_array_elem_types.get(&f_reg))
                    {
                        self.param_array_elem_types.insert(phi_reg, elem_ty.clone());
                    }
                    // Propagate struct type through phi
                    if let Some(s) = self.reg_struct.get(&t_reg)
                        .or_else(|| self.reg_struct.get(&f_reg))
                    {
                        if let Some(t) = self.reg_struct.get(&t_reg) {
                            if t == s { self.reg_struct.insert(phi_reg, s.clone()); }
                        } else {
                            self.reg_struct.insert(phi_reg, s.clone());
                        }
                    }
                    merged_map.insert(name.clone(), phi_reg);
                }
            }
        }
        self.var_map = merged_map;
        *block = block_merge;
        result_r
    }

    fn compile_match_enum(&mut self, m: &MatchExpr, block: &mut BasicBlock) -> usize {
        let scrut_reg = self.compile_expr(&m.scrutinee, block);
        let l_merge = self.fresh_label("merge");
        let mut arm_results: Vec<(usize, String)> = Vec::new();

        // Emit EnumDisc for the scrutinee — applies to both 2-arm and N-arm matches
        let disc_reg = self.fresh_reg();
        block.instrs.push(Instr::EnumDisc(disc_reg, scrut_reg));

        let mut chain_block = block.clone();
        let arms_len = m.arms.len();

        // Build chain of comparisons: for each arm i, check tag == i,
        // branch to arm block or fall through to check next tag
        let chain_labels: Vec<String> = (0..arms_len).map(|_| self.fresh_label("L")).collect();
        let test_labels: Vec<String> = (0..arms_len-1).map(|_| self.fresh_label("L")).collect();

        for i in 0..arms_len {
            if i < arms_len - 1 {
                let test_reg = self.fresh_reg();
                let tag_lit = self.fresh_reg();
                chain_block.instrs.push(Instr::Lit(tag_lit, IrLitValue::Int(i as i64)));
                chain_block.instrs.push(Instr::Eq(test_reg, disc_reg, tag_lit));
                chain_block.terminator = Terminator::Br(test_reg, chain_labels[i].clone(), test_labels[i].clone());
                self.extra_blocks.push(chain_block.clone());
                chain_block = BasicBlock::new(test_labels[i].clone());
            } else {
                // Last arm: unconditional jump
                chain_block.terminator = Terminator::Jmp(chain_labels[i].clone());
                self.extra_blocks.push(chain_block.clone());
            }
        }

        // Compile each arm body
        for i in 0..arms_len {
            let mut arm_block = BasicBlock::new(chain_labels[i].clone());

            // Handle pattern: if pattern is a variant pattern, bind payload variable
            self.resolve_match_pattern(&m.arms[i].pattern, scrut_reg, &mut arm_block);

            let arm_reg = self.compile_expr(&m.arms[i].body, &mut arm_block);
            arm_block.terminator = Terminator::Jmp(l_merge.clone());
            arm_results.push((arm_reg, arm_block.label.clone()));
            self.extra_blocks.push(arm_block);
        }

        let mut block_merge = BasicBlock::new(l_merge);
        let result_r = self.fresh_reg();
        block_merge.instrs.push(Instr::Phi(result_r, arm_results.iter().map(|(r, l)| (*r, l.clone())).collect()));
        *block = block_merge;
        result_r
    }

    fn resolve_match_pattern(&mut self, pattern: &Pattern, scrut_reg: usize, block: &mut BasicBlock) {
        match pattern {
            Pattern::Var(v) => {
                self.var_map.insert(v.name.clone(), scrut_reg);
            }
            Pattern::Variant(v) => {
                let enum_name = self.module.types.find_enum_for_variant(&v.name.name)
                    .map(|e| e.name.clone())
                    .unwrap_or_default();
                for (idx, payload_pat) in v.payload.iter().enumerate() {
                    let proj_reg = self.fresh_reg();
                    block.instrs.push(Instr::EnumProj(proj_reg, enum_name.clone(), v.name.name.clone(), idx, scrut_reg));
                    match payload_pat {
                        Pattern::Var(inner) => {
                            self.var_map.insert(inner.name.clone(), proj_reg);
                        }
                        _ => {}
                    }
                }
            }
            Pattern::Struct(sp) => {
                let variant_fields = self.module.types.find_enum_for_variant(&sp.name.name)
                    .and_then(|ed| {
                        ed.variants.iter().find(|v| v.name == sp.name.name)
                            .map(|v| (ed.name.clone(), v.fields.clone()))
                    });
                if let Some((enum_name, fields)) = variant_fields {
                    for sf in &sp.fields {
                        let field_name = match sf {
                            PatternField::Shorthand { name, .. } => &name.name,
                            PatternField::Rename { field, .. } => &field.name,
                        };
                        let var_name = match sf {
                            PatternField::Shorthand { name, .. } => &name.name,
                            PatternField::Rename { var, .. } => &var.name,
                        };
                        if let Some(field_idx) = fields.iter().position(|(n, _)| n == field_name) {
                            let proj_reg = self.fresh_reg();
                            block.instrs.push(Instr::EnumProj(proj_reg, enum_name.clone(), sp.name.name.clone(), field_idx, scrut_reg));
                            self.var_map.insert(var_name.clone(), proj_reg);
                        }
                    }
                }
            }
            _ => {}
        }
    }

    fn ast_ty_to_ir(&self, ty: &Type) -> IrType {
        match ty {
            Type::Named(n) => match n.name.name.as_str() {
                "Int" => IrType::Int,
                "Bool" => IrType::Bool,
                "Char" => IrType::Char,
                "Unit" => IrType::Unit,
                _ => IrType::Struct(n.name.name.clone()),
            },
            Type::Fun(f) => {
                let params: Vec<IrType> = f.params.iter().map(|p| self.ast_ty_to_ir(&p.ty)).collect();
                let ret = f.return_ty.as_ref().map(|t| self.ast_ty_to_ir(t)).unwrap_or(IrType::Unit);
                IrType::Fun(params, Box::new(ret))
            }
            Type::Tuple(t) => IrType::Tuple(t.elements.iter().map(|e| self.ast_ty_to_ir(e)).collect()),
            Type::Array(a) => IrType::Array(Box::new(self.ast_ty_to_ir(&a.element)), a.size),
            _ => IrType::Int,
        }
    }

    fn ast_tys_to_ir_array(&self, elements: &[Expr]) -> IrType {
        IrType::Array(Box::new(IrType::Int), elements.len())
    }
}

/// Collect free variables in an expression — all Var references that
/// are not in the given set of locally-bound names (params, local defs).
fn collect_free_vars(expr: &Expr, bound: &std::collections::HashSet<&str>) -> Vec<String> {
    let mut fvs = std::collections::HashSet::new();
    collect_free_vars_impl(expr, bound, &mut fvs);
    let mut result: Vec<String> = fvs.into_iter().collect();
    result.sort();
    result
}

fn collect_free_vars_impl(expr: &Expr, bound: &std::collections::HashSet<&str>, fvs: &mut std::collections::HashSet<String>) {
    match expr {
        Expr::Var(v) => {
            if !bound.contains(v.name.as_str()) && v.name != "stdout" && v.name != "stdin" {
                fvs.insert(v.name.clone());
            }
        }
        Expr::Binary(b) => { collect_free_vars_impl(&b.left, bound, fvs); collect_free_vars_impl(&b.right, bound, fvs); }
        Expr::Unary(u) => { collect_free_vars_impl(&u.expr, bound, fvs); }
        Expr::Call(c) => {
            collect_free_vars_impl(&c.func, bound, fvs);
            for arg in &c.args {
                if let ExprArg::Value(e) = arg { collect_free_vars_impl(e, bound, fvs); }
            }
        }
        Expr::Block(b) => {
            // Process each statement sequentially: resolve expression FIRST,
            // then add the def name to inner_bound. This ensures that
            // `def x = x + 1` captures the OUTER x (not the new binding).
            let mut inner_bound = bound.clone();
            for stmt in &b.stmts {
                if let Some(def) = &stmt.def {
                    collect_free_vars_impl(&stmt.expr, &inner_bound, fvs);
                    inner_bound.insert(def.name.name.as_str());
                } else {
                    collect_free_vars_impl(&stmt.expr, &inner_bound, fvs);
                }
            }
            if let Some(fe) = &b.final_expr { collect_free_vars_impl(fe, &inner_bound, fvs); }
        }
        Expr::If(i) => { collect_free_vars_impl(&i.condition, bound, fvs); collect_free_vars_impl(&i.then_branch, bound, fvs); if let Some(ref eb) = i.else_branch { collect_free_vars_impl(eb, bound, fvs); } }
        Expr::Match(m) => {
            collect_free_vars_impl(&m.scrutinee, bound, fvs);
            for arm in &m.arms { collect_free_vars_impl(&arm.body, bound, fvs); }
        }
        Expr::Fn(f) => {
            let mut inner_bound = bound.clone();
            for p in &f.params { inner_bound.insert(p.name.name.as_str()); }
            collect_free_vars_impl(&f.body, &inner_bound, fvs);
        }
        Expr::Field(f) => { collect_free_vars_impl(&f.object, bound, fvs); }
        Expr::Subscript(s) => { collect_free_vars_impl(&s.array, bound, fvs); collect_free_vars_impl(&s.index, bound, fvs); }
        Expr::EnumLit(e) => { match &e.payload { EnumPayload::Single(exprs) => { for ex in exprs { collect_free_vars_impl(ex, bound, fvs); } } EnumPayload::Struct(fields) => { for f in fields { if let Some(v) = &f.value { collect_free_vars_impl(v, bound, fvs); } } } } }
        Expr::Force(f) => { collect_free_vars_impl(&f.expr, bound, fvs); }
        Expr::Fix(f) => {
            let mut inner_bound = bound.clone();
            inner_bound.insert(f.loop_var.name.as_str());
            collect_free_vars_impl(&f.body, &inner_bound, fvs);
        }
        Expr::TupleLit(t) => { for e in &t.elements { collect_free_vars_impl(e, bound, fvs); } }
        Expr::StructLit(s) => { for f in &s.fields { if let Some(v) = &f.value { collect_free_vars_impl(v, bound, fvs); } else { collect_free_vars_impl(&Expr::Var(f.name.clone()), bound, fvs); } } }
        Expr::ArrayLit(a) => { for e in &a.elements { collect_free_vars_impl(e, bound, fvs); } }
        Expr::ArrayFill(a) => { collect_free_vars_impl(&a.value, bound, fvs); }
        Expr::Update(u) => {
            collect_free_vars_impl(&u.base, bound, fvs);
            for uf in &u.updates {
                match uf {
                    UpdateField::NamedField { value, .. } | UpdateField::ArrayIndex { value, .. } | UpdateField::TupleIndex { value, .. } => {
                        collect_free_vars_impl(value, bound, fvs);
                    }
                }
            }
        }
        Expr::Cast(c) => { collect_free_vars_impl(&c.expr, bound, fvs); }
        _ => {} // literals, unit — no free vars
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::lexer::Lexer;
    use crate::parser::Parser;
    use crate::desugar::desugar_program;
    use crate::ir::display;

    fn generate(src: &str) -> String {
        let mut lexer = Lexer::new(src);
        let tokens = lexer.lex_all();
        let mut diag = DiagnosticCollector::new();
        let mut parser = Parser::new(tokens, &mut diag, src);
        let prog = parser.parse_program();
        let prog = desugar_program(&prog, &mut diag);
        let irgen = IrGenerator::new(&mut diag);
        let module = irgen.generate(&prog);
        display::display(&module)
    }

    #[test]
    fn generate_simple_arithmetic() {
        let ir = generate("def x = 40 + 2;");
        assert!(ir.contains("thunk @x"), "Expected thunk, got:\n{}", ir);
        assert!(ir.contains("add"));
    }

    #[test]
    fn generate_fn_definition() {
        let ir = generate("def add = fn(x: Int, y: Int) -> Int { x + y };");
        assert!(ir.contains("fn @add"), "Expected fn, got:\n{}", ir);
    }
}
