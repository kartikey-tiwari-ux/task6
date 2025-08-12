# Task 6 – Sales Trend Analysis Using Aggregations

## 📌 Objective
Analyze monthly revenue and order volume from the **Online Sales Data** using SQLite and SQL aggregation functions.

## 📂 Dataset
**File:** `Online Sales Data.csv`  
**Columns:**
- Transaction ID (INTEGER)
- Date (TEXT, format: YYYY-MM-DD)
- Product Category (TEXT)
- Product Name (TEXT)
- Units Sold (INTEGER)
- Unit Price (REAL)
- Total Revenue (REAL)
- Region (TEXT)
- Payment Method (TEXT)

## 🛠 Tools Used
- DB Browser for SQLite

## 📊 Steps Performed
1. **Created a SQLite database**
2. **Imported CSV file** into a table named `orders` using DB Browser for SQLite.
3. **Executed aggregation queries** to:
   - Calculate monthly revenue and order volume.
   - Find top 3 months by sales revenue.
   - Analyze trends for a specific year (2024).
   - Identify top 5 product categories by revenue.
4. **Exported results** to CSV files for reporting.

## 📜 SQL Queries Used

### 1. Monthly Revenue & Order Volume
```sql
SELECT 
    strftime('%Y', "Date") AS year,
    strftime('%m', "Date") AS month,
    SUM("Total Revenue") AS monthly_revenue,
    COUNT(DISTINCT "Transaction ID") AS order_volume
FROM orders
GROUP BY year, month
ORDER BY year, month;

2. Top 3 Months by Sales
sql
Copy
Edit
SELECT 
    strftime('%Y-%m', "Date") AS month_year,
    SUM("Total Revenue") AS monthly_revenue
FROM orders
GROUP BY month_year
ORDER BY monthly_revenue DESC
LIMIT 3;
3. Trends for 2024
sql
Copy
Edit
SELECT 
    strftime('%Y', "Date") AS year,
    strftime('%m', "Date") AS month,
    SUM("Total Revenue") AS monthly_revenue,
    COUNT(DISTINCT "Transaction ID") AS order_volume
FROM orders
WHERE strftime('%Y', "Date") = '2024'
GROUP BY year, month
ORDER BY month;
4. (Optional) Top 5 Product Categories by Revenue
sql
Copy
Edit
SELECT 
    "Product Category",
    SUM("Total Revenue") AS category_revenue
FROM orders
GROUP BY "Product Category"
ORDER BY category_revenue DESC
LIMIT 5;
📈 Insights from Data
Highest revenue month: January 2024 – $14,548.32

Top 3 months by revenue: Jan 2024, Mar 2024, Apr 2024

Sales volume was relatively consistent, with 27–31 orders per month.

Revenue dropped in mid-year months (June–August).
