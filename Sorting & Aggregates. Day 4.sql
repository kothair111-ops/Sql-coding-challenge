create database ecommerceDB;
use ecommerceDB;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);
INSERT INTO Products (ProductName, Price) VALUES
('Laptop Pro', 1299.99),
('Wireless Headphones', 199.50),
('Smartphone X', 999.00),
('Gaming Monitor', 349.99),
('Mechanical Keyboard', 129.00),
('4K TV', 1799.00),
('Bluetooth Speaker', 89.99);
select*from products;

-- orderby & limit --
select productid,productname,price
from products
order by price asc;
SELECT ProductID, ProductName, Price
FROM Products
ORDER BY Price DESC
LIMIT 3;
Select Productid,productname,price
from products
order by price asc,productname desc
limit 5;
SELECT ProductID, ProductName, Price
FROM Products
WHERE Price >= 100
ORDER BY Price DESC
LIMIT 3;

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2)
);

INSERT INTO Sales (ProductName, Quantity, Price) VALUES
('Laptop Pro', 2, 1299.99),
('Wireless Headphones', 5, 199.50),
('Smartphone X', 3, 999.00),
('Gaming Monitor', 4, 349.99),
('Bluetooth Speaker', 10, 89.99);
select*from sales;

-- Aggregate function--
SELECT COUNT(*) AS TotalSales
FROM Sales;
select avg(quantity) as avgquantity
from sales
where price>100;
select sum(price) as sumprice
from sales;
select avg(price*quantity) as avg
from sales;
select max(price) as maxprice
from sales;
select min(price/quantity) as min
from sales;

-- groupby & having --
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100),
    DepartmentName VARCHAR(100)
);

INSERT INTO Employees (EmployeeName, DepartmentName) VALUES
('Alice', 'Computer Science'),
('Bob', 'Computer Science'),
('Clara', 'Computer Science'),
('David', 'Computer Science'),
('Emma', 'Computer Science'),
('Frank', 'Computer Science'),
('Grace', 'Computer Science'),
('Henry', 'Computer Science'),
('Ivy', 'Computer Science'),
('Jack', 'Computer Science'),
('Kevin', 'Computer Science'), -- 11th employee in CS
('Laura', 'Mechanical'),
('Mike', 'Mechanical'),
('Nina', 'Mechanical'),
('Oscar', 'Mechanical'),
('Paul', 'History'),
('Quinn', 'History'),
('Rita', 'Physics');
select * from employees;
SELECT DepartmentName, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(*) > 10;


