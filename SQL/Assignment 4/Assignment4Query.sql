-- Assignment 4 (SQL)
-- Load the provided dataset into your database
CREATE DATABASE TechCompanyDB;

USE TechCompanyDB;

----------------------------------------------------------------
/* 
1.  From the following tables, write a SQL query to 
	calculate the average price of each company’s products along with the company name.
	Return company_name and average_price.
*/
SELECT   C.company_name,
         AVG(I.price) AS [Average Price]
FROM     company AS C
         INNER JOIN
         items AS I
         ON I.company_id = C.company_id
GROUP BY C.company_name;

----------------------------------------------------------------
/* 
2.  Write a SQL query to find all companies where the average item price is greater
	than the overall average price of all products.
	Return company_name and average_price.
*/
SELECT   C.company_name,
         AVG(I.price) AS [Average Price]
FROM     company AS C
         INNER JOIN
         items AS I
         ON I.company_id = C.company_id
GROUP BY C.company_name
HAVING   AVG(I.price) > (SELECT AVG(price)
                         FROM   items);

----------------------------------------------------------------
/* 
3.  From the following tables, write a SQL query to find all items whose price is
	greater than the average price of all items.
	Return item_id, item_name, price, and company_id.
*/
SELECT item_id,
       item_name,
       price,
       company_id
FROM   items
WHERE  price > (SELECT AVG(price)
                FROM   items);

----------------------------------------------------------------
/* 
4.  From the following tables, write a SQL query to find all employees who work in
	departments whose department budget is greater than the average department budget.
	Return emp_id, emp_fname, emp_lname, and dept_code.
*/
SELECT E.emp_id,
       E.emp_fname,
       E.emp_lname,
       D.dept_code
FROM   employees AS E
       INNER JOIN
       departments AS D
       ON D.dept_code = E.emp_dept
WHERE  D.dept_budget > (SELECT AVG(dept_budget)
                        FROM   departments);

----------------------------------------------------------------
/* 
5.  Write a SQL query to find departments which have more employees than the
	average number of employees per department.
	Return dept_code and dept_name.
*/
SELECT   D.dept_code,
         D.dept_name
FROM     departments AS D
         INNER JOIN
         employees AS E
         ON E.emp_dept = D.dept_code
GROUP BY D.dept_code, D.dept_name
HAVING   COUNT(E.emp_id) > (SELECT AVG(Total_Employee)
                            FROM   (SELECT   COUNT(emp_id) AS Total_Employee
                                    FROM     employees
                                    GROUP BY emp_dept) AS Emp_Count);

----------------------------------------------------------------
/* 
6.  From the following tables, write a SQL query to find all items whose price is less
	than the average price of items for the same company.
	Return item_id, item_name, price, and company_id.
*/
SELECT I1.item_id,
       I1.item_name,
       I1.price,
       I1.company_id
FROM   items AS I1
WHERE  I1.price < (SELECT AVG(I2.price) AS [Average Price]
                   FROM   items AS I2
                   WHERE  I1.company_id = I2.company_id);

----------------------------------------------------------------
/* 
7.  Write a SQL query to find departments that have only one employee assigned to them.
	Return dept_code, dept_name, and the count of employees.
*/
SELECT   D.dept_code,
         D.dept_name,
         COUNT(E.emp_id) AS Total_Employees
FROM     departments AS D
         INNER JOIN
         employees AS E
         ON E.emp_dept = D.dept_code
GROUP BY D.dept_code, D.dept_name
HAVING   COUNT(E.emp_id) = 1;

----------------------------------------------------------------
/* 
8.  From the following tables, write a SQL query to find companies whose average
	item price is equal to the minimum average price among all companies.
	Return company_name and average_price.
*/
SELECT   C.company_name,
         AVG(I.price) AS Average_Price
FROM     company AS C
         INNER JOIN
         items AS I
         ON I.company_id = c.company_id
GROUP BY C.company_name
HAVING   AVG(I.price) = (SELECT MIN(Average_Price)
                         FROM   (SELECT   AVG(price) AS Average_Price
                                 FROM     items
                                 GROUP BY company_id) AS AVG_Price);

----------------------------------------------------------------
/* 
9.  Write a SQL query to find employees whose department budget is less than the
	average department budget.
	Return emp_id, emp_fname, emp_lname, and dept_code.
*/
SELECT E.emp_id,
       E.emp_fname,
       E.emp_lname,
       D.dept_code
FROM   employees AS E
       INNER JOIN
       departments AS D
       ON D.dept_code = E.emp_dept
WHERE  D.dept_budget < (SELECT AVG(dept_budget)
                        FROM   departments);

----------------------------------------------------------------
----------------------------------------------------------------
/* 
1.  Create a CTE that calculates the average item price,
	then display all items whose price is greater than the average.
*/
WITH   AVG_items
AS     (SELECT AVG(price) AS Average_Price
        FROM   items)
SELECT *
FROM   items AS I CROSS JOIN AVG_items AS A
WHERE  I.price > A.Average_Price;

----------------------------------------------------------------
/* 
2.  Create a CTE that calculates the total number of items per company,
	then display company name and item count.
*/
WITH   Item_Count
AS     (SELECT   C.company_name,
                 COUNT(i.item_id) AS Total_items
        FROM     company AS C
                 INNER JOIN
                 items AS I
                 ON I.company_id = C.company_id
        GROUP BY C.company_name)
SELECT *
FROM   Item_Count;

----------------------------------------------------------------
/* 
3.  Using a CTE, calculate the average price per company,
	then display companies where the average price is greater than 2000.
*/
WITH   AVG_Price
AS     (SELECT   company_id,
                 AVG(price) AS AVG_P
        FROM     items
        GROUP BY company_id)
SELECT C.company_name,
       A.AVG_P
FROM   company AS C
       INNER JOIN
       AVG_Price AS A
       ON A.company_id = C.company_id
WHERE  A.AVG_P > 2000;

----------------------------------------------------------------
/* 
4.  Create a CTE that joins employees_new and departments_new
	to display employee full name and department name.
*/
WITH   NEW
AS     (SELECT CONCAT(E.emp_fname, ' ', E.emp_lname) AS Full_Name,
               D.dept_name
        FROM   employees AS E
               INNER JOIN
               departments AS D
               ON D.dept_code = E.emp_dept)
SELECT Full_Name,
       dept_name
FROM   NEW;

----------------------------------------------------------------
/* 
5.  Using a CTE, find departments where the department budget is greater than the average budget.
*/
WITH   AVG_Bud
AS     (SELECT AVG(dept_budget) AS AVG_Budget
        FROM   departments)
SELECT D.dept_code,
       D.dept_name,
       D.dept_budget
FROM   departments AS D CROSS JOIN AVG_Bud AS A
WHERE  D.dept_budget > A.AVG_Budget;

----------------------------------------------------------------
/* 
6.  Create a CTE that calculates the number of employees per department,
	then display departments that have more than one employee.
*/
WITH   Count_Emp
AS     (SELECT   D.dept_name,
                 COUNT(E.emp_id) AS Total_Employees
        FROM     departments AS D
                 INNER JOIN
                 employees AS E
                 ON E.emp_dept = D.dept_code
        GROUP BY D.dept_name)
SELECT *
FROM   Count_Emp
WHERE  Total_Employees > 1;

----------------------------------------------------------------
/* 
7.  Create a CTE that calculates the average item price across all companies,
	then display companies whose average item price is below the overall average.
*/
WITH   AVG_item
AS     (SELECT   company_id,
                 AVG(price) AS Average_Price
        FROM     items
        GROUP BY company_id),
       All_AVG
AS     (SELECT AVG(price) AS OverAll_AVG
        FROM   items)
SELECT C.company_name,
       A.Average_Price
FROM   company AS C
       INNER JOIN
       AVG_item AS A
       ON C.company_id = A.company_id CROSS JOIN All_AVG AS AG
WHERE  A.Average_Price < AG.OverAll_AVG;

