// Strictness analysis for implicit lazy evaluation
//
// Classifies every expression context as Strict or Lazy.
// The IR generator uses this classification to insert Suspend/Force nodes.

use crate::ast::*;

/// Whether an expression context demands evaluation
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Strictness {
    /// The value must be computed now (function arg, condition, etc.)
    Strict,
    /// The value can be delayed (let binding, cons tail, etc.)
    Lazy,
}

/// Classify the strictness of an expression in a given context
pub fn classify(expr: &Expr, context: Strictness) -> Strictness {
    match expr {
        // Literals are already in WHNF; further context is irrelevant
        Expr::Int(..) | Expr::Bool(..) | Expr::Char(..) | Expr::Unit(_) => context,

        // Variable references: if context is lazy, keep lazy
        Expr::Var(..) => context,

        // Function body: evaluated when applied (Strict at call site, Lazy in body)
        Expr::Fn { body, .. } => {
            // Body is lazy — we only produce a closure value
            let _ = classify(body, Strictness::Lazy);
            context
        }

        // Application: always strict (we need the function value)
        Expr::App { func, args, .. } => {
            classify(func, Strictness::Strict);
            for arg in args {
                // Arguments to user functions are Lazy unless annotated strict
                classify(arg, Strictness::Lazy);
            }
            Strictness::Strict
        }

        // Let binding: the bound value is Lazy; body follows context
        Expr::Let { value, body, .. } => {
            classify(value, Strictness::Lazy);
            classify(body, context)
        }

        // If: condition is Strict, branches follow context
        Expr::If { cond, then, else_, .. } => {
            classify(cond, Strictness::Strict);
            classify(then, context);
            classify(else_, context);
            context
        }

        // Force: mark expr as Strict
        Expr::Force { expr, .. } => {
            classify(expr, Strictness::Strict);
            Strictness::Strict
        }

        // Blocks: stmts are Lazy (discarded), final expr follows context
        Expr::Block { stmts, final_expr, .. } => {
            for s in stmts {
                classify(s, Strictness::Lazy);
            }
            classify(final_expr, context)
        }

        // Return: always Strict
        Expr::Return { expr, .. } => {
            classify(expr, Strictness::Strict);
            Strictness::Strict
        }

        // Match, defaults
        _ => context,
    }
}
