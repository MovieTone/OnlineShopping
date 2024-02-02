
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/onlineshopping"
     user="root"  password=""/>

	<sql:query dataSource="${snapshot}" var="menu">
		SELECT * from inventory_group;
	</sql:query>
	
	<c:choose>
		<c:when test="${sessionScope.loggedIn != 'true'}">
			<div class="top_menu" align="center">
				<ul>
					<li><a href="home">Home</a></li>  
					<li><a href="login">Log in</a></li>  
					<li><a href="managing">Managing</a></li>
				</ul>
				<br>
			</div>
		</c:when>
		
		<c:otherwise>
			<div class="top_menu" align="center">
				<ul>
					<li><a href="home">Home</a></li>
					<li><a href="logout">Log out</a></li>  
				<c:choose>
					<c:when test="${sessionScope.manager == 'true'}">
						<li><a href="database.jsp">Database</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="managing">Managing</a></li>
					</c:otherwise>
				</c:choose>
				</ul>
				<br>
			</div>
		</c:otherwise>
	</c:choose>
	
	<div id='left_menu'>
		<ul>
			<c:forEach items="${menu.rows}" var="current">
				<li><a href="list?group=${current.group_code}"><span>${current.group_name}</span></a></li>
			</c:forEach>
		</ul>
	</div>