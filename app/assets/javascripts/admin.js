// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/js/jquery-ui-1.10.3.custom
//= require captify
//= require hider
//= require bootstrap
//= require admin_helpers
//= require captify
//= require codemirror/lib/codemirror
//= require codemirror/mode/htmlmixed/htmlmixed
//= require codemirror/mode/xml/xml
//= require jquery.nestable
//= require ckeditor/ckeditor
//= require links
//= require code

// Retrieve the current text from the active editor
// This can either be CKEditor or the CodeMirror editor (which is just a regular textarea)
function getEditorText() {
	var selectedText = "";
	if (html_mode) {
		selectedText = content_editor.getSelection();
	} else {
		var mySelection = CKEDITOR.instances.page_content.getSelection();
		if (CKEDITOR.env.ie) {
			mySelection.unlock(true);
			selectedText = mySelection.getNative().createRange().text;
			} else {
			selectedText = mySelection.getNative();
		}
	}
	return selectedText;
}
