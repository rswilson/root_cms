// Handles the "Add Code" functionality for the editor

// When the form loads, bind up the form submit for error checking
$(document).ready(function() {
	$('form#add_code').submit(function() {
	
		console.log("Submitting add_code form");
	
		// If we have any errors, don't submit
		if (codeHasErrors()) {
			return false;
		}
		
		// Generate the new HTML
		var html = "<pre><code lang='"+$("form#add_code #code_type").val()+"'>"+$("form#add_code #code_body").val()+"</code></pre>"
		logger(html);
		
		/// Insert the HTML in the content
		insertHTML(html);
	
		// Hide the modal window
		$('#code').modal('hide')
		return false;
	});		
});

// Peforms error checking of the code modal window
function codeHasErrors() {
	var errors = new Array();
	var arrayIndex = 0;
	
	// Do we actually have any content?
	if ($("form#add_code #code_body").val() == "") {
		errors[arrayIndex] = ("No code specified");
		arrayIndex++;
	}
	
	// Have we chosen the code type?
	if ($("form#add_code #code_type").val() == "") {
		errors[arrayIndex] = ("No code type specified");
		arrayIndex++;
	}
	
	// Build up the error string to display
	var errorString = "";
	for (var i = 0; i < arrayIndex; i++) {
		errorString += "<li>"+errors[i]+"</li>"
	}
	
	// Determine if we have any errors to return or not
	if (errorString != "") {
		$("form#add_code #errors").html("<div class='error_messages alert alert-error'><button class='close' data-dismiss='alert'>x</button><h4>Sorry, there was a problem with your code.</h4><p>Correct the following errors and try again.</p><ul>"+errorString+"</ul></div>");
		return true;
	} else {
		$("form#add_code #errors").html("");
		return false;
	}
}
