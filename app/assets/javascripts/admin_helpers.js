// What does this do? #DEPRECATED
function set_dropdown_path(path, dropdown)
{
	var i=0;
	for (i=0; i < $(dropdown).options.length; i++)
	{
		if ( $(dropdown).options[i].value == path )
		{
			$(dropdown).selectedIndex = i;
			break;
		}
	}
}

// Print a log line in firebug, or safari/chrome debugger
function logger(message) {
	if (window.console != null && typeof window.console != "undefined") {
		console.log(message);
	}
}

// When we load a page, make sure we hide any elements that should be hidden
function initPage() {
	set_hidden_elements();
}

// Add the CKEditor a textarea
function addCKEditor(id) {
	CKEDITOR.replace( id, {
		height: '600px',
		filebrowserBrowseUrl : '',
		filebrowserUploadUrl : '',
		filebrowserImageBrowseUrl : '/admin/pictures/uploader',
		filebrowserImageUploadUrl : '/admin/pictures/uploader',
		filebrowserWindowWidth : '1024',
		filebrowserWindowHeight : '640',
		extraPlugins : 'internlink',
		toolbar : null,
		toolbarGroups : null
	});	
	
	// Customise the CKEditor instance
	CKEDITOR.on( 'dialogDefinition', function( ev )
	{
		var dialogName = ev.data.name;
		var dialogDefinition = ev.data.definition;
		
		dialog = dialogDefinition;

		//If this is the Link or Image window, remove the "upload" tab
		if ( dialogName == 'link' || dialogName == 'image' ) {
			dialogDefinition.removeContents('Upload');
			dialogDefinition.removeContents('upload');
		}

		// If this is the image window, then remove the "Link" tab
		if ( dialogName == 'image') {
			dialogDefinition.removeContents('Link');
		}

	});
}

// Add CodeMirror to a textarea
function addCodeMirror(id) {
	return CodeMirror.fromTextArea(document.getElementById(id), {
		mode: "application/xml",
		tabMode: "indent",
		styleActiveLine: true,
		lineNumbers: true,
		lineWrapping: true,
		lineNumbers: true,
	});
}

