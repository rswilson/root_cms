// Handles the resorting functionality of the folders using the "netstable" plugin

// When the document loads
$(document).ready(function() {

	// Thoos function gets called whenever the folders get resorted
	// It calls the backed "sort" proc
	var updateOutput = function(e)
	{
			var list	 = e.length ? e : $(e.target),
					output = list.data('output');
			if (window.JSON) {
					output.val(window.JSON.stringify(list.nestable('serialize')));//, null, 2));
					
					var url = "/admin/folders/sort"
					var json_input = window.JSON.stringify(list.nestable('serialize'));
					$.post(url, "_method=post&authenticity_token="+ encodeURIComponent('#{form_authenticity_token}')+"&sorted_folders="+ json_input);
			} else {
					output.val('JSON browser support required for this demo.');
			}
	};

	// Activate the nestable plugin
	$('#nestable').nestable({
			group: 1
	}).on('change', updateOutput);
	
	// output initial serialised data
	updateOutput($('#nestable').data('output', $('#nestable-output')));

	// Enables the "expand all" and "collapse all" buttons
	$('#nestable-menu').on('click', function(e)
	{
			var target = $(e.target),
					action = target.data('action');
			if (action === 'expand-all') {
					$('.dd').nestable('expandAll');
			}
			if (action === 'collapse-all') {
					$('.dd').nestable('collapseAll');
			}
	});
});
