/*
Business Question:
How much did monthly revenue increase or decrease
compared with the previous month?

SQL Skills:
- Common Table Expressions (CTEs)
- DATE_TRUNC()
- Aggregate Functions
- Window Function: LAG()
- Percentage Growth Calculation
- NULLIF() for division-by-zero protection
*/

WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date)::date AS sales_month,
        ROUND(SUM(revenue), 2) AS monthly_revenue
    FROM sales_data
    GROUP BY
        DATE_TRUNC('month', order_date)::date
),

monthly_comparison AS (
    SELECT
        sales_month,
        monthly_revenue,
        LAG(monthly_revenue) OVER (
            ORDER BY sales_month
        ) AS previous_month_revenue
    FROM monthly_sales
)

SELECT
    sales_month,
    monthly_revenue,
    previous_month_revenue,
    ROUND(
        (
            (monthly_revenue - previous_month_revenue)
            / NULLIF(previous_month_revenue, 0)
        ) * 100,
        2
    ) AS month_over_month_growth_pct
FROM monthly_comparison
ORDER BY sales_month;