CREATE DATABASE SalesAnalytics;
Use SalesAnalytics;

CREATE TABLE Customer(
Customer_ID VARCHAR(10),
Customer_Name VARCHAR(50),
City VARCHAR(30),
Region VARCHAR(30)
);
INSERT INTO Customer
(Customer_ID,Customer_Name,City,Region)
VALUES
('C001','Rahul Sharma','Delhi','North'),
('C002','Priya Singh','Mumbai','West'),
('C003','Aman Verma','Lucknow','North'),
('C004','Neha Gupta','Jaipur','North'),
('C005','Rohan Mehta','Pune','West'),
('C006','Anjali Kapoor','Delhi','North'),
('C007','Karan Malhotra','Banglore','South'),
('C008','Sneha Jain','Mumbai','West'),
('C009','Arjun Rao','Hyderabad','South'),
('C010','Pooja Agarwal','Jaipur','North');
SELECT*FROM Customer;

CREATE TABLE Product(
Product_ID VARCHAR(10),
Product_Name VARCHAR(50),
Category VARCHAR(50),
Price INT 
);
INSERT INTO Product
(Product_ID,Product_Name,Category,Price)
VALUES
('P001','Laptop','Electronics',55000),
('P002','Mouse','Electronics',800),
('P003','Keyboard','Electronics',1500),
('P004','Office Chair','Furniture',7000),
('P005','Desk','Furniture',9000),
('P006','Headphones','Electronics',2500),
('P007','Monitor','Electronics',12000),
('P008','Notebook','Stationary',100),
('P009','Pen Set','Stationary',250),
('P010','Printer','Electronics',15000);
SELECT*FROM Product;

CREATE TABLE Orders(
Order_ID VARCHAR(10),
Order_Date Date,
Customer_ID VARCHAR(10),
Product_ID VARCHAR(10),
Quantity INT,
Sales INT
);
INSERT INTO Orders 
(Order_ID,Order_Date,Customer_ID,Product_ID,Quantity,Sales)
VALUES
('O001','2026-01-05','C001','P001',1,55000),
('O002','2026-01-08','C002','P004',2,14000),
('O003','2026-01-12','C003','P002',3,2400),
('O004','2026-01-15','C004','P007',1,12000),
('O005','2026-01-20','C005','P005',1,9000),
('O006','2026-02-03','C006','P006',2,5000),
('O007','2026-02-10','C007','P003',2,3000),
('O008','2026-02-15','C008','P010',1,15000),
('O009','2026-02-20','C009','P004',1,7000),
('O010','2026-03-02','C010','P008',10,1000),
('O011','2026-03-08','C001','P007',2,24000),
('O012','2026-03-15','C002','P006',1,2500),
('O013','2026-03-20','C003','P005',2,18000),
('O014','2026-04-05','C004','P001',1,55000),
('O015','2026-04-12','C005','P009',5,1250);
SELECT*FROM Orders;
SELECT SUM(Sales)
FROM Orders;
SELECT COUNT(Quantity)
FROM Orders;
SELECT SUM(Quantity)
FROM Orders;
SELECT AVG(Sales) 
FROM Orders;
SELECT MAX(Sales)
FROM Orders;
SELECT MIN(Sales)
FROM Orders;
SELECT Product_Name,Price
FROM Product;
SELECT COUNT(Product_ID)
FROM Product;
SELECT*FROM Product
WHERE Category = "Electronics";
SELECT Product_Name,Price
FROM Product
ORDER BY Price DESC
LIMIT 1;
SELECT*FROM Product
ORDER BY Price ASC
LIMIT 1;
SELECT Customer_Name,City,Region
FROM Customer;
SELECT Customer_Name
FROM Customer
WHERE City = "Delhi";
SELECT Region,COUNT(*)
FROM Customer
GROUP BY Region;
SELECT p.Category,SUM(o.Sales) AS Total_Sales
FROM Orders o 
INNER JOIN Product p 
ON o.Product_ID = p.Product_ID
GROUP BY p.Category;
SELECT p.Category, SUM(o.Quantity) AS Total_Quantity
FROM Orders o 
INNER JOIN Product p 
ON o.Product_ID = p.Product_ID 
GROUP BY p.Category;
SELECT p.Product_Name, SUM(o.Sales) AS Total_Sales
FROM Orders o 
JOIN Product p 
ON o.Product_ID = p.Product_ID
Group BY p.Product_Name;
SELECT p.Product_Name, SUM(o.Sales) AS Total_Sales
FROM Orders O 
JOIN Product p 
ON o.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Sales DESC 
LIMIT 5;
 SELECT c.Customer_Name, SUM(o.Sales) AS Total_Sales
 FROM Customer c 
 JOIN Orders o
 ON o.Customer_ID = c.Customer_ID
 GROUP BY Customer_Name;
 SELECT c.City, SUM(o.Sales) AS Total_Sales
 FROM Orders o 
 JOIN Customer c 
 ON o.Customer_ID = c.Customer_ID
 GROUP BY c.City;
 SELECT c.Region, SUM(o.Sales) AS Total_Sales
 FROM Orders o 
 JOIN Customer c 
 ON o.Customer_ID = c.Customer_ID
 GROUP BY c.Region;
 SELECT c.Customer_Name, SUM(o.Sales) AS Total_Sales
 FROM Orders o 
 JOIN Customer c 
 ON o.Customer_ID = c.Customer_ID
 GROUP BY c.Customer_Name
 ORDER BY Total_Sales DESC
 LIMIT 5;
 SELECT Order_Date, SUM(Sales) AS Total_Sales
 FROM Orders 
 GROUP BY Order_Date;
 SELECT MONTHNAME(Order_Date) AS Month, SUM(Sales) AS Total_Sales
 FROM Orders
 GROUP BY MONTHNAME(Order_Date),MONTH(Order_Date)
 ORDER BY MONTH(Order_Date);
 SELECT MONTHNAME(Order_Date) AS Month, SUM(Sales) AS Total_Sales
 FROM Orders
 GROUP BY MONTHNAME(Order_Date),MONTH(Order_Date)
 ORDER BY Total_Sales DESC
 LIMIT 1;
 SELECT o.Order_ID,o.Order_Date,c.Customer_Name,c.City,p.Product_Name,p.Category,o.Quantity,o.Sales
 FROM Orders o 
 JOIN Customer c 
 ON o.Customer_ID = c.Customer_ID
 JOIN Product p 
 ON o.Product_ID = p.Product_ID;
 