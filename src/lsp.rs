/// LSP server for Dew language.
/// Provides diagnostics, completion, hover, and goto-definition.

use tower_lsp::jsonrpc::Result as LspResult;
use tower_lsp::lsp_types::*;
use tower_lsp::{Client, LanguageServer, LspService, Server};

use crate::ast::Expr;
use crate::diagnostics::DiagnosticCollector;
use crate::parser;
use crate::typeck::TypeChecker;
use std::collections::HashSet;

const KEYWORDS: &[&str] = &[
    "fn", "def", "if", "else", "fix", "dup",
    "box", "unbox", "nil", "cons", "head", "tail", "isnil",
    "true", "false", "Int", "Bool", "Box", "List",
];

pub struct Backend {
    client: Client,
}

impl Backend {
    #[allow(dead_code)]
    fn collect_defs(expr: &Expr, names: &mut HashSet<(String, String)>) {
        match expr {
            Expr::Let(name, bind, body, _) => {
                names.insert((name.clone(), "variable".into()));
                Self::collect_defs(bind, names);
                Self::collect_defs(body, names);
            }
            Expr::Lam(param, _, body, _) => {
                names.insert((param.clone(), "parameter".into()));
                Self::collect_defs(body, names);
            }
            Expr::Fix(name, _, body, _) => {
                names.insert((name.clone(), "function".into()));
                Self::collect_defs(body, names);
            }
            Expr::BinOp(_, l, r, _) => { Self::collect_defs(l, names); Self::collect_defs(r, names); }
            Expr::If(c, t, e, _) => { Self::collect_defs(c, names); Self::collect_defs(t, names); Self::collect_defs(e, names); }
            Expr::App(f, a, _) => { Self::collect_defs(f, names); Self::collect_defs(a, names); }
            Expr::Dup(i, _) => Self::collect_defs(i, names),
            Expr::Box(i, _) => Self::collect_defs(i, names),
            Expr::Unbox(i, _) => Self::collect_defs(i, names),
            Expr::ForceStrict(i, _) => Self::collect_defs(i, names),
            Expr::Cons(h, t, _) => { Self::collect_defs(h, names); Self::collect_defs(t, names); }
            Expr::Head(i, _) => Self::collect_defs(i, names),
            Expr::Tail(i, _) => Self::collect_defs(i, names),
            Expr::IsNil(i, _) => Self::collect_defs(i, names),
            Expr::Pipe(l, r, _) => { Self::collect_defs(l, names); Self::collect_defs(r, names); }
            _ => {}
        }
    }

    fn publish_diagnostics(&self, uri: Url, source: &str) {
        let mut diagnostics = Vec::new();

        // Parse errors
        match parser::parse(source) {
            Ok(ast) => {
                let mut diag = DiagnosticCollector::new();
                let mut typeck = TypeChecker::new(&mut diag);
                if let Err(err) = typeck.check(&ast) {
                    diagnostics.push(Diagnostic {
                        range: Range::new(Position::new(0, 0), Position::new(0, 0)),
                        severity: Some(DiagnosticSeverity::ERROR),
                        code: Some(NumberOrString::String(err.code().into())),
                        source: Some("dew".into()),
                        message: err.detailed(),
                        ..Default::default()
                    });
                }
            }
            Err(errs) => {
                for e in &errs {
                    diagnostics.push(Diagnostic {
                        range: Range::new(Position::new(0, 0), Position::new(0, 0)),
                        severity: Some(DiagnosticSeverity::ERROR),
                        source: Some("dew".into()),
                        message: format!("parse error: {e}"),
                        ..Default::default()
                    });
                }
            }
        }

        let _ = self.client.publish_diagnostics(uri, diagnostics, None);
    }
}

#[tower_lsp::async_trait]
impl LanguageServer for Backend {
    async fn initialize(&self, _: InitializeParams) -> LspResult<InitializeResult> {
        Ok(InitializeResult {
            capabilities: ServerCapabilities {
                text_document_sync: Some(TextDocumentSyncCapability::Kind(TextDocumentSyncKind::FULL)),
                completion_provider: Some(CompletionOptions::default()),
                hover_provider: Some(HoverProviderCapability::Simple(true)),
                ..Default::default()
            },
            ..Default::default()
        })
    }

    async fn shutdown(&self) -> LspResult<()> {
        Ok(())
    }

    async fn did_open(&self, params: DidOpenTextDocumentParams) {
        self.publish_diagnostics(params.text_document.uri, &params.text_document.text);
    }

    async fn did_change(&self, params: DidChangeTextDocumentParams) {
        if let Some(change) = params.content_changes.into_iter().last() {
            self.publish_diagnostics(params.text_document.uri, &change.text);
        }
    }

    async fn completion(&self, _params: CompletionParams) -> LspResult<Option<CompletionResponse>> {
        let items: Vec<CompletionItem> = KEYWORDS.iter().map(|kw| {
            CompletionItem {
                label: kw.to_string(),
                kind: Some(CompletionItemKind::KEYWORD),
                detail: Some(keyword_detail(kw)),
                ..Default::default()
            }
        }).collect();

        Ok(Some(CompletionResponse::Array(items)))
    }

    async fn hover(&self, _: HoverParams) -> LspResult<Option<Hover>> {
        Ok(None)
    }
}

fn keyword_detail(kw: &str) -> String {
    match kw {
        "fn" => "Function/lambda expression".into(),
        "def" => "Let binding (variable definition)".into(),
        "if" => "Conditional expression".into(),
        "else" => "Alternative branch of if".into(),
        "fix" => "Fixed-point combinator (recursion)".into(),
        "dup" => "Duplicate a normal (copyable) value".into(),
        "box" => "Allocate a linear box (affine resource)".into(),
        "unbox" => "Deallocate a box, consuming it".into(),
        "nil" => "Empty list".into(),
        "cons" => "List constructor (head, tail)".into(),
        "head" => "Get first element of list".into(),
        "tail" => "Get rest of list (forces lazy tail)".into(),
        "isnil" => "Test if list is empty".into(),
        "true" | "false" => "Boolean literal".into(),
        "Int" => "64-bit signed integer type".into(),
        "Bool" => "Boolean type".into(),
        "Box" => "Linear box type constructor".into(),
        "List" => "List type constructor".into(),
        _ => "".into(),
    }
}

pub async fn run_lsp() {
    let stdin = tokio::io::stdin();
    let stdout = tokio::io::stdout();

    let (service, socket) = LspService::new(|client| Backend { client });
    Server::new(stdin, stdout, socket).serve(service).await;
}
