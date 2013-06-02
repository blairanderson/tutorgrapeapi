// @codekit-prepend "";

(function (window, document, $, undefined) { // put the vars you need and match them at the bottom
	"use strict";
	// Stuff to do as soon as the DOM is ready;

	$('.button-toggle').on('click', function(event) {
		// event.preventDefault();
		// alert('cledk');
		var $this = $(this);

		if ( $this.find('input').is(':checked') ) {
			$this.toggleClass('red');
		} else {

		}
		// Act on the event
	});

}(this, this.document, this.jQuery)); // in global scope, this === window