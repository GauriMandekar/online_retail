
-- Rank the top products within each country by revenue.
WITH product_revenue AS (SELECT 
Country,StockCode,SUM(Quantity * UnitPrice) AS revenue
FROM online_retail GROUP BY Country, StockCode
)SELECT Country,StockCode,ROUND(revenue, 2) AS revenue,RANK() OVER (PARTITION BY Country ORDER BY revenue DESC) AS product_rank
FROM product_revenue ORDER BY Country, product_rank;


-- Rank invoices by revenue within each country.
with revenuee as(select distinct invoiceno,country,sum(quantity*unitprice)as revenue from online_retail group by invoiceno,country)
select country,invoiceno,round(revenue,2)as revenue,rank()over(partition by country order by revenue desc) as revenue_rank from revenuee ;

-- Calculate each country's percentage contribution to total revenue.
with revenuee as(select country,sum(unitprice*quantity)as revenue from online_retail group by country)
select country,round(revenue,2) as revenue, round(revenue/(select sum(revenue)  from revenuee)*100,2)as revenue_percentage
from revenuee order by revenue_percentage desc;


-- Find each customer's first and most recent purchase.
SELECT
    CustomerID,
    MIN(date_format(InvoiceDate, '%d %M %Y'))AS first_purchase,
    MAX(date_format(InvoiceDate, '%d %M %Y'))AS last_purchase
FROM online_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID;


-- Find customers whose revenue is above the overall average customer revenue.
select stockcode, sum(quantity*unitprice) as revenue
from online_retail
group by stockcode
having sum(quantity*unitprice) > (
    select avg(product_revenue)
    from (
        select sum(quantity*unitprice) as product_revenue
        from online_retail
        group by stockcode
    ) as t
);

WITH customer_rev AS (
SELECT CustomerID,SUM(Quantity * UnitPrice) AS revenue
FROM online_retail WHERE CustomerID IS NOT NULL GROUP BY CustomerID
),ranked AS (SELECT CustomerID,revenue,NTILE(10) OVER (ORDER BY revenue DESC) AS decile FROM customer_rev
)SELECT CustomerID, ROUND(revenue, 2) AS revenue
FROM ranked
WHERE decile = 1
ORDER BY revenue DESC;
