/****** Object:  StoredProcedure [dbo].[SaveDocumentType]  Script Date: 7/4/2016 10:53:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveDocumentType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SaveDocumentType]
GO
/****** Object:  StoredProcedure [dbo].[SaveDocumentType]    Script Date: 7/4/2016 10:53:09 PM ******/
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
-- Description  :  This Procedure will Save Document Type Information
-- ================================================================================================================================
CREATE PROCEDURE SaveDocumentType
	@Tag				CHAR(1),
	@DocumentTypeId		UNIQUEIDENTIFIER,
	@ApplicationId		INT,
	@DocumentTypeName	VARCHAR(25),
	@UserId				UNIQUEIDENTIFIER
AS
BEGIN
	IF(@Tag='I')
	BEGIN
		SELECT @DocumentTypeId=(SELECT NEWID())
		INSERT	INTO M_DocumentType(DocumentTypeId,ApplicationId,DocumentTypeName,CreatedById,CreatedByDate)
		VALUES	(@DocumentTypeId,@ApplicationId,@DocumentTypeName,@UserId,GETDATE())
	END
	IF(@Tag='U')
	BEGIN
		UPDATE	M_DocumentType
		SET		ApplicationId		=@ApplicationId,
				DocumentTypeName	=@DocumentTypeName,
				ModifiedById		=@UserId,
				ModifiedByDate		=GETDATE()
		WHERE	DocumentTypeId		=@DocumentTypeId
	END
	IF(@Tag='D')
	BEGIN
		DELETE FROM M_DocumentType 
		WHERE DocumentTypeId=@DocumentTypeId
	END
END
GO
