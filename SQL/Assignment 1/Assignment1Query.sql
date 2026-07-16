-- Assignment 1 (SQL)
-- (1) Access the following Database 
CREATE DATABASE sql_practice;

USE sql_practice;

CREATE TABLE orders (
    orderid     INT             PRIMARY KEY,
    customerid  VARCHAR (20)    NOT NULL,
    productname VARCHAR (100)   NOT NULL,
    category    VARCHAR (50)    NOT NULL,
    country     VARCHAR (50)    NOT NULL,
    orderdate   DATE            NOT NULL,
    shipdate    DATE            NULL,
    quantity    INT             NOT NULL,
    unitprice   DECIMAL (10, 2) NOT NULL,
    sales       DECIMAL (10, 2) NOT NULL,
    discount    DECIMAL (10, 2) NULL,
    profit      DECIMAL (10, 2) NOT NULL
);

INSERT  INTO orders (orderid, customerid, productname, category, country, orderdate, shipdate, quantity, unitprice, sales, discount, profit)
VALUES             (1, 'c101', 'office chair', 'furniture', 'usa', '2023-01-15', '2023-01-18', 2, 250.00, 500.00, 0.10, 80.00),
(2, 'c102', 'gaming chair', 'furniture', 'usa', '2023-03-10', '2023-03-12', 1, 700.00, 700.00, 0.20, 120.00),
(3, 'a103', 'laptop', 'technology', 'germany', '2023-05-05', '2023-05-08', 3, 400.00, 1200.00, 0.15, 250.00),
(4, 'b104', 'desk lamp', 'office supplies', 'uk', '2022-11-20', '2022-11-25', 5, 40.00, 200.00, 0.05, 30.00),
(5, 'c105', 'tablet', 'technology', 'usa', '2023-07-01', NULL, 1, 350.00, 350.00, NULL, -20.00),
(6, 'd106', 'bookshelf', 'furniture', 'canada', '2024-01-12', '2024-01-15', 4, 150.00, 600.00, 0.25, 90.00),
(7, 'c107', 'monitor', 'technology', 'usa', '2023-09-09', '2023-09-14', 2, 275.00, 550.00, 0.00, 60.00),
(8, 'e108', 'printer', 'technology', 'france', '2023-04-18', NULL, 1, 180.00, 180.00, 0.10, -15.00),
(9, 'c109', 'wooden chair', 'furniture', 'uk', '2023-12-05', '2023-12-09', 6, 120.00, 720.00, 0.30, 140.00),
(10, 'f110', 'mouse', 'technology', 'germany', '2023-06-22', '2023-06-24', 10, 25.00, 250.00, 0.05, 40.00),
(11, 'c111', 'conference chair', 'furniture', 'usa', '2022-08-14', '2022-08-19', 3, 320.00, 960.00, 0.10, -50.00),
(12, 'g112', 'phone', 'technology', 'india', '2023-02-11', '2023-02-15', 2, 500.00, 1000.00, 0.20, 200.00),
(13, 'h113', 'binder', 'office supplies', 'usa', '2023-10-01', '2023-10-03', 1, 15.00, 15.00, 0.00, 5.00),
(14, 'c114', 'standing desk', 'furniture', 'germany', '2023-11-19', '2023-11-22', 2, 650.00, 1300.00, 0.10, 300.00),
(15, 'i115', 'headphones', 'technology', 'usa', '2024-02-05', '2024-02-07', 4, 80.00, 320.00, 0.05, 45.00),
(16, 'c116', 'study chair', 'furniture', 'usa', '2023-08-08', NULL, 5, 210.00, 1050.00, 0.40, 180.00),
(17, 'j117', 'router', 'technology', 'uk', '2023-03-30', '2023-04-02', 2, 150.00, 300.00, NULL, -10.00),
(18, 'c118', 'filing cabinet', 'furniture', 'canada', '2023-05-21', '2023-05-25', 1, 450.00, 450.00, 0.20, 70.00),
(19, 'k119', 'desk chair pro', 'furniture', 'usa', '2023-06-01', '2023-06-05', 2, 480.00, 960.00, 0.10, 150.00),
(20, 'c120', 'server rack', 'technology', 'germany', '2023-07-17', '2023-07-20', 1, 1100.00, 1100.00, 0.05, 220.00);

------------------------------------------------------------------------
-- (2) Basic Questions
-- 1. Write a query to display all columns from the Orders table.
SELECT *
FROM   orders;

-- 2. Display only the OrderID, CustomerID, and Sales columns.
SELECT orderid,
       customerid,
       sales
FROM   orders;

-- 3. Show all orders where Sales > 500.
SELECT *
FROM   orders
WHERE  sales > 500;

-- 4. Retrieve orders where Quantity = 1.
SELECT *
FROM   orders
WHERE  quantity = 1;

-- 5. Display all orders where Country = 'USA'.
SELECT *
FROM   orders
WHERE  country = 'USA';

-- 6. List all distinct countries from the Orders table.
SELECT DISTINCT country
FROM   orders;

-- 7. Show orders where Profit < 0.
SELECT *
FROM   orders
WHERE  profit < 0;

-- 8. Retrieve orders where Discount >= 0.2.
SELECT *
FROM   orders
WHERE  discount >= 0.2;

-- 9. Display orders where ShipDate IS NULL.
SELECT *
FROM   orders
WHERE  shipdate IS NULL;

-- 10. Show orders where Sales = Quantity * UnitPrice
SELECT *
FROM   orders
WHERE  sales = quantity * unitprice;

------------------------------------------------------------------------
-- (3) Intermediate Questions
-- 1. Retrieve orders where Country = 'USA' AND Sales > 300.
SELECT *
FROM   orders
WHERE  country = 'USA'
       AND sales > 300;

-- 2. Show orders where Category = 'Furniture' OR Category = 'Technology'.
SELECT *
FROM   orders
WHERE  category = 'Furniture'
       OR category = 'Technology';

-- 3. Find all orders where CustomerID starts with 'C' using LIKE.
SELECT *
FROM   orders
WHERE  customerid LIKE 'C%';

-- 4. Display orders where OrderDate is BETWEEN '2023-01-01' AND '2023-12-31'.
SELECT *
FROM   orders
WHERE  orderdate BETWEEN '2023-01-01' AND '2023-12-31';

-- 5.Retrieve orders where Country IN ('USA' , 'UK' , 'Germany'), ordered by Sales DESC.
SELECT   *
FROM     orders
WHERE    country IN ('USA', 'UK', 'Germany')
ORDER BY sales DESC;

------------------------------------------------------------------------
-- (4) Advanced Questions
-- 1. Show orders where Sales > 500 AND Profit > 0, ordered by Profit DESC.
SELECT   *
FROM     orders
WHERE    sales > 500
         AND profit > 0
ORDER BY profit DESC;

-- 2. Retrieve orders where Discount IS NOT NULL AND Discount > 0, sorted by Discount ASC.
SELECT   *
FROM     orders
WHERE    discount IS NOT NULL
         AND discount > 0
ORDER BY discount ASC;

-- 3. Find orders where (Quantity * UnitPrice) - Discount > 1000.
SELECT *
FROM   orders
WHERE  (quantity * unitprice) - discount > 1000;

-- 4. Display orders where Product name contains 'Chair' , and Sales BETWEEN 200 AND 1000.
SELECT *
FROM   orders
WHERE  productname LIKE '%Chair%'
       AND sales BETWEEN 200 AND 1000;

-- 5.Retrieve distinct CustomerID values where Country = 'USA' AND Profit < 0, ordered alphabetically.
SELECT   DISTINCT customerid
FROM     orders
WHERE    country = 'USA'
         AND profit < 0
ORDER BY customerid ASC;

