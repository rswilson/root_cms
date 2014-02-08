var template_editor;
var header_editor;
$(document).ready(function() {

	header_editor = addCodeMirror("page_template_header_content");
	template_editor = addCodeMirror("page_template_content");
});

function insertContentTag() {
	logger("inserting");
	template_editor.replaceSelection("#CONTENT#");
}

function insertHTML(html) {
	template_editor.replaceSelection(html);
}

function getEditorText() {
		return template_editor.getSelection();
}
