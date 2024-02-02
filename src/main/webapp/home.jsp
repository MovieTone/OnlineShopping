<%@ page language="java" 
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page isELIgnored="false" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home | Shopping</title>
	
	<link href="shop.css" rel="stylesheet">
</head>
<body>
	<div class="wrap">
	
		<%@ include file="header_menu.jsp" %>
		
		<sql:query dataSource="${snapshot}" var="result">
			SELECT * from inventory_group;
		</sql:query>
		
		<div class="messages_block">
		<form method="post" action="reset.jsp" onsubmit="return confirmBuying()">
					<div class="form-group">
						<button type="submit" class="buy-button">Reset DBase</button>
					</div>
				</form>
			<div class="left_part">
				<h2 align="center">Home</h2>
				
				<c:forEach items="${result.rows}" var="current">
					<div class="message_line_container">
						<div class="one_message_container">
							<div class="one_message">
								<div class="one_message_top">
									<div class="one_message_title">
										<h3><a href="list?group=${current.group_code}">${current.group_name}</a></h3>
									</div>
									<div class="clear"></div>
								</div>
							</div>	
						</div>
					</div>
				</c:forEach>
				<div class="clear_bottom_message"></div>
				<c:if test="${empty result.rows}">
					<div align="center">
						Unfortunately, nothing was found
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>