function initMap() {
  var myLatLng = {lat: 12.864037299999999, lng: 77.59926270000002};

  var map = new google.maps.Map(document.getElementById('map-canvas'), {
    center: myLatLng,
    zoom: 12
  });

  var infoWindow = new google.maps.InfoWindow({map: map});

  // Try HTML5 geolocation.
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      var marker = new google.maps.Marker({
        position: pos,
        icon: 'http://labs.google.com/ridefinder/images/mm_20_yellow.png',
        map: map,
        title: 'Current Location',
        draggable:true
      });

	    google.maps.event.addListener(marker, 'click', function (event) {
	    document.getElementById("latbox").innerHTML=event.latLng.lat();
	    document.getElementById("lngbox").innerHTML=event.latLng.lng();
	    });

	    google.maps.event.addListener(marker, 'dragend', function (event) {
	    document.getElementById("latbox").innerHTML = event.latLng.lat();
	    document.getElementById("lngbox").innerHTML = event.latLng.lng();
	    });   

			$.ajax({
					url: '/outlets',
					type: "GET",
					data: {
						latitude: pos.lat,
						longitude: pos.lng
					},

					success: function(response) {
						if(response == null){
							// 
						} else {
			      var length = response.length;
			      for (var i = 0 ; i < length; i++) 
			      {
			        var lat = parseFloat(response[i].latitude);
			        var lng = parseFloat(response[i].longitude);
			        var loc = {lat: lat, lng: lng};
			        var title = response[i].title;

			        var marker = new google.maps.Marker({
				        position: loc,
				        icon: 'http://labs.google.com/ridefinder/images/mm_20_blue.png',
				        map: map,
				        title: title
			      	});
						}
					}
				}
			});
  }), function(){
      handleLocationError(true, infoWindow, map.getCenter());
    }
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
}
