SELECT 
o.[Order ID],
o.Sales,
o.Profit,
c.customer_name,
c.segment
FROM orders AS o
INNER JOIN customers AS c 
ON o.[Customer ID] = c.customer_id
LIMIT 20;