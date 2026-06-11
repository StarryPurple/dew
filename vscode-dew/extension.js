const vscode = require('vscode');
const { LanguageClient, TransportKind } = require('vscode-languageclient/node');

let client;

function activate(context) {
    const serverModule = context.asAbsolutePath('dew');

    const serverOptions = {
        command: 'dew',
        args: ['lsp'],
        options: { env: { ...process.env } }
    };

    const clientOptions = {
        documentSelector: [{ scheme: 'file', language: 'dew' }],
        synchronize: { fileEvents: vscode.workspace.createFileSystemWatcher('**/*.dew') }
    };

    client = new LanguageClient(
        'dew-lsp',
        'Dew Language Server',
        serverOptions,
        clientOptions
    );

    context.subscriptions.push(
        vscode.commands.registerCommand('dew.runFile', async () => {
            const editor = vscode.window.activeTextEditor;
            if (!editor || editor.document.languageId !== 'dew') return;

            const terminal = vscode.window.createTerminal('Dew');
            terminal.show();
            terminal.sendText(`dew run "${editor.document.fileName}"`);
        }),

        vscode.commands.registerCommand('dew.lintFile', async () => {
            const editor = vscode.window.activeTextEditor;
            if (!editor || editor.document.languageId !== 'dew') return;

            const terminal = vscode.window.createTerminal('Dew Lint');
            terminal.show();
            terminal.sendText(`dew lint "${editor.document.fileName}"`);
        })
    );

    client.start();
}

function deactivate() {
    if (client) return client.stop();
}

module.exports = { activate, deactivate };
