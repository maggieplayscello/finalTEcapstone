<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<title>Home</title>
</head>
<body>
	<div id="wrapper">
		<h1>Golf Tracker</h1>

		<c:url var="imgSrc" value="/img/michgolf.jpg" /> 
		<img src="${imgSrc}" class="homeImg"/><br> <br>

		<div class="textblock">
			<p> Welcome to Golf Tracker! This site will help you track your scores over the course of a season. 
			You can compete with the scores of your friends via private league leaderboards and set up matches with your friends!
			You can also search for courses based on a location and view the results on a map. </p>
		</div>
	
<!-- Do we want a homepage course search? It was on the wireframe we presented...
		<div class="homeSearch">
			<h1>Search All Courses</h1>
			<form method="GET" action="${courseSearchVar}">
				<div class="form-group">
					<input type="text" name="search" placeHolder="Search" id="search" />
				</div>
				<button type="submit" class="btn btn-primary">Search</button>	
			</form>
		</div>
 -->
 
	</div>
</body>

<c:import url="/WEB-INF/jsp/footer.jsp" />