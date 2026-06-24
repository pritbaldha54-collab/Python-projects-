<div align="center">

# 🔺 Pattern Generator & Number Analyzer
### Interactive Python Console Application Using Loops, Conditions and Pattern Printing

![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white)
![CLI](https://img.shields.io/badge/Console-Application-4CAF50?style=for-the-badge)
![Beginner](https://img.shields.io/badge/Level-Beginner-orange?style=for-the-badge)

> "Programming becomes easier when you master loops and logic."

</div>

---

# 📋 Table of Contents

- Overview
- Problem Statement
- Features
- Project Structure
- Workflow
- Pattern Generator
- Number Analyzer
- Source Code Concepts
- Sample Output
- Tech Stack
- Learning Outcomes
- Advantages
- Author
- License

---

# 📌 Overview

The **Pattern Generator & Number Analyzer** is a menu-driven Python console application that allows users to:

- Generate star patterns
- Analyze numbers as Even or Odd
- Calculate the sum of a number range
- Work with loops, conditions and user input

The program continuously runs until the user chooses to exit.

This project is designed to strengthen understanding of:

- Nested Loops
- Conditional Statements
- Menu Driven Programs
- Pattern Printing
- Arithmetic Operations

---

# 🎯 Problem Statement

Create a Python application that provides two major functionalities:

### 1. Pattern Generator

Generate a star pattern based on the number of rows entered by the user.

### 2. Number Analyzer

Analyze numbers within a given range and:

- Identify Even numbers
- Identify Odd numbers
- Calculate the total sum

The application should continue running until the user selects Exit.

---

# ✨ Features

| Feature | Description |
|----------|-------------|
| 🔺 Pattern Generation | Creates star patterns using nested loops |
| 🔢 Number Analysis | Identifies Even and Odd numbers |
| ➕ Sum Calculation | Calculates total sum of numbers |
| 🔁 Infinite Loop | Menu repeats until Exit is selected |
| ⚡ Fast Execution | Runs instantly in terminal |
| 🎓 Beginner Friendly | Easy-to-understand logic |
| 🖥️ Console Based | No GUI required |
| ❌ Invalid Choice Handling | Detects wrong menu input |

---

# 🏗️ Project Structure

```text
📦 Pattern-Generator-And-Number-Analyzer
│
├── 📄 P-2.py
│
└── 📄 README.md
```

---

# 🔄 Program Workflow

```text
Start Program
      │
      ▼
Display Main Menu
      │
      ▼
┌─────────────────┐
│ 1. Pattern      │
│ 2. Analysis     │
│ 3. Exit         │
└─────────────────┘
      │
      ▼
User Choice
      │
 ┌────┴────┐
 ▼         ▼
Pattern   Analysis
  │          │
  ▼          ▼
Print      Even/Odd
Stars      Detection
  │          │
  ▼          ▼
Return To Menu
      │
      ▼
Exit Program
```

---

# 🔺 Pattern Generator

The Pattern Generator creates a left-aligned triangular star pattern using nested loops.

### Logic

```python
for i in range(1, n + 1):
    for _ in range(n - i):
        print(" ", end=" ")

    for j in range(1, i + 1):
        print("*", end=" ")

    print()
```

---

## Sample Pattern

Input:

```text
Rows = 5
```

Output:

```text
        *
      * *
    * * *
  * * * *
* * * * *
```

---

# 🔢 Number Analyzer

The Number Analyzer accepts a start and end number and performs:

### Even Number Detection

```python
if i % 2 == 0:
```

### Odd Number Detection

```python
else:
```

### Sum Calculation

```python
count += i
```

---

## Sample Analysis

Input:

```text
Start Number = 21
End Number = 26
```

Output:

```text
21 is Odd Number.
22 is Even Number.
23 is Odd Number.
24 is Even Number.
25 is Odd Number.
26 is Even Number.

Sum of all numbers : 141
```

---

# 📚 Concepts Used

## 1️⃣ While Loop

Keeps displaying the menu until Exit is selected.

```python
while True:
```

---

## 2️⃣ Match Case Statement

Used for menu selection.

```python
match choice:
```

---

## 3️⃣ Nested Loops

Used for pattern generation.

```python
for i in range():
    for j in range():
```

---

## 4️⃣ Conditional Statements

Used for Even/Odd checking.

```python
if i % 2 == 0:
```

---

## 5️⃣ Arithmetic Operations

Used for sum calculation.

```python
count += i
```

---

# 💻 Source Code Highlights

### Pattern Generation

```python
case 1:
```

Generates star patterns using nested loops.

---

### Number Analysis

```python
case 2:
```

Checks Even/Odd numbers and calculates total sum.

---

### Exit Option

```python
case 3:
```

Terminates the program.

---

### Invalid Choice

```python
case _:
```

Displays an error message when an invalid menu option is selected.

---

# 🖥️ Sample Output

```text
Welcome to Pattern generator and Number analyzer!

1. Pattern generate
2. Number analysis
3. Exit

enter your choice : 1

enter the number of rows : 5

        *
      * *
    * * *
  * * * *
* * * * *

1. Pattern generate
2. Number analysis
3. Exit

enter your choice : 2

enter start number : 21
enter end number : 26

21 is Odd Number.
22 is Even Number.
23 is Odd Number.
24 is Even Number.
25 is Odd Number.
26 is Even Number.

Sum of all numbers : 141

1. Pattern generate
2. Number analysis
3. Exit

enter your choice : 3

Thank You, Visit Again.
```

---

# 🛠️ Tech Stack

| Tool | Purpose |
|--------|---------|
| 🐍 Python 3.x | Programming Language |
| 🔁 While Loop | Menu Repetition |
| 🔂 For Loop | Pattern Printing |
| 🔀 Match Case | Menu Handling |
| ➗ Modulus Operator | Even/Odd Detection |
| ⌨️ input() | User Input |
| 🖨️ print() | Output Display |

---

# 📈 Learning Outcomes

After completing this project, you will understand:

- While Loops
- Nested Loops
- Match Case Statements
- Pattern Printing Logic
- Even/Odd Number Detection
- Sum Calculation
- Menu Driven Programming
- User Input Handling

---

# 🏆 Advantages

| Advantage | Detail |
|-----------|--------|
| 🎓 Beginner Friendly | Excellent practice project |
| 📚 Educational | Covers loops and conditions |
| ⚡ Lightweight | No external libraries |
| 🔄 Reusable Logic | Easy to extend |
| 🖥️ Console Based | Runs on any system |
| 🧠 Improves Logic Building | Strengthens programming fundamentals |

---

# 👤 Author

<div align="center">

### Prit Baldha

[![GitHub](https://img.shields.io/badge/GitHub-Profile-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/pritbaldha54-collab)

> "Learning Python one project at a time."

**🎓 Role:** Python Developer & Programming Learner

**🛠️ Skills:** Python · Problem Solving · Pattern Programming · CLI Applications

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
