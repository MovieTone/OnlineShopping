<%@ page language="java" 
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page isELIgnored="false" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>List | Shopping</title>
	
	<link href="shop.css" rel="stylesheet">
	<script type="text/javascript" src="author_filter_disable.js"></script>
	<script type="text/javascript" src="confirm_buying.js"></script>
</head>
<body>
	<div class="wrap">
	
		<%@ include file="header_menu.jsp" %>
		
		<sql:query dataSource="${snapshot}" var="result">
			SELECT * from inventory WHERE item_group = ${param.group};
		</sql:query>
		
		<div class="messages_block">
			<div class="left_part">
				<h2 align="center">Items</h2>
				<c:forEach items="${result.rows}" var="current">
					<div class="message_line_container">
						<div class="one_message_container">
							<div class="one_message">
								<div class="one_message_top">
									<div class="one_message_title">
										<h3>${current.item_name}</h3>
									</div>
									<div class="clear"></div>
									<div class="image">
										<img src = "resources/${current.item_image_loc}" alt="${current.item_name}" height="100" width="100"></img>
									</div>
									<div class="clear"></div>
									<div class="one_message_author">
										${current.item_author}
									</div>
									<div class="clear"></div>
									<div class="one_message_title">${current.item_description}</div>
									<div class="clear"></div>
								</div>
								<div class="one_message_bottom">
									<div class="one_message_breadcrumbs">
										Price: ${current.item_price}
									</div>
									<div class="one_message_date">
										Stock count: ${current.item_stock_count}
									</div> 
									<c:if test="${sessionScope.loggedIn}">
										<div class="clear"></div>
										<div class="one_message_date">
											<form method="post" action="order" onsubmit="return confirmBuying()">
												<input type="hidden" name="item" value="${current.item_code}"></input>
												<div class="form-group">
													<button type="submit" class="buy-button">Buy</button>
												</div>
											</form>
										</div> 
									</c:if>
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