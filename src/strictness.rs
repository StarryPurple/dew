/// Strictness analysis for Dew.
///
/// **Strict positions** (need an actual value, not a thunk):
///   - if condition
///   - binary op operands
///   - dup argument
///   - fn expression in application
///   - unbox argument (need the Box to deallocate)
///
/// **Lazy positions** (can be thunked):
///   - function body
///   - function argument
///   - let body / bind
///   - fix body
///   - if branches
///   - box argument (allocation is lazy)

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Context {
    Strict,
    Lazy,
}

impl Context {
    pub fn for_if_condition(self) -> Context { Context::Strict }
    pub fn for_if_branch(self) -> Context { Context::Lazy }
    pub fn for_fn_body(self) -> Context { Context::Lazy }
    pub fn for_fn_arg(self) -> Context { Context::Lazy }
    pub fn for_fn_expr(self) -> Context { Context::Strict }
    pub fn for_let_bind(self) -> Context { Context::Lazy }
    pub fn for_let_body(self) -> Context { Context::Lazy }
    pub fn for_binop_operand(self) -> Context { Context::Strict }
    pub fn for_dup_arg(self) -> Context { Context::Strict }
    pub fn for_fix_body(self) -> Context { Context::Lazy }
    pub fn for_box_arg(self) -> Context { Context::Strict }
    pub fn for_unbox_arg(self) -> Context { Context::Strict }
}

pub struct StrictnessAnalysis;

impl StrictnessAnalysis {
    pub fn is_naturally_strict(ir: &crate::ir::Ir) -> bool {
        matches!(ir, crate::ir::Ir::Lit(_) | crate::ir::Ir::Bool(_)
            | crate::ir::Ir::Unit | crate::ir::Ir::BinOp(_, _, _)
            | crate::ir::Ir::Force(_) | crate::ir::Ir::Dealloc(_)
            | crate::ir::Ir::Head(_) | crate::ir::Ir::Tail(_)
            | crate::ir::Ir::IsNil(_) | crate::ir::Ir::Nil)
    }

    pub fn is_naturally_lazy(ir: &crate::ir::Ir) -> bool {
        !Self::is_naturally_strict(ir)
    }
}
