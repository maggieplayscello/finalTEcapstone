<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<title>Dashboard</title>
</head>

<!-- This is mostly outline code since the models do not exist yet. Var names will be wrong -->

<body>
	<h2>Welcome ${currentUser}</h2>
	
	<div id="userScoreboard">
		<h1>My Recent Scores</h1>
		<table class="scores">
			<c:forEach items="${user.score}" var="score">
				<tr>
					<td>${score.course}</td>
					<td>${score.score}</td>
					<td>${score.date}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div id="userTeeTimes">
		<h1>My Scheduled Tee Times</h1>
		<table class="calendar">
			<c:forEach items="${tee_times.tee_time_id}">
				<tr>
					<td>${tee_times.course}</td>
					<td>${tee_times.day}</td>
					<td>${tee_times.time}</td>
					<td>${tee_times.weather}</td>
			</c:forEach>
		</table>
	</div>
	
	<div id="userStandings">
		<h1>League Standings</h1>
		<table>
			<c:forEach items="${user.league}">
				<tr>
					<td>${league.name}</td>
					<td>${league.ranking}</td>
					<td>${league.score}</td>
			</c:forEach>		
		</table>
	</div>

</body>
</html>