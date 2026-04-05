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
FROM orders;
