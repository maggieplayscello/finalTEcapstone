<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<title>Dashboard</title>
</head>

<c:url value='/dashboard' var='newScoreSubmitVar' />

<body>
<div id="wrapper">
	<h1 class="userHeader">Welcome, ${currentUser}!</h1>
	<div class=dashboardGrid>

<!-- User Scoreboard -->
	
	<div class="scoreboard">
		<h3>My Recent Scores</h3>
	    <hr>
		<table class="scores">
		<c:forEach items = "${scores}" var = "score">
			<tr>
				<td>${score.courseName}</td>
				<td>${score.score}</td>
			</tr>
		</c:forEach>
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
			<tr>
				<td>Arcadia Bluffs Golf Course</td>	
				<td>74</td>
				<td>April 8 2020</td>
			</tr>
			<tr>
				<td>Arcadia Bluffs Golf Course</td>	
				<td>80</td>
				<td>April 9 2020</td>
			</tr>
		</table>
		<br>

		<div class="btn">
			<c:url var="addScoreHref" value="/users/${currentUser}/dashboard"/>
			<a href="${addScoreHref}">+ Add a Score</a>
    	</div>
		<br><br>
	<form method="POST" action="${newScoreSubmitVar}">
		<div id="newElementId">Enter score information below:</div>
			<div class="form-group" id="newElementId">
				<label for="name">Course: </label> 
					<!-- Could this be an autopopulated dropdown from courses in the database? -->
				<input type="text" name="course" placeHolder="Course" id="course" />
			</div>
			<div class="form-group" id="newElementId">
				<label for="name">Score:</label> 
				<input type="text" name="score" placeHolder="Score" id="score" />
			</div>
			<label for="leagueconfirm" id="newElementId"> Was this part of a match:
				<select name="leagueconfirm">
					<option>Select...</option>
					<option value="true">Yes</option>
					<option value="false">No</option>
				</select>
			</label>
			<c:if test="${leagueconfirm}">
			<div class="form-group" id="newElementId">
				<label for="name">League:</label> 
				<input type="text" name="league" placeHolder="League Name" id="league" />
			</div>
			<div class="form-group" id="newElementId">
				<label for="name">Match:</label> 
				<input type="text" name="match" placeHolder="Match" id="match" />
			</div>				
			</c:if>
			<br><br>
			<button type="submit" class="btn btn-primary" id="btnSaveScore">Submit</button>
			</form>
		</div>
<script type="text/JavaScript">

document.addEventListener('DOMContentLoaded', () => {
  
  const btnToggleForm = document.getElementById('btnToggleForm');
  btnToggleForm.addEventListener('click', () => {
    showHideForm();
  });

  const btnSaveReview = document.getElementById('btnSaveScore');
  btnSaveReview.addEventListener('click', (event) => {
    event.preventDefault();
    saveReview();
  });
});
	
function showHideForm() {
	  const form = document.querySelector('form');
	  const btn = document.getElementById('btnToggleForm');

	  if (form.classList.contains('d-none')) {
	    form.classList.remove('d-none');
	    btn.innerText = 'Hide Form';
	    document.getElementById('name').focus();
	  } else {
	    resetFormValues();
	    form.classList.add('d-none');
	    btn.innerText = 'Add Score';
	  }
	}

	function resetFormValues() {
	  const form = document.querySelector('form');
	  const inputs = form.querySelectorAll('input');
	  inputs.forEach((input) => {
	    input.value = '';
	  });
	}

	function saveScore() {
	  const course = document.getElementById('course');
	  const score = document.getElementById('score');
	  const league = document.getElementById('league');
	  const match = document.getElementById('match');

	  const newScore = {
		course: course.value,
	    score: score.value,
	    league: league.value,
	    match: match.value
	  };
	  reviews.push(newScore);
	  displayReview(newScore);
	  showHideForm();
	}

</script>


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