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



--3 Pizza Size Performance Report

--Create a report showing:

-Pizza Size
-Total Revenue
-Total Orders
-Performance

-Conditions:

-Revenue > ₹3,00,000 → 📈 High Demand
-Revenue > ₹1,50,000 → 👍 Moderate Demand
-Otherwise → ⚠️ Low Demand


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
