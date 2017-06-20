-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE trasladarEmpleado
	-- Add the parameters for the stored procedure here
	-- centralSalida es la central de donde se va
	-- centralEntrada es el nuevo lugar donde va a trabajar
	@centralSalida int,
	@centralEntrada int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE EmployeeTerritories SET TerritoryID = @centralSalida 
	WHERE TerritoryID = @centralEntrada
END
GO
