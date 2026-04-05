SELECT o.[ORDER ID],
c.customer_name,
c.segment,
o.Sales,
o.Profit
FROM orders AS o
INNER JOIN customers AS c
	ON o.[Customer ID] = c.customer_id
WHERE c.segment = 'Corporate'
	AND o.Profit< 0
ORDER BY o.Profit ASC
LIMIT 15
