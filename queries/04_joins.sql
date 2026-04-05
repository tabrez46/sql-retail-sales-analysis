---- KEY FINDINGS:
-- Top customer by revenue: Sean Miller (Home Office) $25,043
-- Top Corporate customer by profit: Tamara Chand
-- Highest revenue combination: Technology + Consumer segment
-- Consumer segment leads all segments in total revenue and profit

-- Create a customers table
CREATE TABLE customers AS
SELECT DISTINCT 
	[Customer ID] AS customer_id,
	[Customer Name] AS customer_name,
	Segment AS segment 
FROM orders

-- Create a products table
CREATE TABLE products AS 
SELECT DISTINCT 
[Product ID] AS product_id, 
[Product Name] AS product_name,
Category AS category,
[Sub-Category] AS sub_category
FROM orders


-- Q1:  Join orders and customers
SELECT 
o.[Order ID],
c.customer_name,
c.segment,
ROUND(o.Sales, 2) AS Sales,
ROUND(o.Profit, 2) AS Profit
FROM orders AS o
INNER JOIN customers AS c
    ON o.[Customer ID] = c.customer_id
LIMIT 20

--CA-2016-152156	Claire Gute	Consumer	261.96	41.91
--CA-2016-152156	Claire Gute	Consumer	731.94	219.58
--CA-2016-138688	Darrin Van Huff	Corporate	14.62	6.87
--US-2015-108966	Sean O'Donnell	Consumer	957.58	-383.03
--US-2015-108966	Sean O'Donnell	Consumer	22.37	2.52
--CA-2014-115812	Brosina Hoffman	Consumer	48.86	14.17
--CA-2014-115812	Brosina Hoffman	Consumer	7.28	1.97
--CA-2014-115812	Brosina Hoffman	Consumer	907.15	90.72
--CA-2014-115812	Brosina Hoffman	Consumer	18.5	5.78
--CA-2014-115812	Brosina Hoffman	Consumer	114.9	34.47

-- Q2: which segment generates the most revenue and profit?
SELECT 
c.segment,
COUNT(o.[Order ID]) AS order_count,
ROUND(SUM(Sales),2) AS total_revenue,
ROUND(SUM(Profit),2) AS total_profit,
ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margin_pct
FROM orders AS o
INNER JOIN customers AS c
	ON o.[Customer ID] = c.customer_id
GROUP BY c.segment

--Result: 
-- Consumer segment generates the most revenue (1161401.34) and profit (134119.21)	with profit margin of 11.55.

-- Q3:Find the top 15 customers by lifetime value (total Sales)
SELECT 
c.customer_name,
c.segment,
COUNT(o.[ORDER ID]) AS order_count,
ROUND(SUM(o.Sales),2) AS lifetime_value
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.[Customer ID]
GROUP BY c.customer_id, c.customer_name, c.segment
ORDER BY lifetime_value DESC
LIMIT 15

--Resul: 
-- Sean Miller	Home Office	15	25043.05
-- Tamara Chand	Corporate	12	19052.22
-- Raymond Buch	Consumer	18	15117.34
-- Tom Ashbrook	Home Office	10	14595.62
-- Adrian Barton	Consumer	20	14473.57
-- Ken Lonsdale	Consumer	29	14175.23
-- Sanjit Chand	Consumer	22	14142.33
-- Hunter Lopez	Consumer	11	12873.3
-- Sanjit Engle	Consumer	19	12209.44
-- Christopher Conant	Consumer	11	12129.07
-- Todd Sumrall	Corporate	15	11891.75
-- Greg Tran	Consumer	29	11820.12
-- Becky Martin	Consumer	16	11789.63
-- Seth Vernon	Consumer	32	11470.95
-- Caroline Jumper	Consumer	20	11164.97

-- Q4: Find the total revenue and profit per category broken down by segment.
SELECT 
p.category,
c.segment,
ROUND(SUM(o.Sales), 2)   AS total_revenue,
ROUND(SUM(o.Profit), 2)  AS total_profit
FROM orders AS o
INNER JOIN customers AS c
	ON o.[Customer ID] = c.customer_id
INNER JOIN products AS p
    ON o.[Product ID] = p.product_id
GROUP BY p.category, c.segment
ORDER BY total_revenue DESC;

--Result:
-- Highest revenue: Technology + Consumer ($436,285) with healthy 17.3% margin
-- DANGER ZONE: Furniture + Consumer ($409,725 revenue but only 1.97% margin)
-- Furniture underperforms across ALL segments despite strong revenue
-- Technology is consistent — best margins in every segment
-- Recommendation: investigate heavy discounting in Furniture category

-- Q5: Find the top 10 customers from the Corporate segment ranked by profit (not revenue).
SELECT 
c.customer_name,
COUNT(o.[Order ID])       AS total_orders,
ROUND(SUM(o.Sales), 2)    AS total_revenue,
ROUND(SUM(o.Profit), 2)   AS total_profit
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.[Customer ID]
WHERE c.segment = 'Corporate'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_profit DESC
LIMIT 10

--Result: 
-- customer_name	total_orders	total_revenue	total_profit
-- Tamara Chand			12				19052.22	  8981.32
-- Keith Dawkins		28				8181.26		  3038.63
-- Bill Shonely			9				10501.65	  2616.06
-- Harry Marie			20				8236.76		  2437.98
-- Todd Sumrall			15				11891.75	  2371.71
-- Brian Moss			29				7294.19    	  2199.28
-- Jane Waco			14				7721.71	      2173.71
-- Helen Wasserman		20				9300.25		  2164.16
-- Laura Armstrong		26				8673.22	      2059.12
-- Fred Hopkins			13				6987.2		  2050.28