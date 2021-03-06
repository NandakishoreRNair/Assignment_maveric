USE [master]
GO
/****** Object:  Database [mobile]    Script Date: 3/6/2021 3:40:05 PM ******/
CREATE DATABASE [mobile]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mobile', FILENAME = N'E:\Azure Data Studio\MSSQL15.MSSQLSERVER\MSSQL\DATA\mobile.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mobile_log', FILENAME = N'E:\Azure Data Studio\MSSQL15.MSSQLSERVER\MSSQL\DATA\mobile_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mobile] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mobile].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mobile] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mobile] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mobile] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mobile] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mobile] SET ARITHABORT OFF 
GO
ALTER DATABASE [mobile] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mobile] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mobile] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mobile] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mobile] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mobile] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mobile] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mobile] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mobile] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mobile] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mobile] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mobile] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mobile] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mobile] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mobile] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mobile] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mobile] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mobile] SET RECOVERY FULL 
GO
ALTER DATABASE [mobile] SET  MULTI_USER 
GO
ALTER DATABASE [mobile] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mobile] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mobile] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mobile] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mobile] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mobile] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'mobile', N'ON'
GO
ALTER DATABASE [mobile] SET QUERY_STORE = OFF
GO
USE [mobile]
GO
/****** Object:  Table [dbo].[mobdetails]    Script Date: 3/6/2021 3:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mobdetails](
	[id] [nvarchar](50) NOT NULL,
	[battery_power] [int] NOT NULL,
	[blue] [nvarchar](50) NOT NULL,
	[clock_speed] [nvarchar](50) NOT NULL,
	[dual_sim] [nvarchar](50) NOT NULL,
	[fc] [nvarchar](50) NOT NULL,
	[four_g] [nvarchar](50) NOT NULL,
	[int_memory] [int] NOT NULL,
	[m_dep] [nvarchar](50) NOT NULL,
	[mobile_wt] [int] NOT NULL,
	[n_cores] [nvarchar](50) NOT NULL,
	[pc] [nvarchar](50) NOT NULL,
	[px_height] [int] NOT NULL,
	[px_width] [int] NOT NULL,
	[ram] [int] NOT NULL,
	[sc_h] [int] NOT NULL,
	[sc_w] [nvarchar](50) NOT NULL,
	[talk_time] [int] NOT NULL,
	[three_g] [nvarchar](50) NOT NULL,
	[touch_screen] [nvarchar](50) NOT NULL,
	[wifi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_mobdetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mobilebasic]    Script Date: 3/6/2021 3:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mobilebasic](
	[id] [nvarchar](50) NOT NULL,
	[battery_power] [int] NOT NULL,
	[int_memory] [int] NOT NULL,
	[ram] [int] NOT NULL,
	[dual_sim] [nvarchar](50) NOT NULL,
	[four_g] [nvarchar](50) NOT NULL,
	[touch_screen] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mobilehardware]    Script Date: 3/6/2021 3:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mobilehardware](
	[id] [nvarchar](50) NOT NULL,
	[blue] [nvarchar](50) NOT NULL,
	[clock_speed] [nvarchar](50) NOT NULL,
	[fc] [nvarchar](50) NOT NULL,
	[n_cores] [nvarchar](50) NOT NULL,
	[pc] [nvarchar](50) NOT NULL,
	[talk_time] [int] NOT NULL,
	[three_g] [nvarchar](50) NOT NULL,
	[wifi] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mobilelook]    Script Date: 3/6/2021 3:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mobilelook](
	[id] [nvarchar](50) NOT NULL,
	[m_dep] [nvarchar](50) NOT NULL,
	[mobile_wt] [int] NOT NULL,
	[px_height] [int] NOT NULL,
	[px_width] [int] NOT NULL,
	[sc_h] [int] NOT NULL,
	[sc_w] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[findflagship]    Script Date: 3/6/2021 3:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[findflagship] @max int=100
as 
select top (@max) b.* ,h.blue,h.clock_speed,h.fc,h.n_cores,h.pc,h.talk_time,h.three_g,h.wifi,
l.m_dep,l.mobile_wt,l.px_height,l.px_width,l.sc_h,l.sc_w
from  mobilebasic b inner join mobilehardware h on b.id=h.id
inner join mobilelook l on b.id=l.id 
order by int_memory desc,ram desc,battery_power desc;
GO
/****** Object:  StoredProcedure [dbo].[findgaming]    Script Date: 3/6/2021 3:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[findgaming] @max int=100
as 
select top (@max) b.* ,h.blue,h.clock_speed,h.fc,h.n_cores,h.pc,h.talk_time,h.three_g,h.wifi,
l.m_dep,l.mobile_wt,l.px_height,l.px_width,l.sc_h,l.sc_w
from  mobilebasic b inner join mobilehardware h on b.id=h.id
inner join mobilelook l on b.id=l.id 
order by int_memory desc,ram desc,battery_power desc;
GO
/****** Object:  StoredProcedure [dbo].[findId]    Script Date: 3/6/2021 3:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[findId] @Id Int
as 
select  b.* ,h.blue,h.clock_speed,h.fc,h.n_cores,h.pc,h.talk_time,h.three_g,h.wifi,
l.m_dep,l.mobile_wt,l.px_height,l.px_width,l.sc_h,l.sc_w
from  mobilebasic b inner join mobilehardware h on b.id=h.id
inner join mobilelook l on b.id=l.id 
where b.id=@Id;

GO
/****** Object:  StoredProcedure [dbo].[listbasic]    Script Date: 3/6/2021 3:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listbasic]
as 
select * from mobilebasic;
GO
/****** Object:  StoredProcedure [dbo].[mobfullspecs]    Script Date: 3/6/2021 3:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[mobfullspecs]
as 
select	b.* ,h.blue,h.clock_speed,h.fc,h.n_cores,h.pc,h.talk_time,h.three_g,h.wifi,
l.m_dep,l.mobile_wt,l.px_height,l.px_width,l.sc_h,l.sc_w
from  mobilebasic b inner join mobilehardware h on b.id=h.id
inner join mobilelook l on b.id=l.id;

GO
USE [master]
GO
ALTER DATABASE [mobile] SET  READ_WRITE 
GO
