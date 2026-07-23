/*
Business Question:
Which product category generated the highest sales revenue each year?

Business Value:
Identifies the best-performing product category each year,
helping management understand changing customer demand
and make informed inventory and marketing decisions.

SQL Techniques Used:
- Common Table Expressions (CTEs)
- EXTRACT()
- Aggregate Functions
- DENSE_RANK()
- PARTITION BY
- Window Functions
*/

WITH category_yearly_sales AS (

    SELECT
        EXTRACT(YEAR FROM order_date) AS sales_year,
        category_name,
        ROUND(SUM(revenue), 2) AS total_revenue

    FROM sales_data

    GROUP BY
        EXTRACT(YEAR FROM order_date),
        category_name

),

ranked_categories AS (

    SELECT
        sales_year,
        category_name,
        total_revenue,

        DENSE_RANK() OVER (
            PARTITION BY sales_year
            ORDER BY total_revenue DESC
        ) AS category_rank

    FROM category_yearly_sales

)

SELECT
    sales_year,
    category_name,
    total_revenue

FROM ranked_categories

WHERE category_rank = 1

ORDER BY sales_year;