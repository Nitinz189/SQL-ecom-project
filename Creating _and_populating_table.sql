CREATE DATABASE ecommerce_db;

-- Phase 1: Creating and Populating the Products Table

USE ecommerce_db;

-- Create the Products table to store product information
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each product
    ProductName VARCHAR(255) NOT NULL, -- Name of the product
    Description TEXT, -- Description of the product
    Price DECIMAL(10, 2) NOT NULL, -- Price of the product
    StockQuantity INT NOT NULL, -- Quantity of product available in stock
    Category VARCHAR(100), -- Category of the product (e.g., Electronics)
    DateAdded DATE NOT NULL DEFAULT (CURDATE()) -- Date when the product was added, defaults to today's date
);

-- Verify the structure of the Products table
DESCRIBE Products;

-- Insert sample data into the Products table
INSERT INTO Products (ProductName, Description, Price, StockQuantity, Category)
VALUES 
('Smartphone', 'A latest model smartphone with all the features.', 699.99, 50, 'Electronics'),
('Running Shoes', 'Comfortable running shoes for all terrains.', 89.99, 100, 'Sportswear'),
('Bluetooth Speaker', 'Portable speaker with excellent sound quality.', 45.00, 200, 'Electronics');

-- View the data in the Products table to confirm it was inserted correctly
SELECT * FROM Products;


-- Phase 2: Creating and Populating the Users Table

-- Create the Users table to store customer information
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each user
    UserName VARCHAR(255) NOT NULL, -- Name of the user
    Email VARCHAR(255) NOT NULL UNIQUE, -- Email of the user, must be unique
    Password VARCHAR(255) NOT NULL, -- Hashed password for security
    Address VARCHAR(255), -- User's shipping address
    DateRegistered DATE NOT NULL DEFAULT (CURDATE()) -- Date when the user registered, defaults to today's date
);

-- Verify the structure of the Users table
DESCRIBE Users;

-- Insert sample data into the Users table
INSERT INTO Users (UserName, Email, Password, Address)
VALUES 
('John Doe', 'john.doe@example.com', 'hashedpassword123', '123 Main St'),
('Jane Smith', 'jane.smith@example.com', 'hashedpassword456', '456 Elm St');

-- View the data in the Users table to confirm it was inserted correctly
SELECT * FROM Users;


-- Phase 3: Creating and Populating the Orders Table

-- Create the Orders table to store transaction details
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each order
    UserID INT, -- ID of the user who placed the order
    OrderDate DATE NOT NULL, -- Date when the order was placed
    TotalAmount DECIMAL(10, 2) NOT NULL, -- Total amount of the order
    FOREIGN KEY (UserID) REFERENCES Users(UserID) -- Link to the Users table
);

-- Verify the structure of the Orders table
DESCRIBE Orders;

-- Insert sample data into the Orders table
INSERT INTO Orders (UserID, OrderDate, TotalAmount)
VALUES 
(1, '2024-08-01', 789.99),
(2, '2024-08-02', 120.50);

-- View the data in the Orders table to confirm it was inserted correctly
SELECT * FROM Orders;


-- Phase 4: Creating and Populating the Reviews Table

-- Create the Reviews table to store customer feedback
CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each review
    ProductID INT, -- ID of the product being reviewed
    UserID INT, -- ID of the user who wrote the review
    Rating INT, -- Rating given by the user (1 to 5 stars)
    ReviewText TEXT, -- Text of the review
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID), -- Link to the Products table
    FOREIGN KEY (UserID) REFERENCES Users(UserID), -- Link to the Users table
    CHECK (Rating >= 1 AND Rating <= 5) -- Ensure the rating is between 1 and 5
);

-- Verify the structure of the Reviews table
DESCRIBE Reviews;

-- Insert sample data into the Reviews table
INSERT INTO Reviews (ProductID, UserID, Rating, ReviewText)
VALUES 
(1, 1, 5, 'Amazing smartphone, very satisfied!'),
(2, 2, 4, 'Great shoes, very comfortable.');

-- View the data in the Reviews table to confirm it was inserted correctly
SELECT * FROM Reviews;


-- Phase 5: Creating and Populating the Payments Table

-- Create the Payments table to store payment transaction details
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each payment
    OrderID INT, -- ID of the order being paid for
    PaymentMethod VARCHAR(50), -- Method of payment (e.g., Credit Card)
    PaymentDate DATE NOT NULL, -- Date when the payment was made
    Amount DECIMAL(10, 2) NOT NULL, -- Amount paid
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) -- Link to the Orders table
);

-- Verify the structure of the Payments table
DESCRIBE Payments;

-- Insert sample data into the Payments table
INSERT INTO Payments (OrderID, PaymentMethod, PaymentDate, Amount)
VALUES 
(1, 'Credit Card', '2024-08-01', 789.99),
(2, 'PayPal', '2024-08-02', 120.50);

-- View the data in the Payments table to confirm it was inserted correctly
SELECT * FROM Payments;
