# 🚢 Titanic Analysis

<p align="center">
  <b>Exploratory Data Analysis of the Titanic Dataset</b><br>
  A practical Python project for understanding passenger data, survival patterns and relationships between variables.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.x-blue?logo=python" alt="Python">
  <img src="https://img.shields.io/badge/Pandas-Data%20Analysis-150458?logo=pandas" alt="Pandas">
  <img src="https://img.shields.io/badge/NumPy-Numerical%20Computing-013243?logo=numpy" alt="NumPy">
  <img src="https://img.shields.io/badge/Matplotlib-Visualization-orange" alt="Matplotlib">
  <img src="https://img.shields.io/badge/Seaborn-Visualization-4C9A9A" alt="Seaborn">
  <img src="https://img.shields.io/badge/Jupyter-Notebook-F37626?logo=jupyter" alt="Jupyter">
</p>

---

## 📌 Project Overview

**Titanic Analysis** is a Python-based exploratory data analysis project built in Jupyter Notebook.

The project explores the Titanic passenger dataset to understand the information contained in the data and investigate patterns related to passenger survival.

The notebook follows a practical data-analysis workflow:

```text
Load Data
   ↓
Inspect Dataset
   ↓
Understand Variables
   ↓
Check Data Quality
   ↓
Clean / Prepare Data
   ↓
Perform Exploratory Analysis
   ↓
Create Visualizations
   ↓
Interpret Patterns
```

This project is especially useful for beginners who are learning how to work with real-world datasets using Python.

---

# 🎯 Project Objectives

The main objectives of this project are:

- Load the Titanic dataset into Python.
- Understand the structure of the dataset.
- Inspect rows, columns and data types.
- Explore passenger-related information.
- Examine the survival variable.
- Investigate relationships between survival and other available variables.
- Identify missing or incomplete data.
- Perform basic data preparation.
- Generate descriptive statistics.
- Create visualizations for better understanding.
- Practice an end-to-end Exploratory Data Analysis workflow.

---

# 🧰 Technologies & Libraries

The project uses Python and common data-analysis libraries.

## 🐍 Python

Python is the main programming language used to perform the analysis.

It provides a simple and powerful environment for:

- Data analysis
- Data manipulation
- Visualization
- Statistics
- Machine learning

---

## 🐼 Pandas

Pandas is used for working with the Titanic dataset in DataFrame format.

Typical operations include:

```python
import pandas as pd
```

```python
df.head()
```

```python
df.info()
```

```python
df.describe()
```

```python
df.shape
```

```python
df.columns
```

Pandas makes it easy to filter, summarize and transform tabular data.

---

## 🔢 NumPy

NumPy provides numerical functionality used in data processing.

```python
import numpy as np
```

It is useful for:

- Numerical calculations
- Arrays
- Mathematical operations
- Missing-value handling
- Supporting Pandas operations

---

## 📊 Matplotlib

Matplotlib is used for creating charts and visual representations of the data.

```python
import matplotlib.pyplot as plt
```

It can be used for:

- Bar charts
- Histograms
- Line charts
- Scatter plots
- Other analytical plots

---

## 🎨 Seaborn

Seaborn is used for statistical data visualization.

```python
import seaborn as sns
```

It is especially useful for exploring relationships between Titanic variables.

---

## 📓 Jupyter Notebook

The complete project is contained in:

```text
Titanic_Analysis.ipynb
```

Jupyter allows code, output, charts and explanations to be kept together in one interactive analysis.

---

# 📂 Project Structure

A recommended project structure is:

```text
Titanic_Analysis/
│
├── Titanic_Analysis.ipynb
├── Titanic-Dataset.csv
├── README.md
└── images/
    └── charts/
```

> Keep the dataset filename and path consistent with the path used in the notebook.

---

# 🚢 About the Titanic Dataset

The Titanic dataset is a classic dataset used for learning data analysis and machine learning.

It contains information about passengers aboard the Titanic and includes variables that can be used to study survival outcomes.

Common Titanic variables include information such as:

- Passenger identifier
- Passenger class
- Passenger name
- Sex
- Age
- Number of siblings or spouses aboard
- Number of parents or children aboard
- Ticket
- Fare
- Cabin
- Port of embarkation
- Survival status

The exact fields used by this project should be interpreted according to the supplied notebook and dataset.

---

# 🔍 Understanding the Main Variables

## 🆔 Passenger Information

Passenger identifiers can be used to distinguish individual records.

An identifier generally should not automatically be treated as a meaningful predictive feature.

---

## 🎫 Passenger Class

Passenger class provides information about the class/category associated with a passenger.

It can be useful when investigating whether survival patterns differ between passenger groups.

---

## 👤 Sex

Sex is a categorical variable that can be compared against survival outcomes.

For example, an analysis can compare survival counts between different sex categories.

---

## 🎂 Age

Age is a numerical variable.

It can be analyzed to understand:

- Age distribution
- Average age
- Age groups
- Potential relationship between age and survival

---

## 👨‍👩‍👧 Family-Related Variables

Variables representing siblings, spouses, parents or children can provide information about family relationships aboard the ship.

These fields can be used to explore whether family size or family presence is associated with survival patterns.

---

## 💰 Fare

Fare is a numerical financial variable.

It can be analyzed using:

- Mean
- Median
- Minimum
- Maximum
- Distribution
- Comparison across passenger groups

---

## ⚓ Embarkation

The embarkation variable represents the port/category associated with where passengers boarded.

It can be used for categorical comparisons and visualization.

---

# 🔄 Analysis Workflow

## 1️⃣ Load the Dataset

The first step is to load the Titanic data into a Pandas DataFrame.

A typical approach is:

```python
import pandas as pd

df = pd.read_csv("Titanic-Dataset.csv")
```

Once loaded, `df` becomes the main object used throughout the analysis.

---

# 2️⃣ Inspect the First Records

The first records can be displayed using:

```python
df.head()
```

This helps understand:

- What the dataset looks like
- What values appear in each column
- Whether the data was loaded correctly

---

# 3️⃣ Inspect Dataset Dimensions

The shape of the DataFrame can be checked with:

```python
df.shape
```

This gives the number of:

- Rows
- Columns

Knowing the dataset size is one of the first steps in any EDA project.

---

# 4️⃣ Inspect Column Names

Column names can be viewed using:

```python
df.columns
```

This helps identify the variables available for analysis.

Understanding the available variables is important before creating charts or calculating statistics.

---

# 5️⃣ Inspect Data Types

The notebook can use:

```python
df.info()
```

This provides information about:

- Column names
- Data types
- Non-null values
- Dataset structure

This is useful for identifying columns that may need type conversion.

---

# 🧹 Data Quality & Cleaning

Data cleaning is an important part of Titanic analysis because some passenger fields can contain missing values.

## Missing Values

Missing values can be inspected using:

```python
df.isnull().sum()
```

This helps identify which columns require attention.

Possible approaches include:

- Filling missing values
- Removing selected records
- Using a suitable statistic
- Keeping missing values when appropriate

The correct method depends on the analysis objective and the specific notebook workflow.

---

## Duplicate Records

Duplicate rows can be checked with:

```python
df.duplicated().sum()
```

If confirmed duplicate records are not required, they can be removed using:

```python
df = df.drop_duplicates()
```

However, duplicate-looking values should not automatically be removed unless the complete records are actually duplicates.

---

# 📊 Descriptive Statistics

The `describe()` function is useful for understanding numerical variables.

```python
df.describe()
```

It can provide:

| Statistic | Meaning |
|---|---|
| Count | Number of available observations |
| Mean | Average value |
| Std | Standard deviation |
| Min | Minimum value |
| 25% | First quartile |
| 50% | Median |
| 75% | Third quartile |
| Max | Maximum value |

This gives a quick numerical summary of the dataset.

---

# 🧠 Exploratory Data Analysis

The main purpose of EDA is to understand patterns before applying more advanced techniques.

For the Titanic dataset, useful questions include:

### Survival

- How many passengers survived?
- How many passengers did not survive?
- What is the overall survival distribution?

### Passenger Class

- Does survival differ by passenger class?
- Which class has the largest number of passengers?
- How does class relate to survival?

### Sex

- How does survival differ between passenger sex categories?
- Are there visible differences in survival rates?

### Age

- What is the age distribution?
- Are younger passengers represented differently?
- Does age appear related to survival?

### Fare

- How is fare distributed?
- Does fare differ between passenger groups?
- Is there a relationship between fare and survival?

### Family

- How do family-related variables vary?
- Does family size appear related to survival?

These questions turn the dataset into an analytical problem rather than simply a collection of rows and columns.

---

# 📈 Data Visualization

Visualization is one of the most important parts of this project.

The project uses Python visualization libraries to make passenger patterns easier to understand.

---

## 📊 Survival Distribution

A bar chart can be used to compare the number of passengers who survived and those who did not.

Example:

```python
sns.countplot(x="Survived", data=df)
plt.title("Survival Distribution")
plt.show()
```

This gives a quick visual understanding of the target variable.

---

## 👥 Survival by Sex

A categorical visualization can compare survival across sex categories.

Example:

```python
sns.countplot(x="Sex", hue="Survived", data=df)
plt.title("Survival by Sex")
plt.show()
```

This allows the viewer to compare survival outcomes between groups.

---

## 🎫 Survival by Passenger Class

Passenger class can also be compared with survival:

```python
sns.countplot(x="Pclass", hue="Survived", data=df)
plt.title("Survival by Passenger Class")
plt.show()
```

This helps reveal differences between passenger classes.

---

## 🎂 Age Distribution

A histogram can be used to study passenger age:

```python
plt.hist(df["Age"].dropna(), bins=20)
plt.xlabel("Age")
plt.ylabel("Frequency")
plt.title("Age Distribution")
plt.show()
```

This helps understand how ages are distributed in the dataset.

---

## 💰 Fare Distribution

Fare can also be visualized:

```python
plt.hist(df["Fare"], bins=20)
plt.xlabel("Fare")
plt.ylabel("Frequency")
plt.title("Fare Distribution")
plt.show()
```

This makes the spread of ticket fares easier to see.

---

# 🔗 Relationship Analysis

One of the main advantages of EDA is the ability to compare variables.

For example:

```text
Survival
   │
   ├── Sex
   ├── Passenger Class
   ├── Age
   ├── Fare
   └── Family Variables
```

These comparisons can reveal patterns that are difficult to see from individual columns.

---

# 📦 Correlation Analysis

For numerical variables, a correlation matrix can be useful.

Example:

```python
correlation = df.corr(numeric_only=True)

sns.heatmap(correlation, annot=True)
plt.title("Correlation Heatmap")
plt.show()
```

A correlation heatmap can help identify relationships between numerical variables.

> Correlation does not prove causation. A strong correlation only indicates that two variables move together according to the selected correlation measure.

---

# 💻 Example End-to-End Code

A simple Titanic EDA workflow can look like:

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Load dataset
df = pd.read_csv("Titanic-Dataset.csv")

# Inspect data
print(df.head())
print(df.shape)
print(df.columns)

# Dataset information
df.info()

# Missing values
print(df.isnull().sum())

# Duplicate records
print(df.duplicated().sum())

# Statistical summary
print(df.describe())

# Survival visualization
sns.countplot(x="Survived", data=df)
plt.title("Survival Distribution")
plt.show()

# Survival by sex
sns.countplot(x="Sex", hue="Survived", data=df)
plt.title("Survival by Sex")
plt.show()

# Survival by class
sns.countplot(x="Pclass", hue="Survived", data=df)
plt.title("Survival by Passenger Class")
plt.show()
```

This example demonstrates the basic structure of a complete Titanic EDA project.

---

# 🧪 Data Analysis Best Practices

## ✅ Inspect First

Always inspect a dataset before changing it.

```python
df.head()
df.info()
df.shape
```

---

## ✅ Check Missing Values

Missing values can affect statistics and visualizations.

```python
df.isnull().sum()
```

---

## ✅ Understand Data Types

Make sure numerical, categorical and date fields are represented appropriately.

---

## ✅ Use Appropriate Visualizations

Different questions require different charts.

| Question | Useful Visualization |
|---|---|
| Category counts | Bar / Count Plot |
| Distribution | Histogram |
| Numerical relationship | Scatter Plot |
| Group comparison | Box Plot |
| Correlation | Heatmap |
| Time trend | Line Chart |

---

## ✅ Interpret Carefully

Charts show patterns, but interpretation should remain connected to the actual dataset.

---

# 📚 Learning Outcomes

After completing this project, a beginner can practice:

- Python programming
- Pandas DataFrames
- NumPy
- CSV data handling
- Dataset inspection
- Data cleaning
- Missing-value analysis
- Duplicate detection
- Descriptive statistics
- Categorical analysis
- Numerical analysis
- Data visualization
- Exploratory Data Analysis
- Basic correlation analysis
- Markdown documentation

These skills are useful foundations for:

- Data Analytics
- Data Science
- Machine Learning
- Artificial Intelligence
- Business Intelligence

---

# 🚀 How to Run the Project

## Step 1: Install Python

Install Python 3.x.

Verify:

```bash
python --version
```

---

## Step 2: Install Libraries

Run:

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

---

## Step 3: Start Jupyter Notebook

Run:

```bash
jupyter notebook
```

---

## Step 4: Open the Notebook

Open:

```text
Titanic_Analysis.ipynb
```

---

## Step 5: Add the Dataset

Place the Titanic CSV file in the correct folder expected by the notebook.

Example:

```text
Titanic_Analysis/
│
├── Titanic_Analysis.ipynb
├── Titanic-Dataset.csv
└── README.md
```

---

## Step 6: Run the Notebook

Run the notebook cells from top to bottom.

If the dataset is stored in a different location, update the `pd.read_csv()` path accordingly.

---

# 📦 Requirements

A basic `requirements.txt` can contain:

```text
pandas
numpy
matplotlib
seaborn
jupyter
```

Install with:

```bash
pip install -r requirements.txt
```

---

# 🔬 Future Improvements

This project can be extended beyond basic EDA.

## 🤖 Machine Learning

The Titanic dataset is commonly used as an introduction to classification.

A future version could train models such as:

- Logistic Regression
- Decision Tree
- Random Forest
- K-Nearest Neighbors
- Support Vector Machine

The target could be the survival variable if the dataset is prepared appropriately.

---

## 🎯 Feature Engineering

Potential features could include:

- Family size
- Is alone
- Family group
- Title extracted from name
- Age groups
- Fare per person/group

Feature engineering can help transform raw columns into more useful analytical variables.

---

## 📊 Interactive Dashboard

The analysis could be turned into an interactive dashboard using:

- Streamlit
- Plotly
- Power BI
- Tableau

Possible dashboard filters:

```text
Passenger Class
       ↓
Sex
       ↓
Age Group
       ↓
Survival
       ↓
Fare
```

---

## 🧠 Advanced Statistical Analysis

Future versions could explore:

- Survival rates
- Group comparisons
- Correlation
- Distribution analysis
- Outlier detection
- Statistical tests

---

# 🏗️ Recommended Professional Structure

For a larger GitHub project:

```text
Titanic_Analysis/
│
├── data/
│   └── Titanic-Dataset.csv
│
├── notebooks/
│   └── Titanic_Analysis.ipynb
│
├── images/
│   └── charts/
│
├── src/
│   └── analysis.py
│
├── README.md
├── requirements.txt
└── LICENSE
```

This structure separates data, notebooks, code and documentation.

---

# 🏆 Project Highlights

```text
🚢 Titanic Dataset
       ↓
🐍 Python
       ↓
🐼 Pandas
       ↓
🔢 NumPy
       ↓
🧹 Data Preparation
       ↓
🔎 Exploratory Data Analysis
       ↓
📊 Statistical Analysis
       ↓
📈 Visualization
       ↓
🧠 Pattern Understanding
```

### Skills Practiced

| Category | Skills |
|---|---|
| Programming | Python |
| Data Handling | Pandas |
| Numerical Computing | NumPy |
| Visualization | Matplotlib |
| Statistical Visualization | Seaborn |
| Environment | Jupyter Notebook |
| Analysis | Exploratory Data Analysis |
| Documentation | Markdown |

---

# 📌 Project Status

**Status:** ✅ Completed Exploratory Data Analysis Project

### Core workflow

- [x] Load Titanic dataset
- [x] Inspect dataset
- [x] Understand columns
- [x] Check data quality
- [x] Explore passenger information
- [x] Analyze survival-related patterns
- [x] Perform descriptive analysis
- [x] Create visualizations
- [x] Document the project

---

# 👨‍💻 Author

## **Prit Baldha**

Python & Data Analysis Learner

This project was created to practice practical skills in:

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Exploratory Data Analysis
- Data Visualization

---

# 🌟 Conclusion

The **Titanic Analysis** project demonstrates a complete beginner-friendly approach to exploratory data analysis.

Instead of looking at the dataset as only a table of passenger records, the project uses Python to investigate patterns, compare groups, understand distributions and communicate findings through visualizations.

The core learning process is:

> **Load → Inspect → Clean → Analyze → Visualize → Understand**

This workflow is one of the most important foundations for becoming comfortable with real-world Data Science.

---

# 📄 License

This project is intended for educational and learning purposes.

It can be used as a reference for practicing Python, Pandas, NumPy, Matplotlib, Seaborn and exploratory data analysis.

---

<p align="center">
  <b>🚢 Titanic Analysis</b><br>
  <i>Exploring passenger data with Python.</i>
</p>

<p align="center">
  Made with ❤️ by <b>Prit Baldha</b>
</p>
