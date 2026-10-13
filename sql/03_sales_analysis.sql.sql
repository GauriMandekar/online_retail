-- What is total revenue?
select round((quantity*unitprice),2) as revenue from online_retail;
-- What is total quantity sold?
select count(quantity) as total_sold from online_retail;
-- How many orders were placed?
select count(distinct (invoiceno)) as order_placed from online_retail;
-- What is the Average Order Value (AOV)?
select (round(sum(unitprice*quantity),2))/count(distinct (invoiceno)) as order_placed from online_retail ;

-- What is monthly revenue?
SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS year_months,
    ROUND(SUM(Quantity * UnitPrice), 2) AS monthly_revenue
FROM online_retail
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY year_months;


-- Which month generated the highest revenue?
select date_format(invoicedate,"%y-%m") as year_mo,sum(quantity*unitprice) as max_rev from online_retail
group by date_format(invoicedate,"%y-%m") order by  year_mo desc limit 1;


-- Which month generated the lowest revenue?
select date_format(invoicedate,"%y-%m") as year_mo,sum(quantity*unitprice) as max_rev from online_retail
group by date_format(invoicedate,"%y-%m") order by  year_mo  limit 1;

-- What is month-over-month revenue growth?
with mom as(select date_format(invoicedate,"%y-%m") as year_mo,sum(quantity*unitprice) as monthly_rev from online_retail group by  date_format(invoicedate,"%y-%m"))
select monthly_rev,year_mo,
lag(monthly_rev) over(order by year_mo) as previous_mo,
(monthly_rev-lag(monthly_rev) over(order by year_mo))/lag(monthly_rev) over(order by year_mo)*100  as mom_grouth_pct from mom order by year_mo;

-- Which countries generate the most revenue?
select country ,round(sum(unitprice*quantity),2) as revenue from online_retail group by country order by revenue desc limit 1; 

-- What percentage of total revenue comes from each country?
SELECT
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS country_revenue,
    ROUND(
        SUM(Quantity * UnitPrice) * 100.0
        / SUM(SUM(Quantity * UnitPrice)) OVER (),
    2) AS revenue_pct
FROM online_retail
group by country;