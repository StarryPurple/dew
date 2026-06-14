// Type system: internal type representation for HM inference and resource categories

use std::fmt;

/// Internal type representation (post-resolution, canonical)
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Ty {
    /// Primitive types: Int, Bool, Char, Unit
    Prim(PrimTy),
    /// Type variable (for HM inference)
    Var(usize),
    /// Function type
    Fun(Box<Ty>, Box<Ty>),
    /// Named ADT (struct or enum), with optional type arguments
    Adt(String, Vec<Ty>),
    /// Tuple type
    Tuple(Vec<Ty>),
    /// Array type
    Array(Box<Ty>, usize),
    /// List type
    List(Box<Ty>),
    /// Affine resource wrapper (zero-cost compile-time marker)
    Affine(Box<Ty>),
    /// Hole (for type inference gaps)
    Hole(usize),
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum PrimTy {
    Int,
    Bool,
    Char,
    Unit,
}

impl fmt::Display for PrimTy {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let s = match self {
            PrimTy::Int => "Int",
            PrimTy::Bool => "Bool",
            PrimTy::Char => "Char",
            PrimTy::Unit => "Unit",
        };
        write!(f, "{s}")
    }
}

/// Resource affinity
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Affinity {
    /// Normal: default, no special semantics (Int, Bool, Char, Unit, pure structs)
    Normal,
    /// Affine: use at most once (Affine(T))
    Affine,
    /// Persistent: reference-counted (List, Map, Set)
    Persistent,
}

impl Ty {
    /// Compute the affinity of a type
    pub fn affinity(&self) -> Affinity {
        match self {
            Ty::Prim(_) => Affinity::Normal,
            Ty::Affine(_) => Affinity::Affine,
            Ty::List(_) => Affinity::Persistent,
            Ty::Var(_) | Ty::Hole(_) => Affinity::Normal,
            Ty::Fun(_, _) => Affinity::Normal,
            Ty::Tuple(ts) => {
                if ts.iter().any(|t| t.affinity() == Affinity::Affine) {
                    Affinity::Affine
                } else {
                    Affinity::Normal
                }
            }
            Ty::Array(_, _) => Affinity::Normal,
            Ty::Adt(_, _) => Affinity::Normal,
        }
    }
}
