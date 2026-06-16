// Hindley-Milner type system types.
//
// Internal type representation used by the type checker.
// All type variables are resolved during HM inference;
// the IR sees only monomorphized types.

use std::collections::HashMap;
use std::fmt;

// ---------------------------------------------------------------------------
// Type Variable
// ---------------------------------------------------------------------------

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct TypeVar(pub usize);

// ---------------------------------------------------------------------------
// Internal Type
// ---------------------------------------------------------------------------

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Ty {
    Var(TypeVar),
    Int,
    Bool,
    Char,
    Unit,
    Fun(Box<Ty>, Box<Ty>),
    Tuple(Vec<Ty>),
    Array(Box<Ty>, usize),
    Named(String, Vec<Ty>),
}

impl Ty {
    pub fn fun(params: Vec<Ty>, ret: Ty) -> Ty {
        params.into_iter().rfold(ret, |acc, p| Ty::Fun(Box::new(p), Box::new(acc)))
    }
}

impl fmt::Display for Ty {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            Ty::Var(tv) => write!(f, "t{}", tv.0),
            Ty::Int => write!(f, "Int"),
            Ty::Bool => write!(f, "Bool"),
            Ty::Char => write!(f, "Char"),
            Ty::Unit => write!(f, "Unit"),
            Ty::Fun(p, r) => write!(f, "({} -> {})", p, r),
            Ty::Tuple(ts) => {
                write!(f, "(")?;
                for (i, t) in ts.iter().enumerate() {
                    if i > 0 { write!(f, ", ")?; }
                    write!(f, "{}", t)?;
                }
                write!(f, ")")
            }
            Ty::Array(t, n) => write!(f, "Array({}, {})", t, n),
            Ty::Named(n, args) => {
                write!(f, "{}", n)?;
                if !args.is_empty() {
                    write!(f, "(")?;
                    for (i, a) in args.iter().enumerate() {
                        if i > 0 { write!(f, ", ")?; }
                        write!(f, "{}", a)?;
                    }
                    write!(f, ")")?;
                }
                Ok(())
            }
        }
    }
}

// ---------------------------------------------------------------------------
// Type Scheme (∀α. τ)
// ---------------------------------------------------------------------------

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Scheme {
    pub vars: Vec<TypeVar>,
    pub ty: Ty,
}

// ---------------------------------------------------------------------------
// Substitution
// ---------------------------------------------------------------------------

#[derive(Debug, Clone, Default)]
pub struct Subst {
    map: HashMap<TypeVar, Ty>,
}

impl Subst {
    pub fn new() -> Self {
        Subst { map: HashMap::new() }
    }

    pub fn singleton(var: TypeVar, ty: Ty) -> Self {
        let mut s = Subst::new();
        s.insert(var, ty);
        s
    }

    pub fn insert(&mut self, var: TypeVar, ty: Ty) {
        self.map.insert(var, ty);
    }

    pub fn get(&self, var: &TypeVar) -> Option<&Ty> {
        self.map.get(var)
    }

    pub fn apply(&self, ty: &Ty) -> Ty {
        match ty {
            Ty::Var(tv) => {
                if let Some(t) = self.map.get(tv) {
                    self.apply(t)
                } else {
                    ty.clone()
                }
            }
            Ty::Fun(p, r) => Ty::Fun(
                Box::new(self.apply(p)),
                Box::new(self.apply(r)),
            ),
            Ty::Tuple(ts) => Ty::Tuple(ts.iter().map(|t| self.apply(t)).collect()),
            Ty::Array(t, n) => Ty::Array(Box::new(self.apply(t)), *n),
            Ty::Named(name, args) => Ty::Named(name.clone(),
                args.iter().map(|a| self.apply(a)).collect()),
            other => other.clone(),
        }
    }

    pub fn compose(&self, other: &Subst) -> Subst {
        let mut result = other.clone();
        for (var, ty) in &self.map {
            result.insert(*var, other.apply(ty));
        }
        result
    }
}

// ---------------------------------------------------------------------------
// Unification
// ---------------------------------------------------------------------------

pub fn unify(t1: &Ty, t2: &Ty) -> Result<Subst, String> {
    let mut s = Subst::new();
    unify_with(&mut s, t1, t2)?;
    Ok(s)
}

fn unify_with(s: &mut Subst, t1: &Ty, t2: &Ty) -> Result<(), String> {
    let t1 = s.apply(t1);
    let t2 = s.apply(t2);

    match (&t1, &t2) {
        (Ty::Var(a), Ty::Var(b)) if a == b => Ok(()),
        (Ty::Var(a), _) => {
            if occurs(*a, &t2) {
                return Err(format!("occurs check: t{} in {}", a.0, t2));
            }
            s.insert(*a, t2);
            Ok(())
        }
        (_, Ty::Var(_)) => unify_with(s, &t2, &t1),
        (Ty::Int, Ty::Int)
        | (Ty::Bool, Ty::Bool)
        | (Ty::Char, Ty::Char)
        | (Ty::Unit, Ty::Unit) => Ok(()),
        (Ty::Fun(p1, r1), Ty::Fun(p2, r2)) => {
            unify_with(s, p1, p2)?;
            unify_with(s, r1, r2)
        }
        (Ty::Tuple(ts1), Ty::Tuple(ts2)) if ts1.len() == ts2.len() => {
            for (a, b) in ts1.iter().zip(ts2.iter()) {
                unify_with(s, a, b)?;
            }
            Ok(())
        }
        (Ty::Array(t1, n1), Ty::Array(t2, n2)) if n1 == n2 => {
            unify_with(s, t1, t2)
        }
        (Ty::Named(n1, args1), Ty::Named(n2, args2)) if n1 == n2 && args1.len() == args2.len() => {
            for (a, b) in args1.iter().zip(args2.iter()) {
                unify_with(s, a, b)?;
            }
            Ok(())
        }
        _ => Err(format!("cannot unify {} with {}", t1, t2)),
    }
}

fn occurs(var: TypeVar, ty: &Ty) -> bool {
    match ty {
        Ty::Var(v) => *v == var,
        Ty::Fun(p, r) => occurs(var, p) || occurs(var, r),
        Ty::Tuple(ts) => ts.iter().any(|t| occurs(var, t)),
        Ty::Array(t, _) => occurs(var, t),
        Ty::Named(_, args) => args.iter().any(|a| occurs(var, a)),
        _ => false,
    }
}

// ---------------------------------------------------------------------------
// Typing Environment
// ---------------------------------------------------------------------------

#[derive(Debug, Clone)]
pub struct TypeEnv {
    env: HashMap<String, Scheme>,
}

impl TypeEnv {
    pub fn new() -> Self {
        TypeEnv { env: HashMap::new() }
    }

    pub fn insert(&mut self, name: String, scheme: Scheme) {
        self.env.insert(name, scheme);
    }

    pub fn lookup(&self, name: &str) -> Option<&Scheme> {
        self.env.get(name)
    }

    pub fn contains(&self, name: &str) -> bool {
        self.env.contains_key(name)
    }
}

// ---------------------------------------------------------------------------
// Fresh type variable generation
// ---------------------------------------------------------------------------

pub struct TypeVarGen {
    next: usize,
}

impl TypeVarGen {
    pub fn new() -> Self {
        TypeVarGen { next: 0 }
    }

    pub fn fresh(&mut self) -> TypeVar {
        let v = TypeVar(self.next);
        self.next += 1;
        v
    }

    pub fn fresh_ty(&mut self) -> Ty {
        Ty::Var(self.fresh())
    }

    pub fn instantiate(&mut self, scheme: &Scheme) -> Ty {
        let mut s = Subst::new();
        for var in &scheme.vars {
            s.insert(*var, self.fresh_ty());
        }
        s.apply(&scheme.ty)
    }

    pub fn generalize(&self, env: &TypeEnv, ty: Ty) -> Scheme {
        let free = free_type_vars(&ty);
        let env_free = env_free_vars(env);
        let vars: Vec<TypeVar> = free.into_iter()
            .filter(|v| !env_free.contains(v))
            .collect();
        Scheme { vars, ty }
    }
}

fn free_type_vars(ty: &Ty) -> Vec<TypeVar> {
    let mut vars = Vec::new();
    collect_free(ty, &mut vars);
    vars.sort_by_key(|v| v.0);
    vars.dedup();
    vars
}

fn collect_free(ty: &Ty, vars: &mut Vec<TypeVar>) {
    match ty {
        Ty::Var(v) => vars.push(*v),
        Ty::Fun(p, r) => { collect_free(p, vars); collect_free(r, vars); }
        Ty::Tuple(ts) => ts.iter().for_each(|t| collect_free(t, vars)),
        Ty::Array(t, _) => collect_free(t, vars),
        Ty::Named(_, args) => args.iter().for_each(|a| collect_free(a, vars)),
        _ => {}
    }
}

fn env_free_vars(env: &TypeEnv) -> Vec<TypeVar> {
    let mut vars = Vec::new();
    for scheme in env.env.values() {
        collect_free(&scheme.ty, &mut vars);
    }
    vars
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn unify_equal() {
        let t = Ty::Int;
        assert!(unify(&t, &t).is_ok());
    }

    #[test]
    fn unify_var_with_type() {
        let v = Ty::Var(TypeVar(0));
        let t = Ty::Int;
        let s = unify(&v, &t).unwrap();
        assert_eq!(s.apply(&v), Ty::Int);
    }

    #[test]
    fn unify_mismatch() {
        assert!(unify(&Ty::Int, &Ty::Bool).is_err());
    }

    #[test]
    fn occurs_check() {
        // t0 = Fun(t0, Int) should fail occurs check
        let v = Ty::Var(TypeVar(0));
        let fun = Ty::Fun(Box::new(v.clone()), Box::new(Ty::Int));
        assert!(unify(&v, &fun).is_err());
    }
}
