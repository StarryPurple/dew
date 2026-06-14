// Rx → Dew translator binary
// Usage: rx2dew <file.rx> [--emit=text|dew]

use std::{env, fs, process};
use dew::rx_parser::Parser;
use dew::rx2dew_ir::translate_rx_to_dew;

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("usage: rx2dew <file.rx>");
        process::exit(1);
    }
    let src = fs::read_to_string(&args[1]).unwrap_or_else(|e| {
        eprintln!("[E001] cannot read {}: {}", args[1], e);
        process::exit(1);
    });

    match translate_rx_to_dew(&src) {
        Ok(dew) => print!("{dew}"),
        Err(e) => {
            eprintln!("[E002] translation error: {e}");
            process::exit(1);
        }
    }
}
