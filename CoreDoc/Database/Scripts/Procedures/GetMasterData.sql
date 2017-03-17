/****** Object:  StoredProcedure [dbo].[GetMasterData]  Script Date: 6/24/2016 10:53:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetMasterData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetMasterData]
GO
/****** Object:  StoredProcedure [dbo].[GetMasterData]    Script Date: 6/24/2016 10:53:09 PM ******/
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
-- Author:		Debashish Nath
-- Create date: 24/06/2016
-- Description:	This Procedure will retrieve all the Master Data
-- ================================================================================================================================
CREATE PROCEDURE GetMasterData
	@key int,
	@searchValue  varchar(20)
AS
BEGIN

	SET NOCOUNT ON;

	-- Master Data Related To M_Application
	IF(@key=1)
	BEGIN
		SELECT cast(cast(0 as binary) as uniqueidentifier) As Id, MA.ApplicationId AS DataId,MA.ApplicationName As DataName,
		'0' AS OtherInfo1,'' AS OtherInfo2,'' AS OtherInfo3,'' AS OtherInfo4 
		FROM M_Application MA WITH (NOLOCK)
	END
	-- Master Data Related To User
	IF(@key=2)
	BEGIN
		SELECT Mu.UserId AS Id,0 AS DataId,Mu.UserName As DataName,
		MU.UserFullName AS OtherInfo1,MU.UserPassword AS OtherInfo2,'' AS OtherInfo3,'' AS OtherInfo4 
		FROM M_User MU WITH (NOLOCK)
	END
	-- Master Data Related To Document Type
	IF(@key=3)
	BEGIN
		SELECT cast(cast(0 as binary) as uniqueidentifier) As Id, MDT.DocumentTypeId AS DataId,MDT.DocumentTypeName As DataName,
		CONVERT(VARCHAR(16),MA.ApplicationId) AS OtherInfo1,MA.ApplicationName AS OtherInfo2,'' AS OtherInfo3,'' AS OtherInfo4
		FROM M_DocumentType MDT WITH (NOLOCK)
		INNER JOIN M_Application MA WITH (NOLOCK)ON MDT.ApplicationId=MA.ApplicationId
	END
	-- Master Data Related To Parent Link
	IF(@key=4)
	BEGIN
		SELECT cast(cast(0 as binary) as uniqueidentifier) As Id, MPL.ParentLinkId AS DataId,MPL.ParentLinkName As DataName,
		'0' AS OtherInfo1,'' AS OtherInfo2,'' AS OtherInfo3,'' AS OtherInfo4 
		FROM M_ParentLink MPL WITH (NOLOCK)
	END
	-- Master Data Related To Child Link
	IF(@key=5)
	BEGIN
		SELECT cast(cast(0 as binary) as uniqueidentifier) As Id, MCL.ChildLinkId AS DataId,MCL.ChildLinkName As DataName,
		CONVERT(VARCHAR(36),MCL.ChildLinkId) AS OtherInfo1,MCL.ChildLinkName AS OtherInfo2,'' AS OtherInfo3,'' AS OtherInfo4
		FROM M_ParentLink MPL WITH (NOLOCK)
		INNER JOIN M_ChildLink MCL WITH (NOLOCK)ON MPL.ParentLinkId=MCL.ParentLinkId
	END
	-- Master Data Related To User Application Map
	IF(@key=6)
	BEGIN
		SELECT DISTINCT cast(cast(0 as binary) as uniqueidentifier) As Id, MU.UserId AS DataId,MU.UserName As DataName,
		CONVERT(VARCHAR(36),MA.ApplicationId) AS OtherInfo1,MA.ApplicationName AS OtherInfo2,'' AS OtherInfo3,'' AS OtherInfo4
		FROM T_User_Application_Map TUAM WITH (NOLOCK)
		INNER JOIN M_User MU WITH (NOLOCK)ON TUAM.UserId=MU.UserId
		INNER JOIN M_Application MA WITH (NOLOCK)ON TUAM.ApplicationId=MA.ApplicationId
	END
	-- Master Data Related To Search Document Page
	IF(@key=7)
	BEGIN
		SELECT DISTINCT cast(cast(0 as binary) as uniqueidentifier) As Id, MDT.DocumentTypeId AS DataId,MDT.DocumentTypeName As DataName,
		CONVERT(VARCHAR(36),MPL.ParentLinkId) AS OtherInfo1,MPL.ParentLinkName AS OtherInfo2,CONVERT(VARCHAR(36),MCL.ChildLinkId) AS OtherInfo3,MCL.ChildLinkName AS OtherInfo4
		FROM T_Document TD WITH (NOLOCK)
		INNER JOIN M_DocumentType MDT WITH (NOLOCK)ON TD.DocumentTypeId=MDT.DocumentTypeId
		INNER JOIN M_ParentLink MPL WITH (NOLOCK) ON TD.ParentLinkId=MPL.ParentLinkId
		INNER JOIN M_ChildLink MCL WITH (NOLOCK) ON TD.ChildLinkId=MCL.ChildLinkId
	END
	-- Search Data Related To User
	IF(@key=8)
	BEGIN
		SELECT Mu.UserId AS Id,0 AS DataId,Mu.UserName As DataName,
		MU.UserFullName AS OtherInfo1,MU.UserPassword AS OtherInfo2,'' AS OtherInfo3,'' AS OtherInfo4 
		FROM M_User MU WITH (NOLOCK)
		WHERE Mu.UserName=@searchValue
	END
END
GO
