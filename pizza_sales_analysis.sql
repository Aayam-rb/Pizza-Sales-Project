-- Daily Trend for Total Orders:
select order_day, count(distinct order_id) as Total_orders
from pizza_sales
group by order_day
order by Total_orders desc;

-- Monthly Trend for Total Orders:
select  order_months, count(distinct order_id) as Total_orders
from pizza_sales
group by order_months
order by Total_orders desc;

-- Percentage of Sales by Pizza Category:
select pizza_category, round(sum(total_price)*100/(select sum(total_price) from pizza_sales), 2)as total_sales_category
from pizza_sales
group by pizza_category;

-- for a particular month
select pizza_category, round(sum(total_price)*100/(select sum(total_price) from pizza_sales where order_months = 'January'),2) as total_sales_category
from pizza_sales
where order_months = 'January'
group by pizza_category;

-- Percentage of Sales by Pizza Size:
select pizza_size, round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) as total_sales_size
from pizza_sales
group by  pizza_size
order by total_sales_size desc;

-- Total Pizzas Sold by Pizza Category:
select pizza_category, count(quantity) as total_pizzas_sold
from pizza_sales
group by pizza_category;

-- Total sales by hour
select order_hour, count(distinct order_id) as total_order_by_hour
from pizza_sales
where order_months = 'January'
group by order_hour
order by order_hour asc;

-- Top 5 Best Sellers by Revenue, Total Quantity and Total Orders:
-- by revenue
select  pizza_name, sum(total_price) as total_revenue 
from pizza_sales
group by 1
order by 2 desc
limit 5;

-- by quantity
select pizza_name, sum(quantity) as total_quantity
from pizza_sales
group by 1
order by 2 desc
limit 5;

-- by orders
select pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by 1
order by 2 desc
limit 5;

-- Bottom 5 worst Sellers by Revenue, Total Quantity and Total Orders:
-- by revenue
select pizza_name, round(sum(total_price),2) as total_revenue 
from pizza_sales
group by 1
order by 2 asc
limit 5;

-- by quantity
select pizza_name, sum(quantity) as total_quantity
from pizza_sales
group by 1
order by 2 asc
limit 5;

-- by orders
select pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by 1
order by 2  asc
limit 5;