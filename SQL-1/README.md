# 🐬 SQL Database Project

<div align="center">

# 📊 SQL Database & Query Practice

### A complete MySQL project for database creation, relational data management, records, and practical SQL queries.

<br>

**👨‍💻 Author**

# Prit Baldha

<br>

![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Queries-336791?style=for-the-badge)
![Database](https://img.shields.io/badge/Project-Database-0F766E?style=for-the-badge)

</div>

---

## 📌 About

This repository contains a structured **MySQL database project** created to practice and demonstrate important SQL concepts through a practical relational database.

The project includes database and table creation, sample records, and queries for retrieving and analyzing information. The database follows a simple **customer → order → order details → product** relationship, making it useful for learning how multiple related tables work together.

The main SQL script is:

```text
P-1.sql
```

The project is suitable for **SQL beginners, database practice, college assignments, and MySQL Workbench demonstrations**.

---

## 🎯 Project Goals

The main goals of this project are to:

- 🗄️ Understand relational database structure
- 🏗️ Create databases and tables using SQL
- 🔑 Work with primary and foreign key relationships
- 📝 Insert and manage records
- 🔎 Retrieve useful information using `SELECT`
- 🎯 Filter records with `WHERE`
- 📊 Group and summarize information
- ↕️ Sort query results
- 🔗 Retrieve data from multiple related tables
- 🧮 Practice aggregate functions
- ✏️ Understand data modification operations
- 🧠 Build confidence writing practical SQL queries

---

## 🧰 Technologies Used

| Technology | Purpose |
|---|---|
| 🐬 **MySQL** | Relational database management system |
| 💻 **SQL** | Database creation and data manipulation |
| 🛠️ **MySQL Workbench** | SQL development and query execution |
| 📄 **P-1.sql** | Main database and query script |
| 📘 **Markdown** | Project documentation |

---

## 🗂️ Database Structure

The project uses four main relational tables:

```text
                    ┌───────────────┐
                    │   Customers   │
                    └───────┬───────┘
                            │
                            │ Customer ID
                            ▼
                    ┌───────────────┐
                    │     Orders    │
                    └───────┬───────┘
                            │
                            │ Order ID
                            ▼
                    ┌───────────────┐
                    │ Order Details │
                    └───────┬───────┘
                            │
                            │ Product ID
                            ▼
                    ┌───────────────┐
                    │   Products    │
                    └───────────────┘
```

### 📋 Tables

#### 👤 `Customers`

Stores customer-related information.

Typical use:

- Customer identification
- Customer details
- Connecting customers with their orders

#### 🛒 `orders`

Stores order-level information.

Typical use:

- Order identification
- Customer-order relationships
- Order dates and related order information

#### 📦 `products`

Stores product information.

Typical use:

- Product identification
- Product names
- Product categories
- Product prices

#### 🧾 `orderdetails`

Connects orders and products.

This table is important because it represents which products belong to which orders and allows the database to model a many-to-many style relationship between orders and products.

---

## 🔗 Relationships

The database demonstrates relational database concepts through table relationships.

### Customer → Orders

One customer can have multiple orders.

```text
Customers
    │
    └───< Orders
```

### Orders → Order Details

One order can contain multiple order-detail records.

```text
Orders
    │
    └───< OrderDetails
```

### Products → Order Details

One product can appear in multiple order-detail records.

```text
Products
    │
    └───< OrderDetails
```

Together, these relationships allow the database to represent real-world purchasing information in a structured way.

---

## 📁 Project Structure

```text
SQL-Database-Project/
│
├── 📄 P-1.sql
│   ├── Database setup
│   ├── Table definitions
│   ├── Records
│   └── SQL queries
│
└── 📘 README.md
    └── Project documentation
```

---

## 🚀 Getting Started

Follow these steps to run the project locally.

### 1️⃣ Install MySQL

Install:

- MySQL Server
- MySQL Workbench

You can use another MySQL-compatible SQL editor if preferred.

---

### 2️⃣ Open the SQL File

Open the following file in MySQL Workbench:

```text
P-1.sql
```

---

### 3️⃣ Connect to MySQL

Start your MySQL server and connect to your local database server from MySQL Workbench.

---

### 4️⃣ Execute the Script

Run the SQL statements in the script.

If the script contains database creation, execute that first and then select the created database before running the remaining statements.

You can also execute the script from the MySQL command line:

```sql
SOURCE P-1.sql;
```

---

## 🧱 Database Creation

A typical database workflow begins with creating a database:

```sql
CREATE DATABASE database_name;
```

Then select it:

```sql
USE database_name;
```

This makes the selected database the active database for subsequent table operations.

---

## 🏗️ Table Creation

The project demonstrates how relational tables are created using `CREATE TABLE`.

A simplified example:

```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);
```

The exact table definitions and records used for this project are available in `P-1.sql`.

---

## 🔑 Keys & Relationships

Relational databases use keys to uniquely identify records and connect tables.

### Primary Key

A primary key uniquely identifies each record in a table.

Example:

```sql
product_id INT PRIMARY KEY
```

### Foreign Key

A foreign key connects a record to a related record in another table.

For example:

```text
Customers
   ↓
Orders
   ↓
OrderDetails
   ↓
Products
```

This structure helps maintain meaningful relationships between the stored data.

---

## 📝 Working With Records

The project includes sample records that can be used to practice data retrieval and analysis.

Records can be inserted using:

```sql
INSERT INTO table_name
VALUES (...);
```

Data can then be checked with:

```sql
SELECT * FROM table_name;
```

---

## 🔍 Data Retrieval

The `SELECT` statement is one of the most important SQL commands in the project.

Basic example:

```sql
SELECT *
FROM products;
```

You can also retrieve only selected columns:

```sql
SELECT product_name, price
FROM products;
```

---

## 🎯 Filtering Data

The `WHERE` clause allows specific records to be selected.

Example:

```sql
SELECT *
FROM products
WHERE price > 500;
```

This is useful when the database contains many records and only a specific group is required.

---

## ↕️ Sorting Results

Results can be sorted using `ORDER BY`.

Ascending:

```sql
SELECT *
FROM products
ORDER BY price ASC;
```

Descending:

```sql
SELECT *
FROM products
ORDER BY price DESC;
```

---

## 📊 Grouping Data

`GROUP BY` is useful when information needs to be summarized by a particular field.

Example:

```sql
SELECT category, COUNT(*)
FROM products
GROUP BY category;
```

This can be used to calculate summaries such as the number of products in each category.

---

## 🧮 Aggregate Functions

SQL aggregate functions help calculate information from multiple records.

Common functions include:

| Function | Purpose |
|---|---|
| `COUNT()` | Counts records |
| `SUM()` | Calculates total |
| `AVG()` | Calculates average |
| `MIN()` | Finds minimum value |
| `MAX()` | Finds maximum value |

Example:

```sql
SELECT AVG(price)
FROM products;
```

---

## 🔗 JOIN Operations

One of the most important concepts demonstrated by a relational database is retrieving information from multiple tables.

A `JOIN` can connect related records.

Example:

```sql
SELECT *
FROM Customers
JOIN orders
ON Customers.customer_id = orders.customer_id;
```

JOINs make it possible to combine information stored in separate tables.

Common JOIN types include:

```text
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL JOIN
```

The appropriate JOIN depends on the information that needs to be returned.

---

## ✏️ Updating Data

SQL can also be used to modify existing records.

Example:

```sql
UPDATE products
SET price = 999
WHERE product_id = 1;
```

Always use an appropriate `WHERE` condition when updating selected records.

---

## 🗑️ Deleting Data

Records can be removed with `DELETE`.

Example:

```sql
DELETE FROM products
WHERE product_id = 1;
```

A `WHERE` condition should be used carefully to avoid deleting unintended records.

---

## 🧠 SQL Learning Flow

This project follows a practical learning sequence:

```text
📌 Create Database
        ↓
📋 Create Tables
        ↓
🔑 Define Keys
        ↓
🔗 Establish Relationships
        ↓
📝 Insert Records
        ↓
🔎 Retrieve Data
        ↓
🎯 Filter Data
        ↓
↕️ Sort Data
        ↓
📊 Group Data
        ↓
🧮 Analyze Data
        ↓
🔗 Join Tables
        ↓
✏️ Modify Records
```

---

## 📚 Concepts Practiced

This project provides practice with the following SQL concepts:

### 🗄️ Database Management

- `CREATE DATABASE`
- `USE`
- Database selection

### 🏗️ Table Management

- `CREATE TABLE`
- Column definitions
- Data types
- Primary keys
- Foreign keys

### 📝 Data Manipulation

- `INSERT`
- `UPDATE`
- `DELETE`

### 🔎 Data Querying

- `SELECT`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `HAVING`

### 🔗 Relational Queries

- `INNER JOIN`
- Other JOIN concepts
- Connecting related tables

### 🧮 Data Analysis

- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`

---

## 💻 Example Query Section

The project can be used to practice queries such as:

```sql
-- Display all products
SELECT * FROM products;

-- Display selected product information
SELECT product_name, price
FROM products;

-- Filter products
SELECT *
FROM products
WHERE price > 500;

-- Sort products by price
SELECT *
FROM products
ORDER BY price DESC;

-- Count products
SELECT COUNT(*)
FROM products;
```

These examples are for learning purposes. The complete queries and records for this project are contained in `P-1.sql`.

---

## 📈 Why This Project Is Useful

This project is useful for understanding how SQL is applied to a real relational database instead of learning individual commands in isolation.

By working with customers, orders, order details, and products, you can understand how information is separated into tables and then combined when required.

It also provides a good foundation for larger database projects such as:

- 🛒 E-commerce systems
- 🏪 Inventory management systems
- 🧾 Billing systems
- 📦 Order management systems
- 👥 Customer management systems
- 📊 Business analytics systems

---

## 🧪 Testing The Project

After running the SQL script, verify that the tables were created successfully:

```sql
SHOW TABLES;
```

Then inspect individual tables:

```sql
SELECT * FROM Customers;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM orderdetails;
```

You can also test individual queries from the SQL file and compare their output with the expected results.

---

## 🛠️ Recommended Environment

For the best experience, use:

```text
Operating System : Windows / macOS / Linux
Database         : MySQL
SQL Editor       : MySQL Workbench
Language         : SQL
Project File     : P-1.sql
```

---

## ⚠️ Important Notes

- Make sure the MySQL server is running before executing queries.
- Execute database and table creation statements before dependent queries.
- Select the correct database using `USE`.
- Check table names carefully because naming and case sensitivity can vary by environment.
- Use `WHERE` conditions carefully with `UPDATE` and `DELETE`.
- Execute the SQL file in the intended order when foreign-key relationships are involved.
- The sample records are intended for practice and demonstration.

---

## 🎓 Learning Outcomes

After completing this project, you should have a stronger understanding of:

- How relational databases are structured
- How SQL tables store information
- How primary and foreign keys work
- How tables are connected
- How to insert records
- How to retrieve records
- How to filter and sort results
- How to group information
- How aggregate functions work
- How JOIN queries combine related data
- How to update and delete records
- How SQL can be used for practical data analysis

---

## 🌟 Project Highlights

```text
🐬 MySQL Based
📊 Relational Database
📋 Multiple Related Tables
🔑 Primary & Foreign Keys
📝 Sample Records
🔎 Practical Queries
🔗 JOIN Practice
🧮 Aggregate Functions
📈 Data Analysis
🎓 Beginner Friendly
```

---

## 📄 Main File

### `P-1.sql`

This is the main project file. It contains the SQL required to create and work with the database, including its tables, records, and queries.

Keep this file together with the README when sharing or submitting the project.

---

## 👨‍💻 Author

<div align="center">

# Prit Baldha

### 🐬 MySQL & SQL Database Project

A practical database project created for learning, practicing, and demonstrating SQL concepts.

<br>

**Database • SQL • MySQL • Queries • Data Management**

</div>

---

## ⭐ Support

If you find this project useful for learning SQL, consider giving the repository a ⭐.

It can also be used as a starting point for building more advanced database projects.

---

<div align="center">

### 🐬 Built with MySQL

**Designed for learning. Built for practice.**

<br>

**© Prit Baldha**

</div>
