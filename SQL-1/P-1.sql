create database customers_info;
use customers_info;



-- =======================================================================================================
-- 01 | CUSTOMERS TABLE
-- =======================================================================================================

create table Customers (
    CustomerID int auto_increment primary key,
    Name varchar(30) not null,
    Email varchar(30) unique,
    Address varchar(50) 
);




-- 1. Insert at least 5 sample customers into the Customers table.
insert into Customers (Name, Email, Address) 
values ('Neha Shah', 'neha@gmail.com', 'Surat'),
('Rohan Patel', 'rohan@gmail.com', 'Ahmedabad'),
('Meera Joshi', 'meera@gmail.com', 'Vadodara'),
('Arjun Mehta', 'arjun@gmail.com', 'Rajkot'),
('Priya Desai', 'priya@gmail.com', 'Pune'),
('Kunal Shah', 'kunal@gmail.com', 'Mumbai'),
('Isha Patel', 'isha@gmail.com', 'Nashik'),
('Rahul Verma', 'rahul@gmail.com', 'Delhi'),
('Sneha Rao', 'sneha@gmail.com', 'Jaipur'),
('Amit Kumar', 'amit@gmail.com', 'Udaipur');




-- 2. Retrieve all customer details.
select * from Customers;
+------------+-------------+-----------------+-----------+
| CustomerID | Name        | Email           | Address   |
+------------+-------------+-----------------+-----------+
|          1 | Neha Shah   | neha@gmail.com  | Surat     |
|          2 | Rohan Patel | rohan@gmail.com | Ahmedabad |
|          3 | Meera Joshi | meera@gmail.com | Vadodara  |
|          4 | Arjun Mehta | arjun@gmail.com | Rajkot    |
|          5 | Priya Desai | priya@gmail.com | Pune      |
|          6 | Kunal Shah  | kunal@gmail.com | Mumbai    |
|          7 | Isha Patel  | isha@gmail.com  | Nashik    |
|          8 | Rahul Verma | rahul@gmail.com | Delhi     |
|          9 | Sneha Rao   | sneha@gmail.com | Jaipur    |
|         10 | Amit Kumar  | amit@gmail.com  | Udaipur   |
+------------+-------------+-----------------+-----------+




-- 3. Update a customer's address.
update Customers set Address = "Gandhinagar" where CustomerID = 3;

select * from Customers where CustomerID = 3;
+------------+-------------+-----------------+-------------+
| CustomerID | Name        | Email           | Address     |
+------------+-------------+-----------------+-------------+
|          3 | Meera Joshi | meera@gmail.com | Gandhinagar |
+------------+-------------+-----------------+-------------+




-- 4. Delete a customer using their CustomerID.
delete from Customers where CustomerID = 6;

select * from Customers;
+------------+-------------+-----------------+-------------+
| CustomerID | Name        | Email           | Address     |
+------------+-------------+-----------------+-------------+
|          1 | Neha Shah   | neha@gmail.com  | Surat       |
|          2 | Rohan Patel | rohan@gmail.com | Ahmedabad   |
|          3 | Meera Joshi | meera@gmail.com | Gandhinagar |
|          4 | Arjun Mehta | arjun@gmail.com | Rajkot      |
|          5 | Priya Desai | priya@gmail.com | Pune        |
|          7 | Isha Patel  | isha@gmail.com  | Nashik      |
|          8 | Rahul Verma | rahul@gmail.com | Delhi       |
|          9 | Sneha Rao   | sneha@gmail.com | Jaipur      |
|         10 | Amit Kumar  | amit@gmail.com  | Udaipur     |
+------------+-------------+-----------------+-------------+




-- 5. Display all customers whose name is 'Alice'.
select * from Customers where name like "Alice%";
-- Empty set (0 rows)




-- =======================================================================================================
-- 2 | ORDERS TABLE
-- =======================================================================================================

create table orders (
    OrderID int auto_increment primary key,
    CustomerID int,
    OrderDate date,
    TotalAmount int,

    foreign key (CustomerID) references Customers(CustomerID)
);




-- 6. Insert at least 5 sample orders into the Orders table.
insert into orders (CustomerID, OrderDate, TotalAmount) 
values (1, '2026-08-26', 3600),
(2, '2026-08-24', 2200),
(3, '2026-08-21', 4800),
(4, '2026-08-19', 1500),
(1, '2026-08-16', 5200),
(2, '2026-08-14', 2900),
(7, '2026-08-11', 4100),
(8, '2026-08-07', 6200),
(2, '2026-07-30', 3100),
(10, '2026-07-22', 4500);

select * from orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2026-08-26 |        3600 |
|       2 |          2 | 2026-08-24 |        2200 |
|       3 |          3 | 2026-08-21 |        4800 |
|       4 |          4 | 2026-08-19 |        1500 |
|       5 |          1 | 2026-08-16 |        5200 |
|       6 |          2 | 2026-08-14 |        2900 |
|       7 |          7 | 2026-08-11 |        4100 |
|       8 |          8 | 2026-08-07 |        6200 |
|       9 |          2 | 2026-07-30 |        3100 |
|      10 |         10 | 2026-07-22 |        4500 |
+---------+------------+------------+-------------+




-- -7. Retrieve all orders made by a specific customer.
select * from orders where CustomerID = 2;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       2 |          2 | 2026-08-24 |        2200 |
|       6 |          2 | 2026-08-14 |        2900 |
|       9 |          2 | 2026-07-30 |        3100 |
+---------+------------+------------+-------------+




-- 8. Update an order's total amount.
update orders set TotalAmount = 2800 where OrderID = 1;

select * from orders where OrderID = 1;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2026-08-26 |        2800 |
+---------+------------+------------+-------------+




-- 9. Delete an order using its OrderID.
delete from orders where OrderID = 5;

select * from orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2026-08-26 |        2800 |
|       2 |          2 | 2026-08-24 |        2200 |
|       3 |          3 | 2026-08-21 |        4800 |
|       4 |          4 | 2026-08-19 |        1500 |
|       6 |          2 | 2026-08-14 |        2900 |
|       7 |          7 | 2026-08-11 |        4100 |
|       8 |          8 | 2026-08-07 |        6200 |
|       9 |          2 | 2026-07-30 |        3100 |
|      10 |         10 | 2026-07-22 |        4500 |
+---------+------------+------------+-------------+




-- 10. Retrieve orders placed in the last 30 days.
select * from orders where OrderDate between "2026-08-01" and "2026-08-31";
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2026-08-26 |        3900 |
|       2 |          2 | 2026-08-24 |        2200 |
|       3 |          3 | 2026-08-21 |        4800 |
|       4 |          4 | 2026-08-19 |        1500 |
|       6 |          2 | 2026-08-14 |        2900 |
|       7 |          7 | 2026-08-11 |        4100 |
|       8 |          8 | 2026-08-07 |        6200 |
+---------+------------+------------+-------------+




-- 11. Retrieve the highest, lowest, and average order amount using aggregate functions.
select max(TotalAmount) as "Highest Amount", min(TotalAmount) as "Lowest Amount", avg(TotalAmount) as "Avg Amount" from orders;
+----------------+---------------+------------+
| Highest Amount | Lowest Amount | Avg Amount |
+----------------+---------------+------------+
| 6200           | 1500          | 3566.6667  |
+----------------+---------------+------------+













-- =======================================================================================================
-- 3 | PRODUCTS TABLE
-- =======================================================================================================

create table products (
    ProductID int auto_increment primary key,
    ProductName varchar(50) not null,
    Price int,
    Stock int
);




-- 12. Insert at least 5 sample products into the Products table.
insert into products (ProductName, Price, Stock)
values ('Laptop', 60000, 8),
('Keyboard', 1500, 20),
('Mouse', 800, 35),
('Headphones', 2200, 18),
('Monitor', 18000, 6),
('USB Hub', 700, 0),
('Webcam', 3000, 10),
('Speaker', 2500, 14),
('Printer', 13500, 5),
('Tablet', 24000, 7);




-- 13. Retrieve all products sorted by price in descending order.
select * from products order by Price desc;
+-----------+-------------+-------+-------+
| ProductID | ProductName | Price | Stock |
+-----------+-------------+-------+-------+
|         1 | Laptop      | 60000 |     8 |
|        10 | Tablet      | 24000 |     7 |
|         5 | Monitor     | 18000 |     6 |
|         9 | Printer     | 13500 |     5 |
|         7 | Webcam      |  3000 |    10 |
|         8 | Speaker     |  2500 |    14 |
|         4 | Headphones  |  2200 |    18 |
|         2 | Keyboard    |  1500 |    20 |
|         3 | Mouse       |   800 |    35 |
|         6 | USB Hub     |   700 |     0 |
+-----------+-------------+-------+-------+




-- 14. Update the price of a specific product.
update products set Price = 1200 where ProductID = 3;

select * from products where ProductID = 3;
+-----------+-------------+-------+-------+
| ProductID | ProductName | Price | Stock |
+-----------+-------------+-------+-------+
|         3 | Mouse       |  1200 |    35 |
+-----------+-------------+-------+-------+




-- 15. Delete a product if it's out of stock.
delete from products where Stock = 0;

select * from products;
+-----------+-------------+-------+-------+
| ProductID | ProductName | Price | Stock |
+-----------+-------------+-------+-------+
|         1 | Laptop      | 60000 |     8 |
|         2 | Keyboard    |  1500 |    20 |
|         3 | Mouse       |  1200 |    35 |
|         4 | Headphones  |  2200 |    18 |
|         5 | Monitor     | 18000 |     6 |
|         7 | Webcam      |  3000 |    10 |
|         8 | Speaker     |  2500 |    14 |
|         9 | Printer     | 13500 |     5 |
|        10 | Tablet      | 24000 |     7 |
+-----------+-------------+-------+-------+




-- 16. Retrieve products whose price is between 500 and 2000.
select * from products where Price between 500 and 2000;
+-----------+-------------+-------+-------+
| ProductID | ProductName | Price | Stock |
+-----------+-------------+-------+-------+
|         2 | Keyboard    |  1500 |    20 |
|         3 | Mouse       |  1200 |    35 |
+-----------+-------------+-------+-------+




-- 17. Retrieve the most expensive and cheapest product using MAX() and MIN().
select * from products order by Price desc limit 1;
+-----------+-------------+-------+-------+
| ProductID | ProductName | Price | Stock |
+-----------+-------------+-------+-------+
|         1 | Laptop      | 60000 |     8 |
+-----------+-------------+-------+-------+

select * from products order by Price limit 1; 
+-----------+-------------+-------+-------+
| ProductID | ProductName | Price | Stock |
+-----------+-------------+-------+-------+
|         3 | Mouse       |  1200 |    35 |
+-----------+-------------+-------+-------+

















-- =======================================================================================================
-- 4 | ORDERDETAILS TABLE
-- =======================================================================================================

create table orderdetails (
    OrderdetailsID int auto_increment primary key,
    OrderID int,
    ProductID int,
    Quantity int,
    SubTotal int,

    foreign key (OrderID) references orders(OrderID),
    foreign key (ProductID) references products(ProductID)
); 




-- 18. Insert at least 5 sample records into the OrderDetails table.
insert into orderdetails (OrderID, ProductID, Quantity, SubTotal)
values (1, 1, 1, 60000),
(2, 2, 3, 4500),
(3, 3, 4, 3200),
(4, 4, 2, 4400),
(1, 5, 1, 18000),
(3, 2, 2, 3000),
(7, 7, 3, 9000),
(8, 8, 2, 5000),
(3, 4, 1, 2200),
(10, 2, 4, 6000);

select * from orderdetails;
+----------------+---------+-----------+----------+----------+
| OrderdetailsID | OrderID | ProductID | Quantity | SubTotal |
+----------------+---------+-----------+----------+----------+
|              1 |       1 |         1 |        1 |    60000 |
|              2 |       2 |         2 |        3 |     4500 |
|              3 |       3 |         3 |        4 |     3200 |
|              4 |       4 |         4 |        2 |     4400 |
|              5 |       1 |         5 |        1 |    18000 |
|              6 |       3 |         2 |        2 |     3000 |
|              7 |       7 |         7 |        3 |     9000 |
|              8 |       8 |         8 |        2 |     5000 |
|              9 |       3 |         4 |        1 |     2200 |
|             10 |      10 |         2 |        4 |     6000 |
+----------------+---------+-----------+----------+----------+




-- 19. Retrieve all order details for a specific order.
select * from orderdetails where OrderID = 3;
+----------------+---------+-----------+----------+----------+
| OrderdetailsID | OrderID | ProductID | Quantity | SubTotal |
+----------------+---------+-----------+----------+----------+
|              3 |       3 |         3 |        4 |     3200 |
|              6 |       3 |         2 |        2 |     3000 |
|              9 |       3 |         4 |        1 |     2200 |
+----------------+---------+-----------+----------+----------+




-- 20. Calculate the total revenue generated from all orders using SUM().
select sum(SubTotal) as "Total_Revenue" from orderdetails;
+---------------+
| Total_Revenue |
+---------------+
|        115300 |
+---------------+




-- 21. Retrieve the top 3 most ordered products.
select ProductID, sum(Quantity) as "Total_Ordered" from orderdetails group by ProductID order by Total_Ordered desc limit 3;
+-----------+---------------+
| ProductID | Total_Ordered |
+-----------+---------------+
|         2 |             9 |
|         3 |             4 |
|         4 |             3 |
+-----------+---------------+




-- 22. Count how many times a specific product has been sold using COUNT().
select productID, count(*) as "Times_Sold" from orderdetails group by ProductID; 
+-----------+------------+
| productID | Times_Sold |
+-----------+------------+
|         1 |          1 |
|         2 |          3 |
|         3 |          1 |
|         4 |          2 |
|         5 |          1 |
|         7 |          1 |
|         8 |          1 |
+-----------+------------+