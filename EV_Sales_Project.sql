use zoom_electric;



/* **************************************************************************************************************************
*******************************************************	ANSWER  ********************************************************** */ 

select * from sales
where sales_transaction_date between  "2016-10-10" and "2016-10-16"
order by sales_transaction_date;

/* *****          OR       ****** */

select count(*) as Units from sales 
where sales_transaction_date between  "2016-10-10" and "2016-10-16"
order by sales_transaction_date;

/* ******************************************************************************************* */

select * from sales
where sales_transaction_date between  "2016-10-13" and "2016-10-19" or  product_id = 7;


/* *****          OR       ****** */

select count(*) as Units from sales 
where sales_transaction_date between  "2016-10-13" and "2016-10-19" or product_id = 7;


/* ****************************************************************************************** */


use zoom_electric;

show tables;

create view sprint_scooter_id as
select product_id from products where model = 'Sprint';

select * from sprint_scooter_id;

create view only_date as
select distinct date(sales_transaction_date) as only_date from sales 
where date(sales_transaction_date) between "2016-10-10" and "2016-10-25"
order by only_date;

select * from only_date;

create view cummulative_7_day_sales as 
select date(sales_transaction_date) as new_date, count(*) as `no of unit sold`, 
sum(count(*)) 
over (order by date(sales_transaction_date) rows between 6 preceding and current row)  as current_period_sales

from sales where product_id = (select product_id from sprint_scooter_id) and 
date(sales_transaction_date) in (select * from only_date)
group by date(sales_transaction_date);

select cu.new_date, cu.`no of unit sold`, cu.current_period_sales , ct.current_period_sales, 
(cu.current_period_sales - ct.current_period_sales)/ ct.current_period_sales as "% growth"

from cummulative_7_day_sales as cu inner join cummulative_7_day_sales as ct
on cu.new_date = ct.new_date + interval 1 day 
where cu.new_date > date('2016-10-16') ;

select * from cummulative_7_day_sales;

select date('2016-10-16') + interval 1 day ;

show errors;
































