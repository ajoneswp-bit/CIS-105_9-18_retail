select * from retail_data limit 10;

SELECT DATE(InvoiceDate) AS SaleDate, SUM(Quantity) AS ItemsSold
FROM retail_data
GROUP BY DATE(InvoiceDate)
ORDER BY SaleDate;

select
    SaleDate,
    SalesValue,
    Sum(SalesValue) OVER (ORDER BY SaleDate) AS RunningTotal
from (
    SELECT DATE(InvoiceDate) AS SaleDate, SUM(Quantity * UnitPrice) AS SalesValue
    FROM retail_data
    GROUP BY DATE(InvoiceDate)
) DailySales
ORDER BY SaleDate;

SELECT Country, COUNT(DISTINCT InvoiceNo) AS TotalOrders
FROM retail_data
GROUP BY Country
ORDER BY TotalOrders DESC;