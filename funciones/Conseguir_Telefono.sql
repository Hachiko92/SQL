USE [NORTHWND]
GO
/****** Object:  UserDefinedFunction [dbo].[Conseguir_Telefono]    Script Date: 20/06/2017 16:34:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
ALTER FUNCTION [dbo].[Conseguir_Telefono]
(
	-- Add the parameters for the function here
	@EmployeeId int
)
RETURNS nvarchar(15)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @telefono nvarchar(15)

	-- Add the T-SQL statements to compute the return value here
	SELECT @telefono = HomePhone
	FROM Employees
	WHERE EmployeeID = @EmployeeId

	-- Return the result of the function
	RETURN @telefono

END
