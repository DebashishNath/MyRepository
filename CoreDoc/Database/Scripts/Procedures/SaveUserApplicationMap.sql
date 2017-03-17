/****** Object:  StoredProcedure [dbo].[SaveUserApplicationMap]  Script Date: 6/24/2016 10:53:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveUserApplicationMap]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SaveUserApplicationMap]
GO
/****** Object:  StoredProcedure [dbo].[SaveUserApplicationMap]    Script Date: 6/24/2016 10:53:09 PM ******/
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
-- Create Date  :  4th July 2016
-- Description  :  This Procedure will Save User Application Information
-- ================================================================================================================================
CREATE PROCEDURE SaveUserApplicationMap
	@UserId			UNIQUEIDENTIFIER,
	@ApplicationId	INT,
	@Status			CHAR(1)
AS
BEGIN
	IF(@Status='I')
	BEGIN
		SELECT @UserId=(SELECT NEWID())
		INSERT INTO T_User_Application_Map (UserId,ApplicationId,Status)
		VALUES(@UserId,@ApplicationId,@Status)
	END
	IF(@Status='U' OR @Status='D')
	BEGIN
		UPDATE	T_User_Application_Map
		SET		Status			=@Status
		WHERE	UserId=@UserId AND ApplicationId=@ApplicationId
	END
END
GO
