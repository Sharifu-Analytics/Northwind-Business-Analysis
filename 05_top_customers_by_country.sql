/*
Business Question:
Which customer generated the highest sales revenue
in each country?

SQL Skills:
- Common Table Expressions (CTEs)
- Aggregate Functions
- DENSE_RANK()
- PARTITION BY
- Ranking within groups
*/

WITH customer_sales AS (

    SELECT
        customer_id,
        company_name,
        country,
        ROUND(SUM(revenue), 2) AS total_revenue

    FROM sales_data

    GROUP BY
        customer_id,
        company_name,
        country

),

ranked_customers AS (

    SELECT
        customer_id,
        company_name,
        country,
        total_revenue,

        DENSE_RANK() OVER (
            PARTITION BY country
            ORDER BY total_revenue DESC
        ) AS country_rank

    FROM customer_sales

)

SELECT
    customer_id,
    company_name,
    country,
    total_revenue,
    country_rank

FROM ranked_customers

WHERE country_rank = 1

ORDER BY country;