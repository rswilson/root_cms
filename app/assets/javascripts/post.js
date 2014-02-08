var html_mode = false;
var content_editor;

// When the page loads
$(function() {
	addCKEditor("post_body");

	$(".save_button").click(function() {
		save_post();
	});
	
	content_editor = addCodeMirror("post_body_html");
	
	// Bind up the wysiwyg editor button
	$("a#wysiwyg_mode").click(function() {
		if (html_mode) {
			switchMode();
		}
	});
	
	// Bind up the HTML editor button
	$("a#html_mode").click(function() {
		if (!html_mode) {
			switchMode();
		}
	});
	
	$('a[data-toggle="tab"]').on('shown', function (e) {
		console.log("Refreshing");
		content_editor.refresh();
	})
});

// Handle the switching between the Editor and HTML modes
function switchMode() {
	if (html_mode) {
		// Set body
		CKEDITOR.instances.post_body.setData(content_editor.getValue());
		html_mode = false;
	} else {
		// Set body
		content_editor.setValue(CKEDITOR.instances.post_body.getData());
		html_mode = true;
	}
}

// When saving the page, we need to make sure we grab the HTML code from the CodeMirror editor
function savePost () {
	if (html_mode) {
		// Set body
		CKEDITOR.instances.post_body.setData(content_editor.getValue());
	}
}

function insertHTML(html) {
	if (!(typeof html_mode === 'undefined') && html_mode) {
		content_editor.replaceSelection(html);
	} else {
		CKEDITOR.instances.post_body.insertHtml(html);
	}
}
