/****** Object:  StoredProcedure [dbo].[GetDocumentData]  Script Date: 7/6/2016 10:53:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDocumentData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetDocumentData]
GO
/****** Object:  StoredProcedure [dbo].[GetDocumentData]    Script Date: 7/6/2016 10:53:09 PM ******/
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
-- Create Date  :  6th July 2016
-- Description  :  This Procedure will Retrieve Document Information
-- ================================================================================================================================
CREATE PROCEDURE GetDocumentData 
	@DocumentId UNIQUEIDENTIFIER
AS
BEGIN
	
	SET NOCOUNT ON;

	IF (@DocumentId IS NULL)
	BEGIN
		SELECT	TDOC.DocumentId,TDOC.DocumentTypeId,MDT.DocumentTypeName,TDOC.ParentLinkId,MPL.ParentLinkName,TDOC.ChildLinkId,MCL.ChildLinkName, TDOC.Tab, TDOC.Section, 
				TDOC.Operation, TDOC.ViewModel, TDOC.XAMLFileName, TDOC.CommandName, TDOC.PropertyName, TDOC.PropertyDescription,TDOC.ServiceFileName, TDOC.ServiceMethodName, 
				TDOC.ProcedureName, TDOC.Comments, TDOC.DocumentStatus, TDOC.DocumentTypeId,TDOC.ParentLinkId, TDOC.ChildLinkId
		FROM    T_Document TDOC WITH(NOLOCK) 
		INNER JOIN M_ChildLink MCL WITH(NOLOCK) ON TDOC.ChildLinkId = MCL.ChildLinkId 
		INNER JOIN M_DocumentType MDT WITH(NOLOCK) ON TDOC.DocumentTypeId = MDT.DocumentTypeId 
		INNER JOIN M_ParentLink MPL WITH(NOLOCK) ON TDOC.ParentLinkId = MPL.ParentLinkId AND MCL.ParentLinkId = MPL.ParentLinkId
	END
	ELSE
	BEGIN
		SELECT	TDOC.DocumentId,TDOC.DocumentTypeId,MDT.DocumentTypeName,TDOC.ParentLinkId,MPL.ParentLinkName,TDOC.ChildLinkId,MCL.ChildLinkName, TDOC.Tab, TDOC.Section, 
				TDOC.Operation, TDOC.ViewModel, TDOC.XAMLFileName, TDOC.CommandName, TDOC.PropertyName, TDOC.PropertyDescription,TDOC.ServiceFileName, TDOC.ServiceMethodName, 
				TDOC.ProcedureName, TDOC.Comments, TDOC.DocumentStatus, TDOC.DocumentTypeId,TDOC.ParentLinkId, TDOC.ChildLinkId
		FROM    T_Document TDOC WITH(NOLOCK) 
		INNER JOIN M_ChildLink MCL WITH(NOLOCK) ON TDOC.ChildLinkId = MCL.ChildLinkId 
		INNER JOIN M_DocumentType MDT WITH(NOLOCK) ON TDOC.DocumentTypeId = MDT.DocumentTypeId 
		INNER JOIN M_ParentLink MPL WITH(NOLOCK) ON TDOC.ParentLinkId = MPL.ParentLinkId AND MCL.ParentLinkId = MPL.ParentLinkId
		WHERE TDOC.DocumentId=@DocumentId
	END
END
GO
