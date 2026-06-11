/// Types in the Dew language.
///
/// Affinity rules:
///   - Int, Bool, Unit are Normal (freely copyable)
///   - Box(T) is Affine (must be unboxed exactly once — linear resource)
///   - fn(T) -> U is Normal unless any captured variable is affine
///     (closure affinity is inferred during type checking)

use serde::Serialize;
use std::fmt;

/// Whether a type (or closure) is normal or affine.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize)]
pub enum Affinity {
    /// Normal — can be used any number of times.
    Normal,
    /// Affine — must be used at most once.
    Affine,
}

impl Affinity {
    pub fn is_affine(self) -> bool {
        matches!(self, Affinity::Affine)
    }
}

impl fmt::Display for Affinity {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Affinity::Normal => write!(f, "ω"),
            Affinity::Affine => write!(f, "1"),
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub enum Type {
    /// 64-bit signed integer. Normal.
    Int,
    /// Boolean. Normal.
    Bool,
    /// Unit / void. Normal, trivial.
    Unit,
    /// Linear box containing a value of type T. Affine — must be unboxed.
    Box(Box<Type>),
    /// Function type: parameter → return, with affinity inferred from captures.
    /// Affinity=Normal means the closure is pure (no affine captures) and
    /// can be called freely. Affinity=Affine means the closure captures a
    /// resource and is FnOnce.
    Fun(Box<Type>, Box<Type>, Affinity),
    /// Lazy linked list. Normal (copyable) regardless of element type.
    List(Box<Type>),
}

impl Type {
    /// Returns true if values of this type can be freely copied/duplicated.
    pub fn is_copyable(&self) -> bool {
        match self {
            Type::Int | Type::Bool | Type::Unit | Type::List(_) => true,
            Type::Box(_) => false,
            Type::Fun(_, _, affinity) => !affinity.is_affine(),
        }
    }

    /// Returns true if this type is affine (must be consumed, can't be copied).
    pub fn is_affine(&self) -> bool {
        !self.is_copyable()
    }

    /// Set the affinity of a function type.
    pub fn with_affinity(self, affinity: Affinity) -> Type {
        match self {
            Type::Fun(param, ret, _) => Type::Fun(param, ret, affinity),
            other => other,
        }
    }

    /// Get the affinity of this type (Normal for non-functions).
    pub fn affinity(&self) -> Affinity {
        match self {
            Type::Fun(_, _, a) => *a,
            Type::Box(_) => Affinity::Affine,
            _ => Affinity::Normal,
        }
    }
}

impl fmt::Display for Type {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Type::Int => write!(f, "Int"),
            Type::Bool => write!(f, "Bool"),
            Type::Unit => write!(f, "Unit"),
            Type::Box(inner) => write!(f, "Box({inner})"),
            Type::List(inner) => write!(f, "[{inner}]"),
            Type::Fun(param, ret, affinity) => {
                let param_str = if matches!(param.as_ref(), Type::Fun(_, _, _)) {
                    format!("({param})")
                } else {
                    format!("{param}")
                };
                if affinity.is_affine() {
                    write!(f, "{param_str} -1-> {ret}")
                } else {
                    write!(f, "{param_str} -> {ret}")
                }
            }
        }
    }
}
