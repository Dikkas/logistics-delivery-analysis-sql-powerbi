-- Not Used but a possible Data Table to be viewed in SQL or possible created as a new table for extraction
SELECT 
  T0.Delivery_ID,
  T0.Dispatch_Date,
  T0.Delivery_Date,
  T1.Name as Customer,
  T2.Origin,
  T2.Destination,
  T0.Gross_Weight,
  T2.Mode,
  T0.Status
FROM Deliveries_Clean T0
JOIN Customers T1 ON T0.Customer_ID = T1.Customer_ID
JOIN Routes T2 ON T0.Route_ID = T2.Route_ID
Order by T0.Delivery_ID