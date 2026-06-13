#![allow(dead_code)]
// Dew compiler library root
// Pipeline: Source -> Parser -> Type Checker -> Strictness Analysis -> IR Gen -> Evaluator

pub mod ast;
pub mod diagnostics;
pub mod eval;
pub mod ir;
pub mod ir_gen;
pub mod parser;
pub mod strictness;
pub mod typeck;
pub mod types;
pub mod value;
