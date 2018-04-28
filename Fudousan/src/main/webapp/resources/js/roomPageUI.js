/**
 * 
 */
var bottomMenuDisplay = false;

$(function() {
	$("#bottom-menu").hide();
	
	$("#bottom-menu-button").click(function() {
		$("#bottom-menu").toggle('slide');
	});
});