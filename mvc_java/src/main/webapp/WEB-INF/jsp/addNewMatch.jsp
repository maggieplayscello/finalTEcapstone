<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<title>Team Selection</title>
</head>
<body>

				<div class="form-group">
					<label for="team1Name">Team: </label> 
					<select name="team1Name">
						<c:forEach items="${teamsInLeague}" var="team1">
							<option value="${team1.name}">${team1.name}</option>			
						</c:forEach>
					</select>
				</div>
				
</body>
</html>