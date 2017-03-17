/****** Object:  StoredProcedure [dbo].[SaveApplication]  Script Date: 7/6/2016 10:53:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveApplication]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SaveApplication]
GO
/****** Object:  StoredProcedure [dbo].[SaveApplication]    Script Date: 7/6/2016 10:53:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================================================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================================================================================
-- Author	    :  Debashish Nath
-- Create Date  :  24th June 2016
-- Description  :  This Procedure will Save Parent Link Information
-- ================================================================================================================================
CREATE PROCEDURE SaveApplication
	@Tag				CHAR(1),
	@ApplicationId		INT,
	@ApplicationName	VARCHAR(20)
AS
BEGIN
	IF(@Tag='I')
	BEGIN
		SELECT @ApplicationId=(SELECT ISNULL(MAX(ApplicationId),0) + 1 FROM M_Application)
		INSERT	INTO M_Application(ApplicationId,ApplicationName)
		VALUES	(@ApplicationId,@ApplicationName)
	END
	IF(@Tag='U')
	BEGIN
		UPDATE	M_Application
		SET		ApplicationName		=@ApplicationName
		WHERE	ApplicationId		=@ApplicationId
	END
	IF(@Tag='D')
	BEGIN
		DELETE FROM M_Application 
		WHERE ApplicationId=@ApplicationId
	END
END
GO
