-- Which 10 products sell the most units?
select distinct InvoiceNo,sum(Quantity) as unit_sell from online_retail
group by InvoiceNo order by unit_sell desc limit 10;

-- Which 10 products generate the most revenue?
select distinct InvoiceNo,round(sum(unitprice*quantity),2) as revenue from online_retail
group by InvoiceNo order by revenue desc limit 10;

-- Which products have the highest number of orders?
select distinct stockcode,Description,count(invoiceno) as orders from online_retail
group by stockcode,Description order by orders desc;

-- What is the average selling price by product?
select distinct stockcode ,round(avg(unitprice),2) as selling_price from online_retail
group by StockCode;

-- Which products have high quantity but relatively low revenue?
select distinct stockcode,sum(quantity*unitprice) as revenue,
sum(quantity) as quantity from online_retail
group by stockcode  having quantity>revenue order by revenue desc;

-- Which products have high revenue but relatively low quantity?
select distinct stockcode,round(sum(quantity*unitprice),2) as revenue,
sum(quantity) as quantity from online_retail
group by stockcode  having revenue>quantity order by revenue desc;

-- What percentage of revenue comes from the top 10 products?
with revenuee as(select stockcode,sum(quantity*unitprice)as revenue  from online_retail group by stockcode ),
top_10_product as (select  stockcode,revenue from revenuee order by revenue desc limit 10)
select sum(top_10_product.revenue)/round((select sum(revenue) from revenuee)*100 ,2)as top_10_rev_perc
from top_10_product;
 
 
-- Which products contribute most to overall revenue?
select distinct stockcode,description ,round(sum(unitprice*quantity),2)as revenue from online_retail
group by StockCode,description order by revenue desc ;
