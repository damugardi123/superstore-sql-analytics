# Superstore SQL Analytics Project (PostgreSQL)

## Overview

End-to-end SQL analytics project using PostgreSQL on the Superstore retail dataset. The project demonstrates data auditing, KPI modeling, advanced SQL analytics, and customer revenue segmentation.

## Dataset

Superstore sample dataset (~10K rows, 2018–2021 transaction data).

## Objectives

* Validate and profile raw data
* Build analytics-ready SQL view
* Compute core business KPIs
* Identify revenue and profit drivers
* Apply advanced SQL analytics techniques

## Tools

* PostgreSQL
* pgAdmin
* SQL (CTEs, window functions, ranking)

## Project Structure

01_schema.sql — table and analytics view creation
02_data_import_notes.md — CSV import process
03_data_audit.sql — validation and profiling queries
04_business_analysis.sql — KPI and performance queries
05_advanced_analytics.sql — window and segmentation analysis
06_insights_summary.md — business findings

## Skills Demonstrated

* Aggregations & joins
* CTE design
* Window functions
* Ranking & partitioning
* Running totals
* Pareto analysis
* Customer lifetime value
* Behavioral metrics

## Key Insights

* Strong year-over-year revenue growth trend
* Profitability varies more than revenue across categories
* Discount depth negatively impacts margins
* Revenue concentration follows Pareto distribution
* Customer value segmentation reveals high-impact cohorts

## How to Reproduce

1. Create database
2. Run 01_schema.sql
3. Import CSV
4. Run audit and analysis scripts

## Author

SQL analytics project by Damini Y Gardi
