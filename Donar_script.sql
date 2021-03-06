USE [master]
GO
/****** Object:  Database [donateapp]    Script Date: 01/10/2019 15:32:03 ******/
CREATE DATABASE [donateapp] ON  PRIMARY 
( NAME = N'donateapp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\donateapp.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'donateapp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\donateapp_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [donateapp] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [donateapp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [donateapp] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [donateapp] SET ANSI_NULLS OFF
GO
ALTER DATABASE [donateapp] SET ANSI_PADDING OFF
GO
ALTER DATABASE [donateapp] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [donateapp] SET ARITHABORT OFF
GO
ALTER DATABASE [donateapp] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [donateapp] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [donateapp] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [donateapp] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [donateapp] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [donateapp] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [donateapp] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [donateapp] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [donateapp] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [donateapp] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [donateapp] SET  DISABLE_BROKER
GO
ALTER DATABASE [donateapp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [donateapp] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [donateapp] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [donateapp] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [donateapp] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [donateapp] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [donateapp] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [donateapp] SET  READ_WRITE
GO
ALTER DATABASE [donateapp] SET RECOVERY FULL
GO
ALTER DATABASE [donateapp] SET  MULTI_USER
GO
ALTER DATABASE [donateapp] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [donateapp] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'donateapp', N'ON'
GO
USE [donateapp]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 01/10/2019 15:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_Id] [int] NOT NULL,
	[RoleName] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_NGO]    Script Date: 01/10/2019 15:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_NGO](
	[User_ID] [int] NOT NULL,
	[NGOName] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Work]    Script Date: 01/10/2019 15:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Work](
	[Work_Id] [int] NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[WorkType_Id] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[NGO_Id] [int] NULL,
 CONSTRAINT [PK_Work] PRIMARY KEY CLUSTERED 
(
	[Work_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkType]    Script Date: 01/10/2019 15:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkType](
	[WorkType_Id] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_WorkType] PRIMARY KEY CLUSTERED 
(
	[WorkType_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkRequest]    Script Date: 01/10/2019 15:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkRequest](
	[WorkRequest_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Work_Id] [int] NOT NULL,
	[IsAccepted] [bit] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_WorkRequest] PRIMARY KEY CLUSTERED 
(
	[WorkRequest_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_WorkType]    Script Date: 01/10/2019 15:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_WorkType](
	[User_Id] [int] NOT NULL,
	[WorkType_Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01/10/2019 15:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Role_Id] [int] NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](500) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Id] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK__WorkReque__Work___0DAF0CB0]    Script Date: 01/10/2019 15:32:05 ******/
ALTER TABLE [dbo].[WorkRequest]  WITH CHECK ADD FOREIGN KEY([Work_Id])
REFERENCES [dbo].[Work] ([Work_Id])
GO
/****** Object:  ForeignKey [FK__User_Work__WorkT__0AD2A005]    Script Date: 01/10/2019 15:32:05 ******/
ALTER TABLE [dbo].[User_WorkType]  WITH CHECK ADD FOREIGN KEY([WorkType_Id])
REFERENCES [dbo].[WorkType] ([WorkType_Id])
GO
/****** Object:  ForeignKey [FK__Users_Role_RoleId]    Script Date: 01/10/2019 15:32:05 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__Users_Role_RoleId] FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Role] ([Role_Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__Users_Role_RoleId]
GO
