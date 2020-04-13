<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<title>Dashboard</title>
</head>

<body>
<div id="wrapper">
	<h1 class="userHeader">Welcome, ${currentUser}!</h1>
	<div class=dashboardGrid>

<!-- User Scoreboard -->
	
	<div class="scoreboard">
		<h3>My Recent Scores</h3>
	    <hr>
		<table class="scores">
			<tr>
				<th>Course</th>
				<th>Score</th>
				<th>Date</th>
			</tr>	
		<c:forEach items = "${scores}" var = "score">
			<tr>
				<td class="courseCell">${score.courseName}</td>
				<td>${score.score}</td>
				<td>${score.date}</td>
			</tr>
		</c:forEach>
		</table>
		<br>

		<div class="btn">
			<c:url var="addScoreHref" value="/users/${currentUser}/addScore"/>
			<a href="${addScoreHref}">+ Add a Score</a>
		</div>
	<br><br>
</div>

<!-- User Scoreboard -->
	
	<div class="standings">
		<h1 class = "header_title">My League Standings</h1>
		<hr>
		<table class="scores">
			<tr>
				<th>League</th>
				<th>Ranking</th>
				<th>Score</th>
			</tr>			
			<tr>
				<td>League 1</td>	
				<td>3</td>
				<td>70</td>
			</tr>
			<tr>
				<td>Bush League</td>	
				<td>1</td>
				<td>1,209,234</td>
			</tr>
			<tr>
				<td>League of Our Own</td>	
				<td>71</td>
				<td>-2</td>
			</tr>
		</table>
      </div>	
    
<!-- Calendar -->

	<div class="calendar">
		<h1 class = "header_title">My Scheduled Tee Times</h1>
		<hr>
		<div class="calendar_plan">
			<div class="cl_plan">
				<div class="cl_title">Today is</div>
				<div class="cl_copy">April 18 2020</div>
				<div class="cl_add">
					<i class="fas fa-plus"></i>
				</div>
			</div>
		</div>
		<div class="calendar_events">
			<p class="ce_title">Upcoming</p>
			<div class="event_item">
				<div class="ei_Dot dot_active"></div>
				<div class="ei_Title">April 18 2020</div>
				<div class="ei_Copy">10:30 am</div>
				<div class="ei_Copy">League 1 Team 1 Match 1</div>
				<div class="ei_Copy">Alpena Golf Club</div>
			</div>
			<hr>
			<div class="event_item">
				<div class="ei_Dot"></div>
				<div class="ei_Title">April 19 2020</div>
				<div class="ei_Copy">12:00 pm</div>
				<div class="ei_Copy">League 1 Team 1 Match 2</div>
				<div class="ei_Copy">Alpena Golf Club</div>
			</div>
			<hr>
			<div class="event_item">
				<div class="ei_Dot"></div>
				<div class="ei_Title">April 23 2020</div>
		        <div class="ei_Copy">8:10 am</div>
        		<div class="ei_Copy">League 2 Team 1 Match 1</div>
		        <div class="ei_Copy">Arcadia Bluffs Golf Course</div>
			</div>
			<hr>
			<br>
		<div class="btn">
			<c:url var="addScoreHref" value="/users/${currentUser}/dashboard"/>
			<a href="${addScoreHref}">+ Schedule a Tee Time</a>
    	</div>
		</div>
	</div>
	
<!-- Closing tags -->  

</div>   
</div>	
</body>
</html>

<c:import url="/WEB-INF/jsp/footer.jsp" />