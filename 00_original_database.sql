SELECT order_id, 
	product_id, 
	SUM(quantity) AS total_unit 
	FROM order_details
	GROUP BY product_id;