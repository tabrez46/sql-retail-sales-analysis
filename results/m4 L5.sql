SELECT 
o.[Order ID],
c.customer_name,
c.segment,
p.category,
p.sub_category,
ROUND(o.Sales,2) AS Sales,
ROUND(o.Profit,2) AS Profit
FROM orders AS o 
INNER JOIN customers AS c
	ON o.[Customer ID] = c.customer_id
INNER JOIN products AS p
	ON o.[Product ID] = p.product_id
WHERE p.category = 'Technology'
ORDER BY o.Sales DESC
LIMIT 15