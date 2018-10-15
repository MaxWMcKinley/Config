"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
function activate(context) {
    context.subscriptions.push(vscode.commands.registerTextEditorCommand("simple-alignment.align", (editor, edit, args) => {
        try {
            run(editor, edit);
        }
        catch (e) {
            console.error(e);
            throw e;
        }
    }));
}
exports.activate = activate;
function run(editor, edit) {
    var selections = editor.selections;
    if (selections.length < 2)
        return;
    var uniqueLines = [];
    selections.forEach(selection => {
        var pos = selection.start;
        var index = uniqueLines.findIndex(position => position.line == pos.line);
        if (index < 0)
            uniqueLines.push(pos);
        else if (uniqueLines[index].character > pos.character)
            uniqueLines[index] = pos;
    });
    if (uniqueLines.length < 2)
        return;
    var maxPosition = Math.max(...uniqueLines.map(pos => pos.character));
    uniqueLines
        .sort((a, b) => -(a.line - b.line))
        .forEach(pos => {
        if (maxPosition > pos.character)
            edit.insert(pos, repeatString(" ", maxPosition - pos.character));
    });
}
function repeatString(s, n) {
    return n <= 0 ? "" : Array(n + 1).join(s);
}
//# sourceMappingURL=extension.js.map