<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<title>Dashboard</title>
</head>
<body>
<div id="wrapper">
	<h1>Welcome, ${currentUser}!</h1>

<!-- User Scoreboard -->
	
<div class="flex">
	<div class="scoreboard">
		<h1 class = "header_title">My Recent Scores</h1>
	    <hr>
		<table class="scores">
			<tr>
				<td>Alpena Golf Club</td>	
				<td>70</td>
				<td>April 3 2020</td>
			</tr>
			<tr>
				<td>Escanaba Country Club</td>	
				<td>68</td>
				<td>April 5 2020</td>
			</tr>
			<tr>
				<td>Arcadia Bluffs Golf Course</td>	
				<td>71</td>
				<td>April 6 2020</td>
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
        		<div class="ei_Copy">League 2 Team 1 Match 1 at Arcadia</div>
		        <div class="ei_Copy">Arcadia Bluffs Golf Course</div>
			</div>
			<hr>
			<div class="event_item">
				<div class="ei_Dot"></div>
				<div class="ei_Title">April 25 2020</div>
				<div class="ei_Copy">1:07 pm</div>
				<div class="ei_Copy">League 1 Team 1 Match 3</div>
				<div class="ei_Copy">Alpena Golf Club</div>        
			</div>
			<hr>
			<div class="event_item">
 				<div class="ei_Dot"></div>
				<div class="ei_Title">April 26 2020</div>
				<div class="ei_Copy">12:55 pm</div>
				<div class="ei_Copy">League 2 Team 1 Match 2</div>
				<div class="ei_Copy">Arcadia Bluffs Golf Course</div>
			</div>
			<hr>
		</div>
	</div>
	
<!-- User Scoreboard -->
	
	<div class="standings">
		<h1 class = "header_title">My League Standings</h1>
		<hr>
		<table class="scores">
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
				<td>2.01</td>
			</tr>
		</table>
      </div>	
	
<!-- Closing tags -->  
   
</div>   
</div>	
</body>
</html>

<c:import url="/WEB-INF/jsp/footer.jsp" />