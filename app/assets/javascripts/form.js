// The form controls bar on the right hand side can be "sticky" or "scrolling"
// This depends on whether there is enough page height available or not
function resize_form_controls() {
	var windowHeight = window.innerHeight;
	var panelHeight = $("#right_panel").height() + $(".navbar").height();
	logger("Window Height: " + windowHeight + " vs. Panel Height: " + panelHeight);
	if (windowHeight < panelHeight) {
		$("#right_panel").css("width", "100%");
		$("#right_panel").removeClass("affix");
	} else {
		$("#right_panel").css("width", "auto");
		$("#right_panel").addClass("affix");
	}
}
