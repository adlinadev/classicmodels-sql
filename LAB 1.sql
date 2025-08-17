/*  LAB SQL 1 ASSIGNMENT
	STUDENT NAME: ADLINA KAMALULAIL
	MATRIC NO: MCS221015 */

CREATE DATABASE lab1;

USE lab1;

CREATE TABLE car (
	cartype VARCHAR(10) NOT NULL,
    carprice DECIMAL(5,1) NOT NULL,
    carfuel NUMERIC(5) NOT NULL,
    drivetrain VARCHAR(10) NOT NULL,
    carpassenger NUMERIC(5) NOT NULL,
    carweight NUMERIC(5) NOT NULL
    );
    
SELECT *
FROM car;

/*_________________________________________________________________________________________________*/

/* QUESTION 1 */
/* List price and weight for all midsize car typed */

SELECT carprice, carweight, cartype
FROM car
WHERE cartype = "midsize";

/*_________________________________________________________________________________________________*/

/* QUESTION 2 */
/* List the first ten record in the table in descending order according to mpg_city */

SELECT  *
FROM car
ORDER BY carfuel DESC LIMIT 10;

/*_________________________________________________________________________________________________*/

/* QUESTION 3 */
/* Find car that have weight > 2500 and sort the output according to weight in descending order */

SELECT cartype, carweight
FROM car
WHERE carweight > 2500
ORDER BY carweight DESC;

/*_________________________________________________________________________________________________*/

/* QUESTION 4 */
/* List all car in small car category that have number of seat 5 and above */

SELECT *
FROM car
WHERE cartype = "small" AND
	  carpassenger >= 5;

/*_________________________________________________________________________________________________*/

/* QUESTION 5 */
/* List of all car in large category with front drive_train */

SELECT *
FROM car
WHERE cartype = "large" AND
	  drivetrain = "front";

/*_________________________________________________________________________________________________*/

/* QUESTION 6 */
/* Find number of car in the large category */

SELECT COUNT(*) 
FROM car
WHERE cartype = "large";

/*_________________________________________________________________________________________________*/

/* QUESTION 7 */
/* Find the average price for small size car */

SELECT AVG(carprice) 'Average Price'
FROM car
WHERE cartype = "small";

/*_________________________________________________________________________________________________*/

/* QUESTION 8 */
/* Find the midsize car with rear drive train that have less than 20 mpg_city */

SELECT *
FROM car
WHERE	cartype = "midsize" AND
		drivetrain = "rear" AND
        carfuel < 20;
        
/*_________________________________________________________________________________________________*/

/* QUESTION 9 */
/* List all car that having price between 25 to 35 (thousand)  */

SELECT *
FROM car
WHERE carprice BETWEEN 25 AND 35;

/*_________________________________________________________________________________________________*/

/* QUESTION 10 */
/* What is the maximum fuel consumption of small car category  */

SELECT MAX(carfuel) AS "Maximum Fuel Consumption for Small Car"
FROM car
WHERE cartype = "small";

