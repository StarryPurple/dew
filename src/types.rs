/// Types in the Dew language.
///
/// Affinity rules:
///   - Int, Bool, Unit are Normal (freely copyable)
///   - Box(T) is Affine (must be unboxed exactly once — linear resource)
///   - fn(T) -> U is Normal unless any captured variable is affine
///     (closure affinity is inferred during type checking)

use serde::Serialize;
use std::collections::HashMap;
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

/// Type substitution: maps type variable IDs to concrete types.
#[derive(Debug, Clone, Default)]
pub struct Subst {
    map: HashMap<u32, Type>,
}

impl Subst {
    pub fn new() -> Self { Subst { map: HashMap::new() } }
    pub fn singleton(var: u32, ty: Type) -> Self {
        let mut s = Subst::new();
        s.map.insert(var, ty);
        s
    }
    pub fn compose(&self, other: &Subst) -> Self {
        let mut result = self.clone();
        for (v, t) in &other.map {
            result.map.insert(*v, t.apply(other).apply(self));
        }
        result
    }
    pub fn get(&self, var: &u32) -> Option<&Type> {
        self.map.get(var)
    }
    pub fn is_empty(&self) -> bool {
        self.map.is_empty()
    }
}

/// Polymorphic type scheme: ∀vars. body
#[derive(Debug, Clone)]
pub struct Scheme {
    pub vars: Vec<u32>,
    pub body: Type,
}

impl Scheme {
    pub fn monomorphic(ty: Type) -> Self {
        Scheme { vars: vec![], body: ty }
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
    Fun(Box<Type>, Box<Type>, Affinity),
    /// Lazy linked list. Normal (copyable) regardless of element type.
    List(Box<Type>),
    /// Type variable — placeholder to be unified. Not serializable.
    #[serde(skip)]
    Var(u32),
    /// User-defined algebraic type: Option(Int), Result(Int, Bool)
    Named(String, Vec<Type>),
}

impl Type {
    /// Apply a substitution to this type, replacing all Var references.
    pub fn apply(&self, subst: &Subst) -> Type {
        match self {
            Type::Var(v) => subst.get(v).cloned().unwrap_or_else(|| Type::Var(*v)),
            Type::Box(inner) => Type::Box(Box::new(inner.apply(subst))),
            Type::Fun(param, ret, aff) => {
                Type::Fun(Box::new(param.apply(subst)), Box::new(ret.apply(subst)), *aff)
            }
            Type::List(inner) => Type::List(Box::new(inner.apply(subst))),
            Type::Named(name, args) => {
                Type::Named(name.clone(), args.iter().map(|a| a.apply(subst)).collect())
            }
            other => other.clone(),
        }
    }

    /// Returns true if values of this type can be freely copied/duplicated.
    pub fn is_copyable(&self) -> bool {
        match self {
            Type::Int | Type::Bool | Type::Unit | Type::List(_) | Type::Var(_) | Type::Named(_, _) => true,
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
            Type::Var(v) => write!(f, "?{v}"),
            Type::Named(name, args) => {
                write!(f, "{name}")?;
                if !args.is_empty() {
                    write!(f, "(")?;
                    for (i, a) in args.iter().enumerate() {
                        if i > 0 { write!(f, ", ")?; }
                        write!(f, "{a}")?;
                    }
                    write!(f, ")")?;
                }
                Ok(())
            }
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
