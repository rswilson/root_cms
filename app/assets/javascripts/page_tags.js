function galleryType(type) {
	if (type == "SINGLE") {
		$("#gallery_choice").css("display","inline");
	} else {
		$("#gallery_choice").hide();
	}
}

function albumType(type) {
	if (type == "SINGLE") {
		$("#album_choice").css("display","inline");
	} else {
		$("#album_choice").hide();
	}
}

function addMenu(menu_id) {
	var menu_tag = "#MENU"+menu_id+"#";
	logger("Would add menu tag: " + menu_tag);
	insertHTML(menu_tag);
	$('#tags').modal('hide')
}

function addGallery() {
	var galleryType = $('#gallery_type').val();
	if ( galleryType == "ALL") {
		var gallery_tag = "#ALL_GALLERIES#";
		logger("Would add gallery tag: " + gallery_tag);
		insertHTML(gallery_tag);
	} else {
		var galleryID = $('#gallery_id').val();
		var gallery_tag = "#GALLERY"+galleryID+"#";
		logger("Would add gallery tag: " + gallery_tag);
		insertHTML(gallery_tag);
		$('#tags').modal('hide')
	}
}

function addAlbum() {
	var albumType = $('#album_type').val();
	if ( albumType == "ALL") {
		var album_tag = "#ALL_ALBUMS#";
		logger("Would add album tag: " + album_tag);
		insertHTML(album_tag);
	} else {
		var albumID = $('#album_id').val();
		var album_tag = "#ALBUM"+albumID+"#";
		logger("Would add album tag: " + album_tag);
		insertHTML(album_tag);
	}
	$('#tags').modal('hide')
}

function addBlog(blog_id) {
	var blog_tag = "#BLOG"+blog_id+"#";
	logger("Would add blog tag: " + blog_tag);
	insertHTML(blog_tag);
	$('#tags').modal('hide')
}

function addForm(form_id) {
	var form_tag = "#FORM"+form_id+"#";
	logger("Would add form tag: " + form_tag);
	insertHTML(form_tag);
	$('#tags').modal('hide')
}

$(document).ready(function() {
	galleryType($('#gallery_type').val());
	albumType($('#album_type').val());

	/*$("#tags").dialog({
		autoOpen: false,
		width: 600,
		modal: true,
		closeText: '',
		position: ['center',100]
	});

	$('.modalInput[rel=#tags]').click(function() {
		logger("Opening the modal window");
		$('#tags').dialog('open');
		logger($('#tags'));
		return false;
	});*/
});