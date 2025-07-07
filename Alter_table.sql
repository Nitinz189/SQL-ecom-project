USE ecommerce_db;

-- Add a new column 'ProductLaunchDate' to the 'Products' table
ALTER TABLE Products 
ADD COLUMN ProductLaunchDate DATE;

-- Verify that the 'ProductLaunchDate' column has been added to the 'Products' table
DESCRIBE Products;

-- Update the 'ProductLaunchDate' for each category of products
UPDATE Products
SET ProductLaunchDate = 
  CASE Category
    WHEN 'Widgets' THEN '2024-01-01'
    WHEN 'Tools' THEN '2024-02-01'
    WHEN 'Miscellaneous' THEN '2024-03-01'
    WHEN 'Machines' THEN '2024-04-01'
    WHEN 'Instruments' THEN '2024-05-01'
    WHEN 'Gizmos' THEN '2024-06-01'
    WHEN 'Gadgets' THEN '2024-07-01'
    WHEN 'Devices' THEN '2024-08-01'
    WHEN 'Contraptions' THEN '2024-09-01'
    WHEN 'Appliances' THEN '2024-10-01'
    WHEN 'Apparatus' THEN '2024-11-01'
  END;

-- Retrieve and display the ProductID, ProductName, and ProductLaunchDate for all products
SELECT ProductID, ProductName, ProductLaunchDate 
FROM Products;

-- Count how many products have a 'ProductLaunchDate' that is not NULL
SELECT COUNT(*) 
FROM Products 
WHERE ProductLaunchDate IS NOT NULL;

-- Retrieve products where 'ProductLaunchDate' is still NULL
SELECT ProductID, ProductName, ProductLaunchDate 
FROM Products 
WHERE ProductLaunchDate IS NULL;

-- Add a check constraint to ensure that 'ProductLaunchDate' is not NULL
-- Also, it checks that the date is not before January 1, 2020
ALTER TABLE Products 
ADD CONSTRAINT chk_launchdate 
CHECK (ProductLaunchDate IS NOT NULL AND ProductLaunchDate >= '2020-01-01');

-- Retrieve and display product details including the newly added 'ProductLaunchDate'
-- This helps you verify the integrity of the data after adding the constraint
SELECT ProductName, Price, StockQuantity, ProductLaunchDate 
FROM Products;

