<%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page isELIgnored="false" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Database | Shopping</title>
	
	<link href="shop.css" rel="stylesheet">
</head>
<body>
   	<%@ include file="header_menu.jsp" %>
	
	<div class="wrap">
		<div class="database">
			<h3 align="center">Database Tables</h3>
			<div class="database_container">
			<c:choose>
				<c:when test="${sessionScope.manager == 'true'}">
					<sql:query dataSource="${snapshot}" var="inventory_group">
						SELECT * FROM inventory_group;
					</sql:query>
					<sql:query dataSource="${snapshot}" var="inventory">
						SELECT * FROM inventory;
					</sql:query>
					<sql:query dataSource="${snapshot}" var="customer">
						SELECT * FROM customer;
					</sql:query>
					<sql:query dataSource="${snapshot}" var="customer_order">
						SELECT * FROM customer_order;
					</sql:query>
					<sql:query dataSource="${snapshot}" var="order_item">
						SELECT * FROM order_item;
					</sql:query>
					<sql:query dataSource="${snapshot}" var="manager">
						SELECT * FROM manager;
					</sql:query>
					<H3>Inventory_group</H3>
					<table border = 1>
						<c:forEach items="${inventory_group.rows}" var="current">
							<tr>
							    <td>${current.group_code}</td>
							    <td>${current.group_name}</td>
							</tr>
						</c:forEach>
					</table>
					<div class="clear"></div>
					<div class="clear"></div>
					<H3>Inventory</H3>
					<table border = 1>
						<c:forEach items="${inventory.rows}" var="current">
							<tr>
							    <td>${current.item_code}</td>
							    <td>${current.item_name}</td>
							    <td>${current.item_description}</td>
							    <td>${current.item_author}</td>
							    <td>${current.item_image_loc}</td>
							    <td>${current.item_group}</td>
							    <td>${current.item_price}</td>
							    <td>${current.item_stock_location}</td>
							    <td>${current.item_stock_count}</td>
							    <td>${current.item_order_count}</td>
							</tr>
						</c:forEach>
					</table>
					<div class="clear"></div>
					<H3>Customer</H3>
					<table border = 1>
						<c:forEach items="${customer.rows}" var="current">
							<tr>
							    <td>${current.customer_number}</td>
							    <td>${current.surname}</td>
							    <td>${current.initials}</td>
							    <td>${current.title}</td>
							    <td>${current.address1}</td>
							    <td>${current.address2}</td>
							    <td>${current.city}</td>
							    <td>${current.county}</td>
							    <td>${current.postcode}</td>
							    <td>${current.passwd}</td>
							    <td>${current.passphrase}</td>
							</tr>
						</c:forEach>
					</table>
					<div class="clear"></div>
					<H3>Customer_order</H3>
					<table border = 1>
						<c:forEach items="${customer_order.rows}" var="current">
							<tr>
							    <td>${current.order_number}</td>
							    <td>${current.order_date}</td>
							    <td>${current.delivered}</td>
							    <td>${current.shipping_date}</td>
							    <td>${current.customer_number}</td>
							</tr>
						</c:forEach>
					</table>
					<div class="clear"></div>
					<H3>Order_item</H3>
					<table border = 1>
						<c:forEach items="${order_item.rows}" var="current">
							<tr>
							    <td>${current.item_code}</td>
							    <td>${current.order_number}</td>
							    <td>${current.quantity}</td>
							</tr>
						</c:forEach>
					</table>
					<div class="clear"></div>
					<H3>Manager</H3>
					<table border = 1>
						<c:forEach items="${manager.rows}" var="current">
							<tr>
							    <td>${current.manager_number}</td>
							    <td>${current.surname}</td>
							    <td>${current.initials}</td>
							    <td>${current.firstname}</td>
							    <td>${current.passwd}</td>
							    <td>${current.passphrase}</td>
							</tr>
						</c:forEach>
					</table>
					<div class="clear"></div>
				</c:when>
				<c:otherwise>
					Please, <a href="managing">log in as a manager</a> before viewing the database.
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
</body>
</html>