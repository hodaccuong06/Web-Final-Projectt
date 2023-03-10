USE [master]
GO
/****** Object:  Database [ShopWeb]    Script Date: 1/8/2023 11:45:55 PM ******/
CREATE DATABASE [ShopWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ShopWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ShopWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShopWeb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopWeb] SET  MULTI_USER 
GO
ALTER DATABASE [ShopWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopWeb', N'ON'
GO
ALTER DATABASE [ShopWeb] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShopWeb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShopWeb]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 1/8/2023 11:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Avatar] [nvarchar](150) NULL,
	[Slug] [varchar](150) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/8/2023 11:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avartar] [nchar](100) NULL,
	[Slug] [varchar](500) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[Deleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/8/2023 11:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[ProductId] [int] NULL,
	[Status] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/8/2023 11:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/8/2023 11:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NULL,
	[Avartar] [nchar](100) NULL,
	[CategoryId] [int] NULL,
	[ShortDes] [nvarchar](100) NULL,
	[FullDescription] [nvarchar](500) NULL,
	[Price] [float] NULL,
	[PriceDiscount] [float] NULL,
	[TypeId] [int] NULL,
	[Slug] [varchar](50) NULL,
	[BrandId] [int] NULL,
	[Deleted] [bit] NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdateOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/8/2023 11:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (1, N'Macbook', NULL, N'macbook', 1, 1, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (2, N'Ipad', NULL, N'ipad', 1, 2, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (3, N'Iphone', NULL, N'iphone', 1, 3, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (4, N'Acer', NULL, N'acer', 1, 4, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (5, N'Asus', NULL, N'asus', 1, 5, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (6, N'Dell', NULL, N'dell', 1, 6, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (7, N'HP', NULL, N'hp', 1, 7, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (10, N'Lenovo', NULL, N'lenovo', 1, 8, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (11, N'LG', NULL, N'lg', 1, 9, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Apple', N'iphone13.jpg                                                                                        ', N'apple', 1, 1, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Laptop', N'acer.jpg                                                                                            ', N'laptop', 1, 2, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Màn hình', N'manhinhasus.jpg                                                                                     ', N'man-hinh', 1, 3, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Bàn phím', NULL, N'ban-phim', 1, 4, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'Chuột', NULL, N'chuot', 1, 5, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (6, N'Lót chuột', NULL, N'lot-chuot', 1, 6, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (7, N'Tai nghe', NULL, N'tai-nghe', 1, 7, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (1, N'MLY23 – MacBook Air M2 13 inch 2022 – (M2/8GB/512GB) – NEW                                          ', N'MLY23.png                                                                                           ', 1, N'Tình trạng: New', N'Hệ điều hành mới năm nay tập trung nhiều về giao diện và tính năng với nhiều sự thay đổi nhằm đem lại sự tối ưu hơn cho người dùng. Tốc độ nhanh hơn, dữ liệu được đồng bộ qua iCloud – tất cả đều nằm trong hệ sinh thái Apple.', 34500000, 1, 1, N'macbook', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (2, N'MLY33 – MacBook Air M2 13 inch 2022 – (M2/8GB/256GB) – NEW                                          ', N'MLY33.png                                                                                           ', 1, N'Tình trạng: New', N'Hệ điều hành mới năm nay tập trung nhiều về giao diện và tính năng với nhiều sự thay đổi nhằm đem lại sự tối ưu hơn cho người dùng. Tốc độ nhanh hơn, dữ liệu được đồng bộ qua iCloud – tất cả đều nằm trong hệ sinh thái Apple.', 27500000, 1, 1, N'macbook', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (3, N'NULLLG Gram 17 inch 2022 – NEW                                                                      ', N'LGGRAM17.png                                                                                        ', 2, N'Tình trạng: New', N'LG Gram tuy là một thương hiệu laptop mới những cũng đã để lại nhiều điểm nhấn với người tiêu dùng. Khi nhắc đến LG Gram thì người ta sẽ nghĩ ngay đến những chiếc laptop có vẻ ngoài mỏng mảnh sang trọng với trọng lượng siêu nhẹ. Hiệu năng không quá mạnh mẽ nhưng đủ sức đáp ứng tốt mọi công việc cơ bản và cả việc giải trí với chất lượng màn hình cực kỳ đẹp của mình. ', 40990000, 1, 2, N'lg', 11, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (4, N'Bàn phím cơ Asus ROG Strix Flare II (NX Blue Switch)                                                ', N'ASUS1.jpg                                                                                           ', 4, NULL, NULL, NULL, 1, 4, NULL, 5, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (5, N'Tai nghe Over-ear ASUS ROG Strix Fusion 300                                                         ', N'TaiNghe1.jpg                                                                                        ', 7, NULL, NULL, NULL, 1, 7, NULL, 5, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (23, N'Tai nghe Over-ear ASUS ROG Strix Fusion 300                                                         ', NULL, 7, NULL, NULL, NULL, 1, 7, N'tainghe', 5, 0, 1, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (1, N'Cuong', N'Ho', N'hodaccuong06@gmail.com', N'123', NULL)
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (2, N'123', N'123', N'1232', N'202cb962ac59075b964b07152d234b70', NULL)
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (3, N'123', N'321', N'hodaccuong09@gmail.com', N'25f9e794323b453885f5181f1b624d0b', NULL)
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (4, N'1233', N'123333', N'hodaccuong1412@gmail.com', N'202cb962ac59075b964b07152d234b70', 1)
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (5, N'Cu?ng', N'H?', N'hodaccuong091@gmail.com', N'202cb962ac59075b964b07152d234b70', NULL)
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (6, N'Six', N'So Sad', N'hodaccuong14122@gmail.com', N'123', NULL)
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (7, N'Sixxx', N'So Sad', N'hodaccuong14122@gmail.com', N'123', NULL)
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (8, N'Sixxx', N'2', N'hodaccuong1412222@gmail.com', N'123', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:Giảm giá sốc, 2: Đề xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:Admin, 2: User' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'IsAdmin'
GO
USE [master]
GO
ALTER DATABASE [ShopWeb] SET  READ_WRITE 
GO
