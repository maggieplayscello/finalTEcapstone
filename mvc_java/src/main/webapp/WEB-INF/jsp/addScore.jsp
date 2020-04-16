<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />


<style>

#leagueTrue {
	display: none;
}

</style>


<script type="text/JavaScript">
	function isInLeague() {
		var leagueBool = document.getElementById('leagueBool');
		var selectedValue = leagueBool.options[leagueBool.selectedIndex].value;
		if (selectedValue === 'true') {
			document.getElementById('leagueTrue').style.display = 'block';
		} else {
			document.getElementById('leagueTrue').style.display = 'none';
		}
	};
	
	function increaseValue() {
		  var value = parseInt(document.getElementById('number').value, 10);
		  value = isNaN(value) ? 0 : value;
		  value++;
		  document.getElementById('number').value = value;
		}

		function decreaseValue() {
		  var value = parseInt(document.getElementById('number').value, 10);
		  value = isNaN(value) ? 0 : value;
		  value < 1 ? value = 1 : '';
		  value--;
		  document.getElementById('number').value = value;
		};
	
	function validate(){  
		console.log("validating....");
		var num = document.myform.score.value;  
		if (isNaN(score)){  
		  document.getElementById("numloc").innerHTML="Enter Numeric value only"; 
		  console.log("is not number");
		  return false;  
		}else{  
		console.log("is number");
		  return true;  
		  }  
		};
</script>


<html>
<title>Add Score</title>
</head>
<body>
<div id="wrapper">
	<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">	
	<h3>Add a Score</h3>
	<c:url var = "newScoreSubmitVar" value = "/users/${currentUser}/addScore"/>

	<form name = 'myform' method="POST" action="${newScoreSubmitVar}" onsubmit = "return validate()">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>

			<div class="form-group">
				<label for="name">Course: </label> 
				<select name="name">
					<c:forEach items="${allCourses}" var="course">
						<option value="${course.name}">${course.name}</option>			
					</c:forEach>
				</select>
			</div>

			<div class="form-group">
				<label for="score">Score:</label> 
				<input name="score" placeHolder="Score"/><span id="numloc"></span>
			</div>
			
			<div class = "form-group">
				<label for = "date">Date: </label>
				<input name = "date" placeHolder = "Date (mm/dd/yyyy)"/>
			</div>
			<hr>
			<br>
			<label for="leagueBool"> Was this part of a match:</label>
				<select id="leagueBool" onclick="isInLeague()">
					<option>Select...</option>
					<option value="true" >Yes</option>
					<option value="false">No</option>
				</select>
				
			<!-- Fields below will only appear if user selects "Yes" -->	
			
				<div id="leagueTrue" >
				<br>
					<div class="form-group">
						<label for="league">League:</label> 
						<input name="league" placeHolder="Score"/>
					</div>
					<div class="form-group">
						<label for="match">Match:</label> 
						<input name="match" placeHolder="Match"/>
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