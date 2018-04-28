
	
	function initialize() {
	    var myOptions = {
	        center: new google.maps.LatLng(35.4969467, 139.6627667),
	        zoom: 8,
	        mapTypeId: google.maps.MapTypeId.ROADMAP
	
	    };
	    var map = new google.maps.Map(document.getElementById('map'),
	            myOptions);
	    
	    setMarkers(map, locations)
	    
	    var input = document.getElementById('pac-input');
	    var searchBox = new google.maps.places.SearchBox(input);
	    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
	    
	    // Bias the SearchBox results towards current map's viewport.
	    map.addListener('bounds_changed', function() {
	      searchBox.setBounds(map.getBounds());
	    });
	    
	    var markers = [];
	    // Listen for the event fired when the user selects a prediction and retrieve
	    // more details for that place.
	    searchBox.addListener('places_changed', function() {
	      var places = searchBox.getPlaces();
	
	      if (places.length == 0) {
	        return;
	      }
	
	      // Clear out the old markers.
	      markers.forEach(function(marker) {
	        marker.setMap(null);
	      });
	      markers = [];
	
	      // For each place, get the icon, name and location.
	      var bounds = new google.maps.LatLngBounds();
	      places.forEach(function(place) {
	        if (!place.geometry) {
	          console.log("Returned place contains no geometry");
	          return;
	        }
	        var icon = {
	          url: place.icon,
	          size: new google.maps.Size(71, 71),
	          origin: new google.maps.Point(0, 0),
	          anchor: new google.maps.Point(17, 34),
	          scaledSize: new google.maps.Size(25, 25)
	        };
	
	        // Create a marker for each place.
	        markers.push(new google.maps.Marker({
	          map: map,
	          icon: icon,
	          title: place.name,
	          position: place.geometry.location
	        }));
	
	        if (place.geometry.viewport) {
	          // Only geocodes have viewport.
	          bounds.union(place.geometry.viewport);
	        } else {
	          bounds.extend(place.geometry.location);
	        }
	      });
	      map.fitBounds(bounds);
	    });
	}

	function setMarkers(map, locations) {
		var marker;
		var markers = [];
		// Create an array of alphabetical characters used to label the markers.
	    var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
		
	    var  i
	    for (i = 0; i < locations.length; i++) {
	
	        var loan = locations[i][0]
	        var lat = locations[i][1]
	        var lng = locations[i][2]
	        var add = locations[i][3]
	
	        latlngset = new google.maps.LatLng(lat, lng);
	
	        marker = new google.maps.Marker({
	            map: map, title: loan, position: latlngset,
	            label: labels[i % labels.length]
	        });
	       /*  map.setCenter(marker.getPosition()) */
			
	       if (loan.includes="AgencyId") {
	           var content =  '<div>'+'<h3>'+'Information'+'</h3>'+'<p>'+ loan +'<p>'+'<p>'+add+'<p>'+'</div>'		
		   }
	       
	       if (loan.includes="Estate"){
	        var content =  '<div>'+'<h3>'+'Information'+'</h3>'+'<p>'+ loan +'<p>'+'<p>'+add+'<p>'+'<a href="estate/detailedinfomation?id='+loan+'">'+'detailed information'+'</a>'+'</div>'
			   
		   } 
	       
	       
	        var infowindow = new google.maps.InfoWindow()
	
	        google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
	            return function() {
	                infowindow.setContent(content);
	                infowindow.open(map,marker);
	            };
	        })(marker,content,infowindow)); 
	        
	        markers.push(marker);
	    }
	    
	    var markerCluster = new MarkerClusterer(map, markers,
	            {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
	}
	