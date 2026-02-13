--Data Audit

/* What This Phase Demonstrates (Portfolio Value)
This shows:
·	data validation
·	schema understanding
·	grain detection
·	anomaly checks
·	professional workflow
*/

SELECT COUNT(*) AS total_rows
FROM superstore; --confirms full load of 9994 rows

--shows dataset grain and duplication pattern.
SELECT 
    COUNT(DISTINCT order_id) AS unique_orders, -- 5009
    COUNT(DISTINCT customer_id) AS unique_customers, --793
    COUNT(DISTINCT product_id) AS unique_products --1862
FROM superstore;

--defines analysis period
SELECT 
    MIN(order_date) AS first_order, --2018-01-03
    MAX(order_date) AS last_order, --2021-12-30
    MIN(ship_date) AS first_ship, --2018-01-07
    MAX(ship_date) AS last_ship --2022-01-05
FROM superstore;

--Detect impossible values.
SELECT
    MIN(sales), MAX(sales),
    MIN(profit), MAX(profit), --minimum profit is negative
    MIN(discount), MAX(discount),
    MIN(quantity), MAX(quantity)
FROM superstore;

--Category Cardinality
Helps plan segmentation analysis
SELECT COUNT(DISTINCT category) as category_ FROM superstore; --3

SELECT COUNT(DISTINCT sub_category) as sub_category_ FROM superstore; --17

SELECT COUNT(DISTINCT region) as region_ FROM superstore; --4

SELECT COUNT(DISTINCT segment) as segment_ FROM superstore;  --3

--NULL Scan (Critical)
SELECT
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
    SUM(CASE WHEN sales IS NULL THEN 1 ELSE 0 END) AS null_sales,
    SUM(CASE WHEN profit IS NULL THEN 1 ELSE 0 END) AS null_profit,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer
FROM superstore;

--duplicate grain check
SELECT order_id, product_id, COUNT(*)
FROM superstore
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;

--geographical spread
SELECT COUNT(DISTINCT state),  --49 COUNT(DISTINCT city) --531
FROM superstore;
