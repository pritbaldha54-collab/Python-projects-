<div align="center">

# -- ! Pattern Generator & Number Analyzer ! --
### *Interactive Console-Based Pattern Printing & Number Range Analysis*

[![Python](https://img.shields.io/badge/Python-3.8%2B-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Loops](https://img.shields.io/badge/Loops-Nested%20For%2FWhile-FF6F00?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Console](https://img.shields.io/badge/Console-Interactive%20CLI-4CAF50?style=for-the-badge&logo=windowsterminal&logoColor=white)](https://www.python.org/)
[![Math](https://img.shields.io/badge/Math-Arithmetic%20%26%20Logic-9C27B0?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)

<br/>

> *"Loops are the heartbeat of programming — master them, and patterns become poetry."*

</div>

---

## 📋 Table of Contents

- [📌 Overview](#-overview)
- [🎯 Problem Statement](#-problem-statement)
- [✨ Key Features](#-key-features)
- [🏗️ Project Structure](#️-project-structure)
- [🔄 Project Workflow](#-project-workflow)
- [🔺 Part A — Pattern Generation](#-part-a--pattern-generation)
- [🔢 Part B — Number Analysis](#-part-b--number-analysis)
- [🛠️ Tech Stack](#️-tech-stack)
- [📈 Results & Insights](#-results--insights)
- [🏆 Advantages](#-advantages)
- [📄 License](#-license)
- [👤 Author](#-author)
- [🙏 Acknowledgements](#-acknowledgements)

---

## 📌 Overview

The **Pattern Generator & Number Analyzer** is a beginner-friendly, interactive Python console application that demonstrates core programming concepts such as **nested loops**, **conditional logic**, **user input handling**, and **arithmetic operations**. The program presents a menu-driven interface that runs continuously until the user chooses to exit.

This project is designed to:
- Strengthen understanding of nested `for` loops and `while` loops
- Practice user input validation and menu-driven program design
- Apply mathematical logic to analyze ranges of numbers
- Produce visually structured star patterns in the console

---

## 🎯 Problem Statement

> **Objective:** Build a console-based interactive tool to generate star patterns and analyze number ranges.

You are building a simple utility program for students learning Python. The program must accept user choices from a menu and execute the corresponding task — either rendering a visual star pattern or analyzing a numeric range for properties like even/odd classification and sum computation.

| 📂 Feature | 📄 Type | 🔍 Description |
|------------|---------|----------------|
| Pattern Generator | Console Output | Prints star-based ASCII patterns |
| Right-angled Triangle | Pattern | Stars increase row by row from left |
| Pyramid | Pattern | Centered stars with leading spaces |
| Left-angled Triangle | Pattern | Right-aligned stars with indentation |
| Number Analyzer | Logic | Classifies numbers and computes sum |

The goal is to demonstrate **fundamental Python programming skills** through a clean, menu-driven interactive program.

---

## ✨ Key Features

| Feature | Description |
|--------|-------------|
| 🔁 **Infinite Menu Loop** | Program runs continuously until user selects Exit |
| 🔺 **3 Pattern Types** | Right Triangle, Pyramid, and Left Triangle using nested loops |
| 🔢 **Number Range Analysis** | Classifies each number in a range as Even or Odd |
| ➕ **Running Sum** | Computes and displays cumulative sum of the analyzed range |
| 🖥️ **CLI Interface** | Simple, clean text-based menu for user interaction |
| ✅ **Input-Driven Flow** | Fully driven by user input with branching via `if-elif-else` |
| ⚠️ **Invalid Input Handling** | Detects and reports invalid menu or pattern choices |
| 📐 **Space Alignment** | Pyramid and Left Triangle use calculated spacing for alignment |

---

## 🏗️ Project Structure

```
📦 pattern-number-analyzer/
│
├── 📄 project-2.py          ← Main Python script (entry point)
│
└── 📄 README.md             ← Project documentation
```

---

## 🔄 Project Workflow

```
Program Start
      │
      ▼
┌─────────────────────────────┐
│   Display Main Menu         │  ← Options: Pattern / Analyze / Exit
└────────────┬────────────────┘
             │
     ┌───────┴────────┐
     ▼                ▼
┌─────────────┐   ┌──────────────────┐
│  Choice: 1  │   │    Choice: 2     │
│  (Pattern)  │   │  (Analyze Range) │
└──────┬──────┘   └────────┬─────────┘
       │                   │
       ▼                   ▼
┌─────────────┐   ┌──────────────────┐
│ Choose Type │   │ Input Start/End  │
│ 1/2/3       │   │ Even/Odd + Sum   │
└──────┬──────┘   └────────┬─────────┘
       │                   │
       ▼                   ▼
┌─────────────────────────────┐
│   Print Output to Console   │
└────────────┬────────────────┘
             │
             ▼
     Loop Back to Menu
             │
      (Choice: 3) Exit ✅
```

---

## 🔺 Part A — Pattern Generation

### 📝 1. What is Pattern Printing?

Pattern printing is a classic programming exercise that uses **nested loops** to produce visual arrangements of characters. It builds intuition for loop control, indentation, and how rows and columns relate to iteration counts.

---

### 🗺️ 2. Pattern Types — Overview

| Pattern | Shape | Logic Used |
|---------|-------|------------|
| 1️⃣ | **Right-angled Triangle** | Outer loop for rows, inner loop prints `i` stars |
| 2️⃣ | **Pyramid** | Leading spaces decrease, stars follow `2*i - 1` formula |
| 3️⃣ | **Left-angled Triangle** | Leading spaces decrease, stars increase by row |

---

### 🔺 3. Right-angled Triangle

> Stars increase with each row, aligned to the left.

**Logic:**
```python
for i in range(1, rows + 1):
    for j in range(i):
        print("*", end=" ")
    print()
```

**Output (rows = 4):**
```
* 
* * 
* * * 
* * * * 
```

---

### 🏔️ 4. Pyramid Pattern

> Centered pyramid using leading spaces and an odd number of stars per row.

**Logic:**
```python
for i in range(1, rows + 1):
    for j in range(rows - i):      # Leading spaces
        print(" ", end=" ")
    for k in range(2 * i - 1):     # Stars: 1, 3, 5, ...
        print("*", end=" ")
    print()
```

**Output (rows = 4):**
```
      * 
    * * * 
  * * * * * 
* * * * * * * 
```

---

### 🔻 5. Left-angled Triangle

> Right-aligned triangle using indentation that decreases per row.

**Logic:**
```python
for i in range(1, rows + 1):
    for j in range(rows - i):      # Leading spaces
        print(" ", end=" ")
    for k in range(i):             # Stars increase
        print("*", end=" ")
    print()
```

**Output (rows = 4):**
```
      * 
    * * 
  * * * 
* * * * 
```

---

## 🔢 Part B — Number Analysis

### 🔍 6. Number Range Analyzer

> Iterates over a user-defined range and classifies each number as Even or Odd, then computes the total sum.

**Logic:**
```python
for i in range(start, end + 1):
    if i % 2 == 0:
        print(f'Number {i} is Even.')
    else:
        print(f'Number {i} is Odd.')
    sum = sum + i

print(f'Sum of all numbers from {start} to {end} is: {sum}')
```

**Key Concepts Used:**

| Concept | Detail |
|---------|--------|
| 🔁 `range(start, end+1)` | Inclusive range iteration |
| ➗ Modulus `%` Operator | `i % 2 == 0` → Even check |
| ➕ Accumulator Pattern | Running total using `sum = sum + i` |
| 🖨️ f-strings | Formatted output with variable interpolation |

**Sample Output (range 1 to 5):**
```
Number 1 is Odd.
Number 2 is Even.
Number 3 is Odd.
Number 4 is Even.
Number 5 is Odd.
Sum of all numbers from 1 to 5 is: 15
```

---

## 🛠️ Tech Stack

| Tool | Version | Purpose |
|------|---------|---------|
| 🐍 **Python** | 3.8+ | Core programming language |
| 🔁 **While Loop** | Built-in | Infinite menu loop control |
| 🔂 **For Loop** | Built-in | Row and column iteration for patterns |
| 🧮 **Arithmetic Operators** | Built-in | Modulus, addition, multiplication |
| 🖨️ **print() / input()** | Built-in | Console I/O and user interaction |
| 📐 **f-strings** | Python 3.6+ | Formatted string output |

---

## 📈 Results & Insights

After running the program, the following outputs are produced:

- ✅ **3 Distinct Star Patterns** — Right Triangle, Pyramid, and Left-angled Triangle
- 🔢 **Even/Odd Classification** — Every integer in the user-specified range is labeled
- ➕ **Range Sum** — Accurate cumulative sum displayed at the end of each analysis
- 🔁 **Persistent Menu** — Program loops back after every task until manually exited
- ⚠️ **Error Feedback** — Invalid choices trigger a clear "Invalid Choice!" message

---

## 🏆 Advantages

| Advantage | Detail |
|-----------|--------|
| 🎓 **Beginner Friendly** | Core concepts: loops, conditionals, and I/O in one project |
| 🔄 **Reusability** | Pattern logic can be extracted into reusable functions |
| 📚 **Educational** | Each pattern reinforces nested loop reasoning and spacing math |
| 🖥️ **No Dependencies** | Runs with pure Python — no external libraries needed |
| ⚡ **Lightweight** | Single-file script, instantly runnable from any terminal |
| 🧪 **Extensible** | Easy to add new patterns (Diamond, Hollow Triangle, etc.) |
| 📖 **Readable Code** | Clear `if-elif-else` structure makes logic easy to follow |
| 🛡️ **Input Safety** | Invalid menu and pattern choices are caught and reported |

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for full details.

```
MIT License — Free to use, modify, and distribute with attribution.
```

---

## 👤 Author

<div align="center">

### Ayush Isamaliya

[![GitHub](https://img.shields.io/badge/GitHub-yourhandle-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/isamaliya16)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ayush-isamaliya-686533312/)

> *"Every pattern starts with a single star — just like every program starts with a single line."*

**🎓 Role:** Junior Python Developer | Programming Enthusiast \
**📍 Location:** India\
**🛠️ Skills:** Python · Loops · CLI Applications · Logic Building · Pattern Programming

</div>

---

## 🙏 Acknowledgements

Special thanks to the following resources and communities that made this project possible:

- 📚 [Python Official Docs](https://docs.python.org/3/) — Official Python language reference
- 🔁 [Real Python — Loops](https://realpython.com/python-for-loop/) — In-depth loop tutorials
- 📐 [GeeksForGeeks — Patterns](https://www.geeksforgeeks.org/programs-printing-pyramid-patterns-python/) — Pattern printing examples
- 🖥️ [W3Schools Python](https://www.w3schools.com/python/) — Beginner Python reference
- 🧮 [Python f-strings Guide](https://realpython.com/python-f-strings/) — Formatted string literals
- 💬 [Stack Overflow Community](https://stackoverflow.com/) — Problem-solving support
- 📖 [Kaggle Learn](https://www.kaggle.com/learn) — Python and programming courses

---

<div align="center">

---

*Made with ❤️ and ☕ — Last updated: 27 May, 2026*

</div>
