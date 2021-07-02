USE [master]
GO
/****** Object:  Database [ANTS]    Script Date: 7/2/2021 9:21:31 PM ******/
CREATE DATABASE [ANTS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ANTS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ANTS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ANTS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ANTS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ANTS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ANTS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ANTS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ANTS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ANTS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ANTS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ANTS] SET ARITHABORT OFF 
GO
ALTER DATABASE [ANTS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ANTS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ANTS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ANTS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ANTS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ANTS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ANTS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ANTS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ANTS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ANTS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ANTS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ANTS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ANTS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ANTS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ANTS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ANTS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ANTS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ANTS] SET RECOVERY FULL 
GO
ALTER DATABASE [ANTS] SET  MULTI_USER 
GO
ALTER DATABASE [ANTS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ANTS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ANTS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ANTS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ANTS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ANTS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ANTS', N'ON'
GO
ALTER DATABASE [ANTS] SET QUERY_STORE = OFF
GO
USE [ANTS]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 7/2/2021 9:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[accountid] [int] IDENTITY(1,1) NOT NULL,
	[balance] [float] NOT NULL,
	[debit] [float] NOT NULL,
	[credit] [float] NOT NULL,
	[paytype] [varchar](50) NOT NULL,
	[transferdetails] [text] NOT NULL,
	[status] [varchar](50) NOT NULL,
	[createdat] [datetime] NOT NULL,
	[userid] [int] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 7/2/2021 9:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[actionid] [int] IDENTITY(1,1) NOT NULL,
	[actionanme] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[actionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auditlogs]    Script Date: 7/2/2021 9:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditlogs](
	[auditlogid] [int] IDENTITY(1,1) NOT NULL,
	[adminid] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[createdat] [datetime] NOT NULL,
	[details] [text] NULL,
	[actiontypeid] [int] NULL,
 CONSTRAINT [PK_Auditlogs] PRIMARY KEY CLUSTERED 
(
	[auditlogid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 7/2/2021 9:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[blogid] [int] IDENTITY(1,1) NOT NULL,
	[blog] [text] NOT NULL,
	[userid] [int] NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[blogid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notices]    Script Date: 7/2/2021 9:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notices](
	[noticeid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[usertype] [varchar](50) NOT NULL,
	[notice] [text] NOT NULL,
	[createdat] [datetime] NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Notices] PRIMARY KEY CLUSTERED 
(
	[noticeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/2/2021 9:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[sellerid] [int] NOT NULL,
	[customerid] [int] NOT NULL,
	[customerphone] [varchar](50) NOT NULL,
	[customeraddress] [varchar](150) NOT NULL,
	[packageid] [int] NOT NULL,
	[ordername] [varchar](50) NOT NULL,
	[paytype] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[totalprice] [float] NOT NULL,
	[createdat] [datetime] NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 7/2/2021 9:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packages](
	[packageid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[packagename] [varchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[details] [text] NULL,
	[category] [varchar](50) NOT NULL,
	[discount] [float] NOT NULL,
	[voucherid] [int] NOT NULL,
	[createdat] [datetime] NOT NULL,
	[advertisement] [text] NULL,
	[location] [text] NULL,
	[approvestatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Packages] PRIMARY KEY CLUSTERED 
(
	[packageid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 7/2/2021 9:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[ratingid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[packageid] [int] NOT NULL,
	[rating] [float] NOT NULL,
	[complain] [text] NULL,
	[complainstatus] [varchar](50) NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY CLUSTERED 
(
	[ratingid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/2/2021 9:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[usertype] [varchar](50) NOT NULL,
	[createdat] [datetime] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[image] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 7/2/2021 9:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[voucherid] [int] IDENTITY(1,1) NOT NULL,
	[voucherstatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[voucherid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucherentry]    Script Date: 7/2/2021 9:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucherentry](
	[voucherentryid] [int] IDENTITY(1,1) NOT NULL,
	[voucherid] [int] NOT NULL,
	[userid] [int] NOT NULL,
 CONSTRAINT [PK_Voucherentry] PRIMARY KEY CLUSTERED 
(
	[voucherentryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Users]
GO
ALTER TABLE [dbo].[Auditlogs]  WITH CHECK ADD  CONSTRAINT [FK_Auditlogs_Actions] FOREIGN KEY([actiontypeid])
REFERENCES [dbo].[Actions] ([actionid])
GO
ALTER TABLE [dbo].[Auditlogs] CHECK CONSTRAINT [FK_Auditlogs_Actions]
GO
ALTER TABLE [dbo].[Auditlogs]  WITH CHECK ADD  CONSTRAINT [FK_Auditlogs_Users] FOREIGN KEY([adminid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Auditlogs] CHECK CONSTRAINT [FK_Auditlogs_Users]
GO
ALTER TABLE [dbo].[Auditlogs]  WITH CHECK ADD  CONSTRAINT [FK_Auditlogs_Users1] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Auditlogs] CHECK CONSTRAINT [FK_Auditlogs_Users1]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Users]
GO
ALTER TABLE [dbo].[Notices]  WITH CHECK ADD  CONSTRAINT [FK_Notices_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Notices] CHECK CONSTRAINT [FK_Notices_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([sellerid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users1] FOREIGN KEY([customerid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users1]
GO
ALTER TABLE [dbo].[Packages]  WITH CHECK ADD  CONSTRAINT [FK_Packages_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Packages] CHECK CONSTRAINT [FK_Packages_Users]
GO
ALTER TABLE [dbo].[Packages]  WITH CHECK ADD  CONSTRAINT [FK_Packages_Voucher] FOREIGN KEY([voucherid])
REFERENCES [dbo].[Voucher] ([voucherid])
GO
ALTER TABLE [dbo].[Packages] CHECK CONSTRAINT [FK_Packages_Voucher]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Packages] FOREIGN KEY([packageid])
REFERENCES [dbo].[Packages] ([packageid])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Packages]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Users]
GO
ALTER TABLE [dbo].[Voucherentry]  WITH CHECK ADD  CONSTRAINT [FK_Voucherentry_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Voucherentry] CHECK CONSTRAINT [FK_Voucherentry_Users]
GO
ALTER TABLE [dbo].[Voucherentry]  WITH CHECK ADD  CONSTRAINT [FK_Voucherentry_Voucher] FOREIGN KEY([voucherid])
REFERENCES [dbo].[Voucher] ([voucherid])
GO
ALTER TABLE [dbo].[Voucherentry] CHECK CONSTRAINT [FK_Voucherentry_Voucher]
GO
USE [master]
GO
ALTER DATABASE [ANTS] SET  READ_WRITE 
GO
