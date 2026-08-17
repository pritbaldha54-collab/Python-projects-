# 🌍 Air Quality Analysis

<p align="center">
  <b>Beginner Python Data Analysis Project</b><br>
  Exploring air-quality measurements with Python, Pandas, NumPy, Matplotlib and Seaborn.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.x-blue?logo=python" alt="Python">
  <img src="https://img.shields.io/badge/Pandas-Data%20Analysis-150458?logo=pandas" alt="Pandas">
  <img src="https://img.shields.io/badge/NumPy-Scientific%20Computing-013243?logo=numpy" alt="NumPy">
  <img src="https://img.shields.io/badge/Matplotlib-Visualization-orange" alt="Matplotlib">
  <img src="https://img.shields.io/badge/Seaborn-Visualization-4C9A9A" alt="Seaborn">
</p>

---

## 📌 Project Overview

**Air Quality Analysis** is a beginner-friendly exploratory data analysis project built in Python.

The project works with an air-quality dataset containing measurements such as carbon monoxide (CO), nitrogen oxides (NOx), nitrogen dioxide (NO2), hydrocarbon-related measurements, temperature, relative humidity, and absolute humidity.

The notebook follows a practical data-analysis workflow:

1. Import Python libraries
2. Load the dataset
3. Inspect the dataset structure
4. Check missing values
5. Check duplicate records
6. Generate descriptive statistics
7. Clean invalid values
8. Handle missing numeric values
9. Analyze important air-quality variables
10. Visualize distributions

The analysis is intentionally kept simple so that beginners can understand how a real-world dataset is explored and prepared before moving into more advanced data science or machine-learning work.

---

## 🎯 Project Objectives

The main objectives of this project are:

- Understand the structure of an air-quality dataset.
- Identify the number of rows and columns.
- Inspect column names and data types.
- Detect missing values.
- Identify duplicate records.
- Understand descriptive statistics.
- Detect invalid placeholder values.
- Replace invalid values with missing values.
- Fill missing numeric values using the column mean.
- Analyze CO, NOx and NO2 measurements.
- Create histograms to understand data distributions.
- Practice a complete beginner-level EDA workflow.

---

## 🗂️ Dataset

The notebook loads the dataset using:

```python
df = pd.read_csv("Air Quality.csv")
```

The dataset initially contains:

- **9,471 rows**
- **17 columns**

The first rows contain measurements recorded by date and time. The columns include:

| Column | Description |
|---|---|
| `Date` | Measurement date |
| `Time` | Measurement time |
| `CO(GT)` | Ground-truth carbon monoxide measurement |
| `PT08.S1(CO)` | Sensor measurement associated with CO |
| `NMHC(GT)` | Ground-truth non-methane hydrocarbons |
| `C6H6(GT)` | Ground-truth benzene measurement |
| `PT08.S2(NMHC)` | Sensor measurement associated with NMHC |
| `NOx(GT)` | Ground-truth nitrogen oxides |
| `PT08.S3(NOx)` | Sensor measurement associated with NOx |
| `NO2(GT)` | Ground-truth nitrogen dioxide |
| `PT08.S4(NO2)` | Sensor measurement associated with NO2 |
| `PT08.S5(O3)` | Sensor measurement associated with O3 |
| `T` | Temperature |
| `RH` | Relative humidity |
| `AH` | Absolute humidity |
| `Unnamed: 15` | Empty column in the loaded dataset |
| `Unnamed: 16` | Empty column in the loaded dataset |

> **Note:** The README describes the dataset exactly as it is used in the supplied notebook. The notebook does not rename the original columns.

---

## 🛠️ Technologies & Libraries

This project uses the following Python libraries:

### 🐍 Python

The core programming language used for loading, cleaning, analyzing and visualizing the data.

### 🐼 Pandas

Used for:

- Reading the CSV file
- Working with DataFrames
- Inspecting columns and data types
- Checking missing values
- Finding duplicates
- Calculating descriptive statistics
- Cleaning and filling data

Example:

```python
import pandas as pd

df = pd.read_csv("Air Quality.csv")
```

### 🔢 NumPy

Used for numerical operations and identifying numeric columns.

Example:

```python
import numpy as np

numeric_columns = df.select_dtypes(include=np.number).columns
```

### 📊 Matplotlib

Used to create histograms and visualize distributions.

Example:

```python
import matplotlib.pyplot as plt
```

### 🎨 Seaborn

Imported for statistical visualization and future extensions of the analysis.

```python
import seaborn as sns
```

---

## 📁 Project Structure

A recommended project structure is:

```text
Air_Quality_Analysis/
│
├── Air_Quality_Analysis.ipynb
├── Air Quality.csv
├── README.md
└── images/
    └── charts/
```

### File Details

| File | Purpose |
|---|---|
| `Air_Quality_Analysis.ipynb` | Main Jupyter Notebook containing the complete analysis |
| `Air Quality.csv` | Input air-quality dataset |
| `README.md` | Project documentation |
| `images/` | Optional folder for exported charts |

---

# 🔎 Analysis Workflow

## 1. Import Libraries

The project begins by importing the four main libraries:

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
```

This establishes the tools required for data manipulation, numerical processing and visualization.

---

## 2. Read the Dataset

The CSV dataset is loaded into a Pandas DataFrame:

```python
df = pd.read_csv("Air Quality.csv")
df.head()
```

The first five records are displayed to get an initial understanding of the data.

The notebook shows measurements beginning with dates such as `10/03/2004` and hourly times such as `18:00:00`, `19:00:00`, and so on.

---

## 3. Check Dataset Shape

The notebook checks the dimensions of the DataFrame:

```python
df.shape
```

The result is:

```text
(9471, 17)
```

So the loaded dataset contains **9,471 rows and 17 columns**.

---

## 4. Inspect Column Names

The notebook checks all column names:

```python
df.columns
```

This confirms the available air-quality and environmental measurements before performing further analysis.

---

## 5. Inspect Data Types and Non-Null Values

The project uses:

```python
df.info()
```

The notebook shows:

- `Date` and `Time` as string columns.
- Most measurement columns as `float64`.
- The two `Unnamed` columns contain no non-null values.
- The main measurement columns contain **9,357 non-null records** before cleaning.

This inspection is important because it reveals the overall structure and data-quality issues.

---

## 6. Check Missing Values

Missing values are checked using:

```python
df.isnull().sum()
```

Before the invalid-value cleaning step, the notebook reports:

- **114 missing values** in `Date`
- **114 missing values** in `Time`
- **114 missing values** in each of the main measurement columns
- `Unnamed: 15` contains **9,471 missing values**
- `Unnamed: 16` contains **9,471 missing values**

This makes missing-data handling an important part of the project.

---

## 7. Check Duplicate Values

Duplicate rows are checked with:

```python
df.duplicated().sum()
```

The notebook reports:

```text
113
```

So the initial dataset contains **113 duplicate rows** according to Pandas' duplicate-row check.

The supplied notebook identifies these duplicates but does not remove them in the shown cleaning workflow.

---

# 🧹 Data Cleaning

## 8. Convert Invalid `-200` Values to Missing Values

One of the most important cleaning steps in the notebook is:

```python
df = df.replace(-200, np.nan)
```

The notebook explicitly treats **`-200` as a missing/invalid value**.

This is important because the original descriptive statistics contain many `-200` values. If these values were treated as real measurements, they would distort averages, minimum values and other statistics.

After replacement, the notebook checks missing values again:

```python
df.isnull().sum()
```

This exposes the actual missing/invalid values that were previously represented by `-200`.

---

## 9. Fill Missing Numeric Values

The notebook fills missing numeric values using the mean of each numeric column:

```python
numeric_columns = df.select_dtypes(include=np.number).columns

for column in numeric_columns:
    df[column] = df[column].fillna(df[column].mean())
```

This approach:

1. Finds all numeric columns.
2. Calculates the mean of each column.
3. Replaces missing numeric values with that column's mean.

The notebook then verifies the result:

```python
df.isnull().sum()
```

After this step, the main numeric measurements no longer contain missing values.

> **Important:** The notebook's approach is a simple beginner-friendly mean-imputation method. For a production data-science project, the choice of imputation method should depend on the dataset, measurement process and analysis objective.

---

# 📊 Exploratory Analysis

## 10. CO(GT) Analysis

The notebook analyzes the `CO(GT)` column using:

```python
df["CO(GT)"].describe()
```

After cleaning and mean filling, the notebook reports approximately:

| Statistic | Value |
|---|---:|
| Count | 9471 |
| Mean | 2.152750 |
| Standard deviation | 1.308123 |
| Minimum | 0.100000 |
| 25% | 1.200000 |
| Median | 2.152750 |
| 75% | 2.600000 |
| Maximum | 11.900000 |

### CO Distribution

A histogram is created using:

```python
plt.figure(figsize=(8,5))

plt.hist(
    df["CO(GT)"],
    bins=10,
    linewidth=1,
    edgecolor="black"
)

plt.xlabel("CO(GT)")
plt.ylabel("Frequency")
plt.title("Distribution of CO(GT)")
plt.show()
```

This visualization helps understand how the cleaned CO measurements are distributed across the observed range.

---

## 11. NOx(GT) Analysis

The notebook also analyzes nitrogen oxides:

```python
df["NOx(GT)"].describe()
```

The reported values after cleaning are approximately:

| Statistic | Value |
|---|---:|
| Count | 9471 |
| Mean | 246.896735 |
| Standard deviation | 192.258871 |
| Minimum | 2.000000 |
| 25% | 113.000000 |
| Median | 232.000000 |
| 75% | 281.500000 |
| Maximum | 1479.000000 |

### NOx Distribution

The notebook creates a histogram:

```python
plt.figure(figsize=(8,5))

plt.hist(
    df["NOx(GT)"],
    bins=10,
    linewidth=1,
    edgecolor="black"
)

plt.xlabel("NOx(GT)")
plt.ylabel("Frequency")
plt.title("Distribution of NOx(GT)")
plt.show()
```

This provides a visual overview of the frequency distribution of NOx measurements.

---

## 12. NO2(GT) Analysis

The notebook analyzes nitrogen dioxide with:

```python
df["NO2(GT)"].describe()
```

The reported values after cleaning are approximately:

| Statistic | Value |
|---|---:|
| Count | 9471 |
| Mean | 113.091251 |
| Standard deviation | 43.655793 |
| Minimum | 2.000000 |
| 25% | 86.000000 |
| Median | 113.091251 |
| 75% | 132.000000 |
| Maximum | 340.000000 |

The notebook uses the same descriptive-statistics approach to understand the central tendency and spread of NO2 measurements.

---

# 📈 Visualizations

The current notebook includes distribution plots for important air-quality measurements.

### Current visualizations

- **CO(GT) distribution**
- **NOx(GT) distribution**

The charts are created using Matplotlib histograms with:

- 10 bins
- Figure size of `8 × 5`
- Axis labels
- Chart titles
- Black-edged histogram bars

These visualizations make it easier to understand the frequency distribution of the measurements.

---

# 📋 Key Dataset Findings

Based on the supplied notebook:

### Dataset size

The dataset contains:

**9,471 rows × 17 columns**

### Initial missing values

The main measurement fields initially contain **114 missing values each**, while the two `Unnamed` columns are entirely empty.

### Duplicate records

The initial duplicate check finds:

**113 duplicate rows**

### Invalid values

The dataset uses:

**`-200` as a missing/invalid placeholder**

The notebook replaces these values with `NaN`.

### Missing-value treatment

Numeric missing values are filled with the corresponding column mean.

### CO(GT)

After cleaning, the notebook reports:

- Mean: **2.152750**
- Minimum: **0.1**
- Maximum: **11.9**

### NOx(GT)

After cleaning, the notebook reports:

- Mean: **246.896735**
- Minimum: **2**
- Maximum: **1479**

### NO2(GT)

After cleaning, the notebook reports:

- Mean: **113.091251**
- Minimum: **2**
- Maximum: **340**

---

# 🧠 What This Project Demonstrates

This project demonstrates the fundamental stages of exploratory data analysis:

```text
Raw Dataset
     ↓
Load Data
     ↓
Inspect Structure
     ↓
Check Missing Values
     ↓
Check Duplicates
     ↓
Identify Invalid Values
     ↓
Clean Data
     ↓
Handle Missing Numeric Values
     ↓
Calculate Statistics
     ↓
Create Visualizations
     ↓
Understand Data Distribution
```

These steps are commonly used before deeper statistical analysis or machine-learning modeling.

---

# 🚀 How to Run the Project

## 1. Install Python

Install Python 3.x on your computer.

You can verify the installation:

```bash
python --version
```

---

## 2. Install Required Libraries

Run:

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

---

## 3. Open the Project

Place these files in the same folder:

```text
Air_Quality_Analysis.ipynb
Air Quality.csv
README.md
```

Then start Jupyter Notebook:

```bash
jupyter notebook
```

Open:

```text
Air_Quality_Analysis.ipynb
```

---

## 4. Run the Notebook

Run the notebook cells from top to bottom.

The dataset file must be available with the expected filename:

```text
Air Quality.csv
```

because the notebook loads it using:

```python
pd.read_csv("Air Quality.csv")
```

---

# 💡 Possible Future Improvements

The current notebook is a beginner-level analysis. It can be extended significantly.

### Data cleaning improvements

- Remove completely empty columns.
- Convert `Date` and `Time` into proper datetime values.
- Investigate duplicate rows before deciding whether to remove them.
- Compare different missing-value imputation methods.
- Detect and investigate statistical outliers.
- Validate the data after cleaning.

### Exploratory analysis improvements

- Analyze all pollutant variables.
- Compare pollutant levels by month.
- Compare pollutant levels by hour.
- Study temperature and humidity relationships.
- Create box plots.
- Create scatter plots.
- Create correlation heatmaps.
- Analyze trends over time.

### Visualization improvements

Possible additional charts include:

```text
📈 Time-series plots
📊 Bar charts
📦 Box plots
🔥 Correlation heatmaps
🔵 Scatter plots
📉 Trend charts
```

### Machine-learning extension

After completing EDA, the dataset could be used as a starting point for machine-learning experiments such as:

- Pollution-level prediction
- Regression analysis
- Feature importance analysis
- Time-series forecasting
- Clustering of environmental conditions

These extensions are **not implemented in the supplied notebook** and would require additional analysis and modeling.

---

# 📚 Learning Outcomes

After completing this project, a beginner can practice:

- Reading CSV files with Pandas
- Creating and inspecting DataFrames
- Understanding rows and columns
- Checking data types
- Finding missing values
- Finding duplicate rows
- Replacing invalid values
- Selecting numeric columns
- Filling missing values
- Using `describe()`
- Creating histograms
- Adding labels and titles to charts
- Following a basic EDA workflow

---

# 🧪 Example Code

A simplified version of the main workflow is:

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Load dataset
df = pd.read_csv("Air Quality.csv")

# Inspect dataset
print(df.shape)
print(df.columns)
df.info()

# Check missing values
print(df.isnull().sum())

# Check duplicates
print(df.duplicated().sum())

# Replace invalid values
df = df.replace(-200, np.nan)

# Fill missing numeric values
numeric_columns = df.select_dtypes(include=np.number).columns

for column in numeric_columns:
    df[column] = df[column].fillna(df[column].mean())

# Analyze CO
print(df["CO(GT)"].describe())

# Visualize CO
plt.figure(figsize=(8, 5))
plt.hist(
    df["CO(GT)"],
    bins=10,
    linewidth=1,
    edgecolor="black"
)
plt.xlabel("CO(GT)")
plt.ylabel("Frequency")
plt.title("Distribution of CO(GT)")
plt.show()
```

---

# 📌 Project Status

**Status:** ✅ Completed Beginner EDA Project

The supplied notebook currently covers:

- [x] Library imports
- [x] Dataset loading
- [x] Dataset inspection
- [x] Missing-value checking
- [x] Duplicate checking
- [x] Descriptive statistics
- [x] Invalid-value cleaning
- [x] Mean-based numeric imputation
- [x] CO analysis
- [x] NOx analysis
- [x] NO2 analysis
- [x] CO distribution visualization
- [x] NOx distribution visualization

---

# 👨‍💻 Author

**Prit Baldha**

Beginner Python Data Analysis Project

---

# ⭐ Acknowledgement

This README is based on the analysis workflow, code, outputs and terminology present in the supplied `Air_Quality_Analysis(1).ipynb` notebook.

The documentation intentionally describes the work performed in the notebook rather than adding unsupported analysis results.

---

## 📄 License

This project is intended for learning and educational purposes.

You are free to use the notebook as a starting point for practicing Python, Pandas, NumPy and data visualization.

---

<p align="center">
  <b>🌱 Learn Data Analysis • Explore Data • Build Projects • Keep Improving</b>
</p>
