// Dew compiler CLI entry point

use clap::{Parser, ValueEnum};

#[derive(Parser)]
#[command(name = "dew", about = "Dew language compiler and evaluator")]
struct Cli {
    /// Source file to compile/evaluate
    file: Option<String>,

    /// Emission format for IR
    #[arg(long, value_enum)]
    emit: Option<EmitFormat>,

    /// Enable step-by-step evaluation trace
    #[arg(long)]
    trace: bool,
}

#[derive(Clone, ValueEnum)]
enum EmitFormat {
    Json,
    Text,
}

fn main() {
    let _cli = Cli::parse();
}
