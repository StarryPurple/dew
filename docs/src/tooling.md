# Tooling

Dew ships with a command-line compiler, a Language Server Protocol (LSP) implementation, and a VS Code extension.

## CLI

The `dew` binary provides compilation, evaluation, and diagnostics:

```bash
cargo run -- <file.dew>              # compile and evaluate
cargo run -- <file.dew> --emit=text  # print IR as text
dew lsp                              # start LSP server
```

### Commands

| Command | Description |
|---------|-------------|
| `dew <file>` | Parse, compile, and evaluate a `.dew` source file |
| `dew lsp` | Start the LSP server (JSON-RPC over stdio) |

### Options

| Flag | Description |
|------|-------------|
| `--emit <format>` | Emit IR text instead of evaluating. Current format: `text` |
| `--trace` | Enable evaluation tracing (planned) |

### Exit Codes

Dew uses the `main` function's return value as the process exit code:

```dew
def main = fn -> Int { 42 }
// process exits with code 42
```

If `main` returns a non-`Int` value, the exit code defaults to `0` after printing the value. Parsing or evaluation errors exit with code `1`.

### Example Session

```bash
$ dew examples/arithmetic.dew
=> 42

$ dew examples/arithmetic.dew --emit=text
%t0 = ThunkAlloc
Thunk %t0 {
  Prim add Lit 40 Lit 2
}
%t1 = Force %t0
Update %t0, %t1
Def "main" %t0

$ dew examples/fail_unbound.dew
[E002] parse error: parse error
```

## LSP Server

Dew includes a Language Server Protocol implementation for editor integration.

### Starting the Server

```bash
dew lsp
```

The server communicates via JSON-RPC 2.0 over stdin/stdout, using the standard LSP `Content-Length` header framing.

### Supported Features

| Feature | Status | Description |
|---------|--------|-------------|
| **Initialize** | ✅ | Returns server capabilities |
| **Text Document Sync** | ✅ | Full document sync on open/change |
| **Hover** | ✅ | Shows "Dew expression" on hover (basic) |
| **Go to Definition** | ✅ | Provider declared (stub implementation) |
| **Diagnostics** | Partial | Parse errors available; type errors planned |

### Capabilities

On `initialize`, the server reports:

```json
{
  "capabilities": {
    "textDocumentSync": 1,
    "hoverProvider": true,
    "definitionProvider": true
  },
  "serverInfo": {
    "name": "dew",
    "version": "0.1.0"
  }
}
```

### Document Lifecycle

The server tracks open documents in an in-memory map:

- `textDocument/didOpen` — stores the document text
- `textDocument/didChange` — updates with full content (sync mode: full)

Diagnostics are generated from the parser on each change.

### Architecture

The LSP server is implemented in `lsp.rs` (~160 lines):

1. Read `Content-Length` header from stdin
2. Read JSON-RPC body
3. Dispatch to `handle_request` for requests or process notifications
4. Serialize response and write back to stdout

```rust,ignore
enum LspMessage {
    Request  { id, method, params },
    Notification { method, params },
}
```

## VS Code Extension

The `vscode-dew/` directory contains a minimal VS Code extension:

### Files

| File | Purpose |
|------|---------|
| `package.json` | Extension manifest — registers the `dew` language |
| `language-configuration.json` | Comment toggling, bracket matching, auto-closing pairs |
| `syntaxes/dew.tmLanguage.json` | TextMate grammar for syntax highlighting |

### Features

- **File extension**: `.dew` files are recognized as Dew source
- **Syntax highlighting**: Keywords, types, strings, comments
- **Comment toggling**: `//` line comments, `/* */` block comments
- **Bracket matching**: `{}`, `[]`, `()`
- **Auto-closing pairs**: Brackets, quotes

### Installation

Copy or symlink `vscode-dew/` into your VS Code extensions directory:

```bash
cp -r vscode-dew ~/.vscode/extensions/dew
```

## Diagnostics

Dew uses a structured diagnostic system with error/warning codes:

### Error Codes

```
[E001] — File/system errors (cannot read file, no file specified)
[E002] — Parse errors (syntax errors)
[E###] — General errors (sequential numbering)
```

### Warning Codes

```
[W###] — Warnings (sequential numbering)
```

### Output Formats

Diagnostics are collected in a `DiagnosticCollector` and can be emitted as:

- **stderr** (default): plain text with code prefixes
- **JSON**: structured array of diagnostic messages

```rust,ignore
diag.report();          // prints to stderr
let json = diag.to_json();  // returns JSON string
```

### Example Output

```
[E002] parse error: expected expr, got Eof
[E001] eval: unbound: undefined_var
```

## Build Configuration

### Cargo Profile

```toml
[profile.release]
opt-level = 2
lto = true
```

Release builds use optimization level 2 with link-time optimization.

### Dependencies

| Dependency | Version | Purpose |
|------------|---------|---------|
| `clap` | 4 (derive) | CLI argument parsing |
| `serde` | 1 (derive) | Serialization for LSP JSON-RPC |
| `serde_json` | 1 | JSON encoding/decoding |
| `ariadne` | 0.4 | Fancy error reporting (declared) |

## Development Workflow

### Building

```bash
cargo build              # debug build
cargo build --release    # release build
```

### Running Tests

Testing is **example-driven** — each `.dew` file in `examples/` serves as a test case:

```bash
dew examples/arithmetic.dew        # expects exit code 42
dew examples/factorial.dew         # expects exit code 120
dew examples/fail/unbound_var.dew  # expects parse error
```

### Example Categories

| Directory | Purpose |
|-----------|---------|
| `examples/*.dew` | Basic language features (arithmetic, factorial, if/else, match, struct) |
| `examples/complex/` | Algorithm benchmarks (Ackermann, Fibonacci, power, GCD, FizzBuzz) |
| `examples/functions/` | Higher-order function demos |
| `examples/structs/` | Struct usage patterns |
| `examples/fail/` | Error cases (unbound variables, infinite recursion, type errors) |

## IR Emission

The `--emit=text` flag prints the Thunk Graph IR in a human-readable format with 2-space indent:

```
%t0 = ThunkAlloc
Thunk %t0 {
  Lambda [n]
  If Prim eq %n Lit 0
  Then Lit 1
  Else Prim mul %n Apply Ref %t0 [Prim sub %n Lit 1]
}
%t1 = Force %t0
Update %t0, %t1
Def "fact" %t0
```

This is useful for understanding the compiler's output and debugging lazy evaluation behavior.

## Interactive Playground (Planned)

The mdbook can be configured with a **run backend** so that code blocks in the book become interactive — readers can edit examples in the browser and see output without leaving the page.

### How it works

mdbook's `[output.html.playground]` config points at an HTTP endpoint. When a reader clicks "Run", mdbook sends the source code and receives stdout/stderr back:

```
Browser ──POST source──► dew-playground (HTTP server)
                              │
                         dew <source.dew> --emit=text
                              │
Browser ◄── stdout/err ──┘
```

### What's needed

1. **`dew-playground` binary** — a small HTTP server (e.g. `axum` 100-line service) that:
   - Accepts `POST /execute` with `{ "code": "..." }`
   - Writes code to a temp file, runs `dew <file>`, captures stdout/stderr
   - Returns `{ "success": bool, "stdout": "...", "stderr": "..." }`
   - Sandboxes execution (timeout, no filesystem write, no network)
2. **mdbook config** — add to `docs/book.toml`:
   ```toml
   [output.html.playground]
   runnable = true
   editable = true
   ```
3. **Playground URL** — the `--playground-url` flag or embedding the endpoint in the book config

### Security considerations

Code execution on a server is inherently dangerous. The playground server must:
- Run each request in a sandboxed subprocess
- Enforce a timeout (e.g. 5 seconds) — Dew has no infinite loops due to cycle detection, but Ackermann with large inputs can take time
- Disallow `import` and filesystem access
- Run as an unprivileged user
- Rate-limit requests per IP

### Alternative: client-side

A lighter-weight approach is to compile `dew` to WASM via `wasm-pack` and run evaluation entirely in the browser. This removes the server-side risk entirely. Trade-off: less performant, larger page load, but zero server infrastructure.

## Next Steps

- [**Introduction**](intro.md) — return to the beginning
- [Source code](https://github.com/ACM-Class-2026-Spring/dew) — read the implementation
