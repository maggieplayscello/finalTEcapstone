<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<title>Add Score</title>
</head>

<script type="text/JavaScript">

function isInLeague(val){
	var element=document.getElementById('leagueBool');
    if(val==='yes')
        document.getElementById('leagueTrue').style.display='block';
     else
        document.getElementById('leagueTrue').style.display='none'; 
	}

</script>

<body>
<div id="wrapper">
	<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">	
	<h3>Add a Score</h3>

	<form method="POST" action="${newScoreSubmitVar}">
		<div id="addScoreForm" style='display:none;'>Enter score information below:</div>
			<div class="form-group" id="newElementId">
				<label for="name">Course: </label> 
					<!-- Would be great if this could be an autopopulated dropdown from courses in the database instead! -->
				<input type="text" name="course" placeHolder="Course" id="course" />
			</div>
			<div class="form-group">
				<label for="name">Score:</label> 
				<input type="text" name="score" placeHolder="Score" id="score" />
			</div>
			<label for="leagueBool" id="leagueBool"> Was this part of a match:
				<select name="leagueBool">
					<option>Select...</option>
					<option value="true" onclick="isInLeague()">Yes</option>
					<option value="false">No</option>
				</select>
			</label>

				<div id="leagueTrue">
					<div class="form-group">
						<label for="name">League:</label> 
						<input type="text" name="league" placeHolder="League Name" id="league"/>
					</div>
					<div class="form-group">
						<label for="name">Match:</label> 
						<input type="text" name="match" placeHolder="Match" id="match"/>
					</div>	
				</div>			

			<br><br>
			<button type="submit" class="btn btn-primary" id="btnSaveScore">Submit</button>
			</form>
		</div>
	</div>
</div>
		
</body>
</html>