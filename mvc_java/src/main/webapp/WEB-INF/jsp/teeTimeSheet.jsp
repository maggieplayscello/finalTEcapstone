<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<title>Schedule a Tee Time</title>
</head>

<body>
<div id="wrapper">
	<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">	
	<h3>Pick a tee time from the available list below</h3>
	
	<c:url var = "submitTeeTime" value = "/users/${currentUser}/teeTimeSheet"/>
	<form method="POST" action="${submitTeeTime}">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
	
	<c:set var ="message" value = ""/>
	<c:forEach items ="${bookings}" var= "dates">
		<c:if test = "${dates == date}">
			<c:set var="message" value = "You already have a Tee Time This Day"/>
		</c:if>
	</c:forEach>
		<h3><b><c:out value = "${message}"/></b></h3>
		<div class="form-group">
			<label for="times">Available Times: </label> 
			<select name="times">
				<c:forEach items="${availableTimes}" var="time">
					<c:set var = "timeUnformatted" value = "${time}"/>
					<c:set var = "timeFormatted" value = "${fn:substring(timeUnformatted, 11, 16)}"/>
					<option value="${time}">${timeFormatted}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label for="golfers">How Many Golfers in your Party?</label> 
				<select name="golfers">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>			
				</select>
		</div>
		<input type="hidden" id="course" name="course" value="${course}">
		<button type="submit" class="btn btn-primary" id="btnSaveScore">Submit</button>
	</div>
	</div>
</div>
		
</body>
</html>

<c:import url="/WEB-INF/jsp/footer.jsp" />