/*
Business Question:
How has monthly sales revenue changed over time?
*/

SELECT
    DATE_TRUNC('month', order_date)::date AS sales_month,
    TO_CHAR(order_date, 'Month') AS month_name,
    ROUND(SUM(revenue), 2) AS monthly_revenue

FROM sales_data

GROUP BY
    DATE_TRUNC('month', order_date)::date,
    TO_CHAR(order_date, 'Month')

ORDER BY sales_month;