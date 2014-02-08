$(document).ready(function() {
	$('form#add_link').submit(function() {

		if (linkHasErrors()) {
			return false;
		}
		
		if ($("form#add_link #link_type").val() == "url") {
			var link_url = $("form#add_link #link_url").val();
			var html = '<a href="'+link_url+'">'+$("form#add_link #link_text").val()+'</a>';
		} else if ($("form#add_link #link_type").val() == "page") {
			var link_page_id = $("form#add_link #link_page").val();
			var link_url = $('form#add_link #link_page :selected').attr("data-url");
			var html = '<a href="'+link_url+'" data-page_id="'+link_page_id+'">'+$("form#add_link #link_text").val()+'</a>';
		} else {
			var link_url = "";
			var html = "";
		}
		
		insertHTML(html);
		$('#links').modal('hide')
		return false;
	});
	
	setLinkType();
	
	$('#link_type').change(function() {
		setLinkType();
	});
});

function setLinkType() {
	$(".types").hide();
	$("#"+$("#link_type").val()+"_row").show();
}

function linkHasErrors() {
	var errors = new Array();
	var arrayIndex = 0;
	
	if ($("form#add_link #link_text").val() == "") {
		errors[arrayIndex] = ("No link text specified");
		arrayIndex++;
	}
	
	if ($("form#add_link #link_type").val() == "url" && $("form#add_link #link_url").val() == "") {
		errors[arrayIndex] = ("No link url specified");
		arrayIndex++;
	}
	
	var errorString = "";
	for (var i = 0; i < arrayIndex; i++) {
		errorString += "<li>"+errors[i]+"</li>"
	}
	if (errorString != "") {
		$("form#add_link #errors").html("<div class='error_messages alert alert-error'><button class='close' data-dismiss='alert'>x</button><h4>Sorry, there was a problem with your link.</h4><p>Correct the following errors and try again.</p><ul>"+errorString+"</ul></div>");
		return true;
	} else {
		$("form#add_link #errors").html("");
		return false;
	}
}

function setLink(link) {
	if (link != "") {
		$("form#add_link #link_text").val(link);
	}
}
	
