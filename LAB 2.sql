USE classicmodels;

/* a) Find the most expensive product */

SELECT * 
FROM products
 WHERE buyPrice=(
				SELECT MAX(buyPrice)
                FROM products
                );

/* b) Find the cheapest product */

SELECT * 
FROM products
WHERE buyPrice=(
				SELECT MIN(buyPrice)
                FROM products
                );

/* c) Count the Number of employees that work in the same city in descending order */

SELECT COUNT(O.city) AS "Number of Employee", O.city AS "City"
FROM offices AS O, employees as E
WHERE O.officeCode = E.officeCode
GROUP BY O.city
ORDER BY COUNT(O.city) DESC;

/* d) List the customer and sales representative that live in the same city order by city */

SELECT C.customerName 'Customer', E.firstName 'Sales Representative', C.city 'City'
FROM customers as C, employees AS E
WHERE C.salesRepEmployeeNumber = E.employeeNumber
ORDER BY C.city;

/* e) Find the customer that have credit limit more than average credit. */

SELECT *
FROM customers
WHERE creditLimit > (
					SELECT AVG(creditLimit)
                    FROM customers
                    );
                    
/* f) List of customer name serve by the sales representative as the following format. */

SELECT C.customerName 'Customer Name', C.phone 'Contact', E.firstName 'Sales Person Name', E.jobTitle 'Position'
FROM customers as C, employees AS E
WHERE C.salesRepEmployeeNumber = E.employeeNumber;

/* g) Count the number of customers served by each the sales representative in the company */

SELECT COUNT(E.firstName) 'Number of Employee', E.firstName 'Sales Person Name'
FROM customers as C, employees AS E
WHERE C.salesRepEmployeeNumber = E.employeeNumber
GROUP BY E.firstName;

/* h) In order to award the sales person, the company would like to know the sales person that serve more than 5
customers.  */

SELECT *
FROM employees AS E
WHERE 5 <
	(SELECT COUNT(*)
     FROM customers AS C
     WHERE C.salesRepEmployeeNumber = E.employeeNumber);
		
/* i) Choose any product code and find the total sale made in year 2004 */

SELECT OD.productCode, SUM(OD.quantityOrdered*OD.priceEach) 'Total Sales Made in 2004'
FROM orderdetails AS OD, orders AS O
WHERE YEAR(orderDate) = '2004'
GROUP BY OD.productCode;
		 
/* j) Find the monthly quantity order by each product according to the following format.
(hint : use function month(date), year date in SQL),  */

SELECT P.productName 'Product Name', OD.quantityOrdered 'Quantity Order', 
		MONTH(O.orderDate) 'Month Sale', YEAR(O.orderDate) 'Year Sale'
FROM products AS P
JOIN orderdetails AS OD
ON P.productCode = OD.productCode
JOIN orders AS O
ON O.orderNumber  = OD.orderNumber
GROUP BY P.productName;

/* k) Assuming attribute MSRP in products table is the sales price of each product. List the product that have profit
>50 */

SELECT productCode, productName, productLine, buyPrice, MSRP, SUM(MSRP-buyPrice) 'Profit'
FROM products
GROUP BY productCode, productName, productLine, buyPrice, MSRP
HAVING SUM(MSRP-buyPrice) >50;

/* l) Find the product that have order quantity more than 10 unit */

SELECT *
FROM products AS P
WHERE 10 < (SELECT COUNT(*)
			FROM orderdetails AS OD
            WHERE OD.productCode = P.productCode);

/* m) The management want to send the invoice with total amount (calculate based quantiy order x price) for each
order to customer as follows */

SELECT C.customerName 'Customer Name', O.orderNumber 'Order Number', SUM(OD.quantityOrdered*OD.priceEach) 'Total Amount'
FROM customers AS C
JOIN orders AS O
ON C.customerNumber = O.customerNumber
JOIN orderdetails AS OD
ON O.orderNumber  = OD.orderNumber
GROUP BY C.customerName, O.orderNumber;

/* n) Find the subtotal of quantity in stock for each product line according to product vendor */

SELECT productLine 'Product Line', productVendor 'Vendor', quantityInStock 'Stock'
FROM products
GROUP BY productLine, productVendor
ORDER BY productLine, productVendor;