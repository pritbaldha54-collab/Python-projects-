# 🧰 Multi-Utility Toolkit

A menu-driven Python CLI project that combines multiple useful tools in one application, including datetime utilities, mathematical calculations, random data generation, UUID generation, file operations, and module exploration.

## ✨ Features

### 🕒 Datetime & Time Operations
- Display current date and time
- Calculate the difference between two dates
- Format dates into `DD/MM/YYYY`
- Stopwatch
- Countdown timer

### 🧮 Mathematical Operations
- Calculate factorial
- Calculate compound amount
- Trigonometric calculations: Sin, Cos, and Tan
- Calculate area of a circle, rectangle, and square

### 🎲 Random Data Generation
- Generate a random number
- Generate a random list
- Create a random password
- Generate a 6-digit OTP

### 🆔 UUID Generator
- Generate unique identifiers using Python's `uuid` module

### 📁 File Operations
File operations are handled through a separate custom module:
- Create a file
- Write to a file
- Read from a file
- Append data to a file

### 🔍 Module Attribute Explorer
Explore module attributes using Python's built-in `dir()` function for `math`, `datetime`, `random`, `uuid`, and the custom file operations module.

## 🛠️ Technologies & Concepts

- Python 3
- Standard library modules
- Custom modules and packages
- File handling
- Exception handling
- Functions
- Loops and nested menus
- Conditional statements
- `match-case`
- `datetime`, `time`, `math`, `random`, and `uuid`
- `dir()` function

## 📂 Project Structure

```text
Multi-Utility-Toolkit/
│
├── main.py
├── data.txt
│
└── utilities/
    ├── __init__.py
    └── file_operations.py
```

## 📋 Main Menu

```text
+------------------------------------------------+
|                  MAIN MENU                     |
+------------------------------------------------+
|  1. Datetime and Time Operations               |
|  2. Mathematical Operations                    |
|  3. Random Data Generation                     |
|  4. Generate Unique Identifiers (UUID)         |
|  5. File Operations (Custom Module)            |
|  6. Explore Module Attributes (dir())          |
|  7. Exit                                       |
+------------------------------------------------+
```

## 🚀 How to Run

Make sure Python is installed, keep the project files in the correct folder structure, and run:

```bash
python main.py
```

## 💻 Sample Operations

### Calculate Factorial

```text
Enter a number : 6
Factorial of 6 is 720
```

### Generate Random Number

```text
Enter starting number: 1
Enter ending number: 10
Random Number : 8
```

### Generate UUID

```text
Generate Unique Identifiers :
UUID : cd62eea3-2340-4120-9e53-57719bbb1354
```

### File Operations

```text
1. Create a new file
2. Write to a file
3. Read from a file
4. Append to a file
5. Back to main menu
```

## 🎯 Learning Outcomes

This project is useful for practicing how multiple Python concepts can work together in one organized application. It demonstrates built-in modules, custom module imports, file handling, reusable functions, menu-driven programming, random data generation, and utility-based application development.

## 👨‍💻 Author

### **Prit Baldha**

🐍 Python Developer

#

---

<div align="center">

⭐ **If you found this project useful, consider giving it a star!**

Made with ❤️ using Python

</div>
