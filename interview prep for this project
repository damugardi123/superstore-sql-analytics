✅ SQL Project Interview Question Bank (From Your Superstore Project)

We’ll group into:

1️⃣ Project Understanding
2️⃣ Data Audit & Modeling
3️⃣ Core SQL Queries
4️⃣ Advanced SQL / Window Functions
5️⃣ Business Insight Questions
6️⃣ Scenario & Extension Questions
7️⃣ Deep Technical Follow-ups

🎯 1️⃣ Project Understanding Questions

Q1. Describe your SQL project end-to-end.
Expect to answer:

dataset

database used (PostgreSQL)

row count & time span

audit → prep → analysis → advanced analytics

key insights

Q2. Why did you create an analytics view instead of querying raw table repeatedly?

Expected answer:

reuse derived columns

reduce logic duplication

improve maintainability

ensure consistent time dimensions

Q3. What was the grain of your dataset?

Answer:

order_id + product_id level


Explain how you verified via duplicate check.

🧪 2️⃣ Data Audit & Preparation Questions

Q4. What checks did you run before analysis?

You should mention:

row counts

distinct keys

null scan

numeric ranges

duplicate grain validation

date coverage

Q5. How would you detect duplicate business rows in SQL?

GROUP BY order_id, product_id
HAVING COUNT(*) > 1


Q6. How did you validate numeric integrity?

Min/max checks on:

sales

profit

discount

quantity

📊 3️⃣ Core SQL Analysis Questions

Q7. How did you compute monthly sales trend?

Expect:

GROUP BY year, month
SUM(sales)


Q8. How did you calculate Average Order Value?

SUM(sales) / COUNT(DISTINCT order_id)


Explain why distinct is required.

Q9. How did you analyze discount impact?

Grouped by discount → avg profit.

Explain interpretation.

🧠 4️⃣ Advanced SQL Questions (High Value)

These matter most.

Q10. Give an example of a window function you used.

Product ranking:

RANK() OVER (ORDER BY SUM(sales) DESC)


Explain difference vs GROUP BY.

Q11. Difference between GROUP BY and window functions?

Key answer:

GROUP BY → collapses rows
WINDOW → keeps rows + adds metrics

Q12. How did you compute running totals?

SUM(...) OVER (ORDER BY ...)


Q13. How did you perform Pareto (80/20) analysis?

Expect explanation of:

customer totals

cumulative sum window

divide by total

filter <= 0.8

Q14. How did you measure customer lifetime value?

Aggregated per customer:

SUM(sales)

SUM(profit)

order count

Q15. Why use LAG()?

To compute purchase gaps between orders per customer.

📈 5️⃣ Business Insight Questions

Interviewers often pivot here.

Q16. What were your top 3 insights?

Prepare:

revenue growth trend

margin variation by category

discount-profit relationship

Pareto concentration

Q17. Which metric would leadership care about most?

Good answers:

profit margin

revenue concentration risk

discount leakage

Q18. What decision could be made from your discount analysis?

Reduce deep discounting in low-margin subcategories.

🔧 6️⃣ Scenario Extension Questions

Q19. How would you find repeat vs one-time customers?

COUNT(DISTINCT order_id) per customer


Q20. How would you detect seasonality?

Monthly aggregation + multi-year comparison.

Q21. How would you optimize slow queries on this dataset?

Answers:

indexes on order_date, customer_id

materialized views

reduce subqueries

filter early

🧬 7️⃣ Deep Technical Follow-ups

Q22. Why use CTE instead of subquery?

readability

reuse

stepwise logic

debugging

Q23. Difference: RANK vs DENSE_RANK vs ROW_NUMBER

Must know.

Q24. What happens if window ORDER BY is missing?

Undefined ordering → wrong cumulative metrics.

Q25. How would you productionize this project?

Good answer:

schedule refresh

create materialized views

add indexes

validation tests

dashboard layer

✅ How You Should Practice

Do not memorize answers. Practice:

Problem → SQL logic → why → business meaning


If you want next, I can generate:

✅ Mock interview based only on your project
✅ 30-minute rapid-fire round
✅ SQL whiteboard exercises derived from your queries
✅ Behavioral + technical blended interview script

Say: run mock interview and we start.
