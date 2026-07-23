/*
Business Purpose:
Create a reusable sales_data view by combining orders, customers,
employees, order details, products, and categories.

This view serves as the foundation for all sales analyses in this project.
*/

CREATE OR REPLACE VIEW sales_data AS

SELECT
    o.order_id,
    o.order_date,

    c.customer_id,
    c.company_name,
    c.country,

    p.product_id,
    p.product_name,
    cat.category_name,

    od.quantity,
    od.unit_price,
    od.discount,

    ROUND(
        (
            od.unit_price
            * od.quantity
            * (1 - od.discount)
        )::numeric,
        2
    ) AS revenue,

    e.employee_id,
    e.first_name,
    e.last_name

FROM orders AS o

JOIN customers AS c
    ON o.customer_id = c.customer_id

JOIN employees AS e
    ON o.employee_id = e.employee_id

JOIN order_details AS od
    ON o.order_id = od.order_id

JOIN products AS p
    ON od.product_id = p.product_id

JOIN categories AS cat
    ON p.category_id = cat.category_id;

SELECT *
FROM sales_data
LIMIT 10;