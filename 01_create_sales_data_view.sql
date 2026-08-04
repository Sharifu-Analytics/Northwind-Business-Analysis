CREATE OR REPLACE VIEW northwind_sales_analysis AS
SELECT
    o.order_id,
    o.order_date,
    c.customer_id,
    c.company_name AS customer_name,
    c.country AS customer_country,
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    p.product_id,
    p.product_name,
    cat.category_name,
    od.quantity,
    od.unit_price,
    od.discount,
    od.quantity * od.unit_price * (1 - od.discount) AS revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN employees e
    ON o.employee_id = e.employee_id
JOIN order_details od
    ON o.order_id = od.order_id
JOIN products p
    ON od.product_id = p.product_id
JOIN categories cat
    ON p.category_id = cat.category_id;

SELECT
    ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_data;