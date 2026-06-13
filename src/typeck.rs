// Hindley-Milner type inference with affine resource tracking

use crate::ast::*;
use crate::types::*;
use crate::diagnostics::DiagnosticCollector;

/// Type-check a program, returning the inferred types for top-level definitions
pub fn check_program(
    decls: &[Decl],
    diag: &mut DiagnosticCollector,
) -> Result<TypeEnv, Vec<String>> {
    let mut ctx = TypeCtx::new(diag);
    ctx.check_decls(decls)
}

/// Mapping from variable names to their types
pub type TypeEnv = std::collections::HashMap<String, Ty>;

/// Type-checking context with HM unification state
struct TypeCtx<'a> {
    diag: &'a mut DiagnosticCollector,
    env: TypeEnv,
    next_var: usize,
    constraints: Vec<(Ty, Ty)>,
}

impl<'a> TypeCtx<'a> {
    fn new(diag: &'a mut DiagnosticCollector) -> Self {
        Self {
            diag,
            env: TypeEnv::new(),
            next_var: 0,
            constraints: vec![],
        }
    }

    fn fresh_var(&mut self) -> Ty {
        let v = self.next_var;
        self.next_var += 1;
        Ty::Var(v)
    }

    fn check_decls(&mut self, decls: &[Decl]) -> Result<TypeEnv, Vec<String>> {
        // TODO: Implement full HM inference
        for decl in decls {
            self.check_decl(decl)?;
        }
        Ok(self.env.clone())
    }

    fn check_decl(&mut self, decl: &Decl) -> Result<(), Vec<String>> {
        match decl {
            Decl::Def { name, value, .. } => {
                let ty = self.infer_expr(value)?;
                self.env.insert(name.clone(), ty);
                Ok(())
            }
            Decl::Struct { name, .. } => {
                self.env.insert(name.clone(), Ty::Adt(name.clone(), vec![]));
                Ok(())
            }
            Decl::Enum { name, .. } => {
                self.env.insert(name.clone(), Ty::Adt(name.clone(), vec![]));
                Ok(())
            }
            Decl::Import { .. } => Ok(()),
        }
    }

    fn infer_expr(&mut self, expr: &Expr) -> Result<Ty, Vec<String>> {
        match expr {
            Expr::Int(..) => Ok(Ty::Prim(PrimTy::Int)),
            Expr::Bool(..) => Ok(Ty::Prim(PrimTy::Bool)),
            Expr::Char(..) => Ok(Ty::Prim(PrimTy::Char)),
            Expr::Unit(_) => Ok(Ty::Prim(PrimTy::Unit)),
            Expr::Var(name, _) => {
                self.env.get(name)
                    .cloned()
                    .ok_or_else(|| vec![format!("unbound variable: {name}")])
            }
            // TODO: Implement full inference for all expression forms
            _ => Ok(self.fresh_var()),
        }
    }
}
