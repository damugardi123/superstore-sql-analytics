/*
What This Phase Demonstrates
You are now showing:
·	grouped aggregations
·	business KPI computation
·	dimensional slicing
·	ranking logic
·	profitability analysis
·	behavioral metrics
*/

--Overall Sales & Profit by Year
SELECT
    order_year,
    ROUND(SUM(sales), 2)  AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_analytics
GROUP BY order_year
ORDER BY order_year;
Insight goal: growth trend & profit stable

--Monthly Sales Trend
SELECT
    order_year,
    order_month,
    ROUND(SUM(sales), 2) AS monthly_sales
FROM superstore_analytics
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

--Top 10 products by revenue
SELECT
    product_name,
    ROUND(SUM(sales), 2) AS revenue
FROM superstore_analytics
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 10;

--Profit by Region
SELECT
    region,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_analytics
GROUP BY region
ORDER BY total_profit DESC;

--Category & Sub-Category Performance
SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2)  AS sales,
    ROUND(SUM(profit), 2) AS profit
FROM superstore_analytics
GROUP BY category, sub_category
ORDER BY sales DESC;

--Top Customers by Revenue
SELECT
    customer_id,
    customer_name,
    ROUND(SUM(sales), 2) AS customer_sales
FROM superstore_analytics
GROUP BY customer_id, customer_name
ORDER BY customer_sales DESC
LIMIT 10;


--Discount Impact on Profitability
SELECT
    discount,
    ROUND(AVG(profit), 2) AS avg_profit
FROM superstore_analytics
GROUP BY discount
ORDER BY discount;


--Average Order Value
SELECT
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM superstore_analytics;

--Shipping Delay Analysis
SELECT
    ship_mode,
    ROUND(AVG(ship_date - order_date), 2) AS avg_ship_days
FROM superstore_analytics
GROUP BY ship_mode;
(PostgreSQL supports date subtraction -> returns days)
