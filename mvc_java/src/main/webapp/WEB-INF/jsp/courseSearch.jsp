<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<script src="https://maps.googleapis.com/maps/api/js?key=${request}"></script>
<script>

var map;
function initialize() {
	
	var mapOptions = {
		zoom : 6.5,
		center : new google.maps.LatLng(44.5, -86)
	};
	var map = new google.maps.Map(document.getElementById('map-canvas'),
			mapOptions);
		
	<c:forEach var="course" items="${allCourses}">
		var myLatLng = {lat: ${course.latitude}, lng: ${course.longitude}};
		var name = "${course.name}"

    	var marker = new google.maps.Marker({
    		position: myLatLng,
    		map: map,
    		title: name
   	});

    </c:forEach>
};
google.maps.event.addDomListener(window, 'load', initialize);
</script>


<html>
<title>Course Search</title>
<body>
	<div id="wrapper">
	
<!-- Search Form -->
	<div id="courseSearchForm">	
		<c:url value='/courseSearchResults' var='courseSearchVar' />
		<div id="courseSearchFields">
			<h1>Search for Courses</h1>
			<br><br>
			<form method="GET" action="${courseSearchVar}">
				<div class="form-group">
					<label for="name">Course Name:</label> 
					<input type="text" name="searchName" placeHolder="Course Name" id="name" />
				</div>
				<div class="form-group">
					<label for="city">City:</label> 
					<input type="text" name="searchCity" placeholder="City" id="city" />
				</div>
				<button type="submit" class="btn btn-primary">Search</button>	
			</form>
		<br><br>

		<c:if test = "${role == 'Admin'}">
			<button type="submit" class="btn btn-secondary">
				<c:url var="addCourseHref" value="/users/${currentUser}/addCourse"/>
				<a href="${addCourseHref}">+ Add a new Course</a>
			</button>
		</c:if>
	</div>

<!-- Course Map -->

	<div id="map-canvas" style="height: 400px; width: 600px"></div>
</div>
<br><br>

<!-- Course Table -->

		<table id="courseTable">
			<tr>
				<th align="left">Name</th>
				<th align="left">Location</th>
				<th align="left">Par</th>
				<th align="left">Slope</th>
				<th align="left">Rating</th> 
			</tr>		
		<c:forEach items="${allCourses}" var="course">
			<tr>
				<td><c:out value="${course.name}" /></td>
				<td><c:out value="${course.city}" /></td>
				<td><c:out value="${course.par}" /></td>
				<td><c:out value="${course.slope}" /></td>
				<td><c:out value="${course.rating}" /></td>
			<tr>
		</c:forEach>
	</table>
	<br><br>
	
<!-- Closing Tags -->
		
</div>
</body>
</html>
<c:import url="/WEB-INF/jsp/footer.jsp" />