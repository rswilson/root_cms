var html_mode = false;
var content_editor;

// When the page loads
$(function() {
	addCKEditor("page_content");

	$(".save_button").click(function() {
		//savePage();
		//return true;
	});
	
	content_editor = addCodeMirror("page_content_html");
	
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
	
	
	
	$(".edit_page").submit(function () {
		savePage();
	});
	
});

// Handle the switching between the Editor and HTML modes
function switchMode() {
	if (html_mode) {
		// Set content
		CKEDITOR.instances.page_content.setData(content_editor.getValue());
		html_mode = false;
	} else {
		// Set content
		content_editor.setValue(CKEDITOR.instances.page_content.getData());
		html_mode = true;
	}
}

// When saving the page, we need to make sure we grab the HTML code from the CodeMirror editor
function savePage () {
	if (html_mode) {
		// Set content
		CKEDITOR.instances.page_content.setData(content_editor.getValue());
	}
}

$(function() {
	$("#preview_button").click(function() {
		logger("Submitting the preview form");
		var form = $(this)[0].form;
		submit_preview_form(form);
		return false;
	});
});

function submit_preview_form(form) {
	logger($("#"+form.id).attr("action"));
	savePage();
	// Change to accomodate for really annoying CKEditor
	$("#"+form.id+" #page_content").val(CKEDITOR.instances.page_content.getData());
	$("#"+form.id).attr("target", "_blank");
	var url = $("#"+form.id).attr("action")
	$("#"+form.id).attr("action",url+"/preview");
	$("#"+form.id).submit();
	$("#"+form.id).attr("action",url);
	$("#"+form.id).attr("target","");
}

function insertHTML(html) {
	//tinyMCE.execInstanceCommand("page_content","mceInsertContent",false,html);
	if (!(typeof html_mode === 'undefined') && html_mode) {
		content_editor.replaceSelection(html);
	} else {
		CKEDITOR.instances.page_content.insertHtml(html);
	}
}
