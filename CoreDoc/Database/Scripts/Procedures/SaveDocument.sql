/****** Object:  StoredProcedure [dbo].[SaveDocument]  Script Date: 6/24/2016 10:53:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveDocument]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SaveDocument]
GO
/****** Object:  StoredProcedure [dbo].[SaveDocument]    Script Date: 6/24/2016 10:53:09 PM ******/
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
-- Description  :  This Procedure will Document User Information
-- ================================================================================================================================
CREATE PROCEDURE SaveDocument
	@DocumentId				UNIQUEIDENTIFIER,	
	@DocumentTypeId			UNIQUEIDENTIFIER,	
	@ParentLinkId			UNIQUEIDENTIFIER,	
	@ChildLinkId			UNIQUEIDENTIFIER,	
	@Tab					VARCHAR(25),	
	@Section				VARCHAR(25),	
	@Operation				VARCHAR(25),	
	@ViewModel				VARCHAR(25),
	@XAMLFileName			VARCHAR(25),	
	@CommandName			VARCHAR(25),	
	@PropertyName			VARCHAR(25),	
	@PropertyDescription	VARCHAR(25),	
	@ServiceFileName		VARCHAR(25),	
	@ServiceMethodName		VARCHAR(25),	
	@ProcedureName			VARCHAR(25),
	@Comments				VARCHAR(2000),
	@DocumentStatus			CHAR(1)	,
	@UserId					UNIQUEIDENTIFIER
	
AS
BEGIN
	IF(@DocumentStatus='I')
	BEGIN
		SELECT @DocumentId=(SELECT NEWID())
		INSERT INTO T_Document(DocumentId,DocumentTypeId,ParentLinkId,ChildLinkId,Tab,Section,Operation,ViewModel,XAMLFileName,CommandName,PropertyName,	
							PropertyDescription,ServiceFileName,ServiceMethodName,ProcedureName,Comments,DocumentStatus,CreatedById,CreatedByDate)
		VALUES(@DocumentId,@DocumentTypeId,@ParentLinkId,@ChildLinkId,@Tab,@Section,@Operation,@ViewModel,@XAMLFileName,@CommandName,@PropertyName,	
							@PropertyDescription,@ServiceFileName,@ServiceMethodName,@ProcedureName,@Comments,@DocumentStatus,@UserId,GETDATE())
	END
	IF(@DocumentStatus='U')
	BEGIN
		UPDATE	T_Document
		SET		DocumentTypeId		=@DocumentTypeId,
				ParentLinkId		=@ParentLinkId,
				ChildLinkId			=@ChildLinkId,
				Tab					=@Tab,
				Section				=@Section,
				Operation			=@Operation,
				ViewModel			=@ViewModel,
				XAMLFileName		=@XAMLFileName,
				CommandName			=@CommandName,
				PropertyName		=@PropertyName,	
				PropertyDescription	=@PropertyDescription,
				ServiceFileName		=@ServiceFileName,
				ServiceMethodName	=@ServiceMethodName,
				ProcedureName		=@ProcedureName,
				Comments			=@Comments,
				DocumentStatus		=@DocumentStatus,
				CreatedById			=@UserId,
				CreatedByDate		=GETDATE()
		WHERE	DocumentId			=@DocumentId
	END
	IF(@DocumentStatus='D')
	BEGIN
		UPDATE	T_Document
		SET		DocumentStatus		=@DocumentStatus,
				CreatedById			=@UserId,
				CreatedByDate		=GETDATE()
		WHERE	DocumentId			=@DocumentId
	END
END
GO
