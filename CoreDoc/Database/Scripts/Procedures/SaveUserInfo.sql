/****** Object:  StoredProcedure [dbo].[SaveUserInfo]  Script Date: 6/24/2016 10:53:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveUserInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SaveUserInfo]
GO
/****** Object:  StoredProcedure [dbo].[SaveUserInfo]    Script Date: 6/24/2016 10:53:09 PM ******/
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
-- Description  :  This Procedure will Save User Information
-- ================================================================================================================================
CREATE PROCEDURE SaveUserInfo
	@Tag			CHAR(1),
	@UserId			UNIQUEIDENTIFIER,
	@UserName		VARCHAR(20),
	@UserFullName	VARCHAR(50),
	@UserPassword	nvarchar(128)
AS
BEGIN
	IF(@Tag='I')
	BEGIN
		SELECT	@UserId=(SELECT NEWID())
		INSERT	INTO M_USER (UserId,UserName,UserFullName,UserPassword)
		VALUES	(@UserId,@UserName,@UserFullName,@UserPassword)
	END
	IF(@Tag='U')
	BEGIN
		UPDATE	M_USER
		SET		UserName		=@UserName,
				UserFullName	=@UserFullName,
				UserPassword	=@UserPassword
		WHERE	UserId			=@UserId
	END
END
GO
