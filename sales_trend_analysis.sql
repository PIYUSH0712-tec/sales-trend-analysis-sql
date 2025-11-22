-- =====================================
-- Sales Trend Analysis (Main Query)
-- =====================================

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


-- =====================================
-- OPTIONAL FILTERS (Do Not Run Automatically)
-- =====================================

-- A. Filter: Only Q1 (Jan to Mar)
-- WHERE strftime('%m', order_date) BETWEEN '01' AND '03';


-- B. Filter: Only Jul–Oct
-- WHERE strftime('%m', order_date) BETWEEN '07' AND '10';


-- C. Filter: Only 2024
-- WHERE strftime('%Y', order_date) = '2024';


-- D. Filter: Last 3 months of dataset
-- WHERE order_date >= date('2024-10-31', '-3 months');
