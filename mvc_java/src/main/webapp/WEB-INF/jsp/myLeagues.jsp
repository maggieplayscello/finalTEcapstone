<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<style>

#addLeagueForm {
	display: none;
}

#addMatchForm {
	display: none;
}

#addPlayersForm{
	display: none;
}

</style>


<script type="text/JavaScript">
	function addLeague() {
		var addLeagueForm = document.getElementById('addLeagueForm');
		var displaySetting = addLeagueForm.style.display;
		if (displaySetting == 'none') {
			document.getElementById('addLeagueForm').style.display = 'block';
		} else {
			document.getElementById('addLeagueForm').style.display = 'none';
		}
	}
	
	function addMatch() {
		var addMatchForm = document.getElementById('addMatchForm');
		var displaySetting = addMatchForm.style.display;
		if (displaySetting == 'none') {
			document.getElementById('addMatchForm').style.display = 'block';
		} else {
			document.getElementById('addMatchForm').style.display = 'none';
		}
	}
	
	function addPlayers() {
		var addPlayersForm = document.getElementById('addPlayersForm');
		var displaySetting = addPlayersForm.style.display;
		if (displaySetting == 'none') {
			document.getElementById('addPlayersForm').style.display = 'block';
		} else {
			document.getElementById('addPlayersForm').style.display = 'none';
		}
	}
	
	function showSelectedLeague() {
		var selectedLeague = document.getElementById('radioLeague');
		console.log(selectedLeague);
	}
	
</script>


<html>
<title>My Leagues</title>

<body>
<div id="wrapper">
	<h1>Welcome, ${currentUser}!</h1>
	<div class="myLeaguesGrid">
	
<!-- Side Navbar -->

<div class="sidenav">
	<h1 class = "header_title">View My Leagues</h1>
		<c:forEach items="${allLeagues}" var="league">
			<c:url var = "myName" value = "/users/${currentUser}/myLeagues">
				<c:param name = "leagueName" value = "${league.name}"/>
			</c:url>
			<h3>				
				<a href = "${myName}"><label for="league">${league.name}</label></a><br>
			</h3>
		</c:forEach>
		<br>
	
	<!-- Create League Form -->

		<c:if test = "${role == 'Admin'}">

		<a href = "/capstone/users/${currentUser}/addLeague"><button type="button" class="btn btn-primary" id="addLeagueBtn">Create a League</button></a>
		<br><br>
		
		<!-- Create Match Form -->
		
		<button type="button" class="btn btn-primary" id="addMatchBtn" onclick="addMatch()">+ Add a Match</button>
			<div id="addMatchForm" >
			<form method = "POST" action = "/capstone/users/${currentUser}/addMatch">
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
				<br>
				<div class="form-group">
					<label for="leagueId">League: </label> 
					<select name=leagueId>
						<c:forEach items="${allLeagues}" var="league">
							<option value="${league.leagueId}">${league.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="courseName">Course: </label> 
					<select name="courseName">
						<c:forEach items="${allCourses}" var="course">
							<option value="${course.name}">${course.name}</option>			
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="date">Date: </label>
					<input name="date" placeHolder="Date (mm/dd/yyyy)"/>
				</div>
					<div class="form-group">
						<label for="numGolfers">Number of Golfers:</label> 
						<input name="numGolfers" placeHolder="Number"/>
					</div>	
				<button type="submit" class="btn btn-primary" id="btnSaveScore">Submit</button>
				</form>
			</div>				
		</c:if>
	</div>

<!-- League Leaderboard -->
	
<div class="recentScores">
	<h1 class = "header_title">${leagueName} Leaderboard</h1>
	<div id="selectedLeague"></div>

	<!-- Add Players to League Form -->

	<c:if test = "${role == 'Admin'}">
		<button type="button" class="btn btn-primary" id="addPlayersBtn" onclick="addPlayers()">+ Add Players to this League</button>
			<div id="addPlayersForm" >
			<c:url var = "addPlayersUrl" value = "/users/${currentUser}/addPlayers">
			<c:param name = "leagueNames" value = "Bushwood"/>
			</c:url>
			<form method = "POST" action = "${addPlayersUrl}">
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
				<br>
					<input type="hidden" name="leagueName">${leagueName}
				<div class="form-group">
					<label for="users">Add Members: </label> 
					<p>Press control or command to select multiple users.</p>
					<select name="users" multiple>
						<c:forEach items="${allUsers}" var="user">
							<option value="${user.userName}">${user.userName}</option>			
						</c:forEach>
					</select>
				</div>
				<button type="submit" class="btn btn-primary" id="btnSaveLeague">Submit</button>
			</form>
			</div>
		<br><br>	
	</c:if>
		
	<!-- League Leaderboard -->

		<hr>
		<table class="scores">
			<tr>
				<th align="left">Ranking</th>
				<th align="left">Name</th>
				<th align="left">Point Total</th>
				<th align="left">Average Score</th>
			</tr>
			<c:if test = "${not empty teams}">
				<c:forEach items = "${teams}" var = "team">
					<tr>
						<td>Ranking</td>
						<td>${team.name}</td>
						<td>${team.points}</td>
						<td>Average Score</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
      </div>	

<!-- Matches -->    
	
	<div class="matches">
		<h1 class = "header_title">Most Recent Match</h1>
		<label for="previousMatch">View Another Match:</label>
			<select name="state">
				<option value="AL">Match April 7 2020</option>
				<option value="AL">Match April 6 2020</option>
				<option value="AL">Match April 2 2020</option>
				<option value="AL">Match April 1 2020</option>
			</select>
		<hr>
		
		<table class="scores">
			<tr>
				<td>Team 1</td>	
				<td>1</td>
				<td>71</td>
			</tr>
			<tr>
				<td></td>	
				<td>Player 1</td>
				<td>70</td>
			</tr>
			<tr>
				<td></td>	
				<td>Player 2</td>
				<td>72</td>
			</tr>
			<tr>
				<td>Team 2</td>	
				<td>3</td>
				<td>72</td>
			</tr>
			<tr>
				<td></td>	
				<td>Player 1</td>
				<td>71</td>
			</tr>
			<tr>
				<td></td>	
				<td>Player 2</td>
				<td>73</td>
			</tr>
					<tr>
				<td>Team 3</td>	
				<td>3</td>
				<td>74</td>
			</tr>
			<tr>
				<td></td>	
				<td>Player 1</td>
				<td>73</td>
			</tr>
			<tr>
				<td></td>	
				<td>Player 2</td>
				<td>75</td>
			</tr>
		</table>
		
	<!-- Link to Add Score form -->
		
	<c:if test = "${role == 'Admin'}">
		<br>
		<div class="btn">
			<c:url var="addScoreHref" value="/users/${currentUser}/addScore"/>
			<a href="${addScoreHref}">+ Add a Score</a>
		</div>
	</c:if>
</div>	

<!-- Closing Tags -->

</div>
</div>
</body>
</html>

<c:import url="/WEB-INF/jsp/footer.jsp" />