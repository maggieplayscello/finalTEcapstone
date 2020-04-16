<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<title>Schedule a Tee Time</title>
</head>

<script>
!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src='https://weatherwidget.io/js/widget.min.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','weatherwidget-io-js');
</script>

<body>
<div id="wrapper">
<a class="weatherwidget-io" href="https://forecast7.com/en/42d33n83d05/detroit/?unit=us" data-label_1="DETROIT" data-label_2="WEATHER" data-icons="Climacons Animated" data-days="5" data-theme="weather_one" >DETROIT WEATHER</a>

	<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">	
	<h3>Schedule a Tee Time</h3>

	<c:url var = "submitTeeTimeForm" value = "/users/${currentUser}/scheduleTeeTime"/>
	<form method="POST" action="${submitTeeTimeForm}">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>

			<div class="form-group">
				<label for="course">Course: </label> 
				<select name="course">
					<c:forEach items="${allCourses}" var="course">
						<option value="${course.courseId}">${course.name}</option>
					</c:forEach>
				</select>
			</div>

			<div class="form-group">
				<label for="date">Date: </label> 
				<select name="date">
					<c:forEach items="${dates}" var="date">
						<option value="${date}">${date}</option>			
					</c:forEach>
				</select>
			</div>
			<button type="submit" class="btn btn-primary" id="btnSaveScore">Submit</button>
			</form>
		</div>
	</div>
</div>
		
</body>
</html>