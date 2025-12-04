--Lesson 3
-- Data Flow Process
-- Operators - are or, and, between, like, Not In, In
-- Equality sign - are < , > , <= , >= , !

use EmadeDev

Select *
From Noble

/**

Write a logic that shows winners from 1960 - 1962 as 'GOOD'
Winners from 1963 - 1966 as 'BETTER'
Winners  beyond 1966 as 'BEST'
Show the result as 'CATEGORY'

**/

Select
[Year] ,
[Subject] ,
[Winner] ,
Case
	When [Year] Between 1960 and 1962 Then 'Good'
	When [Year] > 1962 and [Year] <= 1966  Then 'Better'
	When [Year] > 1966 Then 'Best'
	End As Category
	From Noble

-- Another approach
Select
[Year] ,
[Subject] ,
[Winner] ,
Case
	When [Year] in ( 1960, 1961, 1962) Then 'Good'
	When [Year] Not in (1960, 1961, 1962,1967,1968, 1969) Then 'Better'
	Else 'Best'
	End As Category
	From Noble


-- Another approach
Select
[Year] ,
[Subject] ,
[Winner] ,
Case
	When [Year] < 1963 Then 'Good'
	When [Year] >= 1963 and [Year] <= 1966 Then 'Better'
	Else 'Best'
	End As Category
	From Noble

-- Create a view vwWinnerCategory
Create View vwWinnerCategory As
Select
[Year] ,
[Subject] ,
[Winner] ,
Case
	When [Year] < 1963 Then 'Good'
	When [Year] >= 1963 and [Year] <= 1966 Then 'Better'
	Else 'Best'
	End As Category
	From Noble

-- Check the view
Select *
From vwWinnerCategory
Where Category = 'Best'