<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<title>Schedule a Tee Time</title>
</head>

<body>
<div id="wrapper">
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
						<option value="${course.name}">${course.name}</option>			
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