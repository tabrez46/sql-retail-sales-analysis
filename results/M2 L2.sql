SELECT Region, 
COUNT (*) AS total_orders, 
ROUND(SUM(Sales), 2) AS total_revenue,
ROUND(AVG(Sales),2) AS avg_order_value
FROM orders
GROUP BY Region
ORDER BY total_revenue DESC;