# 🍕 Pizza Sales Analysis

A SQL-based analysis of a full year of pizza restaurant sales, built to surface key business KPIs, sales trends, and product performance — paired with an Excel dashboard for visualization.

## 📁 Project Files

| File | Description |
|---|---|
| `pizza_sales.csv` |(https://www.kaggle.com/code/melikedilekci/eda-pizza-restaurant-sales)
| `SOLUTIONS.sql` | (https://github.com/stej07033/MSSQL-EXCEL_PROJECT1/blob/main/SOLUTIONS.sql)
| `Dashboard1.xlsx` | Excel dashboard visualizing the analysis |

## 🗂️ Dataset

Each row represents one pizza line item within an order, with the following fields:

- `pizza_id`, `order_id`, `pizza_name_id`
- `quantity`, `unit_price`, `total_price`
- `order_date`, `order_time`
- `pizza_size` (S, M, L, XL, XXL)
- `pizza_category` (Classic, Veggie, Supreme, Chicken)
- `pizza_ingredients`, `pizza_name`

**Time period:** January 1, 2015 – December 31, 2015

## 🎯 Objectives

The analysis answers common restaurant-analytics questions:

**A. Key Performance Indicators (KPIs)**
- Total Revenue
- Average Order Value
- Total Pizzas Sold
- Total Orders
- Average Pizzas per Order

**B–C. Trend Analysis**
- Daily trend of total orders (by day of week)
- Hourly trend of orders (by hour of day)

**D–E. Sales Mix**
- % of sales by pizza category
- % of sales by pizza size

**F–H. Product Performance**
- Total pizzas sold by category (for a given month)
- Top 5 best-selling pizzas
- Bottom 5 best-selling pizzas

**Bonus — Business Reports**
- Pizza performance report with rating tiers (Excellent / Good / Average)
- Pizza category report with sales grades (Best Seller / Popular / Average Seller)
- Pizza size report with demand levels (High / Moderate / Low Demand)

## 🛠️ Tools Used

- **SQL** (T-SQL / SQL Server syntax) for data querying and business logic
- **Excel** for dashboard visualization

## 🚀 How to Use

1. Load `pizza_sales.csv` into a SQL Server (or compatible) database as a table named `pizza_sales`.
2. Run the queries in `SOLUTIONS.sql` sequentially, or pull individual sections as needed.
3. Open `Dashboard1.xlsx` to explore the interactive dashboard built on top of these metrics.

## 📊 Sample Insights

- Revenue, order volume, and average order value are calculated at the top of the script as core KPIs.
- Daily and hourly trends reveal peak ordering windows for staffing and inventory planning.
- Category and size breakdowns show where revenue concentration lies across the menu.
- Custom business reports classify products and segments into performance tiers to support quick decision-making.

## 📝 Notes

- Query logic (rating/grade thresholds) is illustrative and can be tuned to match actual business targets.
- Some column/label naming in the bonus report queries (e.g. `PIZZA_NAME` vs restaurant-level fields) reflects the original working draft and can be cleaned up for production use.

## 📄 License

This project is intended for educational and portfolio purposes.
