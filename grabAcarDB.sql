USE [master]
GO
/****** Object:  Database [grabAcar]    Script Date: 02/10/2015 12:11:43 ******/
CREATE DATABASE [grabAcar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'grabAcar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\grabAcar.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'grabAcar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\grabAcar_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [grabAcar] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [grabAcar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [grabAcar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [grabAcar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [grabAcar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [grabAcar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [grabAcar] SET ARITHABORT OFF 
GO
ALTER DATABASE [grabAcar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [grabAcar] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [grabAcar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [grabAcar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [grabAcar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [grabAcar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [grabAcar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [grabAcar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [grabAcar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [grabAcar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [grabAcar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [grabAcar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [grabAcar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [grabAcar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [grabAcar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [grabAcar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [grabAcar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [grabAcar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [grabAcar] SET RECOVERY FULL 
GO
ALTER DATABASE [grabAcar] SET  MULTI_USER 
GO
ALTER DATABASE [grabAcar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [grabAcar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [grabAcar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [grabAcar] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'grabAcar', N'ON'
GO
USE [grabAcar]
GO
/****** Object:  Table [dbo].[branches]    Script Date: 02/10/2015 12:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branches](
	[branch_id] [int] IDENTITY(1,1) NOT NULL,
	[is_active] [int] NOT NULL,
	[branch_name] [nvarchar](50) NOT NULL,
	[city_id] [int] NOT NULL,
	[location_latitude] [decimal](4, 2) NOT NULL,
	[location_longitude] [decimal](4, 2) NOT NULL,
 CONSTRAINT [branches_pk] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[car_models]    Script Date: 02/10/2015 12:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[car_models](
	[car_model_id] [int] IDENTITY(1,1) NOT NULL,
	[is_active] [int] NOT NULL,
	[model_name] [nvarchar](50) NOT NULL,
	[manufacturer_id] [int] NOT NULL,
	[transmission_id] [int] NOT NULL,
	[manufacture_year] [int] NOT NULL,
	[daily_rate] [decimal](10, 2) NOT NULL,
	[day_late_rate] [decimal](10, 2) NOT NULL,
	[remarks] [nvarchar](max) NULL,
 CONSTRAINT [car_models_pk] PRIMARY KEY CLUSTERED 
(
	[car_model_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cars]    Script Date: 02/10/2015 12:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cars](
	[car_id] [int] IDENTITY(1,1) NOT NULL,
	[is_active] [int] NOT NULL,
	[car_number] [int] NOT NULL,
	[car_model_id] [int] NOT NULL,
	[mileage] [int] NOT NULL,
	[photo] [nvarchar](max) NOT NULL,
	[available_for_rent] [bit] NOT NULL,
	[rentable] [bit] NOT NULL,
	[owner_branch] [int] NOT NULL,
 CONSTRAINT [cars_pk] PRIMARY KEY CLUSTERED 
(
	[car_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cities]    Script Date: 02/10/2015 12:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cities](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[country_id] [int] NOT NULL,
	[city_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [cities_pk] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[countries]    Script Date: 02/10/2015 12:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries](
	[country_id] [int] IDENTITY(1,1) NOT NULL,
	[country_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [country_pk] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[diary]    Script Date: 02/10/2015 12:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diary](
	[line_code] [int] IDENTITY(1,1) NOT NULL,
	[is_active] [int] NOT NULL,
	[car_id] [int] NULL,
	[create_time] [datetime] NOT NULL,
	[customer_id] [int] NOT NULL,
	[date_start] [date] NOT NULL,
	[date_end] [date] NOT NULL,
	[time_start] [time](7) NOT NULL,
	[time_end] [time](7) NOT NULL,
	[actual_date_start] [date] NULL,
	[actual_date_end] [date] NULL,
	[actual_time_start] [time](7) NULL,
	[actual_time_end] [time](7) NULL,
 CONSTRAINT [diary_pk] PRIMARY KEY CLUSTERED 
(
	[line_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[manufacturers]    Script Date: 02/10/2015 12:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manufacturers](
	[manufacturer_id] [int] IDENTITY(1,1) NOT NULL,
	[is_active] [int] NOT NULL,
	[manufacturer_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [manufacturers_pk] PRIMARY KEY CLUSTERED 
(
	[manufacturer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02/10/2015 12:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transmission_types]    Script Date: 02/10/2015 12:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transmission_types](
	[transmission_id] [int] IDENTITY(1,1) NOT NULL,
	[transmission_name] [nvarchar](10) NULL,
 CONSTRAINT [PK_gear_types] PRIMARY KEY CLUSTERED 
(
	[transmission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/10/2015 12:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[is_active] [int] NOT NULL,
	[first_name] [nvarchar](25) NOT NULL,
	[last_name] [nvarchar](25) NOT NULL,
	[city_id] [int] NULL,
	[region_name] [nchar](50) NULL,
	[address] [nvarchar](200) NULL,
	[id_number] [nvarchar](10) NOT NULL,
	[date_of_birth] [date] NULL,
	[gender] [nvarchar](25) NULL,
	[email] [nvarchar](50) NULL,
	[display_picture] [image] NULL,
 CONSTRAINT [PK__Users__1788CCACFE5FC366] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserVsRoles]    Script Date: 02/10/2015 12:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserVsRoles](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserVsRoles] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[branches] ON 

GO
INSERT [dbo].[branches] ([branch_id], [is_active], [branch_name], [city_id], [location_latitude], [location_longitude]) VALUES (1, 1, N'Main', 1, CAST(10.10 AS Decimal(4, 2)), CAST(10.10 AS Decimal(4, 2)))
GO
SET IDENTITY_INSERT [dbo].[branches] OFF
GO
SET IDENTITY_INSERT [dbo].[car_models] ON 

GO
INSERT [dbo].[car_models] ([car_model_id], [is_active], [model_name], [manufacturer_id], [transmission_id], [manufacture_year], [daily_rate], [day_late_rate], [remarks]) VALUES (13, 1, N'Huracan', 6, 1, 2012, CAST(1000.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[car_models] ([car_model_id], [is_active], [model_name], [manufacturer_id], [transmission_id], [manufacture_year], [daily_rate], [day_late_rate], [remarks]) VALUES (14, 1, N'Vanquish', 4, 2, 2014, CAST(1200.00 AS Decimal(10, 2)), CAST(1700.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[car_models] ([car_model_id], [is_active], [model_name], [manufacturer_id], [transmission_id], [manufacture_year], [daily_rate], [day_late_rate], [remarks]) VALUES (17, 1, N'Spider', 3, 1, 2015, CAST(1500.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[car_models] ([car_model_id], [is_active], [model_name], [manufacturer_id], [transmission_id], [manufacture_year], [daily_rate], [day_late_rate], [remarks]) VALUES (21, 1, N'Veyron', 7, 9, 2011, CAST(950.00 AS Decimal(10, 2)), CAST(1250.00 AS Decimal(10, 2)), NULL)
GO
SET IDENTITY_INSERT [dbo].[car_models] OFF
GO
SET IDENTITY_INSERT [dbo].[cars] ON 

GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (0, 0, 55556423, 14, 450, N'C:akepath50811_193419.jpg', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (1, 0, 1234, 13, 100, N'1', 1, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (2, 0, 2343, 14, 200, N'1', 1, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (3, 0, 2323, 17, 200, N'1', 1, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (4, 0, 23232, 21, 222, N'1', 1, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (5, 1, 0, 13, 44, N'http://pre08.deviantart.net/a578/th/pre/f/2013/356/4/3/lamborghini_huracan_superleggera_by_yogabudiwcustom-d6yolte.jpg', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (6, 1, 0, 13, 44, N'C:\fakepath\20150811_193419.jpg', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (7, 1, 0, 17, 888, N'https://upload.wikimedia.org/wikipedia/commons/7/79/Alfa_Romeo_8c_Spider_-_Flickr_-_The_Car_Spy_(6).jpg', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (8, 1, 0, 14, 444, N'http://www.businesscarmanager.co.uk/wp-content/uploads/2012/06/Aston-Martin-Vanquish-MY13.jpg', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (9, 1, 1354365, 17, 222, N'C:\fakepath\1343221552w52El[1].jpg', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (10, 1, 456, 14, 26003, N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRcPL9jPlShAARJfG-5u-7_VA_MIqwUimdnjSLghnBwuKueDbv7LpdTF7Rh', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (11, 0, 0, 14, 666, N'', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (12, 0, 88888, 14, 23, N'', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (13, 1, 0, 14, 33, N'C:\fakepath\20150811_193419.jpg', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (14, 1, 44444, 14, 56, N'C:\fakepath\20150811_193419.jpg', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (15, 1, 55555, 17, 667, N'C:akepath50811_193419.jpg', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (16, 1, 2222, 13, 545, N'http://www.simplysweet.co.il/files/catalog/reg/1343221552w52El.jpg', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (17, 1, 555, 13, 5555, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpwbYaPqFZ0jDTgml9Mt3jLdebaU5KqaLTXk9dAUII-wTOAiwq', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (18, 1, 5465, 17, 3543, N'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTYOceUZlpad7hXceYm9YZ9mDIZzh2QQsJ23HYoohLS7tQS_6La7g', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (19, 1, 333, 13, 3444, N'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQZtSh_-covXbODIrUyNP9l0ahOQMmeQXlOfXknDS7MtzvdynAoJQ', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (20, 1, 33345, 13, 333, N'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSEP-yVUPxBHEkb0Xif6d_oCwH36zv87dtDpvRK45EBN8bN-kXw6g', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (21, 1, 333, 13, 423, N'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRuIuo8dPotNPJKkA7vgGpJvJD8UFOt77EdxrQstW8hNARf9Bs6', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (22, 1, 78787, 14, 5965, N'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRuIuo8dPotNPJKkA7vgGpJvJD8UFOt77EdxrQstW8hNARf9Bs6', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (23, 1, 657, 14, 6657, N'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRDy9MxWHY_wbDK94gj9xGtHlC2sHVCAQuJS8xomRTyk0p6pRJkwA', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (24, 1, 544, 17, 950, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6mjaFC3iCcgkUjT9CNtESm3q2LbTZVgQMlIq3HVg9bFLwgEdsSQ', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (25, 1, 43434, 14, 5546, N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQvKHUx9eyXcUy1KYJdQEtyMRSBEcuocaNmte3roc6nVoWg5M2CsQ', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (26, 0, 5022323, 21, 108, N'', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (27, 0, 1, 13, 123, N'', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (28, 0, 6589, 13, 666530, N'', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (29, 0, 6666, 17, 5656, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (30, 0, 544, 17, 65, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (31, 0, 666, 17, 766, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (32, 0, 666, 17, 766, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (33, 0, 666, 17, 766, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (34, 0, 666, 17, 766, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (35, 0, 666, 17, 766, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (36, 0, 666, 17, 766, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (37, 0, 666, 17, 766, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (38, 0, 56456, 17, 666, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (39, 0, 4334, 14, 540, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (40, 0, 32432, 14, 43507, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (41, 0, 565466, 17, 565, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (42, 1, 32432, 21, 4366, N'', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (43, 0, 23432, 13, 4353, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (44, 0, 23432, 13, 4353, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (45, 0, 23432, 13, 4353, N'', 0, 1, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (46, 0, 32423, 14, 232, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (47, 0, 544, 14, 5654, N'', 0, 0, 1)
GO
INSERT [dbo].[cars] ([car_id], [is_active], [car_number], [car_model_id], [mileage], [photo], [available_for_rent], [rentable], [owner_branch]) VALUES (1017, 1, 999888, 21, 0, N'', 0, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[cars] OFF
GO
SET IDENTITY_INSERT [dbo].[cities] ON 

GO
INSERT [dbo].[cities] ([city_id], [country_id], [city_name]) VALUES (1, 1, N'Tel Aviv')
GO
INSERT [dbo].[cities] ([city_id], [country_id], [city_name]) VALUES (2, 2, N'New York')
GO
SET IDENTITY_INSERT [dbo].[cities] OFF
GO
SET IDENTITY_INSERT [dbo].[countries] ON 

GO
INSERT [dbo].[countries] ([country_id], [country_name]) VALUES (1, N'Israel')
GO
INSERT [dbo].[countries] ([country_id], [country_name]) VALUES (2, N'USA')
GO
SET IDENTITY_INSERT [dbo].[countries] OFF
GO
SET IDENTITY_INSERT [dbo].[diary] ON 

GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (1, 1, 1, CAST(N'2015-09-20 01:59:54.687' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-03' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-22' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (2, 1, 2, CAST(N'2015-09-20 02:01:31.100' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-18' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-29' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (3, 1, 3, CAST(N'2015-09-20 02:04:18.613' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-18' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-29' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (8, 1, 4, CAST(N'2015-09-21 00:05:18.437' AS DateTime), 1, CAST(N'2015-09-02' AS Date), CAST(N'2015-09-03' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-27' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (9, 1, 9, CAST(N'2015-09-27 03:05:55.733' AS DateTime), 1, CAST(N'2015-09-24' AS Date), CAST(N'2015-09-25' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-29' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (10, 1, 9, CAST(N'2015-09-27 03:06:03.660' AS DateTime), 1, CAST(N'2015-09-24' AS Date), CAST(N'2015-09-25' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-29' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (11, 1, 9, CAST(N'2015-09-27 03:06:48.817' AS DateTime), 1, CAST(N'2015-09-24' AS Date), CAST(N'2015-09-25' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-29' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (12, 1, 9, CAST(N'2015-09-27 03:07:23.127' AS DateTime), 1, CAST(N'2015-09-24' AS Date), CAST(N'2015-09-25' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-29' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (13, 1, 9, CAST(N'2015-09-27 03:08:12.740' AS DateTime), 1, CAST(N'2015-09-24' AS Date), CAST(N'2015-09-25' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-29' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (14, 1, 10, CAST(N'2015-09-27 03:13:17.693' AS DateTime), 1, CAST(N'2015-09-24' AS Date), CAST(N'2015-09-25' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-29' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (15, 1, 15, CAST(N'2015-09-27 03:13:51.017' AS DateTime), 1, CAST(N'2015-09-24' AS Date), CAST(N'2015-09-25' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-29' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (16, 1, 12, CAST(N'2015-09-28 22:56:51.737' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-17' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-29' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (17, 1, 12, CAST(N'2015-09-28 22:57:01.537' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-17' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-29' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (18, 1, 12, CAST(N'2015-09-28 22:57:01.850' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-17' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-30' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (19, 1, 12, CAST(N'2015-09-28 22:57:02.057' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-17' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-30' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (20, 1, 12, CAST(N'2015-09-28 22:57:02.247' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-17' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-30' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (21, 1, 12, CAST(N'2015-09-28 22:57:02.457' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-17' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-30' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (22, 1, 12, CAST(N'2015-09-28 22:57:02.667' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-17' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-30' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (23, 1, 12, CAST(N'2015-09-28 22:57:06.560' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-17' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-30' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (24, 1, 12, CAST(N'2015-09-28 22:57:06.877' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-17' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-30' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (25, 1, 16, CAST(N'2015-09-28 22:59:39.203' AS DateTime), 1, CAST(N'2015-09-29' AS Date), CAST(N'2015-09-30' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-30' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (26, 1, 16, CAST(N'2015-09-28 23:06:17.617' AS DateTime), 1, CAST(N'2015-09-16' AS Date), CAST(N'2015-09-24' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-30' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (27, 1, 10, CAST(N'2015-09-29 00:51:58.853' AS DateTime), 1, CAST(N'2015-09-12' AS Date), CAST(N'2015-09-18' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-29' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (28, 1, 9, CAST(N'2015-09-29 13:39:49.520' AS DateTime), 1, CAST(N'2015-09-16' AS Date), CAST(N'2015-09-17' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (29, 1, 15, CAST(N'2015-09-29 19:26:19.903' AS DateTime), 1, CAST(N'2015-09-09' AS Date), CAST(N'2015-09-17' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (30, 1, 15, CAST(N'2015-09-29 19:26:59.847' AS DateTime), 1, CAST(N'2015-09-09' AS Date), CAST(N'2015-09-17' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-30' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (32, 1, 14, CAST(N'2015-09-29 20:01:06.403' AS DateTime), 1, CAST(N'2015-09-03' AS Date), CAST(N'2015-09-18' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-30' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (33, 1, 18, CAST(N'2015-09-30 03:55:12.943' AS DateTime), 1, CAST(N'2015-09-02' AS Date), CAST(N'2015-09-16' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-30' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (34, 1, 14, CAST(N'2015-09-30 09:44:43.010' AS DateTime), 1, CAST(N'2015-09-02' AS Date), CAST(N'2015-09-11' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (35, 1, 19, CAST(N'2015-09-30 09:54:00.340' AS DateTime), 1, CAST(N'2015-09-02' AS Date), CAST(N'2015-09-11' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (36, 1, 18, CAST(N'2015-09-30 10:06:51.720' AS DateTime), 1, CAST(N'2015-09-02' AS Date), CAST(N'2015-09-11' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (37, 1, 15, CAST(N'2015-09-30 11:14:21.333' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-30' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (38, 1, 15, CAST(N'2015-09-30 11:14:52.100' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-30' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-10-02' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (39, 1, 18, CAST(N'2015-09-30 11:16:50.947' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-23' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, CAST(N'2015-09-30' AS Date), NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (40, 1, 18, CAST(N'2015-09-30 11:16:54.443' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-23' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (41, 1, 14, CAST(N'2015-09-30 11:24:55.697' AS DateTime), 1, CAST(N'2015-09-01' AS Date), CAST(N'2015-09-30' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (42, 1, 42, CAST(N'2015-10-01 09:49:23.017' AS DateTime), 1, CAST(N'2015-10-20' AS Date), CAST(N'2015-10-28' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (43, 1, 42, CAST(N'2015-10-01 12:19:08.783' AS DateTime), 21, CAST(N'2015-10-01' AS Date), CAST(N'2016-01-29' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (44, 1, 7, CAST(N'2015-10-01 12:31:01.220' AS DateTime), 1, CAST(N'2015-10-01' AS Date), CAST(N'2015-10-31' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (45, 1, 10, CAST(N'2015-10-01 13:46:44.897' AS DateTime), 1, CAST(N'2015-10-01' AS Date), CAST(N'2015-10-01' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (46, 1, 23, CAST(N'2015-10-01 17:41:52.910' AS DateTime), 1, CAST(N'2015-10-01' AS Date), CAST(N'2015-10-01' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (47, 1, 13, CAST(N'2015-10-01 23:29:39.817' AS DateTime), 1012, CAST(N'2015-10-01' AS Date), CAST(N'2015-10-01' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (48, 1, 25, CAST(N'2015-10-01 23:47:42.207' AS DateTime), 1012, CAST(N'2015-10-01' AS Date), CAST(N'2015-10-15' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[diary] ([line_code], [is_active], [car_id], [create_time], [customer_id], [date_start], [date_end], [time_start], [time_end], [actual_date_start], [actual_date_end], [actual_time_start], [actual_time_end]) VALUES (49, 1, 24, CAST(N'2015-10-02 11:54:41.627' AS DateTime), 1, CAST(N'2015-10-02' AS Date), CAST(N'2015-10-02' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[diary] OFF
GO
SET IDENTITY_INSERT [dbo].[manufacturers] ON 

GO
INSERT [dbo].[manufacturers] ([manufacturer_id], [is_active], [manufacturer_name]) VALUES (3, 1, N'Ferrari')
GO
INSERT [dbo].[manufacturers] ([manufacturer_id], [is_active], [manufacturer_name]) VALUES (4, 1, N'Aston Martin')
GO
INSERT [dbo].[manufacturers] ([manufacturer_id], [is_active], [manufacturer_name]) VALUES (6, 1, N'Lamborghini')
GO
INSERT [dbo].[manufacturers] ([manufacturer_id], [is_active], [manufacturer_name]) VALUES (7, 1, N'Bugatti')
GO
SET IDENTITY_INSERT [dbo].[manufacturers] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

GO
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Administrator')
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (5, N'Customer')
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Employee')
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Manager')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[transmission_types] ON 

GO
INSERT [dbo].[transmission_types] ([transmission_id], [transmission_name]) VALUES (1, N'Manual')
GO
INSERT [dbo].[transmission_types] ([transmission_id], [transmission_name]) VALUES (2, N'Automatic')
GO
INSERT [dbo].[transmission_types] ([transmission_id], [transmission_name]) VALUES (9, N'Semi')
GO
SET IDENTITY_INSERT [dbo].[transmission_types] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [is_active], [first_name], [last_name], [city_id], [region_name], [address], [id_number], [date_of_birth], [gender], [email], [display_picture]) VALUES (1, N'Gil', N'7110EDA4D09E062AA5E4A390B0A572AC0D2C0220', 1, N'Gil', N'Lion', NULL, NULL, NULL, N'123456789', NULL, N'Male', NULL, NULL)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [is_active], [first_name], [last_name], [city_id], [region_name], [address], [id_number], [date_of_birth], [gender], [email], [display_picture]) VALUES (2, N'abc', N'def', 0, N'abc', N'def', 2, N'fe                                                ', N'fe', N'1234533', CAST(N'2015-09-01' AS Date), N'male', N'ee@ee.com', NULL)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [is_active], [first_name], [last_name], [city_id], [region_name], [address], [id_number], [date_of_birth], [gender], [email], [display_picture]) VALUES (3, N'shimrit', N'BF9661DEFA3DAECACFDE5BDE0214C4A439351D4D', 1, N'shimrit', N'lion', 1, NULL, NULL, N'22222', NULL, NULL, N's@s.com', NULL)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [is_active], [first_name], [last_name], [city_id], [region_name], [address], [id_number], [date_of_birth], [gender], [email], [display_picture]) VALUES (5, N'ggg', N'BF9661DEFA3DAECACFDE5BDE0214C4A439351D4D', 0, N'sss', N'fff', 1, NULL, NULL, N'22222', NULL, NULL, N's@s.com', NULL)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [is_active], [first_name], [last_name], [city_id], [region_name], [address], [id_number], [date_of_birth], [gender], [email], [display_picture]) VALUES (6, N'test', N'7110EDA4D09E062AA5E4A390B0A572AC0D2C0220', 1, N'test', N'test', 1, NULL, NULL, N'11', NULL, NULL, N'1@1.com', NULL)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [is_active], [first_name], [last_name], [city_id], [region_name], [address], [id_number], [date_of_birth], [gender], [email], [display_picture]) VALUES (8, N'fdsfsf', N'E178A51AF1EA91E00BB53CE38870425909702846', 0, N'ssss', N'ssss', 1, N'Not Applicable                                    ', N'34 Yitzhak Rabin St.', N'32432432', CAST(N'2010-02-08' AS Date), NULL, N'dd@ff.com', NULL)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [is_active], [first_name], [last_name], [city_id], [region_name], [address], [id_number], [date_of_birth], [gender], [email], [display_picture]) VALUES (10, N'aaaa', N'70C881D4A26984DDCE795F6F71817C9CF4480E79', 0, N'aaa', N'aaa', 1, NULL, NULL, N'222', NULL, NULL, N's@s.com', NULL)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [is_active], [first_name], [last_name], [city_id], [region_name], [address], [id_number], [date_of_birth], [gender], [email], [display_picture]) VALUES (12, N'balol', N'70C881D4A26984DDCE795F6F71817C9CF4480E79', 0, N'aba', N'baba', 1, NULL, NULL, N'222', NULL, NULL, N's@s.com', NULL)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [is_active], [first_name], [last_name], [city_id], [region_name], [address], [id_number], [date_of_birth], [gender], [email], [display_picture]) VALUES (13, N'bnmk', N'EB8445E28390D0FAE5FEB1E33776816FD9B879A7', 0, N'qwert', N'yuio', 1, NULL, NULL, N'514654', NULL, NULL, N'g@g.com', NULL)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [is_active], [first_name], [last_name], [city_id], [region_name], [address], [id_number], [date_of_birth], [gender], [email], [display_picture]) VALUES (15, N'sdasds', N'CC268918C7AF9AAAFC9DCADB82EECBD56486486A', 0, N'asas', N'sasa', 1, NULL, NULL, N'32423', CAST(N'2015-09-16' AS Date), NULL, N's@s.com', NULL)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [is_active], [first_name], [last_name], [city_id], [region_name], [address], [id_number], [date_of_birth], [gender], [email], [display_picture]) VALUES (19, N'test2', N'109F4B3C50D7B0DF729D299BC6F8E9EF9066971F', 1, N'test2', N'test2', 1, NULL, NULL, N'576768', NULL, NULL, N's@s.com', NULL)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [is_active], [first_name], [last_name], [city_id], [region_name], [address], [id_number], [date_of_birth], [gender], [email], [display_picture]) VALUES (21, N'test3', N'7110EDA4D09E062AA5E4A390B0A572AC0D2C0220', 1, N'test', N'test', 1, N'Holon                                             ', NULL, N'1234', NULL, NULL, N'test@test.com', NULL)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [is_active], [first_name], [last_name], [city_id], [region_name], [address], [id_number], [date_of_birth], [gender], [email], [display_picture]) VALUES (1008, N'user', N'7110EDA4D09E062AA5E4A390B0A572AC0D2C0220', 1, N'user', N'user', 1, N'holon                                             ', NULL, N'333', CAST(N'1982-01-01' AS Date), N'male', N'ee@e.com', NULL)
GO
INSERT [dbo].[Users] ([UserID], [Username], [Password], [is_active], [first_name], [last_name], [city_id], [region_name], [address], [id_number], [date_of_birth], [gender], [email], [display_picture]) VALUES (1012, N'assaf', N'7110EDA4D09E062AA5E4A390B0A572AC0D2C0220', 1, N'Assaf', N'Finklestein', 1, N'HomeLand                                          ', N'Unknown', N'987456321', CAST(N'1976-01-01' AS Date), N'Male', N'assaf.f@goknow.com', NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (1, 1)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (1, 2)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (1, 3)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (1, 5)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (2, 3)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (3, 5)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (5, 5)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (6, 5)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (8, 5)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (10, 5)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (12, 5)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (13, 5)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (15, 5)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (19, 5)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (21, 5)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (1008, 5)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (1012, 5)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Roles__8A2B61601683933A]    Script Date: 02/10/2015 12:11:43 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__536C85E492624DE6]    Script Date: 02/10/2015 12:11:43 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__536C85E492624DE6] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[branches]  WITH CHECK ADD  CONSTRAINT [FK_branches_cities] FOREIGN KEY([city_id])
REFERENCES [dbo].[cities] ([city_id])
GO
ALTER TABLE [dbo].[branches] CHECK CONSTRAINT [FK_branches_cities]
GO
ALTER TABLE [dbo].[car_models]  WITH CHECK ADD  CONSTRAINT [FK_car_models_manufacturers] FOREIGN KEY([manufacturer_id])
REFERENCES [dbo].[manufacturers] ([manufacturer_id])
GO
ALTER TABLE [dbo].[car_models] CHECK CONSTRAINT [FK_car_models_manufacturers]
GO
ALTER TABLE [dbo].[car_models]  WITH CHECK ADD  CONSTRAINT [FK_car_models_transmission_types] FOREIGN KEY([transmission_id])
REFERENCES [dbo].[transmission_types] ([transmission_id])
GO
ALTER TABLE [dbo].[car_models] CHECK CONSTRAINT [FK_car_models_transmission_types]
GO
ALTER TABLE [dbo].[cars]  WITH CHECK ADD  CONSTRAINT [FK_cars_branches] FOREIGN KEY([owner_branch])
REFERENCES [dbo].[branches] ([branch_id])
GO
ALTER TABLE [dbo].[cars] CHECK CONSTRAINT [FK_cars_branches]
GO
ALTER TABLE [dbo].[cars]  WITH CHECK ADD  CONSTRAINT [FK_cars_car_models] FOREIGN KEY([car_model_id])
REFERENCES [dbo].[car_models] ([car_model_id])
GO
ALTER TABLE [dbo].[cars] CHECK CONSTRAINT [FK_cars_car_models]
GO
ALTER TABLE [dbo].[cities]  WITH CHECK ADD  CONSTRAINT [FK_cities_countries] FOREIGN KEY([country_id])
REFERENCES [dbo].[countries] ([country_id])
GO
ALTER TABLE [dbo].[cities] CHECK CONSTRAINT [FK_cities_countries]
GO
ALTER TABLE [dbo].[diary]  WITH CHECK ADD  CONSTRAINT [FK_diary_cars] FOREIGN KEY([car_id])
REFERENCES [dbo].[cars] ([car_id])
GO
ALTER TABLE [dbo].[diary] CHECK CONSTRAINT [FK_diary_cars]
GO
ALTER TABLE [dbo].[diary]  WITH CHECK ADD  CONSTRAINT [FK_diary_users] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[diary] CHECK CONSTRAINT [FK_diary_users]
GO
ALTER TABLE [dbo].[UserVsRoles]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UserVsRoles]  WITH CHECK ADD  CONSTRAINT [FK__UserVsRol__UserI__70DDC3D8] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserVsRoles] CHECK CONSTRAINT [FK__UserVsRol__UserI__70DDC3D8]
GO
USE [master]
GO
ALTER DATABASE [grabAcar] SET  READ_WRITE 
GO
