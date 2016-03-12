

window.onload = function()
{
	// Check to see if the browser supports the GeoLocation API.
	if (navigator.geolocation) {
		// Get the location
		navigator.geolocation.getCurrentPosition(function(position) {
			var lat = position.coords.latitude;
			var lon = position.coords.longitude;

			// Show the map
			showMap(lat, lon);
			console.log("Latitude: "+lat)
			console.log("Longitude: "+lon)
			var response = get_outlets(lat,lon);
			console.log(response);
		});
	} else {
		// Print out a message to the user.
		document.write('Your browser does not support GeoLocation :(');
	}
}

function get_outlets(latitude,longitude){
	$.ajax({
			url: '/outlets',
			type: "GET",
			data: {
				latitude: latitude,
				longitude: longitude
			},

			success: function(response) {
				console.log(response);
			}
		});
		
		return true;
}

// Show the user's position on a Google map.
function showMap(lat, lon)
{
	// Create a LatLng object with the GPS coordinates.
	var myLatLng = new google.maps.LatLng(lat, lon);

	// Create the Map Options
  var mapOptions = {
    zoom: 8,
    center: myLatLng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  // Generate the Map
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  // Add a Marker to the Map
  var marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      title: 'Found you!'
  });
}
