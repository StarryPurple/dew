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
    /// Normal: default, no special semantics
    Normal,
    /// Affine: use at most once
    Affine,
}

impl Ty {
    /// Compute the affinity of a type.
    /// For ADTs, checks if the struct/enum is marked #[Affine].
    pub fn affinity(&self, affine_adts: &std::collections::HashSet<String>) -> Affinity {
        match self {
            Ty::Prim(_) => Affinity::Normal,
            Ty::Var(_) | Ty::Hole(_) => Affinity::Normal,
            Ty::Fun(_, _) => Affinity::Normal,
            Ty::Tuple(ts) => {
                if ts.iter().any(|t| t.affinity(affine_adts) == Affinity::Affine) {
                    Affinity::Affine
                } else {
                    Affinity::Normal
                }
            }
            Ty::Array(_, _) => Affinity::Normal,
            Ty::Adt(name, _) => {
                if affine_adts.contains(name.as_str()) {
                    Affinity::Affine
                } else {
                    Affinity::Normal
                }
            }
        }
    }
}
