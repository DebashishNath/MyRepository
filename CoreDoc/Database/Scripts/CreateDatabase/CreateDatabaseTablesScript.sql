USE [master]
GO
/****** Object:  Database [CoreDocDB]    Script Date: 6/22/2016 5:13:44 PM ******/
CREATE DATABASE [CoreDocDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoreDocDB', FILENAME = N'E:\NewSQL\MSSQL12.MSSQLSERVER\MSSQL\DATA\CoreDocDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CoreDocDB_log', FILENAME = N'E:\NewSQL\MSSQL12.MSSQLSERVER\MSSQL\DATA\CoreDocDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CoreDocDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoreDocDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoreDocDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoreDocDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoreDocDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoreDocDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoreDocDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoreDocDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoreDocDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoreDocDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoreDocDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoreDocDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoreDocDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoreDocDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoreDocDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoreDocDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoreDocDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CoreDocDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoreDocDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoreDocDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoreDocDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoreDocDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoreDocDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoreDocDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoreDocDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CoreDocDB] SET  MULTI_USER 
GO
ALTER DATABASE [CoreDocDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoreDocDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoreDocDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoreDocDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CoreDocDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CoreDocDB', N'ON'
GO
USE [CoreDocDB]
GO
/****** Object:  Table [dbo].[M_Application]    Script Date: 6/22/2016 5:13:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Application](
	[ApplicationId] [int] NOT NULL,
	[ApplicationName] [varchar](20) NULL,
 CONSTRAINT [PK_M_Application] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_ChildLink]    Script Date: 6/22/2016 5:13:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_ChildLink](
	[ChildLinkId] [uniqueidentifier] NOT NULL,
	[ParentLinkId] [uniqueidentifier] NOT NULL,
	[ChildLinkName] [varchar](50) NULL,
	[CreatedById] [uniqueidentifier] NULL,
	[CreatedByDate] [datetimeoffset](7) NULL,
	[ModifiedById] [uniqueidentifier] NULL,
	[ModifiedByDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_M_ChildLink] PRIMARY KEY CLUSTERED 
(
	[ChildLinkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_DocumentType]    Script Date: 6/22/2016 5:13:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_DocumentType](
	[DocumentTypeId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [int] NULL,
	[DocumentTypeName] [varchar](25) NOT NULL,
	[CreatedById] [uniqueidentifier] NULL,
	[CreatedByDate] [datetimeoffset](7) NULL,
	[ModifiedById] [uniqueidentifier] NULL,
	[ModifiedByDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_M_DocumentType] PRIMARY KEY CLUSTERED 
(
	[DocumentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_ParentLink]    Script Date: 6/22/2016 5:13:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_ParentLink](
	[ParentLinkId] [uniqueidentifier] NOT NULL,
	[ParentLinkName] [varchar](50) NULL,
	[CreatedById] [uniqueidentifier] NULL,
	[CreatedByDate] [datetimeoffset](7) NULL,
	[ModifiedById] [uniqueidentifier] NULL,
	[ModifiedByDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_M_ParentLink] PRIMARY KEY CLUSTERED 
(
	[ParentLinkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_User]    Script Date: 6/22/2016 5:13:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_User](
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[UserFullName] [varchar](50) NOT NULL,
	[UserPassword] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_M_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Document]    Script Date: 6/22/2016 5:13:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Document](
	[DocumentId] [uniqueidentifier] NOT NULL,
	[DocumentTypeId] [uniqueidentifier] NOT NULL,
	[ParentLinkId] [uniqueidentifier] NOT NULL,
	[ChildLinkId] [uniqueidentifier] NOT NULL,
	[Tab] [varchar](25) NULL,
	[Section] [varchar](25) NOT NULL,
	[Operation] [varchar](25) NULL,
	[ViewModel] [varchar](25) NOT NULL,
	[XAMLFileName] [varchar](25) NOT NULL,
	[CommandName] [varchar](25) NULL,
	[PropertyName] [varchar](25) NULL,
	[PropertyDescription] [varchar](25) NULL,
	[ServiceFileName] [varchar](25) NULL,
	[ServiceMethodName] [varchar](25) NULL,
	[ProcedureName] [varchar](25) NULL,
	[Comments] [varchar](2000) NULL,
	[DocumentStatus] [char](1) NOT NULL,
	[CreatedById] [uniqueidentifier] NULL,
	[CreatedByDate] [datetimeoffset](7) NULL,
	[ModifiedById] [uniqueidentifier] NULL,
	[ModifiedByDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_M_Document] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Document_AuditLog]    Script Date: 6/22/2016 5:13:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Document_AuditLog](
	[AuditLogId] [uniqueidentifier] NOT NULL,
	[DocumentId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[AuditDate] [datetimeoffset](7) NOT NULL,
	[AuditDetails] [varchar](max) NULL,
	[DocumentStatus] [char](1) NOT NULL,
 CONSTRAINT [PK_T_Document_AuditLog] PRIMARY KEY CLUSTERED 
(
	[AuditLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_User_Application_Map]    Script Date: 6/22/2016 5:13:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_User_Application_Map](
	[UserId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [int] NOT NULL,
 CONSTRAINT [PK_T_User_Application_Map] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[M_ChildLink]  WITH CHECK ADD  CONSTRAINT [FK_M_ChildLink_M_ParentLink_ParentLinkId] FOREIGN KEY([ParentLinkId])
REFERENCES [dbo].[M_ParentLink] ([ParentLinkId])
GO
ALTER TABLE [dbo].[M_ChildLink] CHECK CONSTRAINT [FK_M_ChildLink_M_ParentLink_ParentLinkId]
GO
ALTER TABLE [dbo].[M_ChildLink]  WITH CHECK ADD  CONSTRAINT [FK_M_ChildLink_M_User_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[M_User] ([UserId])
GO
ALTER TABLE [dbo].[M_ChildLink] CHECK CONSTRAINT [FK_M_ChildLink_M_User_CreatedById]
GO
ALTER TABLE [dbo].[M_ChildLink]  WITH CHECK ADD  CONSTRAINT [FK_M_ChildLink_M_User_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[M_User] ([UserId])
GO
ALTER TABLE [dbo].[M_ChildLink] CHECK CONSTRAINT [FK_M_ChildLink_M_User_ModifiedById]
GO
ALTER TABLE [dbo].[M_DocumentType]  WITH CHECK ADD  CONSTRAINT [FK_M_DocumentType_M_User_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[M_User] ([UserId])
GO
ALTER TABLE [dbo].[M_DocumentType] CHECK CONSTRAINT [FK_M_DocumentType_M_User_CreatedById]
GO
ALTER TABLE [dbo].[M_DocumentType]  WITH CHECK ADD  CONSTRAINT [FK_M_DocumentType_M_User_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[M_User] ([UserId])
GO
ALTER TABLE [dbo].[M_DocumentType] CHECK CONSTRAINT [FK_M_DocumentType_M_User_ModifiedById]
GO
ALTER TABLE [dbo].[M_ParentLink]  WITH CHECK ADD  CONSTRAINT [FK_M_ParentLink_M_User_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[M_User] ([UserId])
GO
ALTER TABLE [dbo].[M_ParentLink] CHECK CONSTRAINT [FK_M_ParentLink_M_User_CreatedById]
GO
ALTER TABLE [dbo].[M_ParentLink]  WITH CHECK ADD  CONSTRAINT [FK_M_ParentLink_M_User_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[M_User] ([UserId])
GO
ALTER TABLE [dbo].[M_ParentLink] CHECK CONSTRAINT [FK_M_ParentLink_M_User_ModifiedById]
GO
ALTER TABLE [dbo].[T_Document]  WITH CHECK ADD  CONSTRAINT [FK_T_Document_M_ChildLink_ChildLinkId] FOREIGN KEY([ChildLinkId])
REFERENCES [dbo].[M_ChildLink] ([ChildLinkId])
GO
ALTER TABLE [dbo].[T_Document] CHECK CONSTRAINT [FK_T_Document_M_ChildLink_ChildLinkId]
GO
ALTER TABLE [dbo].[T_Document]  WITH CHECK ADD  CONSTRAINT [FK_T_Document_M_DocumentType_DocumentTypeId] FOREIGN KEY([DocumentTypeId])
REFERENCES [dbo].[M_DocumentType] ([DocumentTypeId])
GO
ALTER TABLE [dbo].[T_Document] CHECK CONSTRAINT [FK_T_Document_M_DocumentType_DocumentTypeId]
GO
ALTER TABLE [dbo].[T_Document]  WITH CHECK ADD  CONSTRAINT [FK_T_Document_M_ParentLink_ParentLinkId] FOREIGN KEY([ParentLinkId])
REFERENCES [dbo].[M_ParentLink] ([ParentLinkId])
GO
ALTER TABLE [dbo].[T_Document] CHECK CONSTRAINT [FK_T_Document_M_ParentLink_ParentLinkId]
GO
ALTER TABLE [dbo].[T_Document]  WITH CHECK ADD  CONSTRAINT [FK_T_Document_M_User_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[M_User] ([UserId])
GO
ALTER TABLE [dbo].[T_Document] CHECK CONSTRAINT [FK_T_Document_M_User_CreatedById]
GO
ALTER TABLE [dbo].[T_Document]  WITH CHECK ADD  CONSTRAINT [FK_T_Document_M_User_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[M_User] ([UserId])
GO
ALTER TABLE [dbo].[T_Document] CHECK CONSTRAINT [FK_T_Document_M_User_ModifiedById]
GO
ALTER TABLE [dbo].[T_Document_AuditLog]  WITH CHECK ADD  CONSTRAINT [FK_T_Document_AuditLog_M_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[M_User] ([UserId])
GO
ALTER TABLE [dbo].[T_Document_AuditLog] CHECK CONSTRAINT [FK_T_Document_AuditLog_M_User_UserId]
GO
ALTER TABLE [dbo].[T_Document_AuditLog]  WITH CHECK ADD  CONSTRAINT [FK_T_Document_AuditLog_T_Document_AuditLog] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[T_Document] ([DocumentId])
GO
ALTER TABLE [dbo].[T_Document_AuditLog] CHECK CONSTRAINT [FK_T_Document_AuditLog_T_Document_AuditLog]
GO
ALTER TABLE [dbo].[T_User_Application_Map]  WITH CHECK ADD  CONSTRAINT [FK_T_User_Application_Map_M_Application_ApplicationId] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[M_Application] ([ApplicationId])
GO
ALTER TABLE [dbo].[T_User_Application_Map] CHECK CONSTRAINT [FK_T_User_Application_Map_M_Application_ApplicationId]
GO
ALTER TABLE [dbo].[T_User_Application_Map]  WITH CHECK ADD  CONSTRAINT [FK_T_User_Application_Map_M_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[M_User] ([UserId])
GO
GO
ALTER TABLE [dbo].[M_DocumentType]  WITH CHECK ADD  CONSTRAINT [FK_M_DocumentType_M_Application_ApplicationId] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[M_Application] ([ApplicationId])
GO
GO
ALTER TABLE [dbo].[T_User_Application_Map] CHECK CONSTRAINT [FK_T_User_Application_Map_M_User_UserId]
GO
USE [master]
GO
ALTER DATABASE [CoreDocDB] SET  READ_WRITE 
GO
