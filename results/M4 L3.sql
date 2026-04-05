Select
c.segment,
COUNT(DISTINCT o.[ORDER ID]) AS total_orders,
ROUND(SUM(o.Sales),2) AS total_revenue,
ROUND(SUM(o.Profit),2) AS total_profir
FROM orders AS o
INNER JOIN customers AS c
ON o.[Customer ID] = c.customer_id
GROUP BY c.segment
ORDER BY total_revenue DESC