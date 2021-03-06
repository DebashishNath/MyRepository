SELECT NEWID()

SELECT TOP 1000 [ApplicationId] ,[ApplicationName] FROM [CoreDocDB].[dbo].[M_Application]

SELECT TOP 1000 [UserId],[UserName],[UserFullName],[UserPassword] FROM [CoreDocDB].[dbo].[M_User]

SELECT TOP 1000 [DocumentTypeId],[ApplicationId],[DocumentTypeName],[CreatedById],[CreatedByDate],[ModifiedById],[ModifiedByDate] FROM [CoreDocDB].[dbo].[M_DocumentType]

SELECT TOP 1000 [ParentLinkId],[ParentLinkName],[CreatedById],[CreatedByDate],[ModifiedById],[ModifiedByDate] FROM [CoreDocDB].[dbo].[M_ParentLink]

SELECT TOP 1000 [ChildLinkId],[ParentLinkId],[ChildLinkName],[CreatedById],[CreatedByDate],[ModifiedById],[ModifiedByDate] FROM [CoreDocDB].[dbo].[M_ChildLink]

