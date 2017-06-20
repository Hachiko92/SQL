-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION registrosOrdenes  
(
	-- Add the parameters for the function here
	@EmployeeId int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @nRegistros int

	-- Add the T-SQL statements to compute the return value here
	SELECT @nRegistros = COUNT(*)
	FROM Orders
	WHERE EmployeeID = @EmployeeID

	-- Return the result of the function
	RETURN @nRegistros

END
GO

-- dado un EmployeeId return devolver numero de registro que tiene orders 
