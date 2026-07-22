# 🍕 Pizza Sales Analysis

A SQL-based analysis of a full year of pizza restaurant sales, built to surface key business KPIs, sales trends, and product performance — paired with an Excel dashboard for visualization.

<img width="1254" height="1254" alt="image" src="https://github.com/user-attachments/assets/aa75bf8b-6ec2-4122-9645-2e384b78c2bd" />


## 📁 Project Files

| File | Description |
|---|---|
| `pizza_sales.csv` |(https://www.kaggle.com/code/melikedilekci/eda-pizza-restaurant-sales)
| `SOLUTIONS.sql` | (https://github.com/stej07033/MSSQL-EXCEL_PROJECT1/blob/main/SOLUTIONS.sql)
| `Dashboard1.xlsx` |(https://github.com/stej07033/MSSQL-EXCEL_PROJECT1/blob/main/Dashboard1.xlsx)

PIVOT TABLES
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/a697c591-29a6-4553-9b68-854202969c89" />

## DASHBOARD
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
<img width="1841" height="1057" alt="image" src="https://github.com/user-attachments/assets/88f07643-53c3-49c3-bf0c-8c60d49714cc" />





## SOLUTIONS_SQL
```sql
--- Pizza_sales project
select * from pizza_sales

--A. KPI’s

--1.Total Revenue:

SELECT SUM(total_price) as total_revenue 
FROM pizza_sales

--2.Average Order value:

SELECT AVG(total_price) as avg_total_price
FROM pizza_sales

--3.Total Pizzas Sold:

SELECT SUM(quantity) as total_pizza_sales 
FROM pizza_sales

--4.Total Orders:

SELECT COUNT(DISTINCT order_id) as total_orders
FROM pizza_sales

--5.Average Pizzas Per Order

SELECT
    CAST(SUM(quantity) AS DECIMAL(10,2)) /
    COUNT(DISTINCT order_id) AS average_pizzas_per_order
FROM pizza_sales


--B. Daily Trend for Total Orders

SELECT DATENAME(DW, order_date) AS order_day, 
COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

--C. Hourly Trend for Orders

SELECT DATEPART(HOUR, order_time) as order_hours, 
COUNT(DISTINCT order_id) as total_orders
FROM pizza_sales
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time)

--D. % of Sales by Pizza Category

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

--E. % of Sales by Pizza Size

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size


--F. Total Pizzas Sold by Pizza Category

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

--G. Top 5 Best Sellers by Total Pizzas Sold

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC


--H. Bottom 5 Best Sellers by Total Pizzas Sold

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC


---EXTRA BUNINESS PROBLEMS

-1. Restaurant Performance Report

--Create a business report showing:

-Restaurant Name
-Total Orders
-Total Revenue
-PIZZA NAMAE

-Assign the rating using the following conditions:

-Revenue > ₹40000 AND Orders > 800 → Excellent
-Revenue > ₹25000→  Good
-Otherwise →  Average

SELECT 
     PIZZA_NAME,
    COUNT(DISTINCT order_id) as total_orders,
    SUM(total_price) as total_Revenue,
case 
 WHEN  SUM(total_price)  > 40000 and  COUNT(DISTINCT order_id)> 800 then 'Execllent'
 WHEN  SUM(total_price)  > 25000 then 'Good'
 else 'Average'
end as perforamance_rating
FROM pizza_sales
GROUP BY PIZZA_NAME
ORDER BY total_revenue DESC


-- 2: Pizza Category Sales Report

--Business Requirement:

--Create a report showing:

-Pizza Category
-Total Revenue
-Total Quantity Sold
-Sales Grade

-Assign the grade using the following conditions:

-Revenue > ₹2,00,000 →  Best Seller
-Revenue > ₹1,00,000 →  Popular
-Otherwise →  Average Seller

SELECT 
      pizza_category,
      SUM(total_price) as total_revenue,
      COUNT(quantity) as total_quantity,
CASE 
    WHEN SUM(total_price) > 200000 then 'Best Seller'
    WHEN SUM(total_price) > 100000 then ' Pooular'
    else 'Average seller'
end as pizza_sales_category
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_revenue DESC;
```

```sql
--3 Pizza Size Performance Report

--Create a report showing:

-Pizza Size
-Total Revenue
-Total Orders
-Performance

-Conditions:

-Revenue > ₹3,00,000 →  High Demand
-Revenue > ₹1,50,000 →  Moderate Demand
-Otherwise →  Low Demand


SELECT 
     pizza_size,
        SUM(total_price) as total_revenue,
        count(order_id) as total_orders,
case 
    WHEN  SUM(total_price) > 300000 then 'High Demand'
    WHEN  SUM(total_price) > 150000 then 'Moderate Demand'
    else 'Low Demand'
end as pizza_performance
from pizza_sales
group by pizza_size
order by total_revenue desc;
```

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
