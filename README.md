# 📊 Sales Trend Analysis (SQLite | SQL Project)

This project analyzes **monthly sales performance** using SQL.  
The goal is to extract **monthly revenue** and **order volume** trends from an `orders` dataset.

---

## 🎯 Objective
- Analyze monthly revenue using SQL aggregations  
- Calculate monthly order volume  
- Group data by **year + month**  
- Practice using SQL date functions such as `strftime()`  
- Export final results as a CSV for reporting  

---

## 🛠️ Tools Used
- **SQLite Online**
- SQL (aggregate functions & date functions)
- Excel (for viewing results)

---

## 📁 Project Files
| File | Description |
|------|-------------|
| `online_sales_orders.csv` | Source dataset containing 100 rows of order data |
| `sales_trend_analysis.sql` | Final SQL script with monthly trend query + optional filters |
| `monthly_sales_trend_results.csv` | Final results table (monthly revenue & order volume) |
| `README.md` | Project documentation |

---

## 🧵 Dataset Structure (`orders` table)
- `order_id` — Primary key  
- `order_date` — Date of purchase  
- `product_id` — Product identifier  
- `amount` — Sales amount  

---

## 🧠 SQL Concepts Used
- `strftime()` for extracting **year** and **month**
- `SUM()` for total revenue
- `COUNT(DISTINCT)` for order volume
- `GROUP BY` for monthly grouping
- `ORDER BY` for chronological sorting
- Optional date filters (Q1, 2024-only, etc.)

---

## 📝 Final Query (Monthly Revenue + Order Volume)

```sql
SELECT
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month_number,

    CASE strftime('%m', order_date)
        WHEN '01' THEN 'January'
        WHEN '02' THEN 'February'
        WHEN '03' THEN 'March'
        WHEN '04' THEN 'April'
        WHEN '05' THEN 'May'
        WHEN '06' THEN 'June'
        WHEN '07' THEN 'July'
        WHEN '08' THEN 'August'
        WHEN '09' THEN 'September'
        WHEN '10' THEN 'October'
        WHEN '11' THEN 'November'
        WHEN '12' THEN 'December'
    END AS month_name,

    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume

FROM orders
GROUP BY year, month_number
ORDER BY year, month_number;

Final Output Preview
Year	Month	Revenue	Orders
2024	January	11,590	10
2024	February	12,090	10
2024	March	11,590	10
...	...	...	...

(See the CSV file for full output.)
