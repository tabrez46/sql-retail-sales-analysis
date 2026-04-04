-- Q1: What is overall company performance?
SELECT 
COUNT(*) AS total_orders,
ROUND(SUM(Sales), 2) AS total_revennue, 
ROUND(SUM(Profit), 2) AS total_profit,
ROUND(AVG(Sales), 2) AS avg_order_value
FROM orders;

--Result:
-- total_orders	total_revennue	total_profit	avg_order_value
-- 9994	          2297200.86      286397.02	       229.86

-- Q2: Break down revenue and profit by Category
SELECT Category,
ROUND(SUM(Sales),2 ) AS total_revenue,
ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Category
ORDER BY total_revenue DESC

--Result:
-- Technology has the highest profit ($145,454) and highest revenue ($836,154)

-- Q3: Which Region performs best? 
SELECT 
Region,
COUNT(DISTINCT [Order ID]) AS unique_orders,
COUNT(*) AS total_orders,
ROUND(SUM(Sales),2) AS total_revenue,
ROUND(AVG(Sales),2) AS avg_order_value
FROM orders
GROUP BY Region

--Result:
-- The West region performs best overall, generating the highest total revenue (725,457.82) and the largest number of orders (3,203), indicating strong sales volume and market demand. While the South has the highest average order value (241.80), its lower order count limits overall performance compared to the West.

-- Q4: Which segment is most profitable
SELECT Segment,
ROUND(SUM(Profit)/ SUM(Sales)*100, 2) AS margin_pct
FROM orders
GROUP BY Segment
ORDER BY margin_pct DESC

--Result:
-- "Home office" segment is most profitable, because it shows better cost efficiency and stronger profitability per sale. 

-- Q5: Find every State where total revenue is above $50,000. How many states qualify?
SELECT State,
ROUND(SUM(Sales),2) AS total_revenue
FROM orders
GROUP BY State
HAVING total_revenue> 50000
ORDER BY total_revenue DESC

--Result:
-- 12 states, California whith hughest revenue 

-- Q6: Which Sub_Category products are losing money overall? 
SELECT Category,
[Sub-Category],
ROUND(SUM(Sales), 2)   AS total_revenue,
ROUND(SUM(Profit), 2)  AS total_profit
FROM orders
GROUP BY Category, [Sub-Category]
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC;

-- Tables sub-category looses the most money -17725.48