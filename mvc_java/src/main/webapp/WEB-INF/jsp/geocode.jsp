<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


//<script src="https://maps.googleapis.com/maps/api/js?key=${request}"></script>
<script src="https://maps.googleapis.com/maps/api/geocode/js?address=10+Kercheval,
		+Grosse+Pointe,+MI&key=${request}"></script>

<script type="text/javascript">
    var geocoder;
      var map;
      function initialize() {
    	geocoder = new google.maps.Geocoder();
    	var latlng = new google.maps.LatLng(48.291876,16.339551);
    	var mapOptions = {
    	  zoom: 16,
    	  center: latlng,
    	  mapTypeId: google.maps.MapTypeId.ROADMAP
    	}
    	map = new google.maps.Map(document.getElementById('map'), mapOptions);
    	codeAddress()
      }
 
      function codeAddress() {
        var image = 'URL TO YOUR CUSTOM PIN';
    	var address = '<?php the_field('street');?>, <?php the_field('postal-code');?>, <?php the_field('city');?>';
    	geocoder.geocode( { 'address': address}, function(results, status) {
    	  if (status == google.maps.GeocoderStatus.OK) {
 
     map.setCenter(results[0].geometry.location);
     var marker = new google.maps.Marker({
     map: map,
                        icon: image,
     position: results[0].geometry.location
     });
    	  } else {
     alert('Geocode was not successful for the following reason: ' + status);
    	  }
    	});
      }
      initialize()
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