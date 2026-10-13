-- How many active customers are there?
select count( distinct customerid) as active_customer from online_retail where customerid is not null; 

-- Who are the top 10 customers by revenue?
select customerid,round(sum(unitprice*quantity),2) as revenue from online_retail  group by 
customerid order by revenue desc limit 10;

-- How many orders does each customer make?
select customerid,count(InvoiceNo)as order_count from online_retail group by customerid
order by order_count desc;

-- What is the average order value per customer?
select customerid,round(avg(avg_order),2) as average_order from(select customerid,InvoiceNo,sum(quantity*unitprice) as avg_order from online_retail group by customerid,InvoiceNo)
as orders group by customerid;

-- What is the average revenue per customer?
select customerid,avg(avg_cus) as avg_rev_customer from(select customerid,round(sum(unitprice*quantity),2) as avg_cus from online_retail
 group by customerid order by avg_cus desc )as orders group by customerid;

-- How many customers made only one purchase?
select customerid,count(invoiceno) as orders from online_retail group by customerid
having orders<=1;

-- How many are repeat customers?

SELECT COUNT(*) AS repeat_customers
FROM (
    SELECT customerid
    FROM online_retail
    GROUP BY customerid
    HAVING COUNT(*) > 1
) AS customers;

-- What percentage of revenue comes from repeat customers?
with repeating as(select customerid, sum(quantity*unitprice) as revenue,
count(distinct invoiceno) as invoice_count 
from online_retail group by customerid)
select 100*sum(case when invoice_count>1 then revenue else 0 end)/nullif(sum(revenue),0) as repeating_customers from repeating;


-- How recently did each customer purchase?
select distinct customerid, max(invoicedate) as recent_purchase from online_retail group by customerid;

-- Which high-value customers have become inactive?
select distinct customerid,round(sum(quantity*unitprice),2)as revenue ,
max(invoicedate) as last_purchase from online_retail
group by customerid
order by revenue desc;
