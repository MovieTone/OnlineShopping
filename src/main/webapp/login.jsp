<%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Log in | Shopping</title>
	
	<link href="shop.css" rel="stylesheet">
	<script type="text/javascript" src="validation.js" ></script>
</head>
<body>

	<div class="wrap">
		<div class="login">
			<h3 align="center">Log in</h3>
			<div class="login_container">
				<c:choose>
					<c:when test="${requestScope.isValid == 'true'}">
						<div>${requestScope.user}, welcome!</div>
					</c:when>
					<c:otherwise>
						<c:if test="${requestScope.isValid == 'false'}">
							<div class="error">Username or password is not valid. Please try again.</div>
						</c:if>
					</c:otherwise>
				</c:choose>
				<form name="sign-form" method="post" action="login" id="login-form" role="form" onsubmit="return isValidLogIn()">
					<div class="form-group">
						<label for="login_user">Username:</label>
						<input required minlength="1" maxlength="40" type="text" name="user" id="login_user"></input>	
						<div class="clear">&nbsp;</div>
					</div>
					<div class="form-group">
						<label for="login_pass">Password:</label>
						<input required minlength="6" type="password" name="password" id="login_pass"></input>
					</div>
					<div class="clear">&nbsp;</div>
					<div class="form-group">
						<button type="submit" class="send-button">Log in</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>