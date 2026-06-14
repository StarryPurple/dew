import * as path from 'path';
import { ExtensionContext, workspace, window } from 'vscode';
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  TransportKind,
} from 'vscode-languageclient/node';

let client: LanguageClient;

export function activate(context: ExtensionContext) {
  const config = workspace.getConfiguration('dew');
  const serverPath = config.get<string>('serverPath') || 'dew';

  const serverOptions: ServerOptions = {
    command: serverPath,
    args: ['lsp'],
    transport: TransportKind.stdio,
  };

  const clientOptions: LanguageClientOptions = {
    documentSelector: [{ scheme: 'file', language: 'dew' }],
    synchronize: {
      fileEvents: workspace.createFileSystemWatcher('**/*.dew'),
    },
  };

  client = new LanguageClient(
    'dew',
    'Dew Language Server',
    serverOptions,
    clientOptions
  );

  client.start().then(
    () => window.showInformationMessage('Dew Language Server started'),
    () => window.showErrorMessage('Dew Language Server failed to start')
  );
}

export function deactivate(): Thenable<void> | undefined {
  if (!client) return undefined;
  return client.stop();
}
