<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<title>My Leagues</title>
</head>
<body>
<div id="wrapper">
	<h1>Welcome, ${currentUser}!</h1>
	<div class="userGrid">
	
<!-- Side Navbar -->

<div class="sidenav">
	<h1 class = "header_title">View My Leagues</h1>
		
	<input type="radio" id="league" name="league" value="league">
		<label for="league">League 1</label><br>
	<input type="radio" id="league" name="league" value="league">
		<label for="league">League 2</label><br>
	<input type="radio" id="league" name="league" value="league">
		<label for="league">League 3</label><br>
	<input type="radio" id="league" name="league" value="league">
		<label for="league">League 4</label><br>
	<input type="radio" id="league" name="league" value="league">
		<label for="league">League 5</label><br>
	
		
	<c:if test = "${role == 'Admin'}">
		<div class="addButton">
			<c:url var="addCourseHref" value="/users/${currentUser}/addCourse"/>
			<a href="${addCourseHref}">+ Add a new league</a><br>
			<c:url var="addCourseHref" value="/users/${currentUser}/addCourse"/>
			<a href="${addCourseHref}">+ Create a match</a>
		</div>
	</c:if>
</div>

<!-- League Leaderboard -->
	
<div class="recentScores">
	<h1 class = "header_title">League Leaderboard</h1>

	<c:if test = "${role == 'Admin'}">
		<div class="addButton">
			<c:url var="addCourseHref" value="/users/${currentUser}/addCourse"/>
			<a href="${addCourseHref}">+ Add players to league</a>
		</div>
	</c:if>

		<hr>
		<table class="scores">
			<tr>
				<td>1</td>
				<td>League 1</td>	
				<td>18</td>
				<td>70</td>
			</tr>
			<tr>
				<td>2</td>
				<td>League 2</td>	
				<td>16</td>
				<td>71</td>
			</tr>
			<tr>
				<td>3</td>			
				<td>League 3</td>	
				<td>13</td>
				<td>73</td>
			</tr>
			<tr>
				<td>4</td>			
				<td>League 4</td>	
				<td>11</td>
				<td>75</td>
			</tr>
			<tr>
				<td>5</td>			
				<td>League 5</td>	
				<td>4</td>
				<td>112</td>
			</tr>
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
	<c:if test = "${role == 'Admin'}">
		<div class="addButton">
			<c:url var="addCourseHref" value="/users/${currentUser}/addCourse"/>
			<a href="${addCourseHref}">+ Log Scores</a>
		</div>
	</c:if>
      </div>	






<!-- Closing Tags -->
	</div>
</div>
</body>
</html>

<c:import url="/WEB-INF/jsp/footer.jsp" />