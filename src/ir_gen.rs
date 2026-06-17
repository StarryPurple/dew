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
    var_map: std::collections::HashMap<String, usize>,
    thunk_names: std::collections::HashSet<String>,
    extra_blocks: Vec<BasicBlock>,
    reg_struct: std::collections::HashMap<usize, String>,
}

impl<'a> IrGenerator<'a> {
    pub fn new(diag: &'a mut DiagnosticCollector) -> Self {
        IrGenerator {
            diag,
            module: Module::new(),
            next_reg: 0,
            next_label: 0,
            var_map: std::collections::HashMap::new(),
            thunk_names: std::collections::HashSet::new(),
            extra_blocks: Vec::new(),
            reg_struct: std::collections::HashMap::new(),
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
                    vec![("".into(), self.ast_ty_to_ir(payload))]
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
        let return_ty = f.return_ty.as_ref().map(|t| self.ast_ty_to_ir(t)).unwrap_or(IrType::Unit);

        let mut ir_fn = Fn::new(fn_name, params, return_ty.clone());
        let mut block = BasicBlock::new("entry".into());
        self.next_reg = f.params.len();
        self.var_map.clear();

        // Register parameter names in var_map
        for (i, param) in f.params.iter().enumerate() {
            self.var_map.insert(param.name.name.clone(), i);
        }

        let result_reg = self.compile_expr(&f.body, &mut block);
        self.compile_finish(&mut block, &mut ir_fn.blocks, result_reg);
        self.extra_blocks.clear();

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
                    let r = self.fresh_reg();
                    block.instrs.push(Instr::Force(r, ForceTarget::Static(ident.name.clone())));
                    r
                } else if let Some(&reg) = self.var_map.get(&ident.name) {
                    reg
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
                };
                block.instrs.push(instr);
                result_r
            }

            Expr::Call(c) => {
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
                            let result_r = self.fresh_reg();
                            block.instrs.push(Instr::Stdin(result_r));
                            result_r
                        }
                        _ => 0,
                    }
                } else {
                    let mut arg_regs = Vec::new();
                    for arg in &c.args {
                        if let ExprArg::Value(e) = arg {
                            arg_regs.push(self.compile_expr(e, block));
                        }
                    }
                    let result_r = self.fresh_reg();
                    let target = match &*c.func {
                        Expr::Var(ident) => CallTarget::Static(ident.name.clone()),
                        _ => CallTarget::Dynamic(0),
                    };
                    block.instrs.push(Instr::Call(result_r, target, arg_regs));
                    result_r
                }
            }

            Expr::Block(b) => {
                let mut last_reg = 0;
                for stmt in &b.stmts {
                    if let Some(def) = &stmt.def {
                        if def.rec {
                            self.thunk_names.insert(def.name.name.clone());
                        }
                    }
                }
                for stmt in &b.stmts {
                    last_reg = self.compile_expr(&stmt.expr, block);
                    if let Some(def) = &stmt.def {
                        self.var_map.insert(def.name.name.clone(), last_reg);
                    }
                }
                if let Some(final_expr) = &b.final_expr {
                    last_reg = self.compile_expr(final_expr, block);
                }
                last_reg
            }

            Expr::Fn(_f) => {
                self.diag.error("E003", "nested fn not yet supported in IR gen", None);
                0
            }

            Expr::Match(m) => {
                self.compile_match(m, block)
            }

            Expr::StructLit(s) => {
                let mut field_regs = Vec::new();
                for f in &s.fields {
                    if let Some(v) = &f.value {
                        field_regs.push(self.compile_expr(v, block));
                    }
                }
                let result_r = self.fresh_reg();
                block.instrs.push(Instr::StructCons(result_r, s.name.name.clone(), field_regs));
                self.reg_struct.insert(result_r, s.name.name.clone());
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
                let field_idx = self.reg_struct.get(&obj_r)
                    .and_then(|name| self.module.types.struct_field_index(name, &f.field.name))
                    .or_else(|| f.field.name.parse::<usize>().ok())
                    .unwrap_or(0);
                block.instrs.push(Instr::Field(result_r, obj_r, field_idx));
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
                        block.instrs.push(Instr::StructUpdate(result_r, current_r, fidx, val_r));
                        current_r = result_r;
                    }
                }
                current_r
            }

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

    fn compile_match(&mut self, m: &MatchExpr, block: &mut BasicBlock) -> usize {
        if m.arms.len() != 2 {
            self.diag.error("E003", "match must have exactly 2 arms (if/else desugaring)", None);
            return 0;
        }
        let cond_reg = self.compile_expr(&m.scrutinee, block);

        let l_true = self.fresh_label("L");
        let l_false = self.fresh_label("L");
        let l_merge = self.fresh_label("merge");

        block.terminator = Terminator::Br(cond_reg, l_true.clone(), l_false.clone());
        self.extra_blocks.push(block.clone());

        let mut block_true = BasicBlock::new(l_true.clone());
        let true_reg = self.compile_expr(&m.arms[0].body, &mut block_true);
        block_true.terminator = Terminator::Jmp(l_merge.clone());
        self.extra_blocks.push(block_true);

        let mut block_false = BasicBlock::new(l_false.clone());
        let false_reg = self.compile_expr(&m.arms[1].body, &mut block_false);
        block_false.terminator = Terminator::Jmp(l_merge.clone());
        self.extra_blocks.push(block_false);

        let mut block_merge = BasicBlock::new(l_merge);
        let result_r = self.fresh_reg();
        block_merge.instrs.push(Instr::Phi(result_r, vec![
            (true_reg, l_true),
            (false_reg, l_false),
        ]));
        *block = block_merge;
        result_r
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
