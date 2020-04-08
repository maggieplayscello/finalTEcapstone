<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<title>Home</title>
</head>
<body>
	<h1>Golf Tracker</h1>
	<c:url var="imgSrc" value="/img/michgolf.jpg" /> 
	<img src="${imgSrc}" class="homeImg"/><br> <br>
	<!--  image is from http://www.arcticopen.is/en/pictures/arctic-open-2017 but if we keep this, 
	i can't find photog credit -mt -->
	<div class="description">
		<p> Welcome to Golf Tracker! This site will help you track your scores over the course of a season. 
		You can compete with the scores of your friends via private league leaderboards and set up matches with your friends!
		You can also search for courses based on a location and view the results on a map. </p>
	</div>
</body>
</html>