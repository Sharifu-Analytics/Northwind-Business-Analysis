/*
Business Question:
How did cumulative sales revenue grow over time?

SQL Skills:
- Common Table Expression (CTE)
- DATE_TRUNC()
- Aggregate Functions
- Window Functions
- SUM() OVER()
*/

WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date)::date AS sales_month,
        ROUND(SUM(revenue), 2) AS monthly_revenue
    FROM sales_data
    GROUP BY
        DATE_TRUNC('month', order_date)::date
)

SELECT
    sales_month,
    monthly_revenue,
    ROUND(
        SUM(monthly_revenue) OVER (
            ORDER BY sales_month
        ),
        2
    ) AS running_total_revenue
FROM monthly_sales
ORDER BY sales_month;