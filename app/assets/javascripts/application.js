// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .



var map;

function initializeMap(latitude, longitude, addMarker){
	var mapOptions = {
		zoom: 15,
		center: new google.maps.LatLng(latitude, longitude),
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	map = new google.maps.Map($('#map-canvas')[0], mapOptions);

	if (addMarker) {
		var myMarker = new google.maps.Marker({
			position: new google.maps.LatLng(latitude, longitude),
			map: map
		});
	}	
}

function addMarkers(coords) {
	var image = "http://maps.google.com/mapfiles/ms/icons/yellow-dot.png";

	coords.forEach(function(coord){
		var myMarker = new google.maps.Marker({
			position: new google.maps.LatLng(coord.latitude, coord.longitude),
			map: map,
			icon: image
		});
	});
}

// $(document).ready(function(){

// 	function geolocationSuccess(position) {
// 		var latitude = position.coords.latitude;
// 		var longitude = position.coords.longitude;

// 	} 
// })

$(function(){ $(document).foundation(); });