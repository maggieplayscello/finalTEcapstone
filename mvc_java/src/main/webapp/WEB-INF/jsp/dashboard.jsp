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
<!-- 
					<td>${score.course}</td>
					<td>${score.score}</td>
					<td>${score.date}</td>
 -->					
				</tr>
		</table>
	</div>
	
	<div id="userTeeTimes">
		<h3>My Scheduled Tee Times</h3>
		<table class="calendar">
				<tr>
<!-- 				<td>${tee_times.course}</td>
					<td>${tee_times.day}</td>
					<td>${tee_times.time}</td>
					<td>${tee_times.weather}</td>
 -->
		</table>
	</div>
	<div class="container">
  <div class="calendar light">
    <div class="calendar_header">
      <h1 class = "header_title">Welcome Back</h1>
      <p class="header_copy"> Calendar Plan</p>
    </div>
    <div class="calendar_plan">
      <div class="cl_plan">
        <div class="cl_title">Today</div>
        <div class="cl_copy">22nd  April  2018</div>
        <div class="cl_add">
          <i class="fas fa-plus"></i>
        </div>
      </div>
    </div>
    <div class="calendar_events">
      <p class="ce_title">Upcoming Events</p>
      <div class="event_item">
        <div class="ei_Dot dot_active"></div>
        <div class="ei_Title">10:30 am</div>
        <div class="ei_Copy">Monday briefing with the team</div>
      </div>
      <div class="event_item">
        <div class="ei_Dot"></div>
        <div class="ei_Title">12:00 pm</div>
        <div class="ei_Copy">Lunch for with the besties</div>
      </div>
      <div class="event_item">
        <div class="ei_Dot"></div>
        <div class="ei_Title">13:00 pm</div>
        <div class="ei_Copy">Meet with the client for final design <br> @foofinder</div>
      </div>
      <div class="event_item">
        <div class="ei_Dot"></div>
        <div class="ei_Title">14:30 am</div>
        <div class="ei_Copy">Plan event night to inspire students</div>
      </div>
      <div class="event_item">
        <div class="ei_Dot"></div>
        <div class="ei_Title">15:30 am</div>
        <div class="ei_Copy">Add some more events to the calendar</div>
      </div>
    </div>
  </div>


</div>
  
	
	<div id="userStandings">
		<h3>League Standings</h3>
		<table>
				<tr>
<!-- 
					<td>${league.name}</td>
					<td>${league.ranking}</td>
					<td>${league.score}</td>	
 -->
		</table>
	</div>
	</div>
</body>
</html>

<c:import url="/WEB-INF/jsp/footer.jsp" />