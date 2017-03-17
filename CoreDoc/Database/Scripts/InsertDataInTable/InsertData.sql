USE [CoreDocDB]
GO
INSERT [dbo].[M_Application] ([ApplicationId], [ApplicationName]) VALUES (1, N'LIS Application')
INSERT [dbo].[M_Application] ([ApplicationId], [ApplicationName]) VALUES (2, N'PSC Application')
INSERT [dbo].[M_User] ([UserId], [UserName], [UserFullName], [UserPassword]) VALUES (N'aeabc321-6c1f-42ff-b118-9399ecc5c462', N'akori2029@gmail.com', N'Akash Kori', N'bmlrdW5q')
INSERT [dbo].[T_User_Application_Map] ([UserId], [ApplicationId]) VALUES (N'aeabc321-6c1f-42ff-b118-9399ecc5c462', 1)
INSERT [dbo].[M_DocumentType] ([DocumentTypeId], [ApplicationId], [DocumentTypeName], [CreatedById], [CreatedByDate], [ModifiedById], [ModifiedByDate]) VALUES (N'f0ae5423-93d9-4f5a-9c80-7885403e31c8', 1, N'Lab Escalation', N'aeabc321-6c1f-42ff-b118-9399ecc5c462', CAST(N'2016-06-24T11:34:46.6130000+05:30' AS DateTimeOffset), NULL, NULL)
INSERT [dbo].[M_ParentLink] ([ParentLinkId], [ParentLinkName], [CreatedById], [CreatedByDate], [ModifiedById], [ModifiedByDate]) VALUES (N'784d3249-9de9-462c-94a5-a8e75dd917f4', N'Add', N'aeabc321-6c1f-42ff-b118-9399ecc5c462', CAST(N'2016-06-24T11:37:05.9570000+05:30' AS DateTimeOffset), NULL, NULL)
INSERT [dbo].[M_ChildLink] ([ChildLinkId], [ParentLinkId], [ChildLinkName], [CreatedById], [CreatedByDate], [ModifiedById], [ModifiedByDate]) VALUES (N'19e26a05-e396-4e31-9f33-86393379a652', N'784d3249-9de9-462c-94a5-a8e75dd917f4', N'Add Order', N'aeabc321-6c1f-42ff-b118-9399ecc5c462', CAST(N'2016-06-24T11:38:32.0770000+05:30' AS DateTimeOffset), NULL, NULL)
INSERT [dbo].[T_Document] ([DocumentId], [DocumentTypeId], [ParentLinkId], [ChildLinkId], [Tab], [Section], [Operation], [ViewModel], [XAMLFileName], [CommandName], [PropertyName], [PropertyDescription], [ServiceFileName], [ServiceMethodName], [ProcedureName], [Comments], [DocumentStatus], [CreatedById], [CreatedByDate], [ModifiedById], [ModifiedByDate]) VALUES (N'66a17dba-ba83-4bb4-8e1c-e341020cf658', N'f0ae5423-93d9-4f5a-9c80-7885403e31c8', N'784d3249-9de9-462c-94a5-a8e75dd917f4', N'19e26a05-e396-4e31-9f33-86393379a652', NULL, N'Add New Patient', NULL, N'VM1', N'zbc.xaml', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'I', NULL, NULL, NULL, NULL)
