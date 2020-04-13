<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<script src="https://maps.googleapis.com/maps/api/js?key=${request}"></script>
<script>
	var map;
	function initialize() {
		var myLatLng1 = {lat: 42.3862875, lng: -82.9115567};
		var myLatLng2 = {lat: 42.3764, lng: -82.9376};
		var mapOptions = {
			zoom : 12,
			center : new google.maps.LatLng(42.4, -83)
		};
		map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
			
		var marker1 = new google.maps.Marker({
		    position: myLatLng1,
		    map: map,
		    title: 'GP Main Library'
		  });
		  var marker2 = new google.maps.Marker({
		    position: myLatLng2,
		    map: map,
		    title: 'GPP City Hall'
		  });  
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);
	
	
</script>
</head>
</head>
<body>
	<div id="wrapper">
		<h1>Map of Detroit</h1>
		<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
		<div id="map-canvas" style="height: 500px;; width: auto"></div>

	</div>
</body>
</html>

<c:import url="/WEB-INF/jsp/footer.jsp" />