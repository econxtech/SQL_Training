--How to create a Database

/**
Developer : Kolapo 
Date : 11-04-2025

**/

Create Database EmadeDev

--Create another Database and call it EmadeTest and EmadeProd

Create Database EmadeTest

Create Database EmadeProd

--How to remove a Database

Drop Database EmadeTest

--How to access a Database

use EmadeDev

--How to create a table that you can use inside a database

--Check data in a table
Select *
From Customer

--Show Customer in USA
Select *
From Customer
Where Country ='USA'

--Show CustomerID 1 3 5
Select *
From Customer
Where CustomerID In (1,3,5)

--Show how many Customer we have in the table
Select Count (*) As TotalCustomer
From Customer

--Show the highest ID we have in the table
Select MAX (CustomerID) As HighestCustomerID
From Customer

--Show the lowest ID we have in the table
Select MIN (CustomerID) As LowestCustomerID
From Customer




--PRACTICE
--Show the genders that = male
SELECT *
FROM Customer
WHERE Gender = 'Male';

--Show FirstName = Jerry
SELECT *
FROM Customer
WHERE FirstName = 'Jerry';

--Show records of people = single
SELECT *
FROM Customer
WHERE MaritalStatus = 'Single';

