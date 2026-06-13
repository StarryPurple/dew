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
    /// Box (affine resource wrapper)
    Box(Box<Ty>),
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
    /// Copyable: freely duplicable (Int, Bool, Char, Unit, pure structs)
    Copyable,
    /// Affine: use at most once (Box(T))
    Affine,
    /// Persistent: reference-counted (List, Map, Set)
    Persistent,
}

impl Ty {
    /// Compute the affinity of a type
    pub fn affinity(&self) -> Affinity {
        match self {
            Ty::Prim(_) => Affinity::Copyable,
            Ty::Box(_) => Affinity::Affine,
            Ty::List(_) => Affinity::Persistent,
            Ty::Var(_) | Ty::Hole(_) => Affinity::Copyable, // conservative
            Ty::Fun(_, _) => Affinity::Copyable, // closures follow capture rules
            Ty::Tuple(ts) => {
                if ts.iter().any(|t| t.affinity() == Affinity::Affine) {
                    Affinity::Affine
                } else {
                    Affinity::Copyable
                }
            }
            Ty::Array(_, _) => Affinity::Copyable, // arrays are copyable
            Ty::Adt(_, _) => Affinity::Copyable,   // structural check needed; conservative
        }
    }
}
