/*
Business Question:
Which employee generated the highest sales revenue
for customers in each country?

Business Value:
Identifies the top-performing salesperson in each customer
country, helping management understand regional sales
strengths and recognize high-performing employees.

SQL Techniques Used:
- Common Table Expressions (CTEs)
- Aggregate Functions
- DENSE_RANK()
- PARTITION BY
- Window Functions
- Ranking within groups
*/

WITH employee_country_sales AS (

    SELECT
        country,
        employee_id,
        first_name,
        last_name,
        ROUND(SUM(revenue), 2) AS total_revenue

    FROM sales_data

    GROUP BY
        country,
        employee_id,
        first_name,
        last_name

),

ranked_employees AS (

    SELECT
        country,
        employee_id,
        first_name,
        last_name,
        total_revenue,

        DENSE_RANK() OVER (
            PARTITION BY country
            ORDER BY total_revenue DESC
        ) AS employee_rank

    FROM employee_country_sales

)

SELECT
    country,
    employee_id,
    first_name,
    last_name,
    total_revenue

FROM ranked_employees

WHERE employee_rank = 1

ORDER BY
    country;