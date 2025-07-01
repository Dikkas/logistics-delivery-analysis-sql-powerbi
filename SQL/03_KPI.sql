-- Average Delivery Time
SELECT 
    ROUND(AVG(julianday(Delivery_Date) - julianday(Dispatch_Date)), 2) AS Avg_Delivery_Time
FROM Deliveries_Clean
WHERE Delivery_Date IS NOT NULL AND Status = 'Delivered'

-- Percentage of OnTime on all data
SELECT 
    ROUND(
        SUM(CASE WHEN Status = 'On-Time' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS OnTime_Percentage
FROM Deliveries_Clean T0

-- Shipments by Customer and Destination
SELECT
    T1.Name AS Customer,
    T2.Destination,
    COUNT(*) AS Shipments
FROM Deliveries T0
JOIN Customers T1 ON T0.Customer_ID = T1.Customer_ID
JOIN Routes T2 ON T0.Route_ID = T2.Route_ID
GROUP BY T1.Name, T2.Destination
Order By Shipments DESC