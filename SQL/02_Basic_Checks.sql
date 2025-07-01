-- Checking if Dispatch Date exists in all rows
SELECT *
FROM Deliveries
WHERE Dispatch_Date IS NULL

-- Checking if Delivery_Date is null only on Failed Status 
SELECT *
FROM Deliveries
WHERE Delivery_Date IS NULL and Status != 'Failed'

-- Checking if Dates inconsistent
SELECT *
FROM Deliveries
WHERE julianday(Delivery_Date) < julianday(Dispatch_Date)

-- Checking if Customers exists in Customer TABLE
SELECT *
FROM Deliveries
WHERE Customer_ID NOT IN (SELECT Customer_ID FROM Customers)

-- Checking if Gross Weight is always positive
SELECT *
FROM Deliveries
WHERE Gross_Weight <= 0 or Gross_Weight IS NULL

-- Checking for Duplicates on Deliveries Table
SELECT
    Dispatch_Date,
    Delivery_Date,
    Customer_ID,
    Route_ID,
    Gross_Weight,
    Status,
    COUNT(*) as CountDuplicates
FROM Deliveries
GROUP BY
    Dispatch_Date,
    Delivery_Date,
    Customer_ID,
    Route_ID,
    Gross_Weight,
    Status
HAVING CountDuplicates > 1;

-- Creating a Clean Table without Duplicates
CREATE TABLE Deliveries_Clean AS
SELECT
    MIN(Delivery_ID) as Delivery_ID,
    Dispatch_Date,
    Delivery_Date,
    Route_ID,
    Customer_ID,
    Gross_Weight,
    Status
FROM Deliveries
GROUP BY
    Dispatch_Date,
    Delivery_Date,
    Route_ID,
    Customer_ID,
    Gross_Weight,
    Status;

-- Rechecking Duplicates (Must be empty)
SELECT
    Dispatch_Date,
    Delivery_Date,
    Customer_ID,
    Route_ID,
    Gross_Weight,
    Status,
    COUNT(*) as CountDuplicates
FROM Deliveries_Clean
GROUP BY
    Dispatch_Date,
    Delivery_Date,
    Customer_ID,
    Route_ID,
    Gross_Weight,
    Status
HAVING CountDuplicates > 1;