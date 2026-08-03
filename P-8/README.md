# 📚 Personal Journal Manager

A simple menu-driven Python application for creating and managing personal journal entries using file handling.

## 📌 Overview

The Personal Journal Manager lets users add, view, search, and delete journal entries. Each new entry is stored in `journal.txt` with the current date and time.

## ✨ Features

- Add new journal entries
- Automatically save date and time
- View all saved entries
- Search entries using a keyword
- Delete all entries with confirmation
- Handle empty journal data
- Handle invalid menu choices
- Menu-driven interface

## 🛠️ Technologies & Concepts

- Python 3
- Object-Oriented Programming
- File Handling
- `datetime` Module
- Exception Handling
- `match-case`
- Loops and Conditions

## 📂 Project Structure

```text
Personal-Journal-Manager/
├── index.py
├── journal.txt
└── README.md
```

## ▶️ How to Run

```bash
python index.py
```

## 📋 Program Menu

```text
--- 📚 Personal Journal Manager 📚 ---
1. Add New Entry
2. View All Entries
3. Search Entry
4. Delete All Entries
5. Exit
```

## 💻 Sample Output

### Add Entry

```text
Enter your choice : 1
Enter your journal entry : Today I learned Python.

✅ Entry added successfully...
```

### View All Entries

```text
Your journal entries :
---------------------------
2026-07-15 11:43:39.443868
Today I learned Python.

2026-07-15 11:43:58.318222
I completed my Python assignment.
```

### Search Entry

```text
Enter keyword to search : my

I completed my Python assignment.
```

### Delete All Entries

```text
Are you sure to delete all entries? (yes/no) : yes

All entries deleted.
```

### Invalid Choice

```text
❌ Invalid choice! Please enter 1 to 5.
```

## 🎯 Learning Outcomes

This project demonstrates classes and objects, reading and writing text files, appending data, keyword searching, date and time handling, exception handling, and menu-driven programming.

## 👨‍💻 Author

**Ayush Donga**

🎓 Student at P P Savani University  
🐍 Python Developer | Learning AI & Automation  
📍 Surat, Gujarat, India

### 🎥 Project Demo Video

[▶️ Watch Project Demo Video](https://drive.google.com/file/d/1Pu882CagN_ZNVIlEhvtrttjl8Y0DboWy/view?usp=drive_link)

---

⭐ If you found this project useful, consider giving it a star!

Made with ❤️ using Python
