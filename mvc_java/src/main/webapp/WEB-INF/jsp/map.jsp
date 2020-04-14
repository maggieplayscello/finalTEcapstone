<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<script src="https://maps.googleapis.com/maps/api/js?key=${request}"></script>
<script>
	var map;
	function initialize() {
		var mapOptions = {
			zoom : 7,
			center : new google.maps.LatLng(42.4, -83)
		};
		map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
			
		<%--<c:forEach var="course" items="${courses}"> --%>
	    for (i=0; i< 10; i++) {
		var geocoder = new google.maps.Geocoder();
	    var address = "${course.address} ${course.city}, ${course.state} ${course.zip}";
	    geocodeAddress(geocoder, map, address);
	    }

	    <%-- </c:forEach> --%>
	}

	function geocodeAddress(geocoder, resultsMap, address){
	     geocoder.geocode({'address': address}, function(results, status) {
	          if (status === 'OK') {
	          	for(i=0; i<10; i++){
	        	 	var marker = new google.maps.Marker({
	              		map: resultsMap,
	              		position: results[0].geometry.location
	            	});
	          	} 
	          } else {
	            alert('Geocode was not successful for the following reason: ' + status);
	          }
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