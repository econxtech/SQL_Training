drop table if exists MedalOfHonor
create table dbo.MedalOfHonor 
(Id int identity (1,1) primary key,MilRank varchar (50),SoldierName varchar (50),YearOfAction varchar(4))
insert into dbo.MedalOfHonor 
(MilRank, SoldierName, YearOfAction)
values('Staff Sergeant','Ty Carter', '2009'),
	('Captain', 'Florent Groberg', '2012'), 
	('Major', 'William D. Swenson', '2009'), 
	('Corporal', 'Frank L. Anders', '1899'), 
	('First Lieutenant', 'George C. Shaw', '1903')
--Questions--
/**Assign a pay grade as follows if the Mil Rank is a Sergent,show as Level 6,
if the Mil Rank is a Captain,show as Level 3,if the Mil Rank is a Major,
show as Level 4,if the Mil Rank is a Corporal,show as Level 2,if the Mil Rank is a Lueitenant,
show as Level 1,Make sure to show no rank for non of the conditions 
AboveShow a new column as Grade Scale**/

SELECT 
    MilRank, 
    SoldierName, 
    YearOfAction,
    CASE 
        WHEN MilRank LIKE '%Sergeant%' THEN 'Level 6'
        WHEN MilRank = 'Captain' THEN 'Level 3'
        WHEN MilRank = 'Major' THEN 'Level 4'
        WHEN MilRank = 'Corporal' THEN 'Level 2'
        WHEN MilRank LIKE '%Lieutenant%' THEN 'Level 1'
        ELSE 'no rank'
    END AS GradeScale
FROM dbo.MedalOfHonor;

DROP TABLE IF EXISTS AfricaTemperature;
CREATE TABLE AfricaTemperature(    [RecordedDate] DATE NOT NULL,    [DegreeInFahrenheit] DECIMAL(4, 2) NULL);
INSERT INTO AfricaTemperature(    [RecordedDate],    [DegreeInFahrenheit])VALUES('01-01-2023', '32.60'),('01-02-2023', '31.20'),('01-03-2023', '42.00'),('01-04-2023', '44.60'),('01-05-2023', '39.40'),('01-06-2023', '31.70'),('01-07-2023', NULL),('01-08-2023', '21.20'),('01-09-2023', '19.15'),('01-10-2023', '07.90');

/**Business requirements:
DegreeInFahrenheit is more than 40.00' , show as HotIf DegreeInFahrenheit is below 32:00, 
show as 'It''s too cold outside!' If DegreeInFahrenheit is not available, 
show as 'Why didn''t you record this?'  Otherwise, shows as Sounds about right'   
Show the result in a new column Weather **/

SELECT 
    [RecordedDate], 
    [DegreeInFahrenheit],
    CASE 
        WHEN [DegreeInFahrenheit] IS NULL THEN 'Why didn''t you record this?'
        WHEN [DegreeInFahrenheit] > 40.00 THEN 'Hot'
        WHEN [DegreeInFahrenheit] < 32.00 THEN 'It''s too cold outside!'
        ELSE 'Sounds about right'
    END AS Weather
FROM AfricaTemperature;

--show the highest year of action 
-- The lowest year of action

SELECT 
    MAX(YearOfAction) AS HighestYear,
    MIN(YearOfAction) AS LowestYear
FROM dbo.MedalOfHonor;

-- Produce a report to show the unique weather count

WITH WeatherReport AS (
    SELECT 
        CASE 
            WHEN [DegreeInFahrenheit] IS NULL THEN 'Why didn''t you record this?'
            WHEN [DegreeInFahrenheit] > 40.00 THEN 'Hot'
            WHEN [DegreeInFahrenheit] < 32.00 THEN 'It''s too cold outside!'
            ELSE 'Sounds about right'
        END AS Weather
    FROM AfricaTemperature
)
SELECT 
    Weather, 
    COUNT(*) AS Occurrences
FROM WeatherReport
GROUP BY Weather;

--Another Approach
   
		  select 
		  Weather = case
		   when DegreeInFahrenheit > 40.00 then 'Hot'
		   when DegreeInFahrenheit < 32.00 then 'It''s too cold outside!'
		   when DegreeInFahrenheit is NULL then 'Why didn''t you record this?'
		   else 'Sounds about right'
		   end,
		   WeatherCount = Count(case
		   when DegreeInFahrenheit > 40.00 then 'Hot'
		   when DegreeInFahrenheit < 32.00 then 'It''s too cold outside!'
		   when DegreeInFahrenheit is NULL then 'Why didn''t you record this?'
		   else 'Sounds about right'
		   end)
		   from AfricaTemperature
		   group by case
		   when DegreeInFahrenheit > 40.00 then 'Hot'
		   when DegreeInFahrenheit < 32.00 then 'It''s too cold outside!'
		   when DegreeInFahrenheit is NULL then 'Why didn''t you record this?'
		   else 'Sounds about right'
		   end

select Weather,
  count(*) WeatherCount
  from 
  (
		  select *,
		  case
		   when DegreeInFahrenheit > 40.00 then 'Hot'
		   when DegreeInFahrenheit < 32.00 then 'It''s too cold outside!'
		   when DegreeInFahrenheit is NULL then 'Why didn''t you record this?'
		   else 'Sounds about right'
		   end as Weather
		   from AfricaTemperature
   ) X
   group by Weather


USE EMADEDEV
DROP TABLE IF EXISTS BEST_BUY_CUSTOMERS
--1:Creating a BEST_BUY CUSTOMERS  table
CREATE TABLE BEST_BUY_CUSTOMERS
( 
  CUSTOMER_ID INT NOT NULL,
 FIRST_NAME VARCHAR(50) NULL,
 LAST_NAME VARCHAR(50) NULL,
 AGE INT NOT NULL,
COUNTRY VARCHAR(50) NULL
);
--2:LOAD DATA TO THE BEST_BUY_CUSTOMERS TABLE
INSERT INTO BEST_BUY_CUSTOMERS
(CUSTOMER_ID, FIRST_NAME, LAST_NAME, AGE, COUNTRY)
VALUES (1, 'John', 'Doe', 31, 'USA'),
(2, 'Robert', 'Luna', 22, 'USA'),
(3, 'David', 'Robinson', 22, 'UK'),
(4, 'John', 'Reinhardt', 25, 'UK'),
(5, 'Betty', 'Doe', 28, 'UAE')


--2:Creating an ORDER table
DROP TABLE IF EXISTS BEST_BUY_ORDERS
CREATE TABLE BEST_BUY_ORDERS
(
   ORDER_ID INT NOT NULL,
   ITEM VARCHAR(50) NULL,
   AMOUNT MONEY,
   CUSTOMER_ID INT NOT NULL
);
--2:LOAD DATA TO THE ( 1, 'Keyboard', 400,4), TABLE
INSERT INTO BEST_BUY_ORDERS
(ORDER_ID, ITEM, AMOUNT, CUSTOMER_ID)
VALUES 
( 1, 'Keyboard', 400,4),
( 2, 'Mouse', 300,4),
( 3, 'Monitor', 12000,3),
( 4, 'Keyboard', 400,1),
( 5, 'Mousepad', 250,2)
--2:Creating a BEST_BUY_PRODUCTS table
DROP TABLE IF EXISTS BEST_BUY_PRODUCTS
CREATE TABLE BEST_BUY_PRODUCTS
(
   PRODUCT_ID INT NOT NULL,
   PRODUCT_NAME VARCHAR(50) NULL,
   AMOUNT MONEY,
   CUSTOMER_ID INT NOT NULL
);

--2:LOAD DATA TO THE ( 1, 'Keyboard', 400,4), TABLE
INSERT INTO BEST_BUY_PRODUCTS
(PRODUCT_ID, PRODUCT_NAME, AMOUNT, CUSTOMER_ID)
VALUES 
( 1, 'Keyboard', 400,5),
( 2, 'Headphone', 300,4),
( 3, 'Laptop', 12000,3),
( 4, 'Pen', 400,1),
( 5, 'Mousepad', 250,2)


Joins:
1: Inner Join = used to retrieve rows where matching values exist in both tables

2: Left Join = retrieve all rows from the left table and matching rows from the right table

3: Right Join = retrieve all rows from the right table and matching rows from the left table

4: Full Join = combine the results of both LEFT JOIN and RIGHT JOIN


--1:Write a query that shows customer who bought item Mouse
Select
C.CUSTOMER_ID, C.FIRST_NAME, C.FIRST_NAME
From [dbo].[BEST_BUY_CUSTOMERS] AS C
JOIN
BES

Select 
C.CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME, C.AGE,C.COUNTRY, O.ITEM
From BEST_BUY_CUSTOMERS C
Join
BEST_BUY_ORDERS O
On C.CUSTOMER_ID = O.CUSTOMER_ID
Where O.ITEM = 'Mouse'

--2:SHOW ME THE CUSTOMER INFO AND THE ITEM THAT THEY ORDER, THE PRODUCT BUT ONLY SHOW THE PRODUCT FOR PEN

select 
A.CUSTOMER_ID,
A.FIRST_NAME,
A.LAST_NAME,
A.AGE,
A.COUNTRY,
B.ORDER_ID,
B.ITEM,
B.AMOUNT,
C.PRODUCT_ID,
C.PRODUCT_NAME
FROM BEST_BUY_CUSTOMERS A
LEFT JOIN BEST_BUY_ORDERS B
ON A.CUSTOMER_ID = B.CUSTOMER_ID
LEFT JOIN BEST_BUY_PRODUCTS C
ON A.CUSTOMER_ID = C.CUSTOMER_ID
WHERE C.PRODUCT_NAME= 'PEN'


Assignment for Joins:
Introduction of SQL JOINS. In the world of relational databases… | by Techie-stronaut | Medium

/**********
EFFICIENTLY MANAGING SLOWLY CHANGING DIMENSIONS TYPE 2 (SCD TYPE 2) USING SQL INSERT-MERGE IN MICROSOFT SQL SERVER
SLOWLY CHANGING DIMENSIONS (SCD) ARE ESSENTIAL IN DATA WAREHOUSING FOR TRACKING CHANGES IN DIMENSION DATA OVER TIME. SCD TYPE 2 MAINTAINS HISTORICAL DATA BY CREATING NEW RECORDS FOR EACH CHANGE, ENSURING THAT NO HISTORICAL DATA IS LOST. IN THIS POST, WE WILL DEMONSTRATE HOW TO EFFICIENTLY IMPLEMENT SCD TYPE 2 USING THE MERGE STATEMENT IN SQL.
UNDERSTANDING SCD TYPE 2
SCD TYPE 2 PRESERVES THE HISTORY OF CHANGES BY ADDING NEW RECORDS RATHER THAN UPDATING EXISTING ONES. EACH RECORD INCLUDES:
  SURROGATE KEY: A UNIQUE IDENTIFIER FOR EACH RECORD.
  NATURAL KEY: THE BUSINESS KEY THAT UNIQUELY IDENTIFIES THE DIMENSION.
  EFFECTIVE DATE AND END DATE: THE PERIOD DURING WHICH THE RECORD IS ACTIVE.
  CURRENT FLAG: INDICATES IF THE RECORD IS THE CURRENT VERSION.
  *************/
--FACT TABLE:THE ACTUAL TABLE. , DIMENSION TABLE: DISPLAYS MEASUREMENT LIKE TOTAL RECORDS BY YEAR. STAR SCHEMA, SNOWFLAKES SCHEMA
  --UPSERT: MEANS 


----SCD type

USE EMADE_DEV
DROP TABLE  IF EXISTS EMADE_SCD_EMPLOYEE
CREATE TABLE EMADE_SCD_EMPLOYEE (
    ID INT NOT NULL,
    NAME VARCHAR(100),
    SALARY DECIMAL(10, 2),
    START_DATE DATE,
    END_DATE DATE,
    IS_ACTIVE CHAR(1))

	INSERT INTO EMADE_SCD_EMPLOYEE (ID, NAME, SALARY, START_DATE, END_DATE, IS_ACTIVE)
VALUES 
    (1, 'JOHN DOE', 50000, '2024-01-01', NULL, 'Y'),
    (2, 'JANE SMITH', 60000, '2024-02-01', NULL, 'Y')

	DROP TABLE  IF EXISTS STG_EMADE_SCD_EMPLOYEE
	CREATE TABLE STG_EMADE_SCD_EMPLOYEE (
    ID INT NOT NULL,
    NAME VARCHAR(100),
    SALARY DECIMAL(10, 2),
    START_DATE DATE)

	INSERT INTO STG_EMADE_SCD_EMPLOYEE (ID, NAME, SALARY, START_DATE)
VALUES 
    (1, 'JOHN DOE', 55000, '2024-05-01'), -- UPDATED RECORD
    (3, 'ALICE JOHNSON', 70000, '2024-05-01'); -- NEW RECORD


DROP TABLE  IF EXISTS EMADE_SCD_EMPLOYEE
CREATE TABLE EMADE_SCD_EMPLOYEE (
    ID INT NOT NULL,
    NAME VARCHAR(100),
    SALARY DECIMAL(10, 2),
    START_DATE DATE,
    END_DATE DATE,
    IS_ACTIVE CHAR(1))

	INSERT INTO EMADE_SCD_EMPLOYEE (ID, NAME, SALARY, START_DATE, END_DATE, IS_ACTIVE)
VALUES 
    (1, 'JOHN DOE', 50000, '2024-01-01', NULL, 'Y'),
    (2, 'JANE SMITH', 60000, '2024-02-01', NULL, 'Y')

	DROP TABLE  IF EXISTS STG_EMADE_SCD_EMPLOYEE
	CREATE TABLE STG_EMADE_SCD_EMPLOYEE (
    ID INT NOT NULL,
    NAME VARCHAR(100),
    SALARY DECIMAL(10, 2),
    START_DATE DATE)

	INSERT INTO STG_EMADE_SCD_EMPLOYEE (ID, NAME, SALARY, START_DATE)
VALUES 
    (1, 'JOHN DOE', 55000, '2024-05-01'), -- UPDATED RECORD
    (3, 'ALICE JOHNSON', 70000, '2024-05-01'); -- NEW RECORD

--PERFORMING MERGE OPERATIONS
	INSERT INTO EMADE_SCD_EMPLOYEE (ID, NAME, SALARY, START_DATE, END_DATE, IS_ACTIVE)
SELECT ID, NAME, SALARY, START_DATE, END_DATE, IS_ACTIVE 
FROM (
    MERGE INTO EMADE_SCD_EMPLOYEE AS TARGET
    USING STG_EMADE_SCD_EMPLOYEE AS SOURCE
    ON TARGET.ID = SOURCE.ID AND TARGET.IS_ACTIVE = 'Y'
    WHEN MATCHED THEN
        UPDATE SET 
            TARGET.IS_ACTIVE = 'N',
           -- TARGET.END_DATE = GETDATE()
		    TARGET.END_DATE = DATEADD(day,-1,SOURCE.START_DATE) -- TO SHOW PROPER END DATE OF OLD RECORD
    WHEN NOT MATCHED THEN
        INSERT (ID, NAME, SALARY, START_DATE, END_DATE, IS_ACTIVE)
        VALUES (SOURCE.ID, SOURCE.NAME, SOURCE.SALARY, SOURCE.START_DATE, NULL, 'Y')
    OUTPUT $ACTION,
        SOURCE.ID,
        SOURCE.NAME,
        SOURCE.SALARY,
        SOURCE.START_DATE,
        NULL,
        'Y'
) AS [CHANGES] (ACTION, ID, NAME, SALARY, START_DATE, END_DATE, IS_ACTIVE)
WHERE ACTION = 'UPDATE';

    --FACT TABLE:THE ACTUAL TABLE. , DIMENSION TABLE: DISPLAYS MEASUREMENT LIKE TOTAL RECORDS BY YEAR. STAR SCHEMA, SNOWFLAKES SCHEMA
  --UPSERT: MEANS INSERT AND UPDATE