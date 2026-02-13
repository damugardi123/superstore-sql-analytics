/*
What Phase D Demonstrates
You are now showing:
·	window functions
·	ranking & partitioning
·	cumulative metrics
·	Pareto logic
·	behavioral analytics
·	segmentation modeling
·	CLV computation
*/

--Rank Products by Revenue (Window Function)
SELECT
    product_name,
    SUM(sales) AS revenue,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS revenue_rank
FROM superstore_analytics
GROUP BY product_name;

--Rank Products Within Each Category
SELECT
    category,
    product_name,
    SUM(sales) AS revenue,
    RANK() OVER (
        PARTITION BY category
        ORDER BY SUM(sales) DESC
    ) AS rank_in_category
FROM superstore_analytics
GROUP BY category, product_name;

--Running Monthly Sales Total
SELECT
    order_year,
    order_month,
    SUM(sales) AS monthly_sales,
    SUM(SUM(sales)) OVER (
        ORDER BY order_year, order_month
    ) AS running_sales
FROM superstore_analytics
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

--Customer Lifetime Value
SELECT
    customer_id,
    customer_name,
    SUM(sales)  AS lifetime_sales,
    SUM(profit) AS lifetime_profit,
    COUNT(DISTINCT order_id) AS orders_count
FROM superstore_analytics
GROUP BY customer_id, customer_name
ORDER BY lifetime_sales DESC;

--Top 20% Customers Contribution
WITH cust AS (
    SELECT
        customer_id,
        SUM(sales) AS sales
    FROM superstore_analytics
    GROUP BY customer_id
),
ranked AS (
    SELECT
        *,
        SUM(sales) OVER (ORDER BY sales DESC) AS running_sales,
        SUM(sales) OVER () AS total_sales
    FROM cust
)
SELECT *,
       running_sales / total_sales AS cumulative_share
FROM ranked
ORDER BY sales DESC;

--Order Gap Per Customer
SELECT
    customer_id,
    order_date,
    order_date - LAG(order_date) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS days_since_last_order
FROM superstore_analytics;

--Profit Margin by Category (Window %)
SELECT
    category,
    SUM(profit) AS profit,
    SUM(sales)  AS sales,
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS margin_pct
FROM superstore_analytics
GROUP BY category;

--Customer Segmentation by Spend Tier
WITH totals AS (
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM superstore_analytics
    GROUP BY customer_id
)
SELECT *,
CASE
    WHEN total_sales >= 10000 THEN 'High Value'
    WHEN total_sales >= 5000  THEN 'Mid Value'
    ELSE 'Low Value'
END AS segment
FROM totals;
