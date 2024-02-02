<%@ page language="java" import="java.util.Date, java.util.Calendar, java.text.SimpleDateFormat"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page isELIgnored="false" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Buying | Shopping</title>
	<link href="shop.css" rel="stylesheet">
</head>
<body>
	<%
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String orderDate = format1.format(cal.getTime());
		cal.add(Calendar.DAY_OF_WEEK, 3);
		String shippingDate = format1.format(cal.getTime());
	%>
	
	<%@ include file="header_menu.jsp" %>
	
     <sql:query dataSource="${snapshot}" var="item_stock_count">
   		SELECT item_stock_count FROM inventory WHERE item_code = '${param.item}';
   	 </sql:query>
	
	<div class="create_wrap">
		<div class="create_ad_container">
			<div align="center">
				<c:choose>
				<c:when test="${sessionScope.loggedIn == 'true'}">
					<c:choose>
						<c:when test="${item_stock_count.rows[0]['item_stock_count'] > 0}">
							<sql:update dataSource="${snapshot}" var="count">
						   		INSERT INTO customer_order (order_date, delivered, shipping_date, customer_number) 
						   		VALUES ('<%= orderDate %>', '0', '<%= shippingDate %>', '${sessionScope.user}');
						   	</sql:update>	
						   	
						   	<sql:query dataSource="${snapshot}" var="order">
						   		SELECT order_number FROM customer_order WHERE order_date = '<%= orderDate %>' AND customer_number = '${sessionScope.user}';
						   	</sql:query>
						   	
						   	<sql:update dataSource="${snapshot}" var="count">
						   		INSERT INTO order_item VALUES ('${param.item}', '${order.rows[0]['order_number']}', '1');
						   	</sql:update>
		
						   	<sql:update dataSource="${snapshot}" var="count">
						   		UPDATE inventory SET item_stock_count = '${item_stock_count.rows[0]['item_stock_count'] - 1}' WHERE item_code = '${param.item}';
						   	</sql:update>
						   	
							<H2>Thank you for buying!</H2>
						</c:when>
						<c:otherwise>
							<H2>Sorry, there is no such item available.</H2>
						</c:otherwise>
					</c:choose>
					
				</c:when>
				<c:otherwise>
					<H2>You are not able to buy without <a href="login">logging in</a></H2>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>