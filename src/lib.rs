// Dew compiler library root.
// Each module corresponds to one pipeline stage.
// Stage order: lexer → parser → desugar → nameres → typeck → strictness → ir_gen → backend

pub mod ast;
pub mod diagnostics;
pub mod lexer;
pub mod parser;
pub mod desugar;
pub mod nameres;
pub mod types;
pub mod typeck;
pub mod strictness;
pub mod ir;
pub mod ir_gen;
pub mod value;
pub mod backend;
pub mod lsp;
pub mod semantic_tokens;
pub mod rx_parser;
// pub mod rx2dew_ir;
