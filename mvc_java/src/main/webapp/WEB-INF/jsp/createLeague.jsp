<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<title>Create a League</title>
</head>

<body>
<div id="wrapper">
	<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">	
	<h3>Create a League</h3>

	<div id="addLeagueForm" >
			<br>
			<c:url var = "addLeagueUrl" value = "/users/${currentUser}/addLeague"/>
			<form method="POST" action="${addLeagueUrl}">
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
				<div class="form-group">
					<label for="leagueName">League Name:</label> 
					<input type="text" name="name" placeHolder="League Name"/>
				</div>
				<div class="form-group">
					<label for="users">Add Members: </label> 
					<p>Press control or command to select multiple users.</p>
					<select name="users" multiple>
						<c:forEach items="${allUsers}" var="user">
							<option value="${user.userName}">${user.userName}</option>			
						</c:forEach>
					</select>
				</div>
				<button type="submit" class="btn btn-primary" id="btnSaveLeague">Submit</button>
			</form>
			</div>
		</div>
	</div>
</div>
		
</body>
</html>