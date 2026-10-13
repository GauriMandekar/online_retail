-- How many records have missing Customer ID?
select count(*) from online_retail
where customerid is null;

-- How many records have invalid/negative quantities?
select count(*) from online_Retail
where quantity <=0;

-- How many records have invalid/zero prices?
select count(*) from online_retail
where  UnitPrice<=0;



-- How many cancelled invoices are present?
select count(distinct invoiceno) as cancelled_invoice
from online_retail where invoiceno like "c%";

-- How many duplicate records exist?
SELECT
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country,
    COUNT(*) AS duplicate_count
FROM online_retail
GROUP BY
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country
HAVING COUNT(*) > 1;

-- What percentage of records have missing CustomerID?
select (select count(*) from online_retail
where customerid is null)/(count(customerid))*100 AS cancelled_customer from online_retail;


-- What percentage of transactions are cancellations/returns?
SELECT
    (SELECT COUNT(*)
     FROM online_retail
     WHERE InvoiceNo LIKE 'C%')
    / COUNT(*) * 100 AS cancellation_percentage
FROM online_retail;

#After applying your cleaning rules, how many valid transactions remain?
-- After applying cleaning rules, how many valid transactions remain?
SELECT COUNT(*) AS valid_transactions
FROM (
    SELECT DISTINCT
        InvoiceNo,
        StockCode,
        Description,
        Quantity,
        InvoiceDate,
        UnitPrice,
        CustomerID,
        Country
    FROM online_retail
    WHERE CustomerID IS NOT NULL
      AND Quantity > 0
      AND UnitPrice > 0
      AND InvoiceNo NOT LIKE 'C%'
) AS cleaned;

