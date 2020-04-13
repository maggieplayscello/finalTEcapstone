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

	<form method="POST" action="${createLeagueVar}">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>

			<div class="form-group">
				<label for="name">Name:</label> 
				<input name="name" placeHolder="Name"/>
			</div>

			<div class="form-group">
				<label for="name">Add Golfers to League: </label> 
				<select name="name" multiple>
					<c:forEach items="${allGolfers}" var="course">
						<option value="name">${golfer.name}</option>			
					</c:forEach>
				</select>
				<p>Hold down the Ctrl (windows) or Command (Mac) button to select multiple options.</p>
			</div>

			<br><br>
			<button type="submit" class="btn btn-primary" id="btnSaveScore">Submit</button>
			</form>
		</div>
	</div>
</div>
		
</body>
</html>