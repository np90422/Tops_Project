use pizza_sales;

select * from pizza_sales;

/* *******************  KPI Requirments ***************************************
**************************************************************************** */

-- Total Revenue

select sum(total_price) as 'Total Revenue' from pizza_sales;

-- Average Order Value

select sum(total_price)/sum(quantity) as 'Average Order Value' from pizza_sales; 

-- Total Pizzas Sold

select sum(quantity) as 'Total pizza sold' from pizza_sales; 

-- Total Orders

select count(order_id) as 'Total Order' from pizza_sales;

-- Average Pizza Per Order

select sum(quantity)/count(order_id) as 'Averege Pizza Per Order' from pizza_sales;


/* *************************** Charts Requirements *****************************
***************************************************************************** */

select * from pizza_sales;

-- Daily trend for total Orders

select order_date as 'Date', count(distinct order_id) as total_orders from pizza_sales
group by order_date;

-- Monthly Trend for Total Orders

select date_format('%M', order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY date_format('%M', order_date);

-- Percentage of Sales by Pizza Category

select pizza_category, cast(sum(total_price) as decimal(10,2)) as total_revenue, cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal (10,2)) as pct from pizza_sales
group by pizza_category;

-- Percentage of Sales by Pizza Size

select pizza_size, cast(sum(total_price) as decimal (10,2)) as total_revenue, cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal (10,2)) as pct from pizza_sales
group by pizza_size
order by pizza_size;

-- Total Pizza Sold by Pizza Category

select pizza_category,count(quantity) as 'Total_pizza' from pizza_sales
group by pizza_category;

-- Top 5 Best Sellers by Revenue, Total Quantity and Total Orders

select pizza_name_id, count(quantity) as 'Total_order', sum(total_price ) as 'Revenue' from pizza_sales
group by pizza_name_id
order by 'Revenue'  asc limit 5;

-- Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders

select pizza_name_id,count(quantity) as 'Total_order', sum(total_price ) as 'Revenue' from pizza_sales
group by pizza_name_id
order by 'Revenue' desc limit 5;



