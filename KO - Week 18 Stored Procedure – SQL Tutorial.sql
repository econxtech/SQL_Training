USE [EmadeDev]
GO

/****** Object:  StoredProcedure [dbo].[spLoansAmount]    Script Date: 18/02/2026 04:29:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create   Procedure [dbo].[spLoansAmount]

@AccNo int null, 
@Installments int
As 
Begin
Select * 
From [dbo].[LoansAccounts]
Where AccNo = @AccNo
And Installments = @Installments 
End
GO

Select upper (ENCOUNTERCLASS) as TOMJERRY, ENCOUNTERCLASS, e.* 
From [dbo].[encounters] e
WHERE ENCOUNTERCLASS IN ('Ambulatory' , 'Emergency')




