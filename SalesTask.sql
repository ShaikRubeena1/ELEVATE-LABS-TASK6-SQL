SELECT * FROM sales;

-- Total Revenue by Country
SELECT Country,sum(UnitPrice*Quantity) AS TotalRevenue
 FROM sales
GROUP BY  Country
ORDER BY TotalRevenue DESC;



-- Top 5 Best Selling Products
SELECT Products,sum(Quantity) AS TotalUnitSold FROM sales
GROUP BY Products
ORDER BY TotalUnitSold DESC
LIMIT 5;





-- Sales by Category and Month
SELECT Category,MONTH(str_to_date(OrderDate,'%d-%m-%y')) AS SalesMonth,sum(UnitPrice*Quantity) AS MonthlyRevenue
 FROM sales
GROUP BY  Category,SalesMonth
ORDER BY Category,SalesMonth;




-- Online vs In-store Revenue Split
SELECT SalesChannel,sum(UnitPrice*Quantity) AS TotalRevenue
 FROM sales 
GROUP BY SalesChannel;








-- Top Customers by Spend
SELECT CustomerID,sum(UnitPrice*Quantity) AS TotalSpend 
FROM sales
GROUP BY CustomerID
ORDER BY TotalSpend DESC
LIMIT 10;







-- Most Popular Payment Method
SELECT PaymentMethod,count(*) AS UsageCount
FROM sales
GROUP BY PaymentMethod
ORDER BY UsageCount DESC;








-- Shipment cost by Provider
SELECT ShipmentProvider,AVG(ShippingCost) AS AvgShippingCost,SUM(ShippingCost) AS TotalShippingCost
FROM sales
GROUP BY ShipmentProvider
ORDER BY TotalShippingCost DESC;








-- Monthly Orders Trend
SELECT YEAR(str_to_date(OrderDate,'%d-%m-%y')) AS OrderYear,
	   Month(str_to_date(OrderDate,'%d-%m-%y')) AS OrderMonth,
       count(distinct InvoiceNo) AS TotalOrders
FROM sales
GROUP BY OrderYear,OrderMonth;








-- Category-wise Revenue Analysis
SELECT Category,
       count(distinct InvoiceNo) AS TotalOrders,
       sum(UnitPrice*Quantity) AS TotalRevenue
FROM sales
GROUP BY Category;







-- Monthly Revenue and Order Volume Report

SELECT YEAR(str_to_date(OrderDate,'%d-%m-%y')) AS OrderYear,
       MONTH(str_to_date(OrderDate,'%d-%m-%y')) AS OrderMonth,
       sum(UnitPrice * Quantity) AS TotalRevenue,
       count(distinct InvoiceNo) AS TotalOrders
FROM sales
GROUP BY 
	   YEAR(str_to_date(OrderDate,'%d-%m-%y')),
       MONTH(str_to_date(OrderDate,'%d-%m-%y'))
ORDER BY OrderYear,OrderMonth
LIMIT 12;
