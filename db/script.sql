﻿-- NOTE: All tables names are in lower case; Database name is
-- all lower case as well.

SET STORAGE_ENGINE = INNODB;

-- **IMPORTANT**
-- Change abcd to your username on the next 3 lines before running this script!
DROP DATABASE IF EXISTS onlineshopping;
CREATE DATABASE onlineshopping;
USE onlineshopping;

-- Create tables

-- Create inventory_group table
CREATE TABLE inventory_group (
  group_code INT NOT NULL AUTO_INCREMENT,
  group_name VARCHAR(20),
  PRIMARY KEY(group_code)
);

-- Create inventory table
CREATE TABLE inventory (
  item_code CHAR(8) NOT NULL,
  item_name VARCHAR(40),
  item_description VARCHAR(140),
  item_author VARCHAR (60),
  item_image_loc VARCHAR(140), 
  item_group INT,
  item_price DECIMAL(10,2),
  item_stock_location VARCHAR (10),  
  item_stock_count INT,
  item_order_count INT,
  PRIMARY KEY(item_code),
  FOREIGN KEY(item_group) REFERENCES inventory_group(group_code) ON DELETE SET NULL
);

-- Create customer table
CREATE TABLE customer (
  customer_number INT NOT NULL AUTO_INCREMENT,
  surname VARCHAR(40),
  initials VARCHAR(10),
  firstname VARCHAR(40),
  title ENUM('Mr', 'Mrs', 'Miss', 'Ms', 'Dr', 'Prof', 'Rev'),
  address1 VARCHAR(60),
  address2 VARCHAR(60),
  city VARCHAR(30),
  county VARCHAR(30),
  postcode VARCHAR(8),
  passwd VARCHAR(128),
  passphrase VARCHAR(128),
  PRIMARY KEY(customer_number)
);

-- Create customer_order table
CREATE TABLE customer_order (
  order_number INT NOT NULL AUTO_INCREMENT,
  order_date DATETIME NOT NULL,
  delivered BOOLEAN,
  shipping_date DATETIME, 
  customer_number INT NOT NULL,
  PRIMARY KEY(order_number)   
);  
  
-- Create order_item Table
CREATE TABLE order_item (
  item_code CHAR(8) NOT NULL,
  order_number INT NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY(item_code, order_number),
  FOREIGN KEY(order_number) REFERENCES customer_order(order_number) ON DELETE CASCADE,
  FOREIGN KEY(item_code) REFERENCES inventory(item_code)
);
  

-- Create manager table
CREATE TABLE manager (
  manager_number INT NOT NULL,
  surname VARCHAR(40),
  initials VARCHAR(10),
  firstname VARCHAR(40),
  passwd VARCHAR(128),
  passphrase VARCHAR(128),
 PRIMARY KEY(manager_number)
);

-- Populate inventory group
INSERT INTO inventory_group VALUES (1001, "Books");
INSERT INTO inventory_group VALUES (1002, "Music");
INSERT INTO inventory_group VALUES (1003, "Games");
INSERT INTO inventory_group VALUES (1004, "DVDs");

-- Add books
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

INSERT INTO inventory VALUES (
"AA01-003",
"The Fault in Our Stars",
"Hazel Grace has terminal cancer. When Hazel attends a Cancer Kid Support Group she meets Augustus Waters",
"John Green",
"aa01-003.jpg",
1001,
3.99 ,
"Colchester",
5,
0 );

INSERT INTO inventory VALUES (
"AA01-004",
"Paris",
"This epic novel weaves a gripping tale of four families across the centuries",
"Edward Rutherfurd",
"aa01-004.jpg",
1001,
8.83 ,
"Southend",
12,
10 );

INSERT INTO inventory VALUES (
"AA01-005",
"To Kill a Mockingbird",
"Arrow's 50th anniversary edition of the bestselling, Pulitzer prize-winning classic",
"Harper Lee",
"aa01-005.jpg",
1001,
4.83 ,
"Southend",
2,
15 );

INSERT INTO inventory VALUES (
"AA01-006",
"Only Time Will Tell: 1",
"The Clifton Chronicles - a multi-generational family saga, from the epic master storyteller",
"Jeffrey Archer",
"aa01-006.jpg",
1001,
2.29 ,
"Southend",
1,
10 );

-- Add music
INSERT INTO inventory VALUES (
"AA01-007",
"Purpose",
"His fourth studio album",
"Justin Bieber",
"aa01-007.jpg",
1002,
9.99 ,
"Colchester",
1,
15 );

INSERT INTO inventory VALUES (
"AA01-008",
"Netsky",
"A drum and bass album that can stand up to regular playing",
"Netsky",
"aa01-008.jpg",
1002,
6.99 ,
"Southend",
0,
10 );

INSERT INTO inventory VALUES (
"AA01-009",
"Queen of the Clouds",
"Debut studio album by the Swedish recording artist",
"Tove Lo",
"aa01-009.jpg",
1002,
4.99 ,
"Colchester",
4,
15 );

INSERT INTO inventory VALUES (
"AA01-010",
"Skream",
"Much more of a reggae (even ska) feel than some other dubstep",
"Skream",
"aa01-010.jpg",
1002,
9.99 ,
"Southend",
2,
0 );

INSERT INTO inventory VALUES (
"AA01-011",
"Ecliptica",
"Amazing finnish power metal",
"Sonata Arctica",
"aa01-011.jpg",
1002,
6.99 ,
"Southend",
5,
0 );

INSERT INTO inventory VALUES (
"AA01-012",
"Marshall Mathers LP",
"The album of the hip hop legend",
"Eminem",
"aa01-012.jpg",
1002,
4.99 ,
"Southend",
4,
10 );

-- Add games
INSERT INTO inventory VALUES (
"AA01-013",
"Minecraft",
"A game which has something for everyone and offers hundreds of hours of fun",
"Mojang",
"aa01-013.jpg",
1003,
14.00 ,
"Colchester",
1,
10 );

INSERT INTO inventory VALUES (
"AA01-014",
"FIFA 16",
"FIFA 16 innovates across the entire pitch to deliver a balanced, authentic, and exciting football experience",
"Electronic Arts",
"aa01-014.jpg",
1003,
32.85 ,
"Southend",
0,
15 );

INSERT INTO inventory VALUES (
"AA01-015",
"Madden NFL 16",
"Be the playmaker from the draft room to the gridiron",
"Electronic Arts",
"aa01-015.jpg",
1003,
29.99 ,
"Colchester",
10,
15 );

INSERT INTO inventory VALUES (
"AA01-016",
"DiRT 3",
"Boasts more cars, more locations, more routes and more events than any other game in the series",
"Codemasters Limited",
"aa01-016.jpg",
1003,
37.50 ,
"Southend",
10,
15 );

INSERT INTO inventory VALUES (
"AA01-017",
"Anno 2205",
"In Anno 2205, you join humankind‘s next step into the future with the promise to build a better tomorrow",
"Ubisoft",
"aa01-017.jpg",
1003,
59.50 ,
"Southend",
2,
10 );

INSERT INTO inventory VALUES (
"AA01-018",
"Wasteland 2",
"Take control of a squad of Desert Rangers in the Southwestern United States in Wasteland 2",
"inXile Entertainment",
"aa01-018.jpg",
1003,
29.99 ,
"Southend",
4,
15 );

-- Add DVDs
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

INSERT INTO inventory VALUES (
"AA01-020",
"Inception",
"Blockbuster sci-fi thriller",
"Warner Home Video",
"aa01-020.jpg",
1004,
4.97 ,
"Southend",
0,
4 );

INSERT INTO inventory VALUES (
"AA01-021",
"The Big Bang Theory - Season 8",
"Leonard and Sheldon are brilliant physicists but socially challenged otherwise",
"Warner Home Video",
"aa01-021.jpg",
1004,
12.99 ,
"Colchester",
6,
20 );

INSERT INTO inventory VALUES (
"AA01-022",
"Suits",
"In the high-stakes legal world, contentment does not last long",
"Universal Pictures UK",
"aa01-022.jpg",
1004,
10.00 ,
"Colchester",
3,
10 );

INSERT INTO inventory VALUES (
"AA01-023",
"Interstellar",
"From director Christopher Nolan (Inception) comes the story of ex-pilot Cooper (Matthew McConaughey), who must leave his family and Earth behind to lead an expedition beyond this galaxy to discover whether mankind has a future among the stars",
"Paramount Pictures",
"aa01-023.jpg",
1004,
20.00 ,
"Colchester",
6,
15 );

INSERT INTO inventory VALUES (
"AA01-024",
"The Last Witch Hunter",
"Vin Diesel is an immortal witch hunter who clashes with the supernatural in an epic battle to save the human race",
"Lionsgate",
"aa01-024.jpg",
1004,
17.00 ,
"Colchester",
3,
10 );

-- Add customers
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

-- Create some customer orders
INSERT INTO customer_order VALUES (1231, SUBDATE(NOW(), INTERVAL 53 DAY), TRUE, SUBDATE(NOW(), INTERVAL 50 DAY),  1001);
INSERT INTO customer_order VALUES (1232, SUBDATE(NOW(), INTERVAL 40 DAY), TRUE, SUBDATE(NOW(), INTERVAL 37 DAY), 1003);
INSERT INTO customer_order VALUES (1233, SUBDATE(NOW(), INTERVAL 30 DAY), TRUE, SUBDATE(NOW(), INTERVAL 27 DAY), 1001);
INSERT INTO customer_order VALUES (1234, SUBDATE(NOW(), INTERVAL 21 DAY), TRUE, SUBDATE(NOW(), INTERVAL 18 DAY), 1004);
INSERT INTO customer_order VALUES (1235, SUBDATE(NOW(), INTERVAL 14 DAY), FALSE, '2020/01/01', 1006);
INSERT INTO customer_order VALUES (1236, SUBDATE(NOW(), INTERVAL 8 DAY), TRUE, SUBDATE(NOW(), INTERVAL 5 DAY), 1003);
INSERT INTO customer_order VALUES (1237, SUBDATE(NOW(), INTERVAL 6 DAY), TRUE, SUBDATE(NOW(), INTERVAL 3 DAY), 1001);
INSERT INTO customer_order VALUES (1238, SUBDATE(NOW(), INTERVAL 4 DAY), TRUE, SUBDATE(NOW(), INTERVAL 1 DAY), 1008);
INSERT INTO customer_order VALUES (1239, SUBDATE(NOW(), INTERVAL 4 DAY), FALSE, '2020/01/01', 1005);
INSERT INTO customer_order VALUES (1240, SUBDATE(NOW(), INTERVAL 12 DAY), TRUE, SUBDATE(NOW(), INTERVAL 9 DAY), 1007);
INSERT INTO customer_order VALUES (1241, SUBDATE(NOW(), INTERVAL 1 DAY), FALSE, '2020/01/01', 1004);
INSERT INTO customer_order VALUES (1242, SUBDATE(NOW(), INTERVAL 17 DAY), TRUE, SUBDATE(NOW(), INTERVAL 14 DAY), 1006);
INSERT INTO customer_order VALUES (1243, NOW(), FALSE, '2020/01/01', 1002);

-- Add order items to the orders, one item per order
INSERT INTO order_item VALUES ("AA01-001", 1231 ,1);
INSERT INTO order_item VALUES ("AA01-002", 1232 ,1);
INSERT INTO order_item VALUES ("AA01-007", 1233 ,1);
INSERT INTO order_item VALUES ("AA01-019", 1234 ,1);
INSERT INTO order_item VALUES ("AA01-010", 1235 ,1);
INSERT INTO order_item VALUES ("AA01-015", 1236 ,1);
INSERT INTO order_item VALUES ("AA01-013", 1237 ,1);
INSERT INTO order_item VALUES ("AA01-022", 1238 ,1);
INSERT INTO order_item VALUES ("AA01-009", 1239 ,1);
INSERT INTO order_item VALUES ("AA01-007", 1240 ,1);
INSERT INTO order_item VALUES ("AA01-014", 1241 ,1);
INSERT INTO order_item VALUES ("AA01-004", 1242 ,1);
INSERT INTO order_item VALUES ("AA01-003", 1243 ,1);

-- Create two managers
INSERT INTO manager VALUES(100, "Mancini", "", "Luigia", MD5("luigia"), "better three hours too soon than a minute too late" );
INSERT INTO manager VALUES(101, "Jones", "", "Adam", MD5("adam"), "listen to many, speak to a few" );

-- GRANT DELETE,SELECT,INSERT,UPDATE ON root.* TO 'root'@'localhost' IDENTIFIED BY 'password';
