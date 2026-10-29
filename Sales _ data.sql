# ----------------------- SALES ANALYSIS ------------------------------------
# ---- CREATE DATABASE -----
create database sales_analysis_db;
use sales_analysis_db;
DROP database sales_analysisdb;
show databases;
show tables;
# ------------CREATE TABLE --------------------

create table sales_data (
order_id varchar(20),
order_date date,
product varchar(50),
category varchar(50),
region varchar(50),
customer_segment varchar(50),
sales_channel varchar(50),
quantity int,
unit_price decimal(12,2),
discount_pct decimal(5,2),
net_sales decimal(14,2),
cost decimal(14,2),
profit decimal(14,2),
payment_method varchar(50),
order_status varchar(30));

# --------IMPORT VALUES -------------------------
#  IMPORTED
# ----------VALIDATE VALUES
select * from sales_data;

select count(*) as total_records
from sales_data;
describe sales_data;
select * from sales_data
limit 100 offset 5;

# NULL VALUES check table
select sum(order_id is null) as missing_order_id,
sum(order_date is null) as missing_order_date,
sum(product is null) as missing_product,
sum(region is null) as missing_region,
sum(payment_method is null) as missing_payment_method
from sales_data;

# Business Analysis Queries
select sum(net_sales)as total_sales from sales_data;
select sum(profit)as total_profit from sales_data;
select sum(quantity)as total_quantity from sales_data;

# Category-wise Sales
select category, sum(net_sales)as total_sales from sales_data 
group by category order by total_sales desc;

# Top 10 Products by Sales
select product, sum(net_sales)as total_sales from sales_data 
group by product order by total_sales desc
limit 10 offset 1;

# Region wise Sales
select region,sum(net_sales)as total_sales from sales_data 
group by region order by total_sales desc;

# Monthly Sales Report
select year(order_date) as sales_year,
month(order_date) as sales_month,
sum(net_sales) as total_sales,
sum(profit) as total_profit
from sales_data
group by year(order_date) , month(order_date)
order by sales_year , sales_month; 

# Order Status Summary
select order_status, count(*) as total_orders,
sum(net_sales) as total_sales from sales_data
group by order_status order by total_orders desc;

