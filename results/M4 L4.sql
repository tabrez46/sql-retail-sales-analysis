SELECT 
c.customer_id,
c.customer_name,
c.segment,
COUNT(o.[Order ID])  AS order_count,
ROUND(SUM(o.Sales),2) AS lifetime_value 
FROM customers AS c
LEFT JOIN orders AS o
	ON c.customer_id = o.[Customer ID]
GROUP BY c.customer_id, c.customer_name, c.segment
ORDER BY lifetime_value DESC
LIMIT 20