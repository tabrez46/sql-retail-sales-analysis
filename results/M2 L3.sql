SELECT State,
ROUND(SUM(Sales), 2) AS total_revenue, 
ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY State
HAVING total_revenue > 50000
ORDER BY total_revenue DESC;