-- Q1: Finding all unique shipping methods used in the dataset
SELECT DISTINCT Ship_Mode FROM orders;


-- Result: 4 shipping modes
-- First Class
-- Same Day
-- Second Class
-- Standard Class

-- Q2: Finf 10 most expensive individual orders
SELECT  [Order ID],
[Customer Name],
[Product Name],
Sales
FROM orders
ORDER BY Sales DESC
LIMIT 10;

-- Result: 
-- Sean Miller    Cisco TelePresence System EX90 Videoconferencing Unit	22638.48
-- Tamara Chand   Canon imageCLASS 2200 Advanced Copier	                17499.95
-- Raymond Buch   Canon imageCLASS 2200 Advanced Copier	                13999.96
-- Tom Ashbrook   Canon imageCLASS 2200 Advanced Copier	                11199.968
-- Hunter Lopez	  Canon imageCLASS 2200 Advanced Copier	                10499.97
-- Adrian Barton  GBC Ibimaster 500 Manual ProClick Binding System	    9892.74
-- Sanjit Chand   Ibico EPK-21 Electric Binding System	                9449.95
-- Bill Shonely   3D Systems Cube Printer, 2nd Generation, Magenta	    9099.93
-- Sanjit Engle   HP Designjet T520 Inkjet Large Format Printer - 24" Color	8749.95
-- Christopher    Canon imageCLASS 2200 Advanced Copier	                8399.976

-- Q3: Find all orders where profit is negative, the company lost money
SELECT  [Order ID],
Category,
[Sub-Category],
Sales,
Profit
FROM orders
WHERE Profit < 0 
ORDER BY Sales ASC

-- Result: 1871 Rows with negative Profit 

-- Q4: Find all orders from California OR New York where Sales > 500
SELECT [Customer Name],
State, 
Sales
FROM orders
WHERE State IN ('California', 'New York') AND Sales>500
ORDER BY Sales DESC

-- Result: 392 rows

-- Q5: Find all products where the Product_Name contains the word 'Table'. Show DISTINCT product names sorted alphabetically.
SELECT DISTINCT [Product Name]
FROM orders
WHERE [Product Name] LIKE '%table%'
ORDER BY [Product Name] ASC

-- Result:
-- 99 rows:
-- Acco Smartsocket Table Surge Protector, 6 Color-Coded Adapter Outlets
-- Adjustable Depth Letter/Legal Cart
-- Adjustable Personal File Tote
-- Advantus 10-Drawer Portable Organizer, Chrome Metal Frame, Smoke Drawers
-- Anderson Hickey Conga Table Tops & Accessories
-- Anker 24W Portable Micro USB Car Charger
-- Anker Astro 15000mAh USB Portable Charger
-- Anker Astro Mini 3000mAh Ultra-Compact Portable Charger
-- Avery Printable Repositionable Plastic Tabs
-- BPI Conference Tables

