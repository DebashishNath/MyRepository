/****** Object:  StoredProcedure [dbo].[SaveChildLink]  Script Date: 7/4/2016 10:53:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveChildLink]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SaveChildLink]
GO
/****** Object:  StoredProcedure [dbo].[SaveChildLink] Script Date: 7/4/2016 10:53:09 PM ******/
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
-- Description  :  This Procedure will Save Child Link Information
-- ================================================================================================================================
CREATE PROCEDURE SaveChildLink
	@Tag				CHAR(1),
	@ChildLinkId		UNIQUEIDENTIFIER,
	@ParentLinkId		UNIQUEIDENTIFIER,
	@ChildLinkName		VARCHAR(50),
	@UserId				UNIQUEIDENTIFIER
AS
BEGIN
	IF(@Tag='I')
	BEGIN
		SELECT @ChildLinkId=(SELECT NEWID())
		INSERT	INTO M_ChildLink(ChildLinkId,ParentLinkId,ChildLinkName,CreatedById,CreatedByDate)
		VALUES	(@ChildLinkId,@ParentLinkId,@ChildLinkName,@UserId,GETDATE())
	END
	IF(@Tag='U')
	BEGIN
		UPDATE	M_ChildLink
		SET		ChildLinkName		=@ChildLinkName,
				ModifiedById		=@UserId,
				ModifiedByDate		=GETDATE()
		WHERE	ChildLinkId			=@ChildLinkId
	END
	IF(@Tag='D')
	BEGIN
		DELETE	FROM M_ChildLink 
		WHERE	ChildLinkId	=@ChildLinkId
	END
END
GO
