-- How many total records are in the table?
select count(*) as total_records from online_retail;

-- What is the date range of the dataset?
select min(invoicedate) as min_date ,
max(invoicedate) as max_date from online_retail;

-- How many unique invoices/orders?
select count(distinct(invoiceno)) as no_invoice from online_retail;

-- How many unique products?
select count(distinct(stockcode)) as total_products from online_retail;

-- How many unique customers?
select count(distinct(customerid)) from online_retail;

-- How many countries are represented?
select count(distinct(country)) from online_retail;

-- What are the different countries?
select distinct(country)from online_retail;

-- How many missing CustomerID values exist?
select count(*)from online_retail where customerid is null;

-- How many missing Description values exist?
select count(*) from online_retail where description is null;

-- Are there duplicate records?
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

-- Are there negative/zero quantities?
select count(*) from online_retail where quantity>=0;

-- Are there zero/negative prices?
select count(*)  from online_ritail where online_retail>0;

-- Are there invoices beginning with C?
SELECT InvoiceNo
FROM online_retail
WHERE InvoiceNo LIKE 'C%';