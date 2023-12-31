USE [master]
GO
/****** Object:  Database [clothesShop]    Script Date: 8/9/2022 10:55:45 PM ******/
CREATE DATABASE [clothesShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'clothesShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\clothesShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'clothesShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\clothesShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [clothesShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clothesShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clothesShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clothesShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clothesShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clothesShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clothesShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [clothesShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [clothesShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clothesShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clothesShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clothesShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [clothesShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clothesShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clothesShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clothesShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clothesShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [clothesShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clothesShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clothesShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clothesShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [clothesShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clothesShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [clothesShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clothesShop] SET RECOVERY FULL 
GO
ALTER DATABASE [clothesShop] SET  MULTI_USER 
GO
ALTER DATABASE [clothesShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [clothesShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [clothesShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [clothesShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [clothesShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [clothesShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'clothesShop', N'ON'
GO
ALTER DATABASE [clothesShop] SET QUERY_STORE = OFF
GO
USE [clothesShop]
GO
/****** Object:  Table [dbo].[account]    Script Date: 8/9/2022 10:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[mail] [nvarchar](200) NULL,
	[phone] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 8/9/2022 10:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 8/9/2022 10:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[stock] [int] NULL,
	[product_id] [int] NULL,
	[product_image] [nvarchar](max) NULL,
	[product_name] [nvarchar](max) NULL,
	[product_price] [money] NULL,
	[product_quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderList]    Script Date: 8/9/2022 10:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderList](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[total] [float] NULL,
	[username] [nvarchar](100) NULL,
	[phone] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 8/9/2022 10:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[product_name] [nvarchar](max) NOT NULL,
	[product_price] [money] NULL,
	[product_salePrice] [money] NOT NULL,
	[product_describe] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[img] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([id], [username], [password], [mail], [phone], [address], [role]) VALUES (1, N'Phong', N'123456', N'phong@gmail.com', N'0123546212', N'Hai Duong', 0)
INSERT [dbo].[account] ([id], [username], [password], [mail], [phone], [address], [role]) VALUES (2, N'Lam', N'123456', N'Lam@gmail.com', N'025413652', N'Ha Noi', 1)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [category_name]) VALUES (1, N'High heel')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (2, N'Boost')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (3, N'Sandal')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (4, N'Sneaker')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([id], [order_id], [stock], [product_id], [product_image], [product_name], [product_price], [product_quantity]) VALUES (10, 4, 4, 47, N'https://static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/9f2c1e7a-5da4-4a89-8f4d-1e686412855d/jordan.jpg', N'FakeUltra', 1400.0000, 150)
INSERT [dbo].[OrderItem] ([id], [order_id], [stock], [product_id], [product_image], [product_name], [product_price], [product_quantity]) VALUES (11, 5, 4, 46, N'https://www.snipesusa.com/on/demandware.static/-/Sites-snipesusa-Library/default/dw4337c002/images/brand-pages/jordan/AJ1-3-25-2.jpg', N'Hailidao', 700.0000, 350)
INSERT [dbo].[OrderItem] ([id], [order_id], [stock], [product_id], [product_image], [product_name], [product_price], [product_quantity]) VALUES (12, 5, 4, 45, N'https://static.nike.com/a/images/t_prod_ss/w_960,c_limit,f_auto/9114dec2-8e26-4747-afda-6a7cf0c77c97/air-jordan-4-white-and-black-dh6927-111-release-date.jpg', N'Meji', 3200.0000, 150)
INSERT [dbo].[OrderItem] ([id], [order_id], [stock], [product_id], [product_image], [product_name], [product_price], [product_quantity]) VALUES (13, 5, 5, 44, N'https://media.architecturaldigest.com/photos/57a11cbeb6c434ab487bc26b/4:3/w_1032,h_774,c_limit/nikes-senior-designer-explains-what-went-into-new-air-jordan-01.png', N'Nautilus', 4300.0000, 150)
INSERT [dbo].[OrderItem] ([id], [order_id], [stock], [product_id], [product_image], [product_name], [product_price], [product_quantity]) VALUES (14, 6, 2, 44, N'https://media.architecturaldigest.com/photos/57a11cbeb6c434ab487bc26b/4:3/w_1032,h_774,c_limit/nikes-senior-designer-explains-what-went-into-new-air-jordan-01.png', N'Nautilus', 4300.0000, 150)
INSERT [dbo].[OrderItem] ([id], [order_id], [stock], [product_id], [product_image], [product_name], [product_price], [product_quantity]) VALUES (15, 7, 1, 43, N'https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_auto,w_1400/fl_lossy,pg_1/peaamam7rsb3nabpozu7/michael-jordan-air-jordan-1-broken-foot-pe?fimg-ssr-default', N'Kyle', 5200.0000, 150)
INSERT [dbo].[OrderItem] ([id], [order_id], [stock], [product_id], [product_image], [product_name], [product_price], [product_quantity]) VALUES (16, 8, 3, 47, N'https://static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/9f2c1e7a-5da4-4a89-8f4d-1e686412855d/jordan.jpg', N'FakeUltra', 1400.0000, 150)
INSERT [dbo].[OrderItem] ([id], [order_id], [stock], [product_id], [product_image], [product_name], [product_price], [product_quantity]) VALUES (17, 9, 5, 1, N'https://www.angelalarcon.com/6515-home_default/eloise-low-kitten-heels-d-orsay-ankle-strap-pointed-toe.jpg', N'Kitten Heels', 1200.0000, 150)
INSERT [dbo].[OrderItem] ([id], [order_id], [stock], [product_id], [product_image], [product_name], [product_price], [product_quantity]) VALUES (18, 9, 1, 2, N'https://canary.contestimg.wish.com/api/webimage/59d5da7787e82f1163e7a10f-large.jpg?cache_buster=a37f825374ac903b5311a982f7fe43d8', N'Pumps', 1500.0000, 200)
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderList] ON 

INSERT [dbo].[OrderList] ([id], [total], [username], [phone], [address]) VALUES (4, 5600, N'Phong', N'0123546212', N'Hai Duong')
INSERT [dbo].[OrderList] ([id], [total], [username], [phone], [address]) VALUES (5, 37100, N'Phong', N'0123546212', N'Ha Noi')
INSERT [dbo].[OrderList] ([id], [total], [username], [phone], [address]) VALUES (6, 8600, N'Phong', N'0123546212', N'Hai Duong')
INSERT [dbo].[OrderList] ([id], [total], [username], [phone], [address]) VALUES (7, 5200, N'Phong', N'0123546212', N'Hai Duong')
INSERT [dbo].[OrderList] ([id], [total], [username], [phone], [address]) VALUES (8, 4200, N'Phong', N'0123546212', N'Hai Duong')
INSERT [dbo].[OrderList] ([id], [total], [username], [phone], [address]) VALUES (9, 7500, N'Phong', N'0123546212', N'Ha Noi')
SET IDENTITY_INSERT [dbo].[OrderList] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (1, 1, N'Kitten Heels', 1500.0000, 1200.0000, N'Whether you have just started working in a shoe department and want to be able to talk the lingo, or you have recently gotten really into fashion, knowing your shoe definitions is a useful skill. When it comes to high heeled shoes, we have a special place in our hearts. So we have decided to create the ultimate list of types of heels. Some of these have gone out of style but with the cyclical fashion industry, we won be surprised if they make a comeback soon. Without further ado, we give you 27 heel types. Think you could ace the quiz', 150, N'https://www.angelalarcon.com/6515-home_default/eloise-low-kitten-heels-d-orsay-ankle-strap-pointed-toe.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (2, 1, N'Pumps', 1800.0000, 1500.0000, N'Bought these pumps in Black Multi, size 9-1/2. I normally wear a 9, but because theyre so pointy I decide to size up 1/2 size. Theyre perfect. Love the colorstheyll go with all of my palette. The ONLY thing I dont like us the soles are VERY SLIPPERY on wood and tile flooring. I had to buy adhesive anti-slip sole covers to prevent slip-or-falls.I love these pumps. I wear a lot of black and these black glitter pumps are so cool. The kitten heel is perfect so its high enough but comfortable. Im a size 10 and its hard to find true fitting shoes anymore. These fit true to size. I am very pleased with these', 200, N'https://canary.contestimg.wish.com/api/webimage/59d5da7787e82f1163e7a10f-large.jpg?cache_buster=a37f825374ac903b5311a982f7fe43d8')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (3, 1, N'Stilettos', 1700.0000, 1650.0000, N'I ordered my regular 8.5 in both medium and wide widths in the Fiesta. I received the medium, and it fits perfectly. After 2 weeks, I haven received the wide. I love the bright colors of the Fiesta pair. They are very comfortable. I have always thought my feet were closer to wide than medium, especially because of a bunion on my right foot, but the medium fits to where it won slide around on my feet. I m tempted to get the black multi. Such comfortable, eye catching shoes and on trend.', 350, N'https://5.imimg.com/data5/PI/AN/MY-48738153/stilettos-500x500.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (4, 1, N'Ankle Strap Heels', 1800.0000, 1700.0000, N'True to size! I wear 6.5W, ordered same size in nude beige, and these fit perfectly. My toes were not squished at all because the widest part hit me at the widest part of my foot. Wore with and without stockings. My only concern is the elastic on the strap will wear out, causing me to get more holes punched on strap to tighten shoe in place, or have elastic replaced altogether. Otherwise great shoe from trusted brand. Love lower heel.', 300, N'https://target.scene7.com/is/image/Target/GUEST_3e85b9ea-02b3-417b-9ee7-1e642176effb')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (5, 1, N'Wedge Heels', 2500.0000, 2400.0000, N'Same great footbed. I did go up one size based on other reviewers comments and the wedge and close toe style. This made fit perfect for barefoot feel comfort for me. Leather not to stiff & will soften with wear. Please bring back ALL available colors. I was able to get the black and burgundy, but want the ginger and sand options. Thanks', 150, N'https://tjori.gumlet.com/310x455/tj-kc-124-14-small-image2022-06-15-13:58:34.756888.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (6, 1, N'Wedge Sandals', 3200.0000, 2500.0000, N'Seriously, a gorgeous boot. Super stylish, extremely comfortable and looks high end. It like a sock attached to a boot. Heel is perfect and not too high. I purchased the black and loved them so much, I went back and purchased the burgundy and leopard. The sequin on the leopard doesn stretch as much so go up a little of you can but overall runs true to size. Looks great with leggings, jeans or pants. This is my favorite shoe in my closet', 250, N'https://www.toms.com/on/demandware.static/-/Sites-toms-master-catalog/default/dw6f388cdc/images/product-images/10017913-S.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (7, 1, N'Cone Heels', 4500.0000, 4200.0000, N'Absolutely love these wedges! Very comfortable right out of box and the wedge makes it easy to dress up or down! I love them so much I purchased the other color! You wont be disappointed', 150, N'https://m.media-amazon.com/images/I/61YRajx0c3L._UY500_.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (8, 1, N'Sling Back Heels', 2500.0000, 1900.0000, N'Love this pointy toe sling back! What a profile. Waiting for other colors in my size to come back in stock. As my feet tend to spread at the toes, I ordered a wide. They are super comfortable and fit like a glove. Look great with skirts and dresses. Attractive transition if you are no longer able to wear heels', 150, N'https://www.charleskeith.com/dw/image/v2/BCWJ_PRD/on/demandware.static/-/Sites-ck-products/default/dwec7f6ebe/images/hi-res/2021-L2-CK1-60920241-01-1.jpg?sw=580&sh=774')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (9, 1, N'Platform Heels', 3500.0000, 3200.0000, N'These are lovely shoes. The fit was great and looked fabulous, but sorry to say I had to return them. I have foot issues and the heels were a bit higher than I thought I could stand or walk in for any length of time. Run true to size', 150, N'https://www.versace.com/on/demandware.static/-/Sites-ver-master-catalog/default/dwea6cab47/original/90_1002005-DRA67_1PA4V_20_MedusaAevitasPlatformPumps-PlatformShoes-versace-online-store_2_6.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (10, 1, N'High Heel Sandals', 4500.0000, 4250.0000, N'Super comfy, stylish, well made and look very high end!!! I wore these with a pair of ripped skinny jeans in NYC and felt like a million bucks!! Even had 2 ladies ask me the brand!! I normally wear a 10 but ordered the 11 and was perfectly fine', 170, N'https://5.imimg.com/data5/HR/RM/MY-32391389/designer-party-high-heel-500x500.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (11, 1, N'Peep Toe Heels', 1000.0000, 900.0000, N'They are very comfortable. I ve always thought my feet were closer to wide than medium, especially because of a bunion on my right foot, but the medium fits to where it won slide around on my feet', 150, N'https://www.luxury-shops.com/media/catalog/product/cache/75db745d49fa5d7834a44619d1962341/c/h/christian_louboutin_shelley_85_peep_toe_pumps__60026_1.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (12, 1, N'Cork High Heels', 1600.0000, 1400.0000, N'Sexy, sexy, sexy and so comfortable too! Love these shoes! I wear 9 medium and they run true to size. Love the little bit of stretch at cross piece on top of foot. Cushiony foot bed is nice too', 150, N'https://ae01.alicdn.com/kf/HTB1MrRXfYZnBKNjSZFGq6zt3FXae/Pumps-Shoes-Large-Size-High-Heels-Cork-Sexy-Crossdressed-Burgundy-Fetish-Women-11-Ankle-Strap-Platform.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (13, 2, N'XSport', 1500.0000, 1200.0000, N'Our picks cover most of the top running shoe brands on the market. However, this list isn’t just max-stack shoe after max-stack shoe. We’ve tried to mix in a little trail coverage, a zero-drop option, and a lot more. Sure, more cushion is one of the best ways to add comfort, but we’ve got a little something for everyone', 200, N'https://capvirgo.com/wp-content/uploads/2017/12/IMG_9772.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (14, 2, N'Ultra', 3500.0000, 2200.0000, N'As always, our picks for the most comfortable running shoes come from our own experiences. We’ve worn and reviewed almost everything on our list, and we turn to the community regarding shoes we haven’t worn. We’ll link to our reviews wherever possible to give you even more of our thoughts should you want them', 150, N'https://thesneakerhouse.com/wp-content/uploads/2020/01/ULTRABOOST-20-SHOES-10.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (15, 2, N'KneelJ', 1200.0000, 1100.0000, N'Since Nike debuted its React foam in 2018 with the Epic React, there’s no mistaking it– they have a lock on one of the most comfortable and resilient midsoles in the game. One of the best uses of React to date is in the recently-released Nike Pegasus Trail 4, which has become a fast favorite here at Believe in the Run', 150, N'https://shopgiaythethaogiare.com/wp-content/uploads/2019/03/Giay-adidas-yeezy-boost-700-v2-static.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (16, 2, N'TZUltra', 8000.0000, 7200.0000, N'The Pegasus Trail 4 earns its place among the most comfortable running shoes for its flexibility. It’s not too different from the Pegasus 39 overall, but the rugged outsole gives it some extra trail prowess', 150, N'https://capvirgo.com/wp-content/uploads/2017/12/23915659_304143040086612_1722873620673029931_n.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (17, 2, N'Alibaba', 6500.0000, 6200.0000, N'While it might not be your first choice for the “Beast Coast” trails here in the Mid-Atlantic, it can still handle most terrain you throw at it, and the outsole is improved over last year’s version. Hands down, this is a great option for the West Coast adventurers', 150, N'https://cf.shopee.vn/file/fb9161ceebcd54f78dadd5fe63a10c16')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (18, 2, N'KnockX', 7500.0000, 7200.0000, N'And like we said, we love it as much off the trails as we do on the trails (you can even use it as a daily trainer road shoe in a pinch). Need more protection? Wait ’til the fall for the eventual Gore-Tex version if you want some waterproofing to go with your comfort', 150, N'https://cdn.tgdd.vn/Files/2022/05/28/1435539/cach-chon-size-giay-adidas-ultra-boost-chuan-vua-ban-chan-202205300133494048.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (19, 2, N'Luxury', 1000.0000, 800.0000, N'When you think of Italy, it’s easy to think of comfort. I mean, Tracksmith turns to the boot-shaped nation for almost all of its high-end fabrics. If you think Tracksmith’s standards are high, Diadora’s are even higher. Our review is jam-packed with delicious references to Italian cuisine, and the ride is just as premium', 150, N'https://lzd-img-global.slatic.net/g/p/b990f0f16dd9c94f4fca638bfb869164.jpg_720x720q80.jpg_.webp')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (20, 2, N'SpaceBlack', 3500.0000, 2700.0000, N'Diadora’s brand-new midsole offers a ridiculously smooth ride — think Max Verstappen at Abu Dhabi smooth. We don’t know if the team at Diadora is big into the Brooks Aurora-BL, but it’s easy to make comparisons. Of course, the decoupled midsole is the easiest inspiration to pick out.', 150, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsdVEPD_fHrJjk9JDdQR06wiBOoEkxYoNRfA&usqp=CAU')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (21, 2, N'Junior', 4600.0000, 4300.0000, N'Two words: Flytefoam Blast+. ASICS packed one of its bounciest, most comfortable foams into the latest iteration of its rockered max cushion trainer. Jarrett absolutely loved version two and was already building hype for this version months before it arrived', 200, N'https://cf.shopee.vn/file/c4f3fd886bcda18a48540add68b1ec34')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (22, 2, N'Sanwidth', 7800.0000, 7400.0000, N'Rather than perched on top of it. ASICS built the top layer of its trainer sandwich out of Flytefoam Blast+, as we mentioned before. Below that, you get a more durable one-two punch of traditional Flytefoam with an EVA plate that runs most of the length of the shoe. If there’s one flaw', 150, N'https://product.hstatic.net/200000025394/product/giay_zx_2k_boost_trang_fx7036_01_standard_f602ef4c21d049ac934b66a9a32d3f56_master.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (23, 2, N'Drowning', 8200.0000, 8000.0000, N'The Paradigm line was already Kara’s favorite shoe, and Altra sat down to figure out some ideas on how to make it better. For starters, there are a few poppin’ colorways to sink your feet into. It rides on a thick, and we do mean thick, bed of Ego Max foam, which offers extra bounce and response through your miles', 150, N'https://swagger.com.vn/wp-content/uploads/2020/03/adidas-Yeezy-Boost-380-Alien.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (24, 2, N'Fear', 9500.0000, 9200.0000, N'Meg and Ben Johnson weren’t far behind, with Meg admitting to cheating on her beloved Clifton just a little bit with this new spring fling. It’s not as light as the previous version, but it’s softer and more comfortable, and this is even a running shoe for the Jarretts of the world', 150, N'https://cdn.elly.vn/uploads/2021/07/05000504/top-dong-giay-adidas-ultra-boost-noi-dinh-noi-dam-nhat-hien-nay.5.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (25, 3, N'Night Wolf', 2300.0000, 2300.0000, N'Very nice you can choose for everywhere you go', 160, N'https://cf.shopee.vn/file/836df9eab369a10a814a1376de24a7af')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (26, 3, N'Owl', 3300.0000, 1200.0000, N'Singlets are a must-have for summer GRIT, not least because they keep the farmer’s tan from getting too bad. This version from New Balance just landed at Running Warehouse, and it matches the latest set of FuelCell racing shoes perfectly. You’ll be seeing a lot more of the Vibrant Springs colorway over the next year, to say the least.', 150, N'https://product.hstatic.net/1000230642/product/dsc_0016_fbe754cbacde472d83198eb93e491911_master.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (27, 3, N'Kiwi', 2500.0000, 2200.0000, N'Now, we have the Saucony Tempus. It’s still a stability shoe, but it’s anything but bulky or bland. In fact, it might be the future of stability as a whole. The Tempus blends a PWRRUN PB core (the same foam as in the Endorphin series) with a stiffer PWRRUN frame for a great mix of comfort, speed, and style', 150, N'https://product.hstatic.net/1000284478/product/03_374862_1_2bf2923f577040229fb812fc9834b10b_master.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (28, 3, N'Oriana', 1800.0000, 1600.0000, N'Sleeveless shirts and shorts are the two things you really need for summer GRIT. Well, sunscreen and a hat don’t hurt, but still. Running Warehouse just got a new shipment of shorts in, and the Vuori Seabreeze is screaming our name. Maybe it’s just because it sounds like a day at the beach', 250, N'https://vn-test-11.slatic.net/p/ac01a747d1d3c1cf43893cb0a6374a51.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (29, 3, N'Spectacular', 1900.0000, 1250.0000, N'It looks an awful lot like Nike tried to copy Teva’s homework and change a few things, but there’s nothing wrong with that. You get a rugged outsole, complete with a few waffle lugs, as is tradition. The strappy design should also keep you comfortable across whatever you’re hiking through', 150, N'https://product.hstatic.net/1000230642/product/dewh00900hog39_4__287757a50d4d4a788bbd375b71627c4b_1024x1024.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (30, 3, N'Kinjaz', 3500.0000, 3200.0000, N'If there’s one Nike trail shoe to top our list, well, this is it. We pegged this as one of the most comfortable shoes ever last year and it’s only gotten better since then. The newest version loses an ounce of weight but still retains ultimate comfort thanks to the large stack of full React in the midsole.', 180, N'https://media.dior.com/couture/ecommerce/media/catalog/product/P/V/1617793847_KCQ547LAB_S900_E02_GHC.jpg?imwidth=800')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (31, 3, N'Kyrie', 5500.0000, 5200.0000, N'On the trail, the React midsole in the Pegasus Trail 4 provides comfort over any distance, without feeling clunky or losing ground feel. The updates in this model include a better fitting upper, more room in the toe box, and a re-formulated outsole pattern that provides better traction than last year’s model. ', 150, N'http://img.mwc.com.vn//Upload/2022/06/z3472840052238-6133c04f26519d2e19f8f6f06e894d4b.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (32, 3, N'Urai', 4600.0000, 4300.0000, N'The result is a nimble trail shoe that feels almost like a slipper on the run. Simply put, it’s a huge win any time you get a shoe that feels like an extension of your foot. But that’s not all! What makes this shoe really shine is the way it transitions to the road. In fact, we wouldn’t hesitate to recommend this for someone looking for a great road shoe, it works that well.', 150, N'https://5.imimg.com/data5/MR/UI/MY-32391389/wedges-sandal-500x500.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (33, 3, N'Jayce', 3800.0000, 3200.0000, N'The first thing you notice when you see a Nike Trail shoe is the colors. Oh, the colors. In a world dominated by earthen browns and dark greens, as if we’re trying to actually hide our shoes on the trails, Nike has always pushed the envelope with bold designs. ', 150, N'https://m.media-amazon.com/images/I/61Fb6ndoPOL._UY500_.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (34, 3, N'Lisandra', 1000.0000, 700.0000, N'Whether you’re talking about the cotton candy pink and sky blues of the Terra Kiger 5, or the volt yellow that has become a Nike signature, there’s no denying it– the shoes just look good, on or off the trail. ', 150, N'https://inhat.vn/hcm/wp-content/uploads/2020/08/shop-ban-giay-sandal-nu-dep-o-tphcm-12-min.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (35, 3, N'KingZ', 1500.0000, 1400.0000, N'From a new take on stability with the very fun Tempus to the excellent updates in the road Endorphin line (Speed 3 and Pro 3), Saucony is hammering out the hits. Then, there’s the trail side, typically the afterthought of the shoe segment. Not this year. Saucony is showing its love for the great outdoors, and no shoe says so more than the Endorphin Edge.', 150, N'https://thegioigiaythethao.vn/images/attachment/217Dep-New-Balance--SD3205PPC-.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (36, 3, N'Halaluja', 5600.0000, 4900.0000, N'It may be a new shoe for the trail, but it takes a refined road recipe and cranks it up a little bit. The PWRRUN PB foam, SpeedRoll geometry, and plate are all holdovers from the Endorphin Pro, but the Edge has some new wrinkles.', 150, N'https://images.dsw.com/is/image/DSWShoes/526572_996_ss_01')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (37, 4, N'Jordan 1', 2300.0000, 1200.0000, N'I don’t know about you, but we’re definitely ready for the world championships in Eugene in a few weeks. I mean, the best and brightest on the track scene, back at Hayward Field all over again? Don’t get me wrong, we didn’t qualify, we’re just there to enjoy the action. Now, you can enjoy it too from the comfort of your own home.', 150, N'https://sneakernews.com/wp-content/uploads/2022/04/air-jordan-4-retro-military-black-dh6927-111-release-date-7.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (38, 4, N'Jordan 7', 3300.0000, 1200.0000, N'Singlets are a must-have for summer GRIT, not least because they keep the farmer’s tan from getting too bad. This version from New Balance just landed at Running Warehouse, and it matches the latest set of FuelCell racing shoes perfectly. You’ll be seeing a lot more of the Vibrant Springs colorway over the next year, to say the least.', 150, N'https://static.nike.com/a/videos/t_PDP_1280_v1/f_auto,q_auto:eco,so_22.7/cebf1e0f-d220-4ae0-8d61-e08325a811ca/air-jordan-1-hi-flyease-shoes-Mqc70W.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (39, 4, N'Jordan 6 Ultra', 2500.0000, 2200.0000, N'Now, we have the Saucony Tempus. It’s still a stability shoe, but it’s anything but bulky or bland. In fact, it might be the future of stability as a whole. The Tempus blends a PWRRUN PB core (the same foam as in the Endorphin series) with a stiffer PWRRUN frame for a great mix of comfort, speed, and style', 150, N'https://5.imimg.com/data5/ANDROID/Default/2021/8/UR/IO/IT/54132075/product-jpeg-500x500.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (40, 4, N'Super Fake', 1800.0000, 1600.0000, N'Sleeveless shirts and shorts are the two things you really need for summer GRIT. Well, sunscreen and a hat don’t hurt, but still. Running Warehouse just got a new shipment of shorts in, and the Vuori Seabreeze is screaming our name. Maybe it’s just because it sounds like a day at the beach', 250, N'https://media.gq-magazine.co.uk/photos/62602123724855eb517200cc/master/w_1600%2Cc_limit/air_jordan_1_inverted.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (41, 4, N'OG', 1900.0000, 1250.0000, N'It looks an awful lot like Nike tried to copy Teva’s homework and change a few things, but there’s nothing wrong with that. You get a rugged outsole, complete with a few waffle lugs, as is tradition. The strappy design should also keep you comfortable across whatever you’re hiking through', 150, N'https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2021%2F10%2Fair-jordan-1-high-og-rebellionaire-closer-look-release-info-555088-036-001.jpg?q=75&w=800&cbr=1&fit=max')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (42, 4, N'Predatorz', 3500.0000, 3200.0000, N'If there’s one Nike trail shoe to top our list, well, this is it. We pegged this as one of the most comfortable shoes ever last year and it’s only gotten better since then. The newest version loses an ounce of weight but still retains ultimate comfort thanks to the large stack of full React in the midsole.', 180, N'https://media.vanityfair.com/photos/5ebc58fb77a607fc7f7f15af/master/w_2000,h_1428,c_limit/air-jordan-x-dior-embed01.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (43, 4, N'Kyle', 5500.0000, 5200.0000, N'On the trail, the React midsole in the Pegasus Trail 4 provides comfort over any distance, without feeling clunky or losing ground feel. The updates in this model include a better fitting upper, more room in the toe box, and a re-formulated outsole pattern that provides better traction than last year’s model. ', 150, N'https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_auto,w_1400/fl_lossy,pg_1/peaamam7rsb3nabpozu7/michael-jordan-air-jordan-1-broken-foot-pe?fimg-ssr-default')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (44, 4, N'Nautilus', 4600.0000, 4300.0000, N'The result is a nimble trail shoe that feels almost like a slipper on the run. Simply put, it’s a huge win any time you get a shoe that feels like an extension of your foot. But that’s not all! What makes this shoe really shine is the way it transitions to the road. In fact, we wouldn’t hesitate to recommend this for someone looking for a great road shoe, it works that well.', 150, N'https://media.architecturaldigest.com/photos/57a11cbeb6c434ab487bc26b/4:3/w_1032,h_774,c_limit/nikes-senior-designer-explains-what-went-into-new-air-jordan-01.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (45, 4, N'Meji', 3800.0000, 3200.0000, N'The first thing you notice when you see a Nike Trail shoe is the colors. Oh, the colors. In a world dominated by earthen browns and dark greens, as if we’re trying to actually hide our shoes on the trails, Nike has always pushed the envelope with bold designs. ', 150, N'https://static.nike.com/a/images/t_prod_ss/w_960,c_limit,f_auto/9114dec2-8e26-4747-afda-6a7cf0c77c97/air-jordan-4-white-and-black-dh6927-111-release-date.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (46, 4, N'Hailidao', 1000.0000, 700.0000, N'Whether you’re talking about the cotton candy pink and sky blues of the Terra Kiger 5, or the volt yellow that has become a Nike signature, there’s no denying it– the shoes just look good, on or off the trail. ', 350, N'https://www.snipesusa.com/on/demandware.static/-/Sites-snipesusa-Library/default/dw4337c002/images/brand-pages/jordan/AJ1-3-25-2.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_salePrice], [product_describe], [quantity], [img]) VALUES (52, 4, N'Mirinda', NULL, 800.0000, N'Good!!!1', 160, N'https://dily-img.b-cdn.net/Y6FUT8DNoQWyD-EczfPPgSoU92sX4yy7f23-DE3p6pY/rs:fit:600:800:0/ex:1:ce/background:eeeeee/aHR0cDovL3MzLmFwLW5vcnRoZWFzdC0xLndhc2FiaXN5cy5jb20vaG5jLWNybS1zMy5nZXRjb252ZXJzaW9uLmNvL3dlYmVjb20vMjAyMi8wNS9lMzRhOTZjODdkZjQ4NWVhZmZlYzU2M2U4MjNlYjNmYi5wbmc.jpg')
SET IDENTITY_INSERT [dbo].[product] OFF
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
USE [master]
GO
ALTER DATABASE [clothesShop] SET  READ_WRITE 
GO
