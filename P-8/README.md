# 📊 Data Analytics with NumPy (OOP Based)

A menu-driven **Python Data Analytics Project** developed using **Object-Oriented Programming (OOP)** and **NumPy**. This project allows users to create and manipulate 1D, 2D, and 3D arrays while learning fundamental NumPy operations through an interactive command-line interface.

It is designed as a beginner-friendly project for students who are learning Python, NumPy, and Object-Oriented Programming concepts.

---

# 📖 Table of Contents

- Overview
- Features
- Technologies Used
- Project Structure
- How It Works
- Supported Array Types
- NumPy Operations
- OOP Concepts Used
- Installation
- Usage
- Sample Workflow
- Learning Outcomes
- Future Improvements
- Requirements
- Author
- License

---

# 📌 Overview

This project demonstrates how Object-Oriented Programming can be combined with the powerful NumPy library to perform data analysis tasks.

The program provides a simple menu where users can:

- Create arrays
- Perform NumPy operations
- Learn array manipulation
- Practice Python OOP
- Understand multidimensional arrays

The application is completely terminal-based and is intended for educational purposes.

---

# ✨ Features

## Array Creation

- Create 1D Arrays
- Create 2D Arrays
- Create 3D Arrays
- User input support
- Dynamic array size

---

## Array Operations

Depending on implementation, the project can perform:

- Array Creation
- Array Reshaping
- Array Display
- Mathematical Operations
- Statistical Operations
- Searching
- Sorting
- Indexing
- Slicing
- Copying
- Flattening
- Resizing

---

# 🛠 Technologies Used

- Python 3.x
- NumPy
- Object-Oriented Programming
- Command Line Interface (CLI)

---

# 📂 Project Structure

```
Project/
│
├── DataAnalytics.ipynb
├── README.md
└── requirements.txt
```

---

# ⚙️ How It Works

The application first asks the user which type of array they want to create.

```
1. 1D Array
2. 2D Array
3. 3D Array
```

The program then accepts user input and converts it into a NumPy array.

Example:

```
Enter your choice : 2

Enter rows : 2
Enter columns : 3

Enter 6 elements :

1 2 3 4 5 6
```

Output

```
[[1 2 3]
 [4 5 6]]
```

---

# 📐 Supported Array Types

## 1D Array

Example

```
[10 20 30 40 50]
```

---

## 2D Array

Example

```
[[1 2 3]
 [4 5 6]]
```

---

## 3D Array

Example

```
[[[1 2]
  [3 4]]

 [[5 6]
  [7 8]]]
```

---

# 📚 OOP Concepts Used

The project demonstrates important Object-Oriented Programming concepts.

### Class

```
DataAnalytics
```

---

### Constructor

```
__init__()
```

Used for initializing variables.

---

### Object Creation

```
obj = DataAnalytics()
```

---

### Instance Variables

Example

```
self.array
```

---

### Methods

Example

- create()
- display()
- operations()

*(Methods may vary depending on the project version.)*

---

# 🔢 NumPy Concepts Used

The project introduces many important NumPy functions such as:

- np.array()
- reshape()
- ndim
- shape
- size
- dtype
- indexing
- slicing
- flatten()
- transpose()
- mathematical functions
- statistical functions

---

# ▶ Installation

Clone the repository

```bash
git clone https://github.com/yourusername/DataAnalytics.git
```

Move into the project folder

```bash
cd DataAnalytics
```

Install NumPy

```bash
pip install numpy
```

---

# ▶ Running the Project

Using Jupyter Notebook

```bash
jupyter notebook
```

Open

```
DataAnalytics.ipynb
```

Run all cells.

---

Or using Python

```bash
python main.py
```

(if converted into a Python file)

---

# 💻 Sample Execution

```
Select the type of array to create

1. 1D Array
2. 2D Array
3. 3D Array

Enter your choice : 1

Enter numbers :

10 20 30 40 50

Array created successfully

[10 20 30 40 50]
```

---

# 🎯 Learning Outcomes

After completing this project, students will understand:

- Python OOP
- Classes
- Objects
- Constructors
- Methods
- NumPy Basics
- Multidimensional Arrays
- User Input Handling
- Array Manipulation
- Data Representation

---

# 🚀 Future Improvements

Some features that can be added in future versions:

- Graphical User Interface (Tkinter)
- Data Visualization using Matplotlib
- Pandas Integration
- CSV File Support
- Excel Import/Export
- Menu Loop
- Error Handling
- File Storage
- Statistical Reports
- Machine Learning Preprocessing

---

# 📦 Requirements

Python

```
Python 3.10+
```

Library

```
NumPy
```

Install

```bash
pip install numpy
```

---

# 🤝 Contribution

Contributions are welcome.

If you would like to improve this project:

1. Fork the repository
2. Create a new branch
3. Make your changes
4. Commit your work
5. Submit a Pull Request

---

# 📄 License

This project is created for educational and learning purposes.

Feel free to modify and use it for personal learning.

---

# 👨‍💻 Author

**Prit Baldha**

Python Developer | NumPy Enthusiast | Student Developer

---

# ⭐ Support

If you found this project helpful, consider giving it a ⭐ on GitHub.

It motivates future development and helps others discover the project.

---

## Thank You ❤️

Happy Coding!
