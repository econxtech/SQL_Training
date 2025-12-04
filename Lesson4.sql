--Lesson 4
-- Pivot

use EmadeDev

Select *
From Customer

-- Pivot - Transpose row to Column
Select * 
From
(
Select [CustomerID], [FirstName], [LastName], [Gender], [MaritalStatus], [Country]
From Customer
) Source
Pivot ( Count (Gender)
For Gender in ([Male] , [Female])
) As Target

