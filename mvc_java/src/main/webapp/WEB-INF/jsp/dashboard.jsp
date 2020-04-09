<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<title>Dashboard</title>
</head>

<!-- This is mostly outline code since the models do not exist yet. Var names will be wrong -->

<body>
	<div id="wrapper">
	<h2>Welcome ${currentUser}</h2>
	
	<div id="userScoreboard">
		<h3>My Recent Scores</h3>
		<table class="scores">
				<tr>
					<td>${score.course}</td>
					<td>${score.score}</td>
					<td>${score.date}</td>
				</tr>
		</table>
	</div>
	
	<div id="userTeeTimes">
		<h3>My Scheduled Tee Times</h3>
		<table class="calendar">
				<tr>
					<td>${tee_times.course}</td>
					<td>${tee_times.day}</td>
					<td>${tee_times.time}</td>
					<td>${tee_times.weather}</td>
		</table>
	</div>
	
	<div id="userStandings">
		<h3>League Standings</h3>
		<table>
				<tr>
					<td>${league.name}</td>
					<td>${league.ranking}</td>
					<td>${league.score}</td>	
		</table>
	</div>
	</div>
</body>
</html>

<c:import url="/WEB-INF/jsp/footer.jsp" />