<%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
   <title>Reset Database</title>
   <meta charset="utf-8">
</head>
<body>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/onlineshopping"
     user="root"  password=""/>
     
<c:choose>
  <c:when test="${param.submitted!=null}">
    <c:catch var="exception">
        <sql:update dataSource="${snapshot}" var="count">  
          DELETE FROM customer  
        </sql:update>    
        <sql:update dataSource="${snapshot}" var="count">  
          DELETE FROM order_item  
        </sql:update>
        <sql:update dataSource="${snapshot}" var="count">  
          DELETE FROM inventory  
        </sql:update>  
        <sql:update dataSource="${snapshot}" var="count">  
          DELETE FROM inventory_group  
        </sql:update>
        <sql:update dataSource="${snapshot}" var="count">  
          DELETE FROM customer_order  
        </sql:update>  
        <sql:update dataSource="${snapshot}" var="count">  
          DELETE FROM manager  
        </sql:update>
        
        <sql:update dataSource="${snapshot}" var="count">  
          INSERT INTO inventory_group VALUES (1001, "Books");
        </sql:update>    
        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory_group VALUES (1002, "Music");
        </sql:update>    
        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory_group VALUES (1003, "Games");
        </sql:update>    
        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory_group VALUES (1004, "DVDs");
        </sql:update>    
        
        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory VALUES (
          "AA01-001",
          "The Maze Runner",
          "When the doors of the lift crank open, the only thing Thomas can remember is his first name.",
          "James Dashner",
          "aa01-001.jpg",
          1001,
          3.55,
          "Colchester",
          1,
          15 );
        </sql:update>    

        <sql:update dataSource="${snapshot}" var="count">
          INSERT INTO inventory VALUES (
          "AA01-002",
          "The Catcher in the Rye",
          "Holden narrates the story of a couple of days in his 16-year-old life, just after he has been expelled from school",
          "J. D. Salinger",
          "aa01-002.jpg",
          1001,
          4.99,
          "Southend",
          0,
          5 );
        </sql:update>    

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory VALUES (
          "AA01-003",
          "The Fault in Our Stars",
          "Hazel Grace has terminal cancer. When Hazel attends a Cancer Kid Support Group she meets Augustus Waters",
          "John Green",
          "aa01-003.jpg",
          1001,
          3.99,
          "Colchester",
          5,
          0 );
        </sql:update>    

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory VALUES (
          "AA01-004",
          "Paris",
          "This epic novel weaves a gripping tale of four families across the centuries",
          "Edward Rutherfurd",
          "aa01-004.jpg",
          1001,
          8.83,
          "Southend",
          12,
          10 );
        </sql:update>    

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory VALUES (
          "AA01-007",
          "Purpose",
          "His fourth studio album",
          "Justin Bieber",
          "aa01-007.jpg",
          1002,
          9.99,
          "Colchester",
          1,
          15 );
        </sql:update>    

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory VALUES (
          "AA01-008",
          "Netsky",
          "A drum and bass album that can stand up to regular playing",
          "Netsky",
          "aa01-008.jpg",
          1002,
          6.99,
          "Southend",
          0,
          10 );
        </sql:update>    

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory VALUES (
          "AA01-009",
          "Queen of the Clouds",
          "Debut studio album by the Swedish recording artist",
          "Tove Lo",
          "aa01-009.jpg",
          1002,
          4.99,
          "Colchester",
          4,
          15 );
        </sql:update>    

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory VALUES (
          "AA01-010",
          "Skream",
          "Much more of a reggae (even ska) feel than some other dubstep",
          "Skream",
          "aa01-010.jpg",
          1002,
          9.99,
          "Southend",
          2,
          0 );
        </sql:update>    

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory VALUES (
          "AA01-013",
          "Minecraft",
          "A game which has something for everyone and offers hundreds of hours of fun",
          "Mojang",
          "aa01-013.jpg",
          1003,
          14.00,
          "Colchester",
          1,
          10 );
        </sql:update>    

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory VALUES (
          "AA01-014",
          "FIFA 16",
          "FIFA 16 innovates across the entire pitch to deliver a balanced, authentic, and exciting football experience",
          "Electronic Arts",
          "aa01-014.jpg",
          1003,
          32.85,
          "Southend",
          0,
          15 );
        </sql:update>    

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory VALUES (
          "AA01-015",
          "Madden NFL 16",
          "Be the playmaker from the draft room to the gridiron",
          "Electronic Arts",
          "aa01-015.jpg",
          1003,
          29.99,
          "Colchester",
          10,
          15 );
        </sql:update>    

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory VALUES (
          "AA01-016",
          "DiRT 3",
          "Boasts more cars, more locations, more routes and more events than any other game in the series",
          "Codemasters Limited",
          "aa01-016.jpg",
          1003,
          37.50,
          "Southend",
          10,
          15 );
        </sql:update>    

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory VALUES (
          "AA01-019",
          "Star Wars: The Force Awakens",
          "135 minutes of glorious Star Wars escapism",
          "Walt Disney Studios Home Entertainment",
          "aa01-019.jpg",
          1004,
          15.99,
          "Colchester",
          10,
          15 );
        </sql:update>    

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory VALUES (
          "AA01-020",
          "Inception",
          "Blockbuster sci-fi thriller",
          "Warner Home Video",
          "aa01-020.jpg",
          1004,
          4.97,
          "Southend",
          0,
          4 );
        </sql:update>    

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory VALUES (
          "AA01-021",
          "The Big Bang Theory - Season 8",
          "Leonard and Sheldon are brilliant physicists but socially challenged otherwise",
          "Warner Home Video",
          "aa01-021.jpg",
          1004,
          12.99,
          "Colchester",
          6,
          20 );
        </sql:update>    

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO inventory VALUES (
          "AA01-022",
          "Suits",
          "In the high-stakes legal world, contentment does not last long",
          "Universal Pictures UK",
          "aa01-022.jpg",
          1004,
          10.00,
          "Colchester",
          3,
          10 );
        </sql:update>    

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO customer VALUES (
          1001,
          "Scott",
          "",
          "Mollie",
          "Ms",
          "63 Wenlock Terrace",
          "Pettycur",
          "Kirkcaldy",
          "Fife",
          "KY3 8XD",
          MD5("mollie"),
          "brevity is the soul of wit" );
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO customer VALUES (
          1002,
          "Barrett",
          "",
          "Jake",
          "Mr",
          "18 High St",
          "Thorpe Mandeville",
          "Oxford",
          "Oxfordshire",
          "OX17 3SJ",
          MD5("tiffany"),
          "to be or not to be" );
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
		  INSERT INTO customer VALUES (
          1003,
          "de Ree",
          "",
          "Jantiene",
          "Mrs",
          "54 Gloddaeth Street",
          "Bildeston",
          "Ipswich",
          "Suffolk",
          "IP7 1QL",
          MD5("jantiene"),
          "i like this place and willingly could waste my time in it" );
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO customer VALUES (
          1004,
          "Neudorf",
          "",
          "Maik",
          "Dr",
          "81 Castledore Road",
          "Tuxford",
          "Nottingham",
          "Nottinghamshire",
          "NG22 3XF",
          MD5("maik"),
          "the world is mine oyster" );
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO customer VALUES (
          1005,
          "Villalobos", 
          "",
          "Geraldine",
          "Prof",
          "24 Telford Street",
          "Barber Booth",
          "Sheffield",
          "Yorkshire",
          "S30 7EY",
          MD5("geraldine"),
          "nothing will come of nothing" );
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO customer VALUES (
          1006,
          "Cousteau",
          "",
          "Karel",
          "Mr",
          "47 Shore Street",
          "Stocksfield",
          "Newcastle upon Tyne",
          "Northumberland",
          "NE43 4JA",
          MD5("karel"),
          "folly and ignorance" );
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO customer VALUES (
          1007,
          "Wieczorek",
          "",
          "Wiktoria",
          "Dr",
          "8 Rowland Rd",
          "Ormesby St Margaret",
          "Norwich",
          "Norfolk",
          "NR29 9RQ",
          MD5("wiktoria"),
          "nature teaches beasts to know their friends" );
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO customer VALUES (
          1008,
          "Novosad",
          "",
          "Martin",
          "Mr",
          "54 Harrogate Road",
          "Runwell",
          "Southend-on-Sea",
          "Essex",
          "SS11 8EE",
          MD5("martin"),
          "and summer's lease hath all too short a date" );
        </sql:update>      
        
        <sql:update dataSource="${snapshot}" var="count">         
          INSERT INTO customer_order VALUES (1231, SUBDATE(NOW(), INTERVAL 53 DAY), TRUE, SUBDATE(NOW(), INTERVAL 50 DAY),  1001);
        </sql:update>  
        
        <sql:update dataSource="${snapshot}" var="count">         
          INSERT INTO customer_order VALUES (1232, SUBDATE(NOW(), INTERVAL 40 DAY), TRUE, SUBDATE(NOW(), INTERVAL 37 DAY), 1003);
        </sql:update>  
        
        <sql:update dataSource="${snapshot}" var="count">         
          INSERT INTO customer_order VALUES (1233, SUBDATE(NOW(), INTERVAL 30 DAY), TRUE, SUBDATE(NOW(), INTERVAL 27 DAY), 1001);
        </sql:update>  
        
        <sql:update dataSource="${snapshot}" var="count">         
          INSERT INTO customer_order VALUES (1234, SUBDATE(NOW(), INTERVAL 21 DAY), TRUE, SUBDATE(NOW(), INTERVAL 18 DAY), 1004);
        </sql:update>  
        
        <sql:update dataSource="${snapshot}" var="count">         
          INSERT INTO customer_order VALUES (1235, SUBDATE(NOW(), INTERVAL 14 DAY), FALSE, '2020/01/01', 1006);
        </sql:update>  
        
        <sql:update dataSource="${snapshot}" var="count">         
          INSERT INTO customer_order VALUES (1236, SUBDATE(NOW(), INTERVAL 8 DAY), TRUE, SUBDATE(NOW(), INTERVAL 5 DAY), 1003);
        </sql:update>  
        
        <sql:update dataSource="${snapshot}" var="count">         
          INSERT INTO customer_order VALUES (1237, SUBDATE(NOW(), INTERVAL 6 DAY), TRUE, SUBDATE(NOW(), INTERVAL 3 DAY), 1001);
        </sql:update>  
        
        <sql:update dataSource="${snapshot}" var="count">         
          INSERT INTO customer_order VALUES (1238, SUBDATE(NOW(), INTERVAL 4 DAY), TRUE, SUBDATE(NOW(), INTERVAL 1 DAY), 1008);
        </sql:update>  
        
        <sql:update dataSource="${snapshot}" var="count">         
          INSERT INTO customer_order VALUES (1239, SUBDATE(NOW(), INTERVAL 4 DAY), FALSE, '2020/01/01', 1005);
        </sql:update>  
        
        <sql:update dataSource="${snapshot}" var="count">         
          INSERT INTO customer_order VALUES (1240, SUBDATE(NOW(), INTERVAL 12 DAY), TRUE, SUBDATE(NOW(), INTERVAL 9 DAY), 1007);
        </sql:update>  
        
        <sql:update dataSource="${snapshot}" var="count">         
          INSERT INTO customer_order VALUES (1241, SUBDATE(NOW(), INTERVAL 1 DAY), FALSE, '2020/01/01', 1004);
        </sql:update>  
        
        <sql:update dataSource="${snapshot}" var="count">         
          INSERT INTO customer_order VALUES (1242, SUBDATE(NOW(), INTERVAL 17 DAY), TRUE, SUBDATE(NOW(), INTERVAL 14 DAY), 1006);
        </sql:update>  
        
        <sql:update dataSource="${snapshot}" var="count">         
          INSERT INTO customer_order VALUES (1243, NOW(), FALSE, '2020/01/01', 1002);
        </sql:update>  
        
        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO order_item VALUES ("AA01-001", 1231 ,1);
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO order_item VALUES ("AA01-002", 1232 ,1);
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO order_item VALUES ("AA01-007", 1233 ,1);
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO order_item VALUES ("AA01-019", 1234 ,1);
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO order_item VALUES ("AA01-010", 1235 ,1);
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO order_item VALUES ("AA01-015", 1236 ,1);
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO order_item VALUES ("AA01-013", 1237 ,1);
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO order_item VALUES ("AA01-022", 1238 ,1);
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO order_item VALUES ("AA01-009", 1239 ,1);
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO order_item VALUES ("AA01-007", 1240 ,1);
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO order_item VALUES ("AA01-014", 1241 ,1);
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO order_item VALUES ("AA01-004", 1242 ,1);
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO order_item VALUES ("AA01-003", 1243 ,1);
        </sql:update>      

        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO manager VALUES(100, "Mancini", "", "Luigia", MD5("luigia"), "better three hours too soon than a minute too late" );
        </sql:update>
        
        <sql:update dataSource="${snapshot}" var="count"> 
          INSERT INTO manager VALUES(101, "Jones", "", "Adam", MD5("adam"), "listen to many, speak to a few" );
        </sql:update>
        
    </c:catch>
    <c:choose>
      <c:when  test="${exception != null}">
         <p>
         An exception occurred while resetting the database : ${exception} <br />
         Message: ${exception.message}
         </p>
      </c:when>
      <c:otherwise>
        <p>Database has been reset</p>
      </c:otherwise>
    </c:choose>
    </c:when>
  <c:otherwise>
    <form method="post">
      <p>This will reset the database!</p>
      <input type="submit" name="submitted" value="submit"/>
    </form>
    </c:otherwise>
</c:choose>
</body>
</html>
