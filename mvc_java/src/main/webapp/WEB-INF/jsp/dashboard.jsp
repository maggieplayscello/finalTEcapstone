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

<!-- Calendar -->

  <div class="calendar">
    <div class="calendar_header">
      <h1 class = "header_title">My Scheduled Tee Times</h1>
    </div>
    <div class="calendar_plan">
      <div class="cl_plan">
        <div class="cl_title">Today is</div>
        <div class="cl_copy">April 18 2020</div>

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
      <div class="event_item">
        <div class="ei_Dot"></div>
        <div class="ei_Title">April 19 2020</div>
        <div class="ei_Copy">12:00 pm</div>
        <div class="ei_Copy">League 1 Team 1 Match 2</div>
        <div class="ei_Copy">Alpena Golf Club</div>
      </div>
      <div class="event_item">
        <div class="ei_Dot"></div>
        <div class="ei_Title">April 23 2020</div>
        <div class="ei_Copy">8:10 am</div>
        <div class="ei_Copy">League 2 Team 1 Match 1 at Arcadia</div>
        <div class="ei_Copy">Alpena Bluffs Golf Course</div>
      </div>
      <div class="event_item">
        <div class="ei_Dot"></div>
        <div class="ei_Title">April 19 2020</div>
        <div class="ei_Copy">1:07 pm</div>
        <div class="ei_Copy">League 1 Team 1 Match 3</div>
        <div class="ei_Copy">Alpena Golf Club</div>        
      </div>
      <div class="event_item">
        <div class="ei_Dot"></div>
        <div class="ei_Title">April 19 2020</div>
        <div class="ei_Copy">12:55 pm</div>
        <div class="ei_Copy">League 2 Team 1 Match 2</div>
        <div class="ei_Copy">Alpena Bluffs Golf Course</div>
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