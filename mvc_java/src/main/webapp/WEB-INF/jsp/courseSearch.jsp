<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<html>
<title>Course Search</title>

<body>
	<div id="wrapper">
	
<!-- Search Form -->
	
	<h3>Search for Courses</h3>
	<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">	
	<c:url value='/courseSearchResults' var='courseSearchVar' />
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
	<div class="col-sm-4"></div>
	<br><br>
	
<!-- Add Course Button for Admins only -->

	<c:if test = "${role == 'Admin'}">
		<div class="btn" >
			<c:url var="addCourseHref" value="/users/${currentUser}/addCourse"/>
			<a href="${addCourseHref}">+ Add a new Course</a>
		</div>
	</c:if>
	
	<div class="col-sm-4"></div>
	</div>
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