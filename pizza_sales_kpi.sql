create database pizza;
use pizza;

select *
from pizza_sales
limit 10;

-- 1. Total revenue
select round(sum(total_price),0) as Total_revenue
from pizza_sales;

-- 2. Average order value
select round(sum(total_price)/count(distinct order_id),2) as Avg_Order_Value
from pizza_sales;

-- 3. Total pizza sold
select sum(quantity)as Total_Pizza_sold
from pizza_sales;

-- 4. Total orders placed
select count(distinct order_id) as Total_Order_Placed
from pizza_sales;

-- 5. Average Pizzas per order
select sum(quantity)/count(distinct order_id) as Avg_Pizzas_Per_Order
from pizza_sales;

