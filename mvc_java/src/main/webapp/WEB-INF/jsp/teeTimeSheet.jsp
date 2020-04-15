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

	
	
	<c:forEach items="${availableTimes}" var="time">
		${time.hour}:${time.minute}
		Test
	</c:forEach>
	TEST
	
	</div>
	</div>
</div>
		
</body>
</html>