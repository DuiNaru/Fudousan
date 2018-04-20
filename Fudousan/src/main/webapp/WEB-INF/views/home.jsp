<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    
    <title>boot</title>

    <!-- 부트스트랩 -->
    <link href="<c:url value="resources/css/bootstrap.min.css"/>" rel="stylesheet">
	<style>
	      /* Always set the map height explicitly to define the size of the div
	       * element that contains the map. */
	      #map {
	        height: 100%;
	      }
	      /* Optional: Makes the sample page fill the window. */
	      html, body {
	        height: 95%;
	        margin: 0;
	        padding: 0;
	      }
	      #description {
	        font-family: Roboto;
	        font-size: 15px;
	        font-weight: 300;
	      }
	
	      #infowindow-content .title {
	        font-weight: bold;
	      }
	
	      #infowindow-content {
	        display: none;
	      }
	
	      #map #infowindow-content {
	        display: inline;
	      }
	
	      .pac-card {
	        margin: 10px 10px 0 0;
	        border-radius: 2px 0 0 2px;
	        box-sizing: border-box;
	        -moz-box-sizing: border-box;
	        outline: none;
	        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	        background-color: #fff;
	        font-family: Roboto;
	      }
	
	      #pac-container {
	        padding-bottom: 12px;
	        margin-right: 12px;
	      }
	
	      .pac-controls {
	        display: inline-block;
	        padding: 5px 11px;
	      }
	
	      .pac-controls label {
	        font-family: Roboto;
	        font-size: 13px;
	        font-weight: 300;
	      }
	
	      #pac-input {
	        background-color: #fff;
	        font-family: Roboto;
	        font-size: 15px;
	        font-weight: 300;
	        margin-left: 12px;
	        padding: 0 11px 0 13px;
	        text-overflow: ellipsis;
	        width: 400px;
	      }
	
	      #pac-input:focus {
	        border-color: #4d90fe;
	      }
	
	      #title {
	        color: #fff;
	        background-color: #4d90fe;
	        font-size: 25px;
	        font-weight: 500;
	        padding: 6px 12px;
	      }
	      #target {
	        width: 345px;
	      }
	</style>
</head>

<body onload="initialize()">
	<!-- 로그인 모달 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title"><span data-lang="login"></span></h4>
				</div>
				
				<div class="modal-body">
					<span data-lang="email"></span> <input type="text" id="memberEmail" name="memberID">
					<span data-lang="password"></span> <input type="password" id="password" name="password">
					<button type="button" id="loginBtn"><span data-lang="login"></span></button>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal"><span data-lang="cancel"></span></button>
				</div>
			</div>
		</div>
	</div>
	<!-- 로그인 모달 끝 -->
	
	<!-- Header -->
	<nav class="navbar navbar-default" style="margin: auto 0"> 
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				
				<a class="navbar-brand" href="#" style="margin-bottom: 10px;">
					<img alt="Fudousan" src="resources/image/logo2.png">
				</a>
			</div>
			
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right" style="margin-top: 8px;">
				<c:if test="${sessionScope.loginEmail == null}">
					<li id="loginNameTag"></li>
					<li id="loginAtag"><a data-toggle="modal" href="#loginModal"><span data-lang="login"></span></a></li>
				</c:if>
				<c:if test="${sessionScope.permissionId == 1 || sessionScope.permissionId == 2 }">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>
					<li><a href="/fudousan/logout"><span data-lang="logout"></span></a></li>
					<li><a href="memberupdate/memberupdate">update member</a>
				</c:if>
				<c:if test="${sessionScope.permissionId == 3 }">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>
					<li><a href="/fudousan/logout"><span data-lang="logout"></span></a></li>
					<li><a href="memberupdate/agencyupdate">update member</a>
				</c:if>
				<c:if test="${sessionScope.permissionId == 99 }">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>
					<li><a href="/fudousan/logout"><span data-lang="logout"></span></a></li>
				</c:if>
				
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span data-lang="join"></span><span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="join/join"><span data-lang="customerjoin"></span></a></li>
							<li class="divider"></li>
							
							<li><a href="join/agencyjoin"><span data-lang="agencyjoin"></span></a></li>
						</ul>
					</li>
					
					<li><a href="bm">[okh test]</a></li>
					
					<li><a href="javascript:selectLanguage('ko')">한국어</a></li>
					<li><a href="javascript:selectLanguage('jp')">日本語</a></li>
					<li><a href="javascript:selectLanguage('en')">English</a></li>
					
					<c:if test="${sessionScope.loginId != null && sessionScope.isNormal == normal}">
						<li><a href="mypageNormalUser" style="color: blue;">ahm test</a></li>
					</c:if>
					
				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>

	<!-- Map -->
	<div class="form-group">
		<input id="pac-input" class="controls form-control" type="text" placeholder="Search Box" style="z-index: 1; margin: 100px 0 0 0">
	</div>
	<div id="map" style="width:100%; height:100%"></div>
	
	<!-- agency Location List -->
	<script src="resources/js/jquery-3.3.1.js"></script>
	<script src="resources/js/login.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
	<script type="text/javascript">
	
	var locations = [
		/* 중개소 위치  */
		<c:forEach items="${locationList}" var="location" varStatus="status">
			${location},
		</c:forEach>
		/* 매물 위치  */
		<c:forEach items="${elocationList}" var="elocation" varStatus="status">
			${elocation}<c:if test="${status.last eq false}">,</c:if>
		</c:forEach>
	];
	
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
			
	       if (loan.includes="Agency") {
	           var content =  '<div>'+'<h3>'+'Infomation'+'</h3>'+'<p>'+ loan +'<p>'+'<p>'+add+'<p>'+'<a href="agency/detailedinfomation?id='+loan+'">'+'detailed infomation'+'</a>'+'</div>'		
		   }
	       
	       if (loan.includes="Estate"){
	        var content =  '<div>'+'<h3>'+'Infomation'+'</h3>'+'<p>'+ loan +'<p>'+'<p>'+add+'<p>'+'<a href="estate/detailedinfomation?id='+loan+'">'+'detailed infomation'+'</a>'+'</div>'
			   
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
	</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB1tbIAqN0XqcgTR1-FxYoVTVq6Is6lD98&libraries=places&callback=initialize" async defer></script>
	<!-- 다국어 처리 -->
	<script src="resources/js/cookie.js"></script>
	<script src="resources/js/translation.js"></script>
</body>
</html>
