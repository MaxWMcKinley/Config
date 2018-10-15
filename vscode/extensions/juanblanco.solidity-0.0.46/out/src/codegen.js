'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const abicodegen = require("abi-code-gen");
const fs = require("fs");
const path = require("path");
const codegen = require("nethereum-codegen");
const projService = require("./projectService");
function codeGenerate(args, diagnostics) {
    try {
        let editor = vscode.window.activeTextEditor;
        abicodegen.generateCode(editor.document.fileName, 'cs-service');
    }
    catch (e) {
        let outputChannel = vscode.window.createOutputChannel('solidity code generation');
        outputChannel.clear();
        outputChannel.appendLine('Error generating code:');
        outputChannel.appendLine(e.message);
        outputChannel.show();
    }
}
exports.codeGenerate = codeGenerate;
function codeGenerateNethereumCQSCsharp(args, diagnostics) {
    let extension = '.csproj';
    let lang = 0;
    let editor = vscode.window.activeTextEditor;
    let fileName = editor.document.fileName;
    codeGenerateCQS(fileName, extension, lang, args, diagnostics);
}
exports.codeGenerateNethereumCQSCsharp = codeGenerateNethereumCQSCsharp;
function codeGenerateNethereumCQSVbNet(args, diagnostics) {
    let extension = '.vbproj';
    let lang = 1;
    let editor = vscode.window.activeTextEditor;
    let fileName = editor.document.fileName;
    codeGenerateCQS(fileName, extension, lang, args, diagnostics);
}
exports.codeGenerateNethereumCQSVbNet = codeGenerateNethereumCQSVbNet;
function codeGenerateNethereumCQSFSharp(args, diagnostics) {
    let extension = '.fsproj';
    let lang = 3;
    let editor = vscode.window.activeTextEditor;
    let fileName = editor.document.fileName;
    codeGenerateCQS(fileName, extension, lang, args, diagnostics);
}
exports.codeGenerateNethereumCQSFSharp = codeGenerateNethereumCQSFSharp;
function codeGenerateNethereumCQSVbAll(args, diagnostics) {
    let extension = '.vbproj';
    let lang = 1;
    codeGenerateAllFiles(extension, lang, args, diagnostics);
}
exports.codeGenerateNethereumCQSVbAll = codeGenerateNethereumCQSVbAll;
function codeGenerateNethereumCQSFSharpAll(args, diagnostics) {
    let extension = '.fsproj';
    let lang = 3;
    codeGenerateAllFiles(extension, lang, args, diagnostics);
}
exports.codeGenerateNethereumCQSFSharpAll = codeGenerateNethereumCQSFSharpAll;
function codeGenerateNethereumCQSCSharpAll(args, diagnostics) {
    let extension = '.csproj';
    let lang = 0;
    codeGenerateAllFiles(extension, lang, args, diagnostics);
}
exports.codeGenerateNethereumCQSCSharpAll = codeGenerateNethereumCQSCSharpAll;
function getBuildPath() {
    let packageDefaultDependenciesDirectory = vscode.workspace.getConfiguration('solidity').get('packageDefaultDependenciesDirectory');
    let packageDefaultDependenciesContractsDirectory = vscode.workspace.getConfiguration('solidity').get('packageDefaultDependenciesContractsDirectory');
    let project = projService.initialiseProject(vscode.workspace.rootPath, packageDefaultDependenciesDirectory, packageDefaultDependenciesContractsDirectory);
    return path.join(vscode.workspace.rootPath, project.projectPackage.build_dir);
}
function codeGenerateAllFiles(extension, lang, args, diagnostics) {
    let buildPath = getBuildPath();
    let outputPath = '**/*.json';
    let files = vscode.workspace.findFiles(outputPath, null, 1000);
    files.then(documents => {
        documents.forEach(document => {
            if (document.fsPath.startsWith(buildPath)) {
                codeGenerateCQS(document.fsPath, extension, lang, args, diagnostics);
            }
        });
    });
}
function codeGenerateCQS(fileName, extension, lang, args, diagnostics) {
    try {
        let root = vscode.workspace.workspaceFolders[0];
        let settingsFile = path.join(root.uri.fsPath, 'nethereum-gen.settings');
        let prettyRootName = prettifyRootNameAsNamespace(root.name);
        let baseNamespace = prettyRootName + '.Contracts';
        let projectName = baseNamespace + extension;
        if (fs.existsSync(settingsFile)) {
            let settings = JSON.parse(fs.readFileSync(settingsFile, 'utf8'));
            if (settings.projectName !== undefined) {
                projectName = settings.projectName;
                baseNamespace = settings.namespace;
            }
        }
        let outputPathInfo = path.parse(fileName);
        let contractName = outputPathInfo.name;
        let projectPath = path.join(root.uri.fsPath, baseNamespace);
        let compilationOutput = JSON.parse(fs.readFileSync(fileName, 'utf8'));
        let abi = compilationOutput.abi;
        let contractByteCode = compilationOutput.bytecode;
        codegen.generateNetStandardClassLibrary(projectName, projectPath, lang);
        codegen.generateAllClasses(abi, contractByteCode, contractName, baseNamespace, projectPath, lang);
    }
    catch (e) {
        let outputChannel = vscode.window.createOutputChannel('solidity code generation');
        outputChannel.clear();
        outputChannel.appendLine('Error generating code:');
        outputChannel.appendLine(e.message);
        outputChannel.show();
    }
}
// remove - and make upper case
function prettifyRootNameAsNamespace(value) {
    return value.split('-').map(function capitalize(part) {
        return part.charAt(0).toUpperCase() + part.slice(1);
    }).join('');
}
//# sourceMappingURL=codegen.js.map