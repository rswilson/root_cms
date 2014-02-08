// The hider functionality enables two modes:
// Hider: Elements begin hidden and are automatically displayed when the linked element is clicked
// Slider: Elements begin hidden and automatically slide open when the linked element is clicked

// Perform regexp matching to find elements based on their CSS class
jQuery.expr[':'].regex = function(elem, index, match) {
	var matchParams = match[3].split(','),
	                  validLabels = /^(data|css):/,
	                  attr = {
	                           method: matchParams[0].match(validLabels) ?
	                           matchParams[0].split(':')[0] : 'attr',
	                           property: matchParams.shift().replace(validLabels,'')
	                         },
	                  regexFlags = 'ig',
	                  regex = new RegExp(matchParams.join('').replace(/^\s+|\s+$/g,''), regexFlags);
	return regex.test(jQuery(elem)[attr.method](attr.property));
}

//Find all elements on the page with the "hider" class
function set_hider_elements() {
	logger("Attempting to hide elements");
	$( ':regex(class,hider#)' ).each(
		function( intIndex ){
			logger("found classes");
			var classes = $(this).attr('class').split(' ');
			for (var i=0; i<classes.length; i++) {
				logger(classes[i].match("^hider#.*$"));
				if ( classes[i].match("^hider#.*$") ) {
					var class_to_hide = classes[i].split('#');
					class_to_hide = class_to_hide[class_to_hide.length-1];
					
					// Make sure we hide the element
					logger(class_to_hide);
					$("."+class_to_hide).hide();
					
					// Link up the relevant element to control the hidden behaviour
					$( this ).bind ("click",function(){
						$("."+class_to_hide).toggle();
					});
					break;
				}
			}
		}
	);
}

//Find all elements on the page with the "slider" class
function set_slider_elements() {
	$( ':regex(class,^slider#)' ).each(
		function( intIndex ){
			var classes = $(this).attr('class').split(' ');
			for (var i=0; i<classes.length; i++) {
				logger(classes[i].match("^slider#.*$"));
				if ( classes[i].match("^slider#.*$") ) {
					logger("got a match");
					var class_to_hide = classes[i].split('#');
					class_to_hide = class_to_hide[class_to_hide.length-1];
					logger(class_to_hide);
					// Attach the effect control
					attachEffect($(this), class_to_hide, "slider");
					
					// Hide the element
					$("."+class_to_hide).hide();
					break;
				}
			}
		}
	);
}

// Find all elements with hider class
// Loop through the hiders and work out what they hide
// Add onclick function to hiders
function set_hidden_elements() {
	find_elements("hider");
	find_elements("slider");
}

// Do we still use this? #DEPRECATED
function find_elements(type) {
	logger("Checking for elements of type: " + type);
	$( ':regex(class,'+type+'#)' ).each(
		function( intIndex ){
			var classes = $(this).attr('class').split(' ');
			for (var i=0; i<classes.length; i++) {
				logger("woo " + classes[i]);
				logger(classes[i].match("^"+type+"#.*$"));
				if ( classes[i].match("^"+type+"#.*$") ) {
					logger("got a match");
					var class_to_hide = classes[i].split('#');
					class_to_hide = class_to_hide[class_to_hide.length-1];
					logger(class_to_hide);
					attachEffect($(this), class_to_hide, type);
					$("."+class_to_hide).hide();



					break;
				}
			}
		}
	);
}

// Attach the relevant effect
function attachEffect(element, className, effect) {
	switch (effect) {
		case "hider" :
			logger("Found hideable element. Attaching function to " + element);
			element.bind ("click",function(){
				$("."+className).toggle();
			});
			element.addClass("hider");
			break;
		case "slider" :
			logger("Found slideable element. Attaching function to " + element);
			element.bind ("click", function(){
				$("."+className).slideToggle();
			});
			element.addClass("slider");
			break;
		default :
			break;
	}
}
