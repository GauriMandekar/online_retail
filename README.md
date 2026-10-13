# online_retail
this is SQL project on shop one day data i try to solve the query in as possible as 
# Online Retail Data Analysis | SQL Project

**Analyzing retail transactions to uncover product performance, sales patterns, and customer insights using SQL.**

## Overview

This project applies SQL-based data analysis to online retail transaction data to explore sales performance, evaluate product demand, and examine customer purchasing activity.

Using MySQL, I perform data exploration, data quality checks, and business-focused analysis to transform raw transaction records into meaningful insights.

The project demonstrates how SQL can support data-driven decision-making in a retail business.

## Business Objectives

* Assess the quality and reliability of transaction data.
* Analyze revenue and product sales performance.
* Identify products with high sales volume and revenue.
* Examine customer transaction patterns where customer identifiers are available.
* Investigate missing values, cancellations, and unusual transaction records.
* Translate business questions into structured SQL queries.

## Dataset

The dataset contains online retail transaction records with the following attributes:

| Column        | Description                             |
| ------------- | --------------------------------------- |
| `InvoiceNo`   | Invoice or transaction identifier       |
| `StockCode`   | Product identifier                      |
| `Description` | Product description                     |
| `Quantity`    | Quantity recorded for a transaction     |
| `InvoiceDate` | Transaction date and time               |
| `UnitPrice`   | Price per unit                          |
| `CustomerID`  | Customer identifier, where available    |
| `Country`     | Country associated with the transaction |

**Analysis period:** One day, based on the transaction records included in the current dataset.

The scope of the analysis is limited to the available records. A single-day dataset cannot establish long-term trends, seasonality, or customer retention over time.

## Technology Stack

* **SQL** — Data exploration, cleaning, transformation, and analysis
* **MySQL** — Database engine
* **MySQL Workbench** — Query development and execution
* **Git & GitHub** — Version control and project documentation

## Project Workflow

### 1. Data Exploration

* Examine the dataset structure and available attributes.
* Assess the number of records and transaction dates.
* Understand product, invoice, and customer information.

### 2. Data Quality Assessment

* Identify missing values.
* Investigate duplicate records.
* Examine zero and negative quantities.
* Check zero or invalid unit prices.
* Assess incomplete customer identifiers.

### 3. Sales Analysis

* Calculate transaction-level revenue.
* Rank products by revenue.
* Compare product sales quantities.
* Examine revenue distribution across countries.

Revenue calculation:

```sql
Quantity * UnitPrice
```

Revenue calculations must account for negative quantities, cancellations, and other exceptional transactions according to the chosen business rules.

### 4. Customer Analysis

* Examine the availability of customer identifiers.
* Analyze customer-level transactions where identifiers are present.
* Investigate records with missing customer information.

### 5. Product Performance Analysis

* Identify products with high sales quantities.
* Rank products by revenue.
* Compare product demand and sales contribution.

### 6. Advanced SQL Analysis

* Common Table Expressions (CTEs)
* Aggregate functions
* Conditional logic using `CASE`
* Ranking and window functions, where applicable
* Data-quality checks and analytical subqueries

## Business Questions

The analysis addresses questions such as:

1. How reliable and complete is the transaction data?
2. Which products contribute the most revenue?
3. Which products have the highest recorded sales quantities?
4. Which countries account for the largest share of revenue?
5. How do cancellations and negative quantities affect sales calculations?
6. How much transaction data is missing customer identifiers?
7. Which records require further investigation before reporting business results?

The SQL scripts contain the queries used to investigate these questions.

## Key Findings

*Findings will be added after executing and validating the SQL queries.*

This section will document verified results, including product rankings, revenue calculations, data-quality issues, and other insights supported by the dataset.

## Repository Structure

```text
online_retail/
│
├── data/
│   └── data.csv
│
├── sql/
│   ├── 01_dataset.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_sales_analysis.sql
│   ├── 04_customer_analysis.sql
│   ├── 05_product_analysis.sql
│   └── 06_advanced_analysis.sql
│
├── sql_questions/
│   └── questions.txt
│
└── README.md
```

*The structure above represents the intended organization. Update the filenames if they differ from the actual repository.*

## Limitations

* The analysis covers only the transaction records available for the selected day.
* Long-term sales trends and seasonal patterns cannot be evaluated using a single day of data.
* Customer-level insights depend on the completeness and reliability of customer identifiers.
* Revenue calculations depend on the treatment of cancellations, returns, and unusual transactions.
* Sales revenue should not be interpreted as profit because product costs and operating expenses are not included.

## Future Enhancements

* Expand the analysis to a longer transaction period.
* Add validated numerical findings and business recommendations.
* Develop a Power BI dashboard for sales and product performance.
* Perform deeper customer segmentation when sufficient data is available.
* Extend data validation and automate recurring analytical queries.

## Skills Demonstrated

`SQL` · `MySQL` · `Data Cleaning` · `Exploratory Data Analysis` · `Business Analysis` · `Data Quality` · `Git` · `GitHub`

## Author

**Gauri Mandekar**
B.Sc. Data Science Student
Aspiring Data Analyst

[View the project repository](https://github.com/GauriMandekar/online_retail)
