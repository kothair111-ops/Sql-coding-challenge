Create database Onlinebookstore;
use onlinebookstore;
Create Table Books(
BookId Int Primary key,
Title  Varchar(100),
Author Varchar(150),
Price Decimal(10,2)
);
-- Create a order table with foregin key referece--
Create table Orders(
OrderId Int primary key,
BookId Int,
OrderDate Date,
Quantity Int,
Foreign key (BookID) REFERENCES Books(BookID)
);
ALTER TABLE Books
ADD ISBN VARCHAR(20) UNIQUE;
SHOW INDEX FROM Books;
DELETE FROM Orders
WHERE OrderID IN (999, 1000);






