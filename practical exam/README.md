# 🛒 E-Commerce SQL Database Project

> **A complete MySQL 8.0+ database project for practicing real-world SQL concepts, database relationships, data analysis, joins, subqueries, date functions, string functions, window functions, and CASE expressions.**

---

## 📌 Project Overview

This project is a complete **E-Commerce Database Management System** built using **MySQL**.

The database represents the core operations of an online shopping platform. It stores information about:

- 🗂️ Product categories
- 📦 Products
- 👤 Customers
- 🛍️ Orders
- 🧾 Order items
- 💳 Payments
- 🚚 Shipping

The project is designed not only to create a relational database, but also to provide practical SQL exercises using realistic business scenarios.

The SQL file contains the complete database structure, sample data, relationships, CRUD operations, filtering, grouping, aggregate functions, joins, subqueries, date and time functions, string manipulation, window functions, and conditional logic using `CASE`.

---

## 🎯 Project Objectives

The main objectives of this project are:

- Build a properly structured relational database.
- Understand how multiple tables are connected.
- Practice Primary Keys and Foreign Keys.
- Insert and manage realistic sample records.
- Perform CRUD operations.
- Filter data using `WHERE`, `HAVING`, and `LIMIT`.
- Use SQL operators such as `AND`, `OR`, and `NOT`.
- Sort and group business data.
- Perform calculations using aggregate functions.
- Understand different types of SQL JOINs.
- Work with subqueries.
- Manipulate dates and strings.
- Analyze data using window functions.
- Use `RANK()` and running totals.
- Apply SQL `CASE` expressions for business classification.
- Practice real-world e-commerce analysis queries.

---

## 🗄️ Database Information

| Property | Details |
|---|---|
| 🗃️ Database Name | `ecommerce_db` |
| 💻 SQL Language | MySQL |
| ⚙️ Recommended Version | MySQL 8.0+ |
| 🏗️ Storage Engine | InnoDB |
| 📄 Main SQL File | `main.sql` |
| 📊 Project Type | E-Commerce Database |
| 🔑 Key Concepts | PK, FK, JOINs, Subqueries, Aggregation, Windows |
| 👨‍💻 Author | **Prit Baldha** |

---

# 🏗️ Database Schema

The project contains **7 related tables**.

### 📋 Tables

```text
categories
    │
    └──────────────< products
                         │
                         └──────────────< order_items >────────────── orders
                                                                         │
                         customers >────────────────────────────────────┘
                                                                         │
                         payments >──────────────────────────────────────┘
                                                                         │
                         shipping >──────────────────────────────────────┘
```

---

## 1. 🗂️ Categories

The `categories` table stores the different product categories available in the store.

### Columns

| Column | Data Type | Description |
|---|---|---|
| `category_id` | `INT` | Primary Key |
| `category_name` | `VARCHAR(100)` | Unique category name |

### Relationship

One category can contain many products.

```text
categories.category_id
        ↓
products.category_id
```

---

## 2. 📦 Products

The `products` table stores information about products available in the store.

### Columns

| Column | Data Type | Description |
|---|---|---|
| `product_id` | `INT` | Primary Key |
| `name` | `VARCHAR(150)` | Product name |
| `category_id` | `INT` | Foreign Key |
| `price` | `DECIMAL(10,2)` | Product price |
| `stock_quantity` | `INT` | Available stock |
| `added_date` | `DATE` | Product creation date |

### Relationship

`category_id` references:

```text
categories.category_id
```

This creates a **one-to-many relationship** between categories and products.

---

## 3. 👤 Customers

The `customers` table stores customer information.

### Columns

| Column | Data Type | Description |
|---|---|---|
| `customer_id` | `INT` | Primary Key |
| `name` | `VARCHAR(150)` | Customer name |
| `email` | `VARCHAR(150)` | Customer email |
| `phone_number` | `VARCHAR(20)` | Contact number |
| `address` | `VARCHAR(255)` | Customer address |
| `registration_date` | `DATE` | Registration date |

The `email` column is unique and the project also contains a missing email value for practicing `COALESCE()`.

### Relationship

One customer can place many orders.

```text
customers.customer_id
        ↓
orders.customer_id
```

---

## 4. 🛍️ Orders

The `orders` table stores customer order information.

### Columns

| Column | Data Type | Description |
|---|---|---|
| `order_id` | `INT` | Primary Key |
| `customer_id` | `INT` | Foreign Key |
| `order_date` | `DATE` | Date of order |
| `total_amount` | `DECIMAL(12,2)` | Total order amount |
| `status` | `ENUM` | Pending, Shipped, Delivered, Cancelled |

### Order Status

```text
Pending
Shipped
Delivered
Cancelled
```

Each order belongs to one customer.

---

## 5. 🧾 Order Items

The `order_items` table stores individual products included in an order.

### Columns

| Column | Data Type | Description |
|---|---|---|
| `order_item_id` | `INT` | Primary Key |
| `order_id` | `INT` | Foreign Key |
| `product_id` | `INT` | Foreign Key |
| `quantity` | `INT` | Number of units |
| `subtotal` | `DECIMAL(12,2)` | Item subtotal |

This table connects orders and products.

```text
orders
   ↓
order_items
   ↑
products
```

This creates a practical **many-to-many relationship** between orders and products through the `order_items` table.

---

## 6. 💳 Payments

The `payments` table stores payment information for orders.

### Columns

| Column | Data Type | Description |
|---|---|---|
| `payment_id` | `INT` | Primary Key |
| `order_id` | `INT` | Foreign Key |
| `payment_date` | `DATE` | Payment date |
| `payment_method` | `ENUM` | Credit Card, PayPal, UPI |
| `payment_status` | `ENUM` | Paid, Pending, Failed |

### Payment Methods

```text
Credit Card
PayPal
UPI
```

### Payment Status

```text
Paid
Pending
Failed
```

---

## 7. 🚚 Shipping

The `shipping` table stores shipping and delivery information.

### Columns

| Column | Data Type | Description |
|---|---|---|
| `shipping_id` | `INT` | Primary Key |
| `order_id` | `INT` | Foreign Key |
| `shipping_date` | `DATE` | Date shipped |
| `delivery_date` | `DATE` | Date delivered |
| `shipping_status` | `ENUM` | Dispatched, In Transit, Delivered |

### Shipping Status

```text
Dispatched
In Transit
Delivered
```

The table also contains `NULL` shipping and delivery dates for orders that have not completed delivery, which is useful for practicing date functions and `NULL` handling.

---

# 🔗 Table Relationships

The database uses Foreign Keys to maintain relationships between tables.

### Category → Products

```text
categories.category_id
        ↓
products.category_id
```

### Customer → Orders

```text
customers.customer_id
        ↓
orders.customer_id
```

### Order → Order Items

```text
orders.order_id
        ↓
order_items.order_id
```

### Product → Order Items

```text
products.product_id
        ↓
order_items.product_id
```

### Order → Payments

```text
orders.order_id
        ↓
payments.order_id
```

### Order → Shipping

```text
orders.order_id
        ↓
shipping.order_id
```

---

# 🧩 SQL Concepts Covered

This project covers a wide range of important SQL concepts.

## 1. 🏗️ Database & Table Creation

The project demonstrates:

- `CREATE DATABASE`
- `USE`
- `CREATE TABLE`
- `PRIMARY KEY`
- `FOREIGN KEY`
- `AUTO_INCREMENT`
- `NOT NULL`
- `UNIQUE`
- `DEFAULT`
- `CHECK`
- `ENUM`
- `DECIMAL`
- `DATE`
- `VARCHAR`
- InnoDB storage engine

---

## 2. ✏️ CRUD Operations

CRUD stands for:

```text
C → Create
R → Read
U → Update
D → Delete
```

### Create

Used to insert new records:

```sql
INSERT INTO products
    (name, category_id, price, stock_quantity, added_date)
VALUES
    ('USB-C Fast Charger', 1, 1499.00, 100, CURDATE());
```

### Read

Used to retrieve records:

```sql
SELECT *
FROM products;
```

### Update

Used to modify existing records:

```sql
UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE product_id = 1
  AND stock_quantity >= 2;
```

### Delete

Used to remove old cancelled orders:

```sql
DELETE FROM orders
WHERE status = 'Cancelled'
  AND order_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY);
```

---

# 🔎 WHERE, HAVING & LIMIT

The project demonstrates filtering at different stages of a query.

### WHERE

Used to filter individual rows.

Example:

```sql
SELECT *
FROM orders
WHERE status = 'Pending';
```

### HAVING

Used to filter grouped results.

Example:

```sql
SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 3;
```

### LIMIT

Used to restrict the number of returned rows.

Example:

```sql
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;
```

---

# ⚡ SQL Operators

The project demonstrates:

### AND

```sql
WHERE status = 'Pending'
  AND payment_status = 'Paid';
```

### OR

```sql
WHERE registration_date > '2022-12-31'
   OR total_purchases > 10000;
```

### NOT

```sql
WHERE NOT stock_quantity = 0;
```

These operators are useful for combining multiple conditions.

---

# 📊 Sorting & Grouping

## ORDER BY

Products can be sorted by price:

```sql
SELECT
    product_id,
    name,
    price
FROM products
ORDER BY price DESC;
```

## GROUP BY

Orders can be grouped by customer:

```sql
SELECT
    customer_id,
    COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id;
```

Grouping is especially useful for business reporting and analysis.

---

# ➕ Aggregate Functions

The project uses the following aggregate functions:

| Function | Purpose |
|---|---|
| `SUM()` | Calculates total |
| `AVG()` | Calculates average |
| `MAX()` | Finds maximum |
| `MIN()` | Finds minimum |
| `COUNT()` | Counts records |

### Example

```sql
SELECT
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS average_order_value,
    MAX(total_amount) AS highest_order,
    MIN(total_amount) AS lowest_order,
    COUNT(order_id) AS total_orders
FROM orders;
```

---

# 🔗 SQL JOINs

JOINs are one of the major parts of this project.

## INNER JOIN

Used to retrieve matching records from both tables.

Example:

```sql
SELECT
    p.product_id,
    p.name AS product_name,
    c.category_name,
    p.price
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id;
```

---

## LEFT JOIN

Returns all records from the left table and matching records from the right table.

Example:

```sql
SELECT
    o.order_id,
    c.name AS customer_name,
    o.total_amount
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id;
```

---

## RIGHT JOIN

Returns all records from the right table and matching records from the left table.

Example:

```sql
SELECT
    o.order_id,
    s.shipping_id,
    s.shipping_status
FROM orders o
RIGHT JOIN shipping s
    ON o.order_id = s.order_id;
```

---

## FULL OUTER JOIN

MySQL does not directly provide `FULL OUTER JOIN`.

Therefore, the project demonstrates the MySQL-compatible approach using:

```text
LEFT JOIN
+
UNION
+
RIGHT JOIN
```

Example structure:

```sql
SELECT ...
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id

UNION

SELECT ...
FROM customers c
RIGHT JOIN orders o
    ON c.customer_id = o.customer_id;
```

This allows unmatched rows from both sides to be included.

---

# 🔍 Subqueries

The project includes practical subquery examples.

### Orders from customers registered after 2022

```sql
SELECT
    order_id,
    customer_id,
    order_date,
    total_amount
FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM customers
    WHERE registration_date > '2022-12-31'
);
```

### Customer with the highest spending

The project uses a subquery to compare customer spending and identify the highest-spending customer.

### Products never ordered

The project also demonstrates how to find products that do not appear in the `order_items` table.

These examples help develop an understanding of nested queries and multi-step data analysis.

---

# 📅 Date & Time Functions

The project demonstrates several important MySQL date functions.

## MONTH()

Used to extract the month from an order date:

```sql
SELECT
    MONTH(order_date) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY MONTH(order_date);
```

## YEAR()

Used to identify the order year:

```sql
SELECT
    YEAR(order_date) AS order_year,
    COUNT(*) AS total_orders
FROM orders
GROUP BY YEAR(order_date);
```

## DATEDIFF()

Used to calculate delivery duration:

```sql
SELECT
    shipping_id,
    order_id,
    DATEDIFF(delivery_date, shipping_date) AS delivery_days
FROM shipping;
```

## DATE_FORMAT()

Used to display dates in a custom format:

```sql
SELECT
    DATE_FORMAT(order_date, '%d-%m-%Y') AS formatted_order_date
FROM orders;
```

## DATE_SUB()

Used to work with relative dates:

```sql
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);
```

---

# 🔤 String Manipulation Functions

The project includes practical string operations.

## UPPER()

Converts product names to uppercase.

```sql
SELECT
    UPPER(name) AS uppercase_product_name
FROM products;
```

## TRIM()

Removes unnecessary spaces from customer names.

```sql
SELECT
    TRIM(name) AS customer_name
FROM customers;
```

## COALESCE()

Replaces missing email values.

```sql
SELECT
    COALESCE(email, 'Not Provided') AS email
FROM customers;
```

These functions are useful for cleaning and standardizing business data.

---

# 🪟 Window Functions

Window functions are used for advanced analysis without collapsing individual rows.

This project includes:

- `RANK()`
- `SUM() OVER()`
- `COUNT() OVER()`
- `PARTITION BY`
- `ORDER BY` inside window functions
- Running totals
- Cumulative totals
- `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`

---

## 🏆 Customer Ranking

Customers are ranked based on their total spending.

```sql
RANK() OVER (
    ORDER BY total_spending DESC
) AS spending_rank
```

This helps identify the highest-value customers.

---

## 📈 Cumulative Revenue

The project calculates cumulative monthly revenue.

```sql
SUM(monthly_revenue) OVER (
    ORDER BY order_month
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS cumulative_revenue
```

This is useful for analyzing revenue growth over time.

---

## 🔢 Running Order Count

The project also calculates the running number of orders:

```sql
COUNT(*) OVER (
    ORDER BY order_date, order_id
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS running_order_count
```

---

## 🔄 UNBOUNDED PRECEDING

The following window frame:

```sql
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
```

means:

```text
Start from the first row
        ↓
Include every previous row
        ↓
Include the current row
```

This is commonly used for running totals and cumulative calculations.

---

# 🧠 SQL CASE Expressions

The project uses `CASE` for business classification.

## 🏅 Customer Loyalty Status

Customers are classified according to total spending:

| Spending | Status |
|---|---|
| Above ₹50,000 | 🥇 Gold |
| ₹20,000 to ₹50,000 | 🥈 Silver |
| Otherwise | 🥉 Bronze |

Example:

```sql
CASE
    WHEN total_spent > 50000 THEN 'Gold'
    WHEN total_spent BETWEEN 20000 AND 50000 THEN 'Silver'
    ELSE 'Bronze'
END AS Loyalty_Status
```

---

## 📦 Product Sales Category

Products are classified according to units sold:

| Units Sold | Category |
|---|---|
| More than 500 | 🔥 Best Seller |
| 200 to 500 | ⭐ Popular |
| Otherwise | 📦 Regular |

Example:

```sql
CASE
    WHEN units_sold > 500 THEN 'Best Seller'
    WHEN units_sold BETWEEN 200 AND 500 THEN 'Popular'
    ELSE 'Regular'
END AS product_category
```

---

# 💼 Real-World Business Questions

The project is built around practical e-commerce questions such as:

### 📦 Product Analysis

- Which products are the most expensive?
- Which products are out of stock?
- Which products have never been ordered?
- Which product has the highest number of units sold?
- Which products belong to each category?

### 👤 Customer Analysis

- Which customers have placed the most orders?
- Which customer has spent the most?
- Which customers registered after 2022?
- Which customers have never placed an order?
- What is the loyalty status of each customer?

### 🛍️ Order Analysis

- Which orders were placed in the last six months?
- What is the average order value?
- How many orders are pending?
- How many orders are delivered?
- What is the running order count?

### 💰 Revenue Analysis

- What is the total store revenue?
- What is the revenue generated by each category?
- What is the monthly revenue?
- What is the cumulative revenue?
- Which category generated the highest revenue?

### 🚚 Shipping Analysis

- Which orders have not been shipped?
- How many days did delivery take?
- Which deliveries took the longest?
- Which shipments are currently in transit?

### 💳 Payment Analysis

- Which orders were paid?
- Which payments are pending?
- Which payment methods are being used?
- Which orders have failed or pending payments?

---

# 📁 Project Structure

```text
E-Commerce-SQL-Project/
│
├── 📄 main.sql
│
└── 📄 README.md
```

---

# ⚙️ Requirements

To run this project, you need:

- 💻 MySQL Server
- 🖥️ MySQL Workbench or another MySQL-compatible SQL editor
- 📚 Basic understanding of SQL
- ⚙️ MySQL 8.0 or later recommended

---

# 🚀 How to Run the Project

## Step 1: Install MySQL

Install MySQL Server and optionally MySQL Workbench.

---

## Step 2: Open the SQL File

Open:

```text
main.sql
```

in MySQL Workbench or your preferred MySQL editor.

---

## Step 3: Select MySQL 8.0+

The project uses features such as:

- CTEs
- Window functions
- `RANK()`
- `ROWS BETWEEN`
- `ENUM`
- `CHECK`

Therefore, **MySQL 8.0+** is recommended.

---

## Step 4: Execute the Script

Run the SQL script from the beginning.

The script creates:

```text
ecommerce_db
```

and then creates all required tables.

---

## Step 5: Verify the Tables

After execution, run:

```sql
USE ecommerce_db;

SHOW TABLES;
```

You should see:

```text
categories
customers
order_items
orders
payments
products
shipping
```

---

# 🔎 Useful Verification Queries

### Show all categories

```sql
SELECT *
FROM categories;
```

### Show all products

```sql
SELECT *
FROM products;
```

### Show all customers

```sql
SELECT *
FROM customers;
```

### Show all orders

```sql
SELECT *
FROM orders;
```

### Show all order items

```sql
SELECT *
FROM order_items;
```

### Show all payments

```sql
SELECT *
FROM payments;
```

### Show all shipping records

```sql
SELECT *
FROM shipping;
```

---

# 🧪 Practice Workflow

A good way to study this project is to follow the SQL concepts in this order:

```text
1. Database Creation
       ↓
2. Table Creation
       ↓
3. Primary & Foreign Keys
       ↓
4. Insert Data
       ↓
5. SELECT
       ↓
6. WHERE / HAVING / LIMIT
       ↓
7. AND / OR / NOT
       ↓
8. ORDER BY / GROUP BY
       ↓
9. Aggregate Functions
       ↓
10. JOINs
       ↓
11. Subqueries
       ↓
12. Date Functions
       ↓
13. String Functions
       ↓
14. Window Functions
       ↓
15. CASE Expressions
       ↓
16. Business Analysis
```

This progression makes the project useful for both **SQL learning and practical database analysis**.

---

# 📌 Key SQL Functions Used

```text
CREATE DATABASE
CREATE TABLE
INSERT INTO
SELECT
UPDATE
DELETE

WHERE
HAVING
LIMIT
ORDER BY
GROUP BY

AND
OR
NOT

INNER JOIN
LEFT JOIN
RIGHT JOIN
UNION

IN
NOT IN

SUM()
AVG()
MAX()
MIN()
COUNT()

MONTH()
YEAR()
DATEDIFF()
DATE_FORMAT()
DATE_SUB()
CURDATE()

UPPER()
TRIM()
COALESCE()

RANK()
SUM() OVER()
COUNT() OVER()
PARTITION BY
ROWS BETWEEN
UNBOUNDED PRECEDING

CASE
WHEN
THEN
ELSE
END
```

---

# 🔐 Data Integrity

The database uses relational constraints to help maintain data consistency.

### Primary Keys

Every main table has a unique identifier.

Examples:

```text
category_id
product_id
customer_id
order_id
order_item_id
payment_id
shipping_id
```

### Foreign Keys

Relationships are enforced using Foreign Keys.

Examples:

```text
products.category_id
orders.customer_id
order_items.order_id
order_items.product_id
payments.order_id
shipping.order_id
```

### Constraints

The project uses:

```text
PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
DEFAULT
CHECK
ENUM
```

This makes the database structure closer to a real production-style relational database.

---

# 🔄 Cascade & Restrict Behavior

The project also demonstrates Foreign Key actions.

### ON DELETE CASCADE

For dependent records such as:

```text
orders → order_items
orders → payments
orders → shipping
```

deleting an order can automatically remove its dependent records.

### ON DELETE RESTRICT

For product and category relationships, restrictive behavior helps prevent accidental deletion of records that are still referenced.

---

# 📊 Sample Business Analysis

The database can be used to create reports such as:

```text
Customer Spending Report
        ↓
Customer Ranking
        ↓
Loyalty Classification
        ↓
Gold / Silver / Bronze
```

and:

```text
Product Sales
        ↓
Units Sold
        ↓
CASE Classification
        ↓
Best Seller / Popular / Regular
```

and:

```text
Monthly Revenue
        ↓
Window Function
        ↓
Cumulative Revenue
        ↓
Revenue Growth Analysis
```

---

# 🎓 Learning Outcomes

After completing this project, you should have practical experience with:

- Designing relational database schemas
- Creating multiple related tables
- Working with Primary and Foreign Keys
- Inserting and managing data
- Writing filtering queries
- Performing grouped analysis
- Using aggregate functions
- Joining multiple tables
- Writing nested queries
- Working with dates
- Cleaning text data
- Handling `NULL` values
- Writing window functions
- Creating rankings
- Creating running totals
- Applying business rules using `CASE`
- Answering real-world business questions using SQL

---

# 🧑‍💻 Author

## **Prit Baldha**

👨‍💻 **SQL / Database Project**

📌 **Project:** E-Commerce Database Management System  
🗃️ **Database:** `ecommerce_db`  
💻 **Technology:** MySQL  
📄 **Main File:** `main.sql`

This project was created as a practical SQL database project to demonstrate database design, relational data management, querying, and business-oriented data analysis.

---

# ⭐ Project Highlights

```text
✅ 7 Relational Tables
✅ Primary & Foreign Keys
✅ Sample E-Commerce Dataset
✅ CRUD Operations
✅ Filtering & Sorting
✅ GROUP BY & HAVING
✅ Aggregate Functions
✅ INNER JOIN
✅ LEFT JOIN
✅ RIGHT JOIN
✅ FULL OUTER JOIN using UNION
✅ Subqueries
✅ Date & Time Functions
✅ String Functions
✅ NULL Handling
✅ Window Functions
✅ RANK()
✅ Running Totals
✅ Cumulative Revenue
✅ UNBOUNDED PRECEDING
✅ CASE Expressions
✅ Customer Loyalty Analysis
✅ Product Sales Classification
✅ Real-World Business Queries
```

---

# 🏁 Conclusion

This **E-Commerce SQL Database Project** provides a complete practical environment for learning and demonstrating important MySQL concepts.

Instead of practicing SQL only with isolated examples, this project connects multiple tables and uses realistic e-commerce scenarios. This makes it useful for:

- 📚 SQL exam preparation
- 🧑‍💻 Database practice
- 📊 Data analyst practice
- 💼 Portfolio projects
- 🎯 Interview preparation
- 🏗️ Relational database learning
- 📈 Business data analysis

The `main.sql` file contains the complete implementation, including database creation, table definitions, sample data, relationships, and practical SQL analysis queries.

---

## 📄 Main Project File

```text
main.sql
```

**Author:** Prit Baldha

⭐ If you find this project useful, feel free to use it as a foundation for your own SQL learning and database projects.
