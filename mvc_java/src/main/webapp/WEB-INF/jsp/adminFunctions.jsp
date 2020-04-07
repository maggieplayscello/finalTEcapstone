<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Functions</title>
</head>

<c:import url="/WEB-INF/jsp/header.jsp" />

<body>
These are all functions only available to admins.

<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">
		<c:url var="changeRole" value="/users/${currentUser}/adminFunctions/${role}"/>
		<form method="POST" action="${changeRole}">
		<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
			<div class="form-group">
				<label for="userName">User Name: </label>
				<input type="text" id="userName" name="userName" placeHolder="User Name" class="form-control" />
			</div>
			<div class="form-group">
				<label for="role">Role: </label>
				<select name = 'myRole' id = 'role'>
					<option value = 'Admin'>Admin</option>
					<option value = 'League Admin'>League Admin</option>
					<option value = 'Golfer'>Golfer</option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">Change Role</button>
		</form>
	</div>
	<div class="col-sm-4"></div>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp" />
</body>
</html>