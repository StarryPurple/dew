const cp = require('child_process');
const path = require('path');
let client = null;

function activate(context) {
    const vscode = require('vscode');
    const lc = require('vscode-languageclient');

    const dewPath = vscode.workspace.getConfiguration('dew').get('compilerPath') || 'dew';
    const serverOptions = { run: { command: dewPath, args: ['lsp'] }, debug: { command: dewPath, args: ['lsp'] } };
    const clientOptions = {
        documentSelector: [{ scheme: 'file', language: 'dew' }, { scheme: 'file', language: 'dewir' }],
        synchronize: { configurationSection: 'dew' }
    };

    client = new lc.LanguageClient('dew-lsp', 'Dew Language Server', serverOptions, clientOptions);
    context.subscriptions.push(client.start());
}
function deactivate() { if (client) return client.stop(); }
module.exports = { activate, deactivate };
