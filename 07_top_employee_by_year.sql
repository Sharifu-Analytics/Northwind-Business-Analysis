/*
Business Question:
Which employee generated the highest sales revenue each year?

Business Value:
Identifies the top-performing employee annually, helping
management recognize outstanding performance and analyze
year-over-year sales leadership.

SQL Techniques Used:
- Common Table Expressions (CTEs)
- EXTRACT()
- Aggregate Functions
- DENSE_RANK()
- PARTITION BY
- Window Functions
*/

WITH employee_yearly_sales AS (

    SELECT
        EXTRACT(YEAR FROM order_date) AS sales_year,
        employee_id,
        first_name,
        last_name,
        ROUND(SUM(revenue), 2) AS total_revenue

    FROM sales_data

    GROUP BY
        EXTRACT(YEAR FROM order_date),
        employee_id,
        first_name,
        last_name

),

ranked_employees AS (

    SELECT
        sales_year,
        employee_id,
        first_name,
        last_name,
        total_revenue,

        DENSE_RANK() OVER (
            PARTITION BY sales_year
            ORDER BY total_revenue DESC
        ) AS employee_rank

    FROM employee_yearly_sales

)

SELECT
    sales_year,
    employee_id,
    first_name,
    last_name,
    total_revenue

FROM ranked_employees

WHERE employee_rank = 1

ORDER BY sales_year;