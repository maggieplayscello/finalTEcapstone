<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<title>Course Search</title>
</head>
<body>

	<h3>Search for Courses</h3>
	<form method="GET" id="searchForm">
		<div class="formInputGroup">
			<label for="name">Course Name:</label> 
			<input type="text" name="courseName" id="courseName" />
		</div>
		<div class="formInputGroup">
			<label for="city">City:</label> 
			<input type="text" name="city" id="city" />
		</div>
		
		<!-- This is copied over just in case we expand outside Michigan
		<label for="state">State:</label>
			<select name="state">
				<option value="AL">Alabama</option>
				<option value="AK">Alaska</option>
				<option value="AZ">Arizona</option>
				<option value="AR">Arkansas</option>
				<option value="CA">California</option>
				<option value="CO">Colorado</option>
				<option value="CT">Connecticut</option>
				<option value="DE">Delaware</option>
				<option value="DC">District Of Columbia</option>
				<option value="FL">Florida</option>
				<option value="GA">Georgia</option>
				<option value="HI">Hawaii</option>
				<option value="ID">Idaho</option>
				<option value="IL">Illinois</option>
				<option value="IN">Indiana</option>
				<option value="IA">Iowa</option>
				<option value="KS">Kansas</option>
				<option value="KY">Kentucky</option>
				<option value="LA">Louisiana</option>
				<option value="ME">Maine</option>
				<option value="MD">Maryland</option>
				<option value="MA">Massachusetts</option>
				<option value="MI">Michigan</option>
				<option value="MN">Minnesota</option>
				<option value="MS">Mississippi</option>
				<option value="MO">Missouri</option>
				<option value="MT">Montana</option>
				<option value="NE">Nebraska</option>
				<option value="NV">Nevada</option>
				<option value="NH">New Hampshire</option>
				<option value="NJ">New Jersey</option>
				<option value="NM">New Mexico</option>
				<option value="NY">New York</option>
				<option value="NC">North Carolina</option>
				<option value="ND">North Dakota</option>
				<option value="OH">Ohio</option>
				<option value="OK">Oklahoma</option>
				<option value="OR">Oregon</option>
				<option value="PA">Pennsylvania</option>
				<option value="RI">Rhode Island</option>
				<option value="SC">South Carolina</option>
				<option value="SD">South Dakota</option>
				<option value="TN">Tennessee</option>
				<option value="TX">Texas</option>
				<option value="UT">Utah</option>
				<option value="VT">Vermont</option>
				<option value="VA">Virginia</option>
				<option value="WA">Washington</option>
				<option value="WV">West Virginia</option>
				<option value="WI">Wisconsin</option>
				<option value="WY">Wyoming</option>
			</select>
			 -->
		</form>
		<div class= "button">
			<input type="submit" value="Search" />
		</div>
	
		<table id="courseTable">
			<tr>
				<th align="left">Name</th>
				<th align="left">Par</th>
				<th align="left">Slope</th>
				<th align="left">Rating</th>
				<th align="left">Location</th>
			</tr>		
		<c:forEach items="${allCourses}" var="course">
			<tr>
				<td><c:out value="${course.name}" /></td>
				<td><c:out value="${course.par}" /></td>
				<td><c:out value="${course.slope}" /></td>
				<td><c:out value="${course.rating}" /></td>
				<td><c:out value="${course.city}" /></td>
			<tr>
		</c:forEach>
	</table>	
	
</body>
</html>