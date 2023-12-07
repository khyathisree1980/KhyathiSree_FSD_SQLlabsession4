Create database ECommerceDB;
use ECommerceDB;

create table supplier (
SUPP_ID INT primary key,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50) NOT NULL,
SUPP_PHONE varchar(50) NOT NULL
);

create table customer (
CUS_ID INT primary key, 
CUS_NAME VARCHAR(20) NOT NULL, 
CUS_PHONE VARCHAR(10) NOT NULL, 
CUS_CITY VARCHAR(30) NOT NULL, 
CUS_GENDER CHAR
);

create table category (
CAT_ID INT primary key, 
CAT_NAME VARCHAR(20) NOT NULL
); 

create table product (
PRO_ID INT primary key, 
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy", PRO_DESC VARCHAR(60), 
CAT_ID INT NOT NULL,
foreign key (CAT_ID) references category (CAT_ID)
);

create table supplier_pricing (
PRICING_ID INT primary key, 
PRO_ID INT NOT NULL,
SUPP_ID INT NOT NULL,
foreign key (PRO_ID) references product (PRO_ID), 
foreign key (SUPP_ID) references supplier (SUPP_ID), 
SUPP_PRICE INT DEFAULT 0
);

create table orders (
ORD_ID INT primary key,
ORD_AMOUNT INT NOT NULL, 
ORD_DATE DATE NOT NULL, 
CUS_ID INT NOT NULL,
PRICING_ID INT NOT NULL,
foreign key (CUS_ID) references customer (CUS_ID),
foreign key (PRICING_ID) references supplier_pricing (PRICING_ID)
);

create table rating (
RAT_ID INT primary key, 
ORD_ID INT NOT NULL,
foreign key (ORD_ID) references orders (ORD_ID),
RAT_RATSTARS INT NOT NULL
);

-- Insert data into Supplier Table
INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE)
VALUES
  (1, 'Rajesh Retails', 'Delhi', '1234567890'),
  (2, 'Appario Ltd.', 'Mumbai', '2589631470'),
  (3, 'Knome products', 'Bangalore', '9785462315'),
  (4, 'Bansal Retails', 'Kochi', '8975463285'),
  (5, 'Mittal Ltd.', 'Lucknow', '7898456532');

-- Insert data into Customer Table
INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER)
VALUES
  (1, 'AAKASH', '9999999999', 'DELHI', 'M'),
  (2, 'AMAN', '9785463215', 'NOIDA', 'M'),
  (3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
  (4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
  (5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

-- Insert data into Category Table
INSERT INTO category (CAT_ID, CAT_NAME)
VALUES
  (1, 'BOOKS'),
  (2, 'GAMES'),
  (3, 'GROCERIES'),
  (4, 'ELECTRONICS'),
  (5, 'CLOTHES');

-- Insert data into Product Table
INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID)
VALUES
  (1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
  (2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
  (3, 'ROG LAPTOP', 'Windows 10 with 15-inch screen, i7 processor, 1TB SSD', 4),
  (4, 'OATS', 'Highly Nutritious from Nestle', 3),
  (5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
  (6, 'MILK', '1L Toned Milk', 3),
  (7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
  (8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
  (9, 'Project IGI', 'compatible with windows 7 and above', 2),
  (10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
  (11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1),
  (12, 'Train Your Brain', 'By Shireen Stephen', 1);

-- Insert data into Supplier_pricing Table
INSERT INTO supplier_pricing (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE)
VALUES
  (1, 1, 2, 1500),
  (2, 3, 5, 30000),
  (3, 5, 1, 3000),
  (4, 2, 3, 2500),
  (5, 4, 1, 1000),
  (6, 12, 2, 780),
  (7, 12, 4, 789),
  (8, 3, 1, 31000),
  (9, 1, 5, 1450),
  (10, 4, 2, 999),
  (11, 7, 3, 549),
  (12, 7, 4, 529),
  (13, 6, 2, 105),
  (14, 6, 1, 99),
  (15, 2, 5, 2999),
  (16, 5, 2, 2999);

-- Insert data into Order Table
INSERT INTO orders (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES
  (101, 1500, "2021-10-06", 2, 1),
  (102, 1000, "2021-10-12", 3, 5),
  (103, 30000, "2021-09-16", 5, 2),
  (104, 1500, "2021-10-05", 1, 1),
  (105, 3000, "2021-08-16", 4, 3),
  (106, 1450, "2021-08-18", 1, 9),
  (107, 789, "2021-09-01", 3, 7),
  (108, 780, "2021-09-07", 5, 6),
  (109, 3000, "2021-09-10", 5, 3),
  (110, 2500, "2021-09-10", 2, 4),
  (111, 1000, "2021-09-15", 4, 5),
  (112, 789, "2021-09-16", 4, 7),
  (113, 31000, "2021-09-16", 1, 8),
  (114, 1000, "2021-09-16", 3, 5),
  (115, 3000, "2021-09-16", 5, 3),
  (116, 99, "2021-09-17", 2, 14);

-- Insert data into Rating Table
INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES
  (1, 101, 4),
  (2, 102, 3),
  (3, 103, 1),
  (4, 104, 2),
  (5, 105, 4),
  (6, 106, 3),
  (7, 107, 4),
  (8, 108, 4),
  (9, 109, 3),
  (10, 110, 5),
  (11, 111, 3),
  (12, 112, 4),
  (13, 113, 2),
  (14, 114, 1),
  (15, 115, 1),
  (16, 116, 0);

select * from supplier;
select * from customer;
select * from category;
select * from product;
select * from supplier_pricing;
select * from orders;
select * from rating;

-- Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000
SELECT c.CUS_GENDER, COUNT(c.CUS_GENDER) as count
FROM customer c
Inner JOIN 
(select  c.CUS_ID as customerId
from customer c
Inner Join orders o ON o.CUS_ID = c.CUS_ID
WHERE O.ORD_AMOUNT >= 3000
GROUP BY c.CUS_ID)
as v ON v.customerId = c.CUS_ID
GROUP BY c.CUS_GENDER;

-- Display all the orders along with product name ordered by a customer having Customer_Id=2  
SELECT p.PRO_NAME, o.*
FROM orders o
Inner join customer c ON c.CUS_ID = o.CUS_ID
Inner join supplier_pricing sp ON sp.PRICING_ID = o.PRICING_ID
Inner join product p ON p.PRO_ID = sp.PRO_ID
WHERE c.CUS_ID = 2;

-- Display the Supplier details who can supply more than one product



-- Find the least expensive product from each category and print the table with category id, name, product name and price of the product



-- Display the Id and Name of the Product ordered after “2021-10-05”



-- Display customer name and gender whose names start or end with character 'A'



-- Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”. Note that there should be one rating per supplie
-- Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.
select c.CUS_GENDER , count(c.CUS_GENDER) as count from customer c inner join 
(
select c.CUS_ID as customerId
from customer c inner join orders o on o.CUS_ID=c.CUS_ID where o.ORD_AMOUNT>=3000 group by c.CUS_ID
) as v on v.customerId= c.CUS_ID group by c.CUS_GENDER;


-- Display all the orders along with product name ordered by a customer having Customer_Id=2
select p.PRO_NAME, o.*
from orders o inner join customer c on c.CUS_ID= o.CUS_ID inner join supplier_pricing sp on sp.pricing_id= o.pricing_id
inner join product p on p.pro_id =sp.pro_id
where c.CUS_ID=2;


-- Display the Supplier details who can supply more than one product.
select s.*, v.totalProducts from supplier s inner join (
select sp.supp_id ,count(sp.pro_id) as totalProducts from supplier_pricing sp group by sp.SUPP_ID)
as v on v.supp_id= s.supp_id where v.totalProducts >1;


-- Find the least expensive product from each category and print the table with category id, name, product name and price of the product
select c.cat_id, c.cat_name, min(vv.min_price) as min_price from category c  inner join (
select p.*, v.min_price from product p inner join(
select sp.pro_id, min(sp.supp_price) as min_price from supplier_pricing sp group by sp.PRO_ID) 
as v on p.pro_id = v.PRO_ID )
as vv on vv.cat_id =c.cat_id group by c.cat_id;


-- Display the Id and Name of the Product ordered after “2021-10-05”.
select p.pro_id, p.pro_name from orders o inner join supplier_pricing sp on sp.PRICING_ID= o.PRICING_ID
inner join product p on p.PRO_ID=sp.PRO_ID where o.ORD_DATE> '2021-10-05' ;


-- Display customer name and gender whose names start or end with character 'A'
select * from customer c 
where c.CUS_NAME like 'A%'
or c.CUS_NAME like '%A';


-- Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every supplier) and 
-- Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print 
-- “Average Service” else print “Poor Service”. Note that there should be one rating per supplier.

select report.supp_id, report.supp_name,
case
when report.average=5 then 'Exellent Service'
when report.average>4 then 'Good Service'
when report.average>2 then 'Average Service'
else 'Poor Service'
end as type_of_service from 
( select s.*, final.average from supplier s inner join ( select vv.supp_id, avg (vv.rat_ratstars) as average from (
select sp.pricing_id, sp.pro_id, sp.supp_id, sp.supp_price, v.ord_id, v.rat_ratstars from supplier_pricing sp inner join(
select o.ord_id, o.pricing_id, r.rat_ratstars from orders o inner join rating r on r.ord_id= o.ord_id)
as v on sp.pricing_id= v.pricing_id)
as vv group by vv.supp_id)
as final on final.supp_id= s.supp_id)
as report;


