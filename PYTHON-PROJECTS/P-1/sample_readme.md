<div align="center">

# 👨‍🎓 Student Details Manager
### Interactive Python Program for Data Types & Memory Address Demonstration

![Python](https://img.shields.io/badge/Python-3.8+-3776AB?style=for-the-badge&logo=python&logoColor=white)
![CLI](https://img.shields.io/badge/Console-Application-4CAF50?style=for-the-badge)
![Beginner](https://img.shields.io/badge/Level-Beginner-orange?style=for-the-badge)

> "Understanding data types is the first step toward mastering Python."

</div>

---

# 📋 Table of Contents

- Overview
- Problem Statement
- Features
- Project Structure
- Workflow
- Concepts Used
- Sample Output
- Tech Stack
- Learning Outcomes
- Advantages
- Author
- License

---

# 📌 Overview

The **Student Details Manager** is a beginner-friendly Python console application that collects student information and displays the entered values along with their data types and memory addresses.

The project demonstrates fundamental Python concepts such as:

- User Input
- Variables
- Data Types
- Type Casting
- Memory Management
- Built-in Functions

This project is ideal for beginners who want to understand how Python stores and manages different types of data.

---

# 🎯 Problem Statement

Create a Python program that:

1. Accepts user details.
2. Stores data in appropriate variables.
3. Displays entered information.
4. Shows the datatype of each variable.
5. Shows the memory address of each variable using the `id()` function.

The goal is to help students understand how Python handles different data types internally.

---

# ✨ Features

| Feature | Description |
|----------|-------------|
| 👤 User Input | Accepts Name, Age, Height and Favourite Number |
| 🔢 Data Type Detection | Displays datatype using `type()` |
| 🧠 Memory Address Display | Shows memory location using `id()` |
| 🖥️ Console Based | Runs directly in Python IDLE or Terminal |
| 🎓 Educational | Great project for beginners |
| ⚡ Lightweight | No external libraries required |
| ✅ Easy to Understand | Simple and clean code structure |

---

# 🏗️ Project Structure

```text
📦 Student-Details-Manager
│
├── 📄 P-1.py
│
└── 📄 README.md
```

---

# 🔄 Project Workflow

```text
Start Program
      │
      ▼
Display Title
      │
      ▼
Input Name
      │
      ▼
Input Age
      │
      ▼
Input Height
      │
      ▼
Input Favourite Number
      │
      ▼
Store Values
      │
      ▼
Display Details
      │
      ├── Value
      ├── Data Type
      └── Memory Address
      │
      ▼
Display Thank You Message
      │
      ▼
End Program
```

---

# 📚 Concepts Used

## 1️⃣ User Input

The program uses the `input()` function to collect information from the user.

```python
name = input("Enter your name: ")
```

---

## 2️⃣ String Data Type

Stores text values.

```python
name = "Prit"
```

Output:

```python
<class 'str'>
```

---

## 3️⃣ Integer Data Type

Stores whole numbers.

```python
age = 20
```

Output:

```python
<class 'int'>
```

---

## 4️⃣ Float Data Type

Stores decimal values.

```python
height = 5.8
```

Output:

```python
<class 'float'>
```

---

## 5️⃣ Type Casting

Converts user input into required data types.

```python
age = int(input())
height = float(input())
```

---

## 6️⃣ type() Function

Used to determine the datatype of a variable.

```python
print(type(age))
```

Output:

```python
<class 'int'>
```

---

## 7️⃣ id() Function

Used to display the memory address of an object.

```python
print(id(age))
```

Example Output:

```text
140714359834328
```

Note: Memory addresses change every time the program runs.

---

# 💻 Source Code

```python
print("Student Details")

name = input("Enter your name: ")
age = int(input("Enter your age: "))
height = float(input("Enter your height in feet: "))
fav_num = int(input("Enter your favourite number: "))

print("----- Details -----")

print("Name:", name)
print("Type:", type(name))
print("Memory Address:", id(name))

print("\nAge:", age)
print("Type:", type(age))
print("Memory Address:", id(age))

print("\nHeight:", height)
print("Type:", type(height))
print("Memory Address:", id(height))

print("\nFavourite Number:", fav_num)
print("Type:", type(fav_num))
print("Memory Address:", id(fav_num))

print("\nThank You!")
```

---

# 🖥️ Sample Output

```text
Student Details

Enter your name: prit
Enter your age: 20
Enter your height in feet: 5.8
Enter your favourite number: 13

----- Details -----

Name: prit
Type: <class 'str'>
Memory Address: 2670059508464

Age: 20
Type: <class 'int'>
Memory Address: 140714359834328

Height: 5.8
Type: <class 'float'>
Memory Address: 2670095140144

Favourite Number: 13
Type: <class 'int'>
Memory Address: 140714359834104

Thank You!
```

---

# 🛠️ Tech Stack

| Tool | Purpose |
|--------|---------|
| 🐍 Python 3.x | Programming Language |
| ⌨️ input() | User Input |
| 🖨️ print() | Display Output |
| 🔍 type() | Datatype Detection |
| 🧠 id() | Memory Address Display |

---

# 📈 Learning Outcomes

After completing this project, you will understand:

- Variables
- Data Types
- User Input
- Type Casting
- Memory Address Concept
- Built-in Functions
- Console-Based Programming

---

# 🏆 Advantages

| Advantage | Detail |
|-----------|--------|
| 🎓 Beginner Friendly | Easy project for learning Python basics |
| 📚 Educational | Demonstrates important built-in functions |
| ⚡ Lightweight | Runs without external libraries |
| 🔍 Practical Learning | Helps understand memory allocation |
| 🖥️ Simple Interface | Clean console-based interaction |
| 🔄 Reusable | Can be extended with additional fields |

---

# 👤 Author

<div align="center">

### Prit Baldha

[![GitHub](https://img.shields.io/badge/GitHub-Profile-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/pritbaldha54-collab)

> "Learning Python one project at a time."

**🎓 Role:** Python Developer & Programming Learner

**🛠️ Skills:** Python · Problem Solving · Data Types · CLI Applications · Programming Fundamentals

GitHub: https://github.com/pritbaldha54-collab

</div>

---

# 📄 License

This project is licensed under the MIT License.

```text
MIT License - Free to use, modify and distribute with attribution.
```

---

<div align="center">

### ⭐ If you found this project useful, consider giving it a star!

Made with ❤️ using Python

</div>
