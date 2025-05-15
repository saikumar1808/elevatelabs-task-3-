SELECT * FROM ecommerce_data.sales_data1;
SET foreign_key_checks = 0;
SET unique_checks = 0;

SELECT * FROM sales_data1 LIMIT 10;

# Total Sales Per Country
SELECT Country, SUM(Quantity * UnitPrice) AS TotalSales
FROM sales_data1
GROUP BY Country
ORDER BY TotalSales DESC;

# Top 10 Products by Revenue
SELECT Description_, SUM(Quantity * UnitPrice) AS Revenue
FROM sales_data1
GROUP BY Description_
ORDER BY Revenue DESC
LIMIT 10;

# Top customers by spending
SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalSpent
FROM sales_data1
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 10;

# monthly sales trend
SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
    SUM(Quantity * UnitPrice) AS MonthlySales
FROM sales_data1
GROUP BY Month
ORDER BY Month;

# sales per day 
SELECT 
    DATE(InvoiceDate) AS Date,
    SUM(Quantity * UnitPrice) AS DailySales
FROM sales_data1
GROUP BY Date
ORDER BY Date;

# avg order value by country
SELECT Country, AVG(Quantity * UnitPrice) AS AvgOrderValue
FROM sales_data1
GROUP BY Country;

# cancelled orders
SELECT *
FROM sales_data1
WHERE Quantity < 0;

--  total sales per country
CREATE VIEW view_country_sales AS
SELECT Country, SUM(Quantity * UnitPrice) AS TotalSales
FROM sales_data1
GROUP BY Country;

-- top 10 customers
CREATE VIEW view_top_customers AS
SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalSpent
FROM sales_data1
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 10;

-- monthly sales trend
CREATE VIEW view_monthly_sales AS
SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
    SUM(Quantity * UnitPrice) AS MonthlySales
FROM sales_data1
GROUP BY Month
ORDER BY Month;





