# 📊 Northwind Business Analysis Dashboard

## 📌 Project Overview

This project analyzes sales performance using the Northwind database. Data was extracted from PostgreSQL using SQL, transformed into a business-friendly sales view, and visualized in Power BI to provide actionable business insights.

The dashboard helps monitor revenue, orders, customers, product performance, employee performance, geographic sales, and category trends.

---

## 📷 Dashboard Preview

<p align="center">
  <img src="Screenshots/dashboard.png" width="900">
</p>

## 📈 Key Business Insights

- 💰 Total Revenue: $1.27M
- 📦 Total Orders: 830
- 👥 Total Customers: 89
- 📦 Units Sold: 51K
- 💵 Average Order Value: $1.53K

## 🛠️ Tools Used

- PostgreSQL 18
- SQL
- pgAdmin 4
- Power BI Desktop
- DAX (Data Analysis Expressions)
- Git
- GitHub
- Northwind Sample Database

---

## 📂 Dataset

**Database:** Northwind

The dashboard is built from a custom SQL view named `sales_data`, created by joining multiple Northwind tables to produce a business-ready dataset.

Main tables include:

- Orders
- Order Details
- Customers
- Employees
- Products
- Categories
- Suppliers

---

# SQL View

The SQL view combines sales transactions into a single reporting table containing:

- Order ID
- Order Date
- Customer
- Company
- Country
- Product
- Category
- Quantity
- Unit Price
- Discount
- Revenue
- Employee

## SQL Analysis

### Total Revenue Calculation

Calculates the total sales revenue used in the dashboard KPI.

<p align="center">
  <img src="Screenshots/sql-total-revenue.png" width="850">
</p>

### Top Products

Ranks products by total revenue to identify the highest-performing products.

<p align="center">
  <img src="Screenshots/sql-top-products.png" width="850">
</p>

### Top Employees

Ranks employees by total revenue and order volume to identify the strongest sales performers.

<p align="center">
  <img src="Screenshots/sql-top-employees.png" width="850">
</p>



## 📈 Dashboard KPIs

The dashboard summarizes overall business performance using the following key performance indicators (KPIs):

- 💰 Total Revenue
- 📦 Total Orders
- 👥 Total Customers
- 📦 Units Sold
- 💵 Average Order Value
---

# 📊 Dashboard Visualizations

### Revenue Analysis

- Revenue by Month
- Revenue by Country
- Revenue by Category

### Product Analysis

- Top Products
- Revenue by Category (Donut Chart)

### Employee Analysis

- Top Employees

### Customer Analysis

- Companies by Revenue

### Interactive Filters

- Year
- Country
- Product Category

---



# 📁 Repository Structure

```
Northwind-Business-Analysis/
│
├── README.md
├── LICENSE
├── Northwind-Business-Analysis.pbix
├── 00_original_database.sql
├── 01_create_sales_data_view.sql
├── 02_analysis_queries.sql
│
└── screenshots/
    ├── dashboard.png
    ├── sql-total-revenue.png
    ├── sql-top-products.png
    └── sql-top-employees.png

---
## 🚀 Skills Demonstrated

- SQL Joins
- PostgreSQL Views
- Data Cleaning
- Data Modeling
- DAX Measures
- KPI Design
- Interactive Dashboards
- Business Analysis
- Data Visualization
- Git & GitHub Version Control

### SQL

- INNER JOIN
- Views
- Calculated Columns
- Data Transformation

### PostgreSQL

- Database Design
- View Creation
- Query Optimization

### Power BI

- Data Import
- Data Modeling
- DAX Measures
- KPI Cards
- Line Charts
- Bar Charts
- Donut Charts
- Slicers
- Dashboard Design

---

# Business Value

This dashboard enables business users to:

- Monitor revenue performance
- Identify top-selling products
- Track employee sales performance
- Analyze sales by country
- Compare product category performance
- Explore sales interactively using filters

---

# Author

**Md Shariful Islam**

Data Analyst | SQL | PostgreSQL | Power BI


**GitHub:**  
[Sharifu-Analytics](https://github.com/Sharifu-Analytics)

**LinkedIn:**  
[Md Shariful Islam](https://linkedin.com/in/islam-freelancer)

