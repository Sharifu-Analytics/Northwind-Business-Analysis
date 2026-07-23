/*
Business Question:
Which three products generated the highest sales revenue
within each product category?

Business Value:
Helps identify the strongest products in every category,
supporting inventory planning, promotions, and product strategy.

SQL Techniques Used:
- Common Table Expressions (CTEs)
- Aggregate Functions
- DENSE_RANK()
- PARTITION BY
- Window Functions
- Ranking within groups
*/

WITH product_sales AS (

    SELECT
        category_name,
        product_id,
        product_name,
        ROUND(SUM(revenue), 2) AS total_revenue

    FROM sales_data

    GROUP BY
        category_name,
        product_id,
        product_name

),

ranked_products AS (

    SELECT
        category_name,
        product_id,
        product_name,
        total_revenue,

        DENSE_RANK() OVER (
            PARTITION BY category_name
            ORDER BY total_revenue DESC
        ) AS product_rank

    FROM product_sales

)

SELECT
    category_name,
    product_id,
    product_name,
    total_revenue,
    product_rank

FROM ranked_products

WHERE product_rank <= 3

ORDER BY
    category_name,
    product_rank,
    total_revenue DESC;