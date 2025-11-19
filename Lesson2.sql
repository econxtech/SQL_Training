-- Lesson 2
use EmadeDev

/**
Developer : Kolapo 
Date : 11-11-2025

**/


-- How to remove a table from a database
Drop Table if exists Noble

--How to create a table
Create Table Noble
(
[Year] int Not Null,
[Subject] varchar (50) Null,
[Winner] varchar (50) Null
)

--Checking data from the data
Select * 
From Noble

--How to load data to a table
Insert into Noble
(
[Year],
[Subject],
[Winner]
)
Values
(1960,'Chemistry', 'Bob'),
(1961,'Physics', 'Jude'),
(1962,'Geography', 'Jason'),
(1963,'Economics', 'Stella'),
(1964,'Mathematics', 'Joe'),
(1965,'English', 'Diana'),
(1966,'Biology', 'Trump'),
(1967,'Medicine', 'Biden'),
(1968,'Commerce', 'Charles'),
(1969,'Literature', 'Ben')

Select *
From Noble

--Crud (Create, Read(Select), Update, Delete)

--How to update a record in a table
Update Noble
Set [Subject] ='Law'
Where Winner = 'Trump'

--How to delete records in a table
Delete 
From Noble
Where Winner = 'Trump'
