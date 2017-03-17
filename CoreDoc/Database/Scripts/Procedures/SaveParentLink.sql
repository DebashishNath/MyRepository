/****** Object:  StoredProcedure [dbo].[SaveParentLink]  Script Date: 7/4/2016 10:53:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveParentLink]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SaveParentLink]
GO
/****** Object:  StoredProcedure [dbo].[SaveParentLink]    Script Date: 7/4/2016 10:53:09 PM ******/
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
CREATE PROCEDURE SaveParentLink
	@Tag				CHAR(1),
	@ParentLinkId		UNIQUEIDENTIFIER,
	@ParentLinkName		VARCHAR(50),
	@UserId				UNIQUEIDENTIFIER
AS
BEGIN
	IF(@Tag='I')
	BEGIN
		SELECT @ParentLinkId=(SELECT NEWID())
		INSERT	INTO M_ParentLink(ParentLinkId,ParentLinkName,CreatedById,CreatedByDate)
		VALUES	(@ParentLinkId,@ParentLinkName,@UserId,GETDATE())
	END
	IF(@Tag='U')
	BEGIN
		UPDATE	M_ParentLink
		SET		ParentLinkName		=@ParentLinkName,
				ModifiedById		=@UserId,
				ModifiedByDate		=GETDATE()
		WHERE	ParentLinkId		=@ParentLinkId
	END
	IF(@Tag='D')
	BEGIN
		DELETE FROM M_ParentLink 
		WHERE ParentLinkId=@ParentLinkId
	END
END
GO
