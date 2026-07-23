/*
Business Question:
How much sales revenue did each employee generate?

Business Value:
Measures employee sales performance and helps identify
the strongest contributors to total company revenue.

SQL Techniques Used:
- Aggregate Functions
- GROUP BY
- COUNT(DISTINCT)
- ROUND()
- ORDER BY
*/

SELECT
    employee_id,
    first_name,
    last_name,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue

FROM sales_data

GROUP BY
    employee_id,
    first_name,
    last_name

ORDER BY
    total_revenue DESC;