<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<meta charset="ISO-8859-1">
<head>
<title>Tee Time added Confirmation</title>
</head>
<body>
	<div id="wrapper">
		<div class="textblock">
			<br>
			<p><em>You have successfully added a Tee Time!</em></p>
			<button type="submit" class="btn btn-primary">
				<c:url var="dashboardHref" value="/users/${currentUser}/dashboard"/>
				<a href="${dashboardHref}">Back to My Dashboard</a>
			</button>
			<button type="submit" class="btn btn-primary">
				<c:url var="myLeaguesHref" value="/users/${currentUser}/myLeagues"/>
				<a href="${myLeaguesHref}">Go to My Leagues</a>
			</button>
			<br>
		</div>
	<c:url var="imgSrc" value="/img/treetops_michael_hiller.jpg" /> 
	<img src="${imgSrc}" class="homeImg"/>
</body>
</html>

<c:import url="/WEB-INF/jsp/footer.jsp" />