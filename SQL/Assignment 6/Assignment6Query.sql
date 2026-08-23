-- Assignment 6 (SQL)
USE hardware_store;

GO
----------------------------------------------------------------
/*
1.	Total revenue by customer showing customer name and total revenue
*/
CREATE VIEW Revenue_by_Customer
AS
(SELECT   C.name,
          SUM(O.amount) AS Total_Revenue
 FROM     customers AS C
          INNER JOIN
          orders AS O
          ON O.customer_id = C.customer_id
 GROUP BY C.name);

 GO
----------------------------------------------------------------
/*
2.	Customers with at least 3 orders showing customer name and order count
*/
CREATE VIEW Customer_Orders
AS
(SELECT   C.name,
          COUNT(DISTINCT O.order_id) AS Total_Orders
 FROM     customers AS C
          INNER JOIN
          orders AS O
          ON O.customer_id = C.customer_id
 GROUP BY C.name
 HAVING   COUNT(DISTINCT O.order_id) >= 3);

GO
----------------------------------------------------------------
/*
3.  Average order value per customer showing customer name and average amount
*/
CREATE VIEW AVG_Order_per_Customer
AS
(SELECT   C.name,
          AVG(O.amount) AS Total_Revenue
 FROM     customers AS C
          INNER JOIN
          orders AS O
          ON O.customer_id = C.customer_id
 GROUP BY C.name);

 GO
----------------------------------------------------------------
/*
4.	Total revenue by product showing product name and total revenue
*/
CREATE VIEW Revenue_by_Product
AS
(SELECT   P.product_name,
          SUM(O.amount) AS Total_Revenue
 FROM     products AS P
          INNER JOIN
          orders AS O
          ON O.product_id = P.product_id
 GROUP BY P.product_name);

GO
----------------------------------------------------------------
/*
5.	Total quantity sold by product showing product name and total quantity sold
*/
CREATE VIEW Quantity_by_Product
AS
(SELECT   P.product_name,
          SUM(O.quantity) AS Total_Quantity
 FROM     products AS P
          INNER JOIN
          orders AS O
          ON O.product_id = P.product_id
 GROUP BY P.product_name);

 GO
----------------------------------------------------------------
/*
6.  Number of orders per day showing order date and order count
*/
CREATE VIEW Orders_per_day
AS
(SELECT   order_date,
          COUNT(DISTINCT order_id) AS Total_Orders
 FROM     orders
 GROUP BY order_date);

GO
----------------------------------------------------------------
/*
7.  Total sales per day showing order date and daily sales amount
*/
CREATE VIEW Sales_per_day
AS
(SELECT   order_date,
          SUM(amount) AS Total_Orders
 FROM     orders
 GROUP BY order_date);

GO
----------------------------------------------------------------
/*
8.  Total payments by payment method showing payment method and total collected
*/
CREATE VIEW payments_by_methods
AS
(SELECT   payment_method,
          SUM(payment_amount) AS TotalPayments
 FROM     payments
 GROUP BY payment_method);

GO
----------------------------------------------------------------
/*
9.  Total payments per day showing payment date and total payment amount
*/
CREATE VIEW payments_per_day
AS
(SELECT   payment_date,
          SUM(payment_amount) AS TotalPayments
 FROM     payments
 GROUP BY payment_date);

 GO
----------------------------------------------------------------
/*
10.  Shipment summary by carrier showing carrier name, shipment
	 count, first shipping date, and last shipping date
*/
CREATE VIEW Shipment_summary
AS
(SELECT   carrier,
          COUNT(DISTINCT shipment_id) AS TotalShipment,
          MIN(shipping_date) AS First_shipping_date,
          MAX(shipping_date) AS Last_shipping_date
 FROM     shipments
 GROUP BY carrier);

GO
----------------------------------------------------------------
/*
-- Bounce Problems
1.  Orders with shipping status: order ID, customer name, order date, shipped_status (shipped / not_shipped)
*/
CREATE VIEW Orders_with_ShippingSt
AS
(SELECT O.order_id,
        C.name,
        O.order_date,
        CASE 
        WHEN S.shipment_id IS NOT NULL THEN 'Shipped' 
        ELSE 'Not Shipped' 
        END AS Shipped_Status
 FROM   orders AS O
        INNER JOIN
        customers AS C
        ON C.customer_id = O.customer_id
        LEFT JOIN
        shipments AS S
        ON S.order_id = O.order_id);

GO
----------------------------------------------------------------
/*
2.  Product price rank band: product name, price, price_band based on price (budget/standard/premium)
*/
CREATE VIEW Product_price_band
AS
(SELECT product_id,
        product_name,
        price,
        CASE 
        WHEN price <= 100 THEN 'Budget' 
        WHEN price <= 500 THEN 'Standard' 
        ELSE 'Premium' 
        END AS Price_Band
 FROM   products);

GO