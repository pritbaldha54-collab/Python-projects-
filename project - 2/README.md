# 🗄️ SQL Database Project

<div align="center">

# 📊 Database Management & SQL Practice Project

**A structured MySQL project containing database creation, table design, data insertion, and SQL query practice.**

<br>

![MySQL](https://img.shields.io/badge/MySQL-Database-blue?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Queries-orange?style=for-the-badge)
![Database](https://img.shields.io/badge/Database-Management-success?style=for-the-badge)
![Project](https://img.shields.io/badge/Project-Academic-purple?style=for-the-badge)

</div>

---

## 📌 Project Overview

This project is a **MySQL / SQL database project** created for learning, practicing, and demonstrating important SQL concepts.

The main SQL file, **`main.sql`**, contains the database-related implementation and query practice. It is designed to help understand how relational databases are created, populated, and queried using SQL.

The project focuses on writing practical SQL statements rather than only studying syntax theoretically.

### 🎯 Main Objectives

- 🗄️ Understand relational database structure
- 🏗️ Create and manage database tables
- 📝 Insert and manage records
- 🔍 Retrieve useful information using `SELECT`
- 🎯 Filter records using `WHERE`
- 🔢 Sort and organize results
- 📊 Perform aggregate calculations
- 🔗 Work with relationships between tables
- 🧩 Practice SQL queries on structured data
- 💡 Build a strong foundation for database development

---

## 🧰 Technologies Used

| Technology | Purpose |
|---|---|
| 🐬 **MySQL** | Relational database management system |
| 🧾 **SQL** | Database creation and querying |
| 💻 **MySQL Workbench / SQL Editor** | Writing and executing SQL |
| 📄 **main.sql** | Complete project SQL source file |

---

## 🗂️ Database Structure

The SQL file contains the following table definitions:

- `customers`
- `orders`
- `emp`

### 📥 Tables With Data

- `customers`
- `orders`
- `emp`

---

## 🔎 SQL Query Coverage

The project provides practical exposure to SQL queries and database operations.

### 1. 🏗️ Database & Table Creation

The project demonstrates how SQL can be used to define the structure of a relational database.

Typical concepts include:

```sql
CREATE DATABASE database_name;

CREATE TABLE table_name (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);
```

---

### 2. ➕ Insert Data

Records can be added to database tables using `INSERT`.

```sql
INSERT INTO table_name (id, name)
VALUES (1, 'Example');
```

This is useful for populating tables with sample or real-world style records.

---

### 3. 🔍 SELECT Queries

`SELECT` is used to retrieve information from database tables.

```sql
SELECT *
FROM table_name;
```

The project contains approximately **23 `SELECT` statements**, covering different retrieval and query scenarios.

---

### 4. 🎯 Filtering With WHERE

The `WHERE` clause helps retrieve only the records that satisfy a condition.

```sql
SELECT *
FROM table_name
WHERE condition;
```

Examples of conditions can include:

```sql
WHERE age > 18
WHERE city = 'Surat'
WHERE salary >= 30000
```

---

### 5. 🔢 Sorting With ORDER BY

`ORDER BY` can arrange query results in ascending or descending order.

```sql
SELECT *
FROM table_name
ORDER BY column_name ASC;
```

Or:

```sql
SELECT *
FROM table_name
ORDER BY column_name DESC;
```

---

### 6. 🧮 Aggregate Functions

SQL aggregate functions are useful for analyzing groups of records.

Common functions include:

- `COUNT()` 🔢
- `SUM()` 💰
- `AVG()` 📊
- `MIN()` ⬇️
- `MAX()` ⬆️

Example:

```sql
SELECT COUNT(*)
FROM table_name;
```

---

### 7. 🔗 JOIN Operations

When information is stored across multiple related tables, `JOIN` operations can combine the data.

The project contains approximately **9 JOIN statements**.

Common JOIN types include:

```sql
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL JOIN
```

Example:

```sql
SELECT a.column_name, b.column_name
FROM table_a a
INNER JOIN table_b b
ON a.id = b.id;
```

---

## 🧠 Concepts Practiced

This project can be used to practice the following important SQL concepts:

### 📌 Basic SQL

- `CREATE DATABASE`
- `CREATE TABLE`
- `INSERT INTO`
- `SELECT`
- `UPDATE`
- `DELETE`

### 📌 Data Filtering

- `WHERE`
- Comparison operators
- Logical operators
- `IN`
- `BETWEEN`
- `LIKE`
- `IS NULL`
- `IS NOT NULL`

### 📌 Result Management

- `ORDER BY`
- `DISTINCT`
- Column aliases
- Limiting query results

### 📌 Data Analysis

- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- `GROUP BY`
- `HAVING`

### 📌 Relational Queries

- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- Multi-table queries
- Primary and foreign key relationships

---

## 📁 Project File

The project is intentionally kept simple and easy to understand.

```text
SQL-Project/
│
├── 📄 main.sql
│
└── 📄 README.md
```

### `main.sql`

`main.sql` is the main SQL source file. It contains the database implementation, table definitions, data, and query practice used in this project.

---

## ▶️ How to Run the Project

### Step 1️⃣ Install MySQL

Install **MySQL Server** and optionally **MySQL Workbench**.

### Step 2️⃣ Open the SQL File

Open:

```text
main.sql
```

inside MySQL Workbench or another MySQL-compatible SQL editor.

### Step 3️⃣ Execute the Script

Run the SQL statements in the correct order.

For MySQL Workbench:

1. Open MySQL Workbench
2. Connect to your MySQL server
3. Open `main.sql`
4. Review the SQL statements
5. Execute the script
6. Refresh the database/schema
7. Run individual queries to inspect the results

---

## 💡 Example SQL Queries

### Display All Records

```sql
SELECT *
FROM table_name;
```

### Select Specific Columns

```sql
SELECT id, name
FROM table_name;
```

### Filter Records

```sql
SELECT *
FROM table_name
WHERE id > 5;
```

### Sort Records

```sql
SELECT *
FROM table_name
ORDER BY name ASC;
```

### Count Records

```sql
SELECT COUNT(*) AS total_records
FROM table_name;
```

### Group Records

```sql
SELECT category, COUNT(*) AS total
FROM table_name
GROUP BY category;
```

### Join Tables

```sql
SELECT a.name, b.value
FROM table_a a
JOIN table_b b
ON a.id = b.id;
```

> Replace the example table and column names with the actual names used in `main.sql`.

---

## 📈 Project Statistics

| Metric | Details |
|---|---:|
| 🗃️ Tables Defined | **3** |
| 📥 Tables With INSERT Statements | **3** |
| 🔎 SELECT Statements | **23** |
| 🔗 JOIN Statements | **9** |
| 👁️ Views | **0** |
| ⚙️ Procedures | **0** |
| 🧮 Functions | **0** |

---

## 🎓 Learning Outcomes

After working through this project, you should have a better understanding of how relational databases work and how SQL is used to interact with them.

You can practice:

- Creating structured databases
- Designing tables
- Storing records
- Retrieving information
- Filtering data
- Sorting results
- Performing calculations
- Combining related tables
- Writing more advanced SQL queries
- Understanding how database relationships work

The project is especially useful for **SQL practice, college practicals, database exams, and beginner-level database development**.

---

## 🧪 Practice Approach

For better learning, do not only execute the queries.

Try to:

1. Read the query carefully.
2. Predict the output.
3. Execute the query.
4. Compare your prediction with the actual result.
5. Modify one condition.
6. Execute it again.
7. Try writing the same result using a different SQL approach.

This method helps build actual SQL problem-solving skills.

---

## ⚠️ Important Notes

- Make sure you are connected to the correct MySQL server before execution.
- Run database and table creation statements before dependent queries.
- Check table and column names carefully.
- SQL syntax can vary between MySQL and other database systems.
- Always test `UPDATE` and `DELETE` statements carefully, especially when working with real data.
- Keep a backup of important databases before making destructive changes.

---

## 👨‍💻 Author

<div align="center">

# ✨ Prit Baldha

### 💻 SQL & Database Project

**Created with curiosity, practice, and a focus on learning SQL through practical implementation.**

📚 **Project Type:** SQL / MySQL Database Project  
🗄️ **Primary Technology:** MySQL  
📄 **Main File:** `main.sql`

</div>

---

## 🌟 Project Highlights

- 🗄️ Structured relational database implementation
- 📝 Practical SQL statements
- 🔍 Data retrieval and filtering
- 📊 Data analysis queries
- 🔗 Table relationships and JOIN operations
- 🎯 Beginner-friendly project structure
- 💻 Suitable for SQL practice and academic learning

---

## 📜 License

This project is intended for **educational and learning purposes**.

You are free to study the SQL queries, modify them, and use the project as a reference for improving your database and SQL skills.

---

<div align="center">

### 🚀 Keep Learning • Keep Practicing • Keep Building

**Made with ❤️ by Prit Baldha**

</div>
