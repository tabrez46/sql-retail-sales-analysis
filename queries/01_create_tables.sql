-- ============================================================
-- Project: Retail Sales Analysis (Superstore Dataset)
-- Author:  [Your Name]
-- Date:    2025
-- Description: This script documents the table structure.
--              Data was imported from CSV via DB Browser.
-- ============================================================

-- The 'orders' table was imported from superstore.csv
-- Here is its structure for reference:

/*
Table: orders
Columns:
  Row_ID         INTEGER    - unique row identifier
  Order_ID       TEXT       - unique order identifier
  Order_Date     TEXT       - date order was placed (MM/DD/YYYY)
  Ship_Date      TEXT       - date order was shipped
  Ship_Mode      TEXT       - Standard Class, Second Class, First Class, Same Day
  Customer_ID    TEXT       - unique customer identifier
  Customer_Name  TEXT       - full customer name
  Segment        TEXT       - Consumer, Corporate, Home Office
  Country        TEXT       - country of order
  City           TEXT       - city of order
  State          TEXT       - US state
  Region         TEXT       - West, East, Central, South
  Product_ID     TEXT       - unique product identifier
  Category       TEXT       - Furniture, Office Supplies, Technology
  Sub_Category   TEXT       - 17 sub-categories
  Product_Name   TEXT       - full product name
  Sales          REAL       - revenue from the order
  Quantity       INTEGER    - number of items ordered
  Discount       REAL       - discount applied (0.0 to 1.0)
  Profit         REAL       - profit from the order
*/

-- Verify data was loaded correctly
SELECT COUNT(*) AS total_rows FROM orders;
-- Expected: ~9,994 rows

SELECT * FROM orders LIMIT 5;