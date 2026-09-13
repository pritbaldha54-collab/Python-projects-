# 🎓 College Database Management System

<div align="center">

## 🐬 MySQL SQL Practice Project

**A complete relational database project for learning, practicing, and demonstrating SQL concepts**

### 👤 Author
# **Prit Baldha**

</div>

---

## 📌 About This Project

This project is a practical **College Database Management System** created using **MySQL**.

The project starts by creating a database named `college_db` and then builds five related tables:

- 👨‍🎓 `students`
- 📚 `courses`
- 👨‍🏫 `instructors`
- 📝 `enrollments`
- 🏫 `departments`

The SQL file contains database creation, table creation, sample data, CRUD operations, filtering, aggregate functions, joins, subqueries, date functions, string functions, conditional logic, and window functions.

It is designed as a **SQL learning and practice project** that can also be used as a portfolio project on GitHub.

---

## 🎯 Project Objective

The main objective of this project is to understand how SQL can be used to manage and analyze data in a relational database.

Through this project, you can practice:

- Creating a database
- Creating relational tables
- Defining primary keys
- Using `AUTO_INCREMENT`
- Applying `UNIQUE` and `NOT NULL`
- Inserting records
- Reading records
- Updating records
- Deleting records
- Filtering data
- Joining multiple tables
- Grouping records
- Applying aggregate functions
- Filtering grouped results
- Working with subqueries
- Working with dates
- Combining strings
- Applying conditional logic
- Using SQL window functions

---

# 🗄️ Database Information

### Database Name

```sql
college_db
```

### Database Creation

```sql
CREATE DATABASE college_db;
USE college_db;
```

Once the database is selected, all tables and queries are executed inside `college_db`.

---

# 🧱 Database Tables

The project contains **5 main tables**.

| # | Table | Purpose |
|---|---|---|
| 1 | `students` | Stores student information |
| 2 | `courses` | Stores course information |
| 3 | `instructors` | Stores instructor information |
| 4 | `enrollments` | Stores student-course enrollment records |
| 5 | `departments` | Stores department information |

---

# 🔗 Database Relationship

The tables are connected through common IDs.

```text
                    ┌─────────────────────┐
                    │    departments      │
                    │                     │
                    │ DeptID              │
                    │ DeptName            │
                    └─────────┬───────────┘
                              │
                  ┌───────────┴───────────┐
                  │                       │
                  ▼                       ▼
        ┌──────────────────┐    ┌──────────────────┐
        │     courses      │    │   instructors    │
        │                  │    │                  │
        │ CourseID         │    │ InstructorID     │
        │ CourseName       │    │ DeptID           │
        │ DeptID           │    │ Salary           │
        │ Credits          │    └──────────────────┘
        └────────┬─────────┘
                 │
                 ▼
        ┌──────────────────┐
        │   enrollments    │
        │                  │
        │ EnrollmentID     │
        │ StuID            │
        │ CourseID         │
        │ EnrollmentDate   │
        └────────┬─────────┘
                 │
                 ▼
        ┌──────────────────┐
        │     students     │
        │                  │
        │ StuID            │
        │ FirstName        │
        │ LastName         │
        │ Email            │
        │ BirthDate        │
        │ EnrollmentDate   │
        └──────────────────┘
```

---

# 👨‍🎓 1. Students Table

The `students` table stores information about students.

### Structure

| Column | Data Type | Description |
|---|---|---|
| `StuID` | `INT` | Primary key and auto-increment ID |
| `FirstName` | `VARCHAR(50)` | Student first name |
| `LastName` | `VARCHAR(50)` | Student last name |
| `Email` | `VARCHAR(50)` | Unique student email |
| `BirthDate` | `DATE` | Student date of birth |
| `EnrollmentDate` | `DATE` | College enrollment date |

### Important Constraints

```sql
StuID INT AUTO_INCREMENT PRIMARY KEY
Email VARCHAR(50) UNIQUE
```

### Sample Records

The database contains 10 students:

| ID | Name | Enrollment Year |
|---:|---|---:|
| 1 | John Doe | 2022 |
| 2 | Jane Smith | 2021 |
| 3 | Michael Brown | 2023 |
| 4 | Emily Davis | 2022 |
| 5 | David Wilson | 2020 |
| 6 | Sarah Taylor | 2024 |
| 7 | Daniel Anderson | 2021 |
| 8 | Sophia Thomas | 2025 |
| 9 | James Jackson | 2023 |
| 10 | Olivia White | 2024 |

---

# 📚 2. Courses Table

The `courses` table stores courses offered by different departments.

### Structure

| Column | Data Type | Description |
|---|---|---|
| `CourseID` | `INT` | Primary key and auto-increment ID |
| `CourseName` | `VARCHAR(50)` | Name of the course |
| `DeptID` | `INT` | Department identifier |
| `Credits` | `INT` | Course credit value |

### Courses Included

| ID | Course | Department ID | Credits |
|---:|---|---:|---:|
| 1 | Introduction to SQL | 1 | 3 |
| 2 | Data Structures | 2 | 4 |
| 3 | Database Management | 1 | 4 |
| 4 | Python Programming | 3 | 3 |
| 5 | Machine Learning | 4 | 4 |
| 6 | Artificial Intelligence | 5 | 4 |
| 7 | Statistics | 2 | 3 |
| 8 | Data Science | 3 | 3 |
| 9 | Data Analytics | 4 | 4 |
| 10 | Cyber Security | 10 | 3 |

---

# 👨‍🏫 3. Instructors Table

The `instructors` table stores instructor information.

### Structure

| Column | Data Type | Description |
|---|---|---|
| `InstructorID` | `INT` | Primary key |
| `FirstName` | `VARCHAR(50)` | Instructor first name |
| `LastName` | `VARCHAR(50)` | Instructor last name |
| `Email` | `VARCHAR(50)` | Unique instructor email |
| `DeptID` | `INT` | Department identifier |
| `Salary` | `DECIMAL(10,2)` | Instructor salary |

### Instructor Data

The project contains 10 instructors with salaries ranging from **65,000 to 92,000**.

Examples include:

- Alice Johnson
- Bob Lee
- Robert Martin
- Linda Clark
- William Lewis
- Emma Walker
- Thomas Hall
- Sophia Allen
- Henry Young
- Grace King

---

# 📝 4. Enrollments Table

The `enrollments` table connects students with courses.

### Structure

| Column | Data Type | Description |
|---|---|---|
| `EnrollmentID` | `INT` | Primary key |
| `StuID` | `INT` | Student identifier |
| `CourseID` | `INT` | Course identifier |
| `EnrollmentDate` | `DATE` | Enrollment date |

This table is important because it creates the relationship between students and courses.

For example:

```text
John Doe
   ↓
StuID = 1
   ↓
CourseID = 1
   ↓
Introduction to SQL
```

---

# 🏫 5. Departments Table

The `departments` table stores department information.

### Departments Included

| ID | Department |
|---:|---|
| 1 | Computer Science |
| 2 | Mathematics |
| 3 | Information Technology |
| 4 | Data Science |
| 5 | Artificial Intelligence |
| 6 | Physics |
| 7 | Chemistry |
| 8 | Commerce |
| 9 | Business Administration |
| 10 | Cyber Security |

---

# 🔄 CRUD Operations

The project demonstrates CRUD operations on all major tables.

### CRUD Means

| Operation | SQL Command | Purpose |
|---|---|---|
| 🟢 Create | `INSERT` | Add new records |
| 🔵 Read | `SELECT` | Retrieve records |
| 🟡 Update | `UPDATE` | Modify existing records |
| 🔴 Delete | `DELETE` | Remove records |

---

# 🧪 Query 1: CRUD Operations on All Tables

The first practical section demonstrates complete CRUD operations.

### Students

A temporary student record is inserted:

```sql
INSERT INTO students
(FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES
('Test', 'Student', 'test.student@email.com',
 '2002-05-10', '2025-08-01');
```

The record is then retrieved, updated, and deleted.

### Courses

A temporary course called `Advanced SQL` is:

1. Inserted
2. Retrieved
3. Updated from 4 to 5 credits
4. Deleted

### Instructors

A temporary instructor is:

1. Inserted
2. Retrieved
3. Department updated
4. Deleted

### Enrollments

A temporary enrollment is:

1. Inserted
2. Retrieved
3. Course updated
4. Deleted

### Departments

A temporary department is:

1. Inserted
2. Retrieved
3. Renamed
4. Deleted

This provides practical experience with CRUD operations across the complete database.

---

# 🔍 Query 2: Students Enrolled After 2022

This query retrieves students whose enrollment date is after December 31, 2022.

```sql
SELECT *
FROM students
WHERE EnrollmentDate > "2022-12-31";
```

### Concepts Used

- `SELECT`
- `WHERE`
- Date comparison

### Result

The query returns:

- Michael Brown
- Sarah Taylor
- Sophia Thomas
- James Jackson
- Olivia White

---

# 📐 Query 3: Courses Offered by Mathematics Department

This query uses an `INNER JOIN` to connect courses and departments.

```sql
SELECT
    c.CourseID,
    c.CourseName,
    c.DeptID,
    d.DeptName
FROM courses c
INNER JOIN departments d
    ON c.DeptID = d.DeptID
WHERE d.DeptName = "MATHEMATICS"
LIMIT 5;
```

### Concepts Used

- Table alias
- `INNER JOIN`
- `ON`
- `WHERE`
- `LIMIT`

### Result

The Mathematics department contains:

- Data Structures
- Statistics

---

# 📊 Query 4: Number of Students in Each Course

This query counts students enrolled in each course and returns courses with more than 5 students.

```sql
SELECT
    CourseID,
    COUNT(StuID) AS TotalStudents
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(StuID) > 5;
```

### Concepts Used

- `COUNT()`
- `GROUP BY`
- `HAVING`

### Result

```text
Empty set
```

The result is empty because no course currently has more than 5 enrolled students in the sample dataset.

---

# 🎯 Query 5: Students Enrolled in Both Courses

This query finds students enrolled in both:

- Introduction to SQL
- Data Structures

```sql
SELECT
    s.FirstName,
    s.LastName
FROM Students s
JOIN Enrollments e USING (StuID)
JOIN Courses c USING (CourseID)
WHERE c.CourseName IN
('Introduction to SQL', 'Data Structures')
GROUP BY s.StuID
HAVING COUNT(c.CourseName) = 2;
```

### Result

```text
Empty set
```

No student in the current sample data is enrolled in both courses.

---

# 🔎 Query 6: Students Enrolled in Either Course

This query retrieves students enrolled in either Introduction to SQL or Data Structures.

```sql
SELECT
    s.StuID,
    s.FirstName,
    s.LastName,
    c.CourseName
FROM students s
INNER JOIN enrollments e
    ON s.StuID = e.StuID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID
WHERE c.CourseName IN
('Introduction to SQL', 'Data Structures');
```

### Concepts Used

- `INNER JOIN`
- `WHERE`
- `IN`

### Matching Students

| Student | Course |
|---|---|
| John Doe | Introduction to SQL |
| Jane Smith | Data Structures |
| Michael Brown | Introduction to SQL |
| David Wilson | Data Structures |
| Daniel Anderson | Introduction to SQL |

---

# 📈 Query 7: Average Course Credits

The average credit value of all courses is calculated using `AVG()`.

```sql
SELECT AVG(Credits) AS Avg_credits
FROM courses;
```

### Result

```text
Avg_credits
-----------
3.5000
```

### Concept Used

```sql
AVG()
```

`AVG()` calculates the arithmetic average of a numeric column.

---

# 💰 Query 8: Maximum Instructor Salary

This query finds the highest salary among instructors in the Computer Science department.

```sql
SELECT
    MAX(i.Salary) AS Max_Salary,
    d.DeptName
FROM instructors i
JOIN departments d
    ON i.DeptID = d.DeptID
WHERE d.DeptName = "Computer Science";
```

### Result

```text
Max_Salary     DeptName
82000.00       Computer Science
```

### Concepts Used

- `MAX()`
- `JOIN`
- `WHERE`
- Table aliases

---

# 🏢 Query 9: Students Enrolled in Each Department

This query uses multiple `LEFT JOIN` operations to count students by department.

```sql
SELECT
    d.DeptID,
    d.DeptName,
    COUNT(e.StuID) AS "Total Students"
FROM departments d
LEFT JOIN courses c
    ON d.DeptID = c.DeptID
LEFT JOIN enrollments e
    ON c.CourseID = e.CourseID
GROUP BY d.DeptID;
```

### Important Concept

A `LEFT JOIN` keeps all departments, including departments that currently have zero enrolled students.

### Result Summary

| Department | Students |
|---|---:|
| Computer Science | 4 |
| Mathematics | 2 |
| Information Technology | 1 |
| Data Science | 2 |
| Artificial Intelligence | 1 |
| Physics | 0 |
| Chemistry | 0 |
| Commerce | 0 |
| Business Administration | 0 |
| Cyber Security | 0 |

---

# 🔗 Query 10: Students and Corresponding Courses

This query uses `INNER JOIN` to display students together with their courses.

```sql
SELECT
    s.StuID,
    s.FirstName,
    s.LastName,
    c.CourseID,
    c.CourseName
FROM students s
INNER JOIN enrollments e
    ON s.StuID = e.StuID
INNER JOIN courses c
    ON c.CourseID = e.CourseID;
```

### Example Result

| Student | Course |
|---|---|
| John Doe | Introduction to SQL |
| Jane Smith | Data Structures |
| Michael Brown | Introduction to SQL |
| Emily Davis | Database Management |
| David Wilson | Data Structures |
| Sarah Taylor | Machine Learning |
| Daniel Anderson | Introduction to SQL |
| Sophia Thomas | Artificial Intelligence |
| James Jackson | Python Programming |
| Olivia White | Machine Learning |

---

# ↔️ Query 11: LEFT JOIN Students and Courses

This query retrieves all students and their corresponding courses.

```sql
SELECT
    s.StuID,
    s.FirstName,
    s.LastName,
    c.CourseName
FROM students s
LEFT JOIN enrollments e
    ON s.StuID = e.StuID
LEFT JOIN courses c
    ON c.CourseID = e.CourseID;
```

### Why Use LEFT JOIN?

`LEFT JOIN` returns every record from the left table.

In this case:

```text
students
   ↓
LEFT JOIN
   ↓
enrollments
   ↓
LEFT JOIN
   ↓
courses
```

This is useful when you want to keep all students even if some students do not have a matching course.

---

# 🧩 Query 12: Subquery for Highly Enrolled Courses

This query demonstrates nested subqueries.

```sql
SELECT *
FROM students
WHERE StuID IN
(
    SELECT StuID
    FROM enrollments
    WHERE CourseID IN
    (
        SELECT CourseID
        FROM enrollments
        GROUP BY CourseID
        HAVING COUNT(*) > 10
    )
);
```

### Query Logic

The query works from the inside outward:

```text
Step 1
Find courses having more than 10 students
        ↓
Step 2
Find students enrolled in those courses
        ↓
Step 3
Return complete student records
```

### Result

```text
Empty set
```

There are not more than 10 students enrolled in any course in the sample dataset.

---

# 📅 Query 13: Extract Enrollment Year

The `YEAR()` function extracts the year from an enrollment date.

```sql
SELECT
    *,
    YEAR(EnrollmentDate) AS "Year"
FROM enrollments;
```

### Example

```text
EnrollmentDate   Year
2022-08-01       2022
2021-08-01       2021
2023-07-15       2023
2022-09-10       2022
```

### Concept Used

```sql
YEAR(date_column)
```

This is useful when analyzing data year by year.

---

# 🔤 Query 14: Concatenate Instructor Name

The `CONCAT()` function combines the first and last name.

```sql
SELECT
    InstructorID,
    CONCAT(FirstName, " ", LastName) AS "Full Name"
FROM instructors;
```

### Example Output

```text
InstructorID    Full Name
1               Alice Johnson
2               Bob Lee
3               Robert Martin
4               Linda Clark
5               William Lewis
6               Emma Walker
7               Thomas Hall
8               Sophia Allen
9               Henry Young
10              Grace King
```

### Concept Used

```sql
CONCAT()
```

This is useful for creating readable full names from separate columns.

---

# 🪟 Query 15: Running Total Using Window Function

This query demonstrates a SQL **window function**.

```sql
SELECT
    *,
    COUNT(*) OVER
    (
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS "Running_TotalStudents"
FROM enrollments;
```

### Window Function Concept

A window function performs a calculation across related rows without collapsing the result into one row per group.

The expression:

```sql
ROWS BETWEEN UNBOUNDED PRECEDING
AND CURRENT ROW
```

means:

```text
Start from the first row
        ↓
Continue through the current row
        ↓
Calculate the running value
```

### Running Total

```text
Enrollment 1 → 1
Enrollment 2 → 2
Enrollment 3 → 3
Enrollment 4 → 4
Enrollment 5 → 5
Enrollment 6 → 6
Enrollment 7 → 7
Enrollment 8 → 8
Enrollment 9 → 9
Enrollment 10 → 10
```

This is a useful introduction to analytical SQL.

---

# 🏷️ Query 16: Senior or Junior Classification

The final query uses `CASE` and `DATE_SUB()` to classify students.

```sql
SELECT
    StuID,
    FirstName,
    LastName,
    EnrollmentDate,
    CASE
        WHEN EnrollmentDate <
             DATE_SUB(CURDATE(), INTERVAL 4 YEAR)
        THEN "Senior"
        ELSE "Junior"
    END AS Label
FROM students;
```

### Logic

```text
Is EnrollmentDate older than 4 years?
            │
       ┌────┴────┐
      YES        NO
       │          │
       ▼          ▼
    Senior      Junior
```

### Functions Used

- `CASE`
- `WHEN`
- `THEN`
- `ELSE`
- `END`
- `DATE_SUB()`
- `CURDATE()`

This query is useful for learning conditional logic in SQL.

---

# 🧠 SQL Concepts Practiced

This project covers a broad range of SQL concepts.

## 🗃️ Database Commands

```sql
CREATE DATABASE
USE
```

## 🏗️ Table Commands

```sql
CREATE TABLE
```

## ✏️ Data Manipulation

```sql
INSERT
UPDATE
DELETE
SELECT
```

## 🔍 Filtering

```sql
WHERE
IN
```

## 📊 Aggregation

```sql
COUNT()
AVG()
MAX()
```

## 📦 Grouping

```sql
GROUP BY
HAVING
```

## 🔗 Joins

```sql
INNER JOIN
LEFT JOIN
JOIN ... USING
```

## 🧩 Subqueries

```sql
SELECT ...
WHERE ... IN
(
    SELECT ...
)
```

## 📅 Date Functions

```sql
YEAR()
CURDATE()
DATE_SUB()
```

## 🔤 String Functions

```sql
CONCAT()
```

## 🔀 Conditional Logic

```sql
CASE
WHEN
THEN
ELSE
END
```

## 🪟 Window Functions

```sql
COUNT() OVER()
```

and:

```sql
ROWS BETWEEN UNBOUNDED PRECEDING
AND CURRENT ROW
```

---

# 🧾 SQL Functions Used

| Function | Purpose |
|---|---|
| `COUNT()` | Counts records |
| `AVG()` | Calculates average |
| `MAX()` | Finds maximum value |
| `YEAR()` | Extracts year from date |
| `CONCAT()` | Combines strings |
| `CURDATE()` | Returns current date |
| `DATE_SUB()` | Subtracts a time interval |

---

# 🔗 JOIN Concepts Practiced

## INNER JOIN

Returns matching records from both tables.

```sql
SELECT *
FROM students s
INNER JOIN enrollments e
    ON s.StuID = e.StuID;
```

### Simple Idea

```text
Table A + Table B
       ↓
Only matching records
```

---

## LEFT JOIN

Returns all records from the left table and matching records from the right table.

```sql
SELECT *
FROM students s
LEFT JOIN enrollments e
    ON s.StuID = e.StuID;
```

### Simple Idea

```text
All records from LEFT table
+
Matching records from RIGHT table
```

---

# 📊 Aggregate Functions

Aggregate functions summarize multiple rows.

### COUNT

```sql
SELECT COUNT(*)
FROM students;
```

Counts records.

### AVG

```sql
SELECT AVG(Credits)
FROM courses;
```

Calculates the average.

### MAX

```sql
SELECT MAX(Salary)
FROM instructors;
```

Finds the highest value.

---

# 📦 GROUP BY and HAVING

### GROUP BY

Used to create groups of records.

```sql
SELECT CourseID, COUNT(StuID)
FROM enrollments
GROUP BY CourseID;
```

### HAVING

Used to filter grouped results.

```sql
SELECT CourseID, COUNT(StuID)
FROM enrollments
GROUP BY CourseID
HAVING COUNT(StuID) > 5;
```

### Difference

```text
WHERE  → filters rows before grouping
HAVING → filters groups after grouping
```

---

# 🧩 Subquery Concept

A subquery is a query inside another query.

Example:

```sql
SELECT *
FROM students
WHERE StuID IN
(
    SELECT StuID
    FROM enrollments
);
```

The inner query executes as part of the outer query.

---

# 🪟 Window Function Concept

Window functions allow calculations across rows while keeping individual rows visible.

Example:

```sql
COUNT(*) OVER
(
    ROWS BETWEEN UNBOUNDED PRECEDING
    AND CURRENT ROW
)
```

Unlike `GROUP BY`, a window function does not reduce multiple rows into a single row per group.

---

# ▶️ How to Run the Project

## Step 1: Install MySQL

Install:

- 🐬 MySQL Server
- 🛠️ MySQL Workbench

You can also use another MySQL-compatible SQL editor.

---

## Step 2: Open the SQL File

Open:

```text
main.sql
```

---

## Step 3: Execute the Database Creation

Run:

```sql
CREATE DATABASE college_db;
USE college_db;
```

---

## Step 4: Create the Tables

Run the table creation statements for:

```text
students
courses
instructors
enrollments
departments
```

---

## Step 5: Insert the Sample Data

Execute the `INSERT` statements provided in the SQL file.

---

## Step 6: Run the Queries

Run Query 1 through Query 16 individually or execute the complete SQL file.

---

# 📁 Project Structure

```text
College-Database/
│
├── main.sql
│
└── README.md
```

### `main.sql`

Contains:

- Database creation
- Table creation
- Sample records
- CRUD operations
- 16 SQL queries
- Query output examples

### `README.md`

Contains:

- Project overview
- Database structure
- Table descriptions
- Query explanations
- SQL concepts
- Running instructions

---

# 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| 🐬 MySQL | Database management |
| 🧾 SQL | Query language |
| 🛠️ MySQL Workbench | SQL development and execution |
| 🐙 GitHub | Project version control and portfolio |

---

# 📚 What I Learned From This Project

This project provides hands-on practice with the complete flow of a relational database.

### Database Design

Understanding how different tables can represent different entities and how IDs can connect those tables.

### Data Management

Learning how to create, insert, update, retrieve, and delete records.

### Data Analysis

Using functions such as:

```sql
COUNT()
AVG()
MAX()
```

to analyze database records.

### Relational Queries

Using joins to combine information stored across different tables.

### Advanced SQL

Practicing:

- Subqueries
- Date functions
- String functions
- `CASE`
- Window functions

---

# 🎓 Suitable For

This project is useful for:

- 👨‍🎓 Students learning SQL
- 💻 Beginners learning MySQL
- 📊 Data Analyst practice
- 🗄️ Database Management practice
- 🧪 SQL interview preparation
- 📝 College practical assignments
- 🐙 GitHub portfolio projects

---

# 💡 Practice Suggestions

After running the existing queries, try modifying them.

For example:

### Find students enrolled before 2022

```sql
SELECT *
FROM students
WHERE EnrollmentDate < '2022-01-01';
```

### Find courses with 4 credits

```sql
SELECT *
FROM courses
WHERE Credits = 4;
```

### Find the average instructor salary

```sql
SELECT AVG(Salary)
FROM instructors;
```

### Find the highest-paid instructor

```sql
SELECT *
FROM instructors
ORDER BY Salary DESC
LIMIT 1;
```

### Count total students

```sql
SELECT COUNT(*) AS TotalStudents
FROM students;
```

These variations can help strengthen SQL problem-solving skills.

---

# ✅ Project Highlights

- 🐬 MySQL-based relational database
- 🗄️ 5 interconnected tables
- 👨‍🎓 Student management data
- 📚 Course management data
- 👨‍🏫 Instructor data
- 📝 Enrollment records
- 🏫 Department data
- 🔄 CRUD operations
- 🔗 Multiple join examples
- 📊 Aggregate functions
- 🧩 Subqueries
- 📅 Date functions
- 🔤 String functions
- 🔀 `CASE` expressions
- 🪟 Window functions
- 📈 Running total calculation
- 📋 Practical query outputs
- 🎓 Beginner-to-intermediate SQL practice

---

# 👤 Author

<div align="center">

## 💻 Prit Baldha

**SQL | MySQL | Database Management | Data Analysis**

This project was created by **Prit Baldha** as a practical SQL database project for learning, practicing, and demonstrating MySQL skills.

### 🐬 Database
`college_db`

### 📄 Main SQL File
`main.sql`

</div>

---

# ⭐ Support

If this project helped you learn SQL or gave you ideas for your own database project, feel free to ⭐ **star the repository** and use it for your own SQL practice.

---

<div align="center">

### 🐬 Built with MySQL & SQL

**Made with 💻 by Prit Baldha**

</div>
