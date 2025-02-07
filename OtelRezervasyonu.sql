USE [OtelRezervasyonu]
GO
/****** Object:  Table [dbo].[Fatura]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fatura](
	[FaturaID] [int] IDENTITY(1,1) NOT NULL,
	[RezervasyonID] [int] NOT NULL,
	[ToplamTutar] [decimal](10, 2) NULL,
	[OdemeTarihi] [date] NULL,
	[IsDelete] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FaturaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kasa]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kasa](
	[KasaID] [int] IDENTITY(1,1) NOT NULL,
	[FaturaID] [int] NOT NULL,
	[Tutar] [decimal](10, 2) NULL,
	[Tarih] [date] NULL,
	[IsDelete] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KasaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NOT NULL,
	[Sifre] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[MusteriID] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NULL,
	[Soyad] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Telefon] [nvarchar](20) NULL,
	[IsDelete] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oda]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oda](
	[OdaID] [int] IDENTITY(1,1) NOT NULL,
	[OdaNo] [int] NULL,
	[YatakSayisi] [int] NULL,
	[Durum] [nvarchar](20) NULL,
	[IsDelete] [bit] NOT NULL,
	[Kat] [int] NULL,
	[Fiyat] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OdaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[PersonelID] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NULL,
	[Soyad] [nvarchar](50) NULL,
	[Gorev] [nvarchar](50) NULL,
	[IsDelete] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezervasyon]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervasyon](
	[RezervasyonID] [int] IDENTITY(1,1) NOT NULL,
	[MusteriID] [int] NOT NULL,
	[OdaID] [int] NOT NULL,
	[GirisTarihi] [date] NULL,
	[CikisTarihi] [date] NULL,
	[IsDelete] [bit] NOT NULL,
	[ToplamFiyat] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[RezervasyonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Fatura] ON 

INSERT [dbo].[Fatura] ([FaturaID], [RezervasyonID], [ToplamTutar], [OdemeTarihi], [IsDelete]) VALUES (11, 24, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2024-07-27' AS Date), 0)
INSERT [dbo].[Fatura] ([FaturaID], [RezervasyonID], [ToplamTutar], [OdemeTarihi], [IsDelete]) VALUES (12, 25, CAST(400.00 AS Decimal(10, 2)), CAST(N'2024-07-27' AS Date), 0)
INSERT [dbo].[Fatura] ([FaturaID], [RezervasyonID], [ToplamTutar], [OdemeTarihi], [IsDelete]) VALUES (13, 26, CAST(2000.00 AS Decimal(10, 2)), CAST(N'2024-07-27' AS Date), 0)
INSERT [dbo].[Fatura] ([FaturaID], [RezervasyonID], [ToplamTutar], [OdemeTarihi], [IsDelete]) VALUES (14, 27, CAST(400.00 AS Decimal(10, 2)), CAST(N'2024-07-27' AS Date), 0)
INSERT [dbo].[Fatura] ([FaturaID], [RezervasyonID], [ToplamTutar], [OdemeTarihi], [IsDelete]) VALUES (15, 28, CAST(4000.00 AS Decimal(10, 2)), CAST(N'2024-07-27' AS Date), 0)
INSERT [dbo].[Fatura] ([FaturaID], [RezervasyonID], [ToplamTutar], [OdemeTarihi], [IsDelete]) VALUES (16, 29, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2024-07-27' AS Date), 0)
INSERT [dbo].[Fatura] ([FaturaID], [RezervasyonID], [ToplamTutar], [OdemeTarihi], [IsDelete]) VALUES (17, 30, CAST(2000.00 AS Decimal(10, 2)), CAST(N'2024-07-27' AS Date), 0)
INSERT [dbo].[Fatura] ([FaturaID], [RezervasyonID], [ToplamTutar], [OdemeTarihi], [IsDelete]) VALUES (18, 31, CAST(2400.00 AS Decimal(10, 2)), CAST(N'2024-07-27' AS Date), 0)
INSERT [dbo].[Fatura] ([FaturaID], [RezervasyonID], [ToplamTutar], [OdemeTarihi], [IsDelete]) VALUES (67, 32, CAST(4200.00 AS Decimal(10, 2)), CAST(N'2024-07-27' AS Date), 0)
INSERT [dbo].[Fatura] ([FaturaID], [RezervasyonID], [ToplamTutar], [OdemeTarihi], [IsDelete]) VALUES (68, 34, CAST(400.00 AS Decimal(10, 2)), CAST(N'2024-07-28' AS Date), 0)
INSERT [dbo].[Fatura] ([FaturaID], [RezervasyonID], [ToplamTutar], [OdemeTarihi], [IsDelete]) VALUES (69, 35, CAST(3200.00 AS Decimal(10, 2)), CAST(N'2024-07-30' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Fatura] OFF
GO
SET IDENTITY_INSERT [dbo].[Kasa] ON 

INSERT [dbo].[Kasa] ([KasaID], [FaturaID], [Tutar], [Tarih], [IsDelete]) VALUES (13, 11, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2024-07-30' AS Date), 0)
INSERT [dbo].[Kasa] ([KasaID], [FaturaID], [Tutar], [Tarih], [IsDelete]) VALUES (14, 68, CAST(400.00 AS Decimal(10, 2)), CAST(N'2024-07-30' AS Date), 0)
INSERT [dbo].[Kasa] ([KasaID], [FaturaID], [Tutar], [Tarih], [IsDelete]) VALUES (15, 12, CAST(400.00 AS Decimal(10, 2)), CAST(N'2024-07-30' AS Date), 0)
INSERT [dbo].[Kasa] ([KasaID], [FaturaID], [Tutar], [Tarih], [IsDelete]) VALUES (16, 13, CAST(2000.00 AS Decimal(10, 2)), CAST(N'2024-07-30' AS Date), 0)
INSERT [dbo].[Kasa] ([KasaID], [FaturaID], [Tutar], [Tarih], [IsDelete]) VALUES (17, 14, CAST(400.00 AS Decimal(10, 2)), CAST(N'2024-07-30' AS Date), 0)
INSERT [dbo].[Kasa] ([KasaID], [FaturaID], [Tutar], [Tarih], [IsDelete]) VALUES (18, 15, CAST(4000.00 AS Decimal(10, 2)), CAST(N'2024-07-30' AS Date), 0)
INSERT [dbo].[Kasa] ([KasaID], [FaturaID], [Tutar], [Tarih], [IsDelete]) VALUES (19, 16, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2024-07-30' AS Date), 0)
INSERT [dbo].[Kasa] ([KasaID], [FaturaID], [Tutar], [Tarih], [IsDelete]) VALUES (20, 17, CAST(2000.00 AS Decimal(10, 2)), CAST(N'2024-07-30' AS Date), 0)
INSERT [dbo].[Kasa] ([KasaID], [FaturaID], [Tutar], [Tarih], [IsDelete]) VALUES (21, 18, CAST(2400.00 AS Decimal(10, 2)), CAST(N'2024-07-30' AS Date), 0)
INSERT [dbo].[Kasa] ([KasaID], [FaturaID], [Tutar], [Tarih], [IsDelete]) VALUES (22, 67, CAST(4200.00 AS Decimal(10, 2)), CAST(N'2024-07-30' AS Date), 0)
INSERT [dbo].[Kasa] ([KasaID], [FaturaID], [Tutar], [Tarih], [IsDelete]) VALUES (23, 69, CAST(3200.00 AS Decimal(10, 2)), CAST(N'2024-07-30' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Kasa] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([KullaniciID], [KullaniciAdi], [Sifre]) VALUES (1, N'admin', N'12345')
INSERT [dbo].[Kullanici] ([KullaniciID], [KullaniciAdi], [Sifre]) VALUES (2, N'admin', N'12345')
INSERT [dbo].[Kullanici] ([KullaniciID], [KullaniciAdi], [Sifre]) VALUES (3, N'admin', N'12345')
INSERT [dbo].[Kullanici] ([KullaniciID], [KullaniciAdi], [Sifre]) VALUES (4, N'admin', N'12345')
INSERT [dbo].[Kullanici] ([KullaniciID], [KullaniciAdi], [Sifre]) VALUES (5, N'admin', N'12345')
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
GO
SET IDENTITY_INSERT [dbo].[Musteri] ON 

INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Email], [Telefon], [IsDelete]) VALUES (26, N'ere', N'werewr', N'werwwer', N'werwrwr', 1)
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Email], [Telefon], [IsDelete]) VALUES (27, N'Ayşe', N'Kara', N'ayse.kara@example.com', N'5556667788', 0)
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Email], [Telefon], [IsDelete]) VALUES (28, N'Mehmet', N'Şahin', N'mehmet.sahin@example.com', N'9998887766', 0)
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Email], [Telefon], [IsDelete]) VALUES (29, N'Fatma', N'Çelik', N'fatma.celik@example.com', N'4445556677', 1)
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Email], [Telefon], [IsDelete]) VALUES (30, N'Ali', N'Demir', N'ali.demir@example.com', N'3334445566', 1)
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Email], [Telefon], [IsDelete]) VALUES (36, N'Tarık', N'DEMİR', N'demirtarik4@gmail.com', N'05078958912', 0)
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Email], [Telefon], [IsDelete]) VALUES (38, N'Cansel', N'Yayan', N'cyayan99@gmail.com', N'05300741860', 0)
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Email], [Telefon], [IsDelete]) VALUES (39, N'fatma', N'paltacı', N'fatmapaltcaı@gmail.com', N'06098978765', 0)
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Email], [Telefon], [IsDelete]) VALUES (40, N'rıfat', N'ılgaz', N'rıfatılgaz@gmail.com', N'09878978912', 1)
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Email], [Telefon], [IsDelete]) VALUES (41, N'Fatma', N'Paltacı', N'demir', N'05078958912', 1)
INSERT [dbo].[Musteri] ([MusteriID], [Ad], [Soyad], [Email], [Telefon], [IsDelete]) VALUES (42, N'Ttttt', N'Dddddd', N'adasds223', N'0987asda', 1)
SET IDENTITY_INSERT [dbo].[Musteri] OFF
GO
SET IDENTITY_INSERT [dbo].[Oda] ON 

INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (40, 1, 2, N'Rezerve', 0, 1, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (41, 2, 4, N'Rezerve', 0, 1, CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (42, 3, 1, N'Temizleniyor', 0, 1, CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (43, 4, 2, N'Rezerve', 0, 1, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (44, 5, 4, N'Tadilatta', 0, 1, CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (45, 6, 2, N'Dolu', 0, 1, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (46, 7, 2, N'Boş', 0, 1, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (47, 8, 3, N'Dolu', 0, 1, CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (48, 9, 1, N'Temizleniyor', 0, 1, CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (49, 10, 2, N'Rezerve', 0, 1, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (50, 11, 2, N'Boş', 0, 2, CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (51, 12, 3, N'Dolu', 0, 2, CAST(600.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (52, 13, 1, N'Temizleniyor', 0, 2, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (53, 14, 2, N'Rezerve', 0, 2, CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (54, 15, 4, N'Tadilatta', 0, 2, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (55, 16, 2, N'Boş', 0, 2, CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (56, 17, 4, N'Boş', 0, 2, CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (57, 18, 3, N'Dolu', 0, 2, CAST(600.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (58, 19, 1, N'Temizleniyor', 0, 2, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (59, 20, 2, N'Rezerve', 0, 2, CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (60, 21, 2, N'Tadilatta', 1, 3, CAST(600.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (61, 21, 5, N'Tadilatta', 1, 3, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (62, 21, 3, N'Boş', 1, 3, CAST(900.00 AS Decimal(10, 2)))
INSERT [dbo].[Oda] ([OdaID], [OdaNo], [YatakSayisi], [Durum], [IsDelete], [Kat], [Fiyat]) VALUES (63, 21, 4, N'Dolu', 0, 3, CAST(1200.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Oda] OFF
GO
SET IDENTITY_INSERT [dbo].[Personel] ON 

INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Gorev], [IsDelete]) VALUES (1, N'Ahmet', N'Yılmaz', N'Müdür', 0)
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Gorev], [IsDelete]) VALUES (2, N'Mehmet', N'Demir', N'Resepsiyonist', 0)
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Gorev], [IsDelete]) VALUES (3, N'Ayşe', N'Kaya', N'Temizlik Görevlisi', 0)
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Gorev], [IsDelete]) VALUES (4, N'Ahmet', N'Yılmaz', N'Müdür', 0)
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Gorev], [IsDelete]) VALUES (5, N'Mehmet', N'Demir', N'Resepsiyonist', 0)
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Gorev], [IsDelete]) VALUES (6, N'Ayşe', N'Kaya', N'Temizlik Görevlisi', 0)
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Gorev], [IsDelete]) VALUES (7, N'Ahmet', N'Yılmaz', N'Müdür', 0)
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Gorev], [IsDelete]) VALUES (8, N'Mehmet', N'Demir', N'Resepsiyonist', 0)
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Gorev], [IsDelete]) VALUES (9, N'Ayşe', N'Kaya', N'Temizlik Görevlisi', 0)
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Gorev], [IsDelete]) VALUES (10, N'Ahmet', N'Yılmaz', N'Müdür', 0)
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Gorev], [IsDelete]) VALUES (11, N'Mehmet', N'Demir', N'Resepsiyonist', 0)
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Gorev], [IsDelete]) VALUES (12, N'Ayşe', N'Kaya', N'Temizlik Görevlisi', 0)
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Gorev], [IsDelete]) VALUES (13, N'Ahmet', N'Yılmaz', N'Müdür', 0)
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Gorev], [IsDelete]) VALUES (14, N'Mehmet', N'Demir', N'Resepsiyonist', 0)
INSERT [dbo].[Personel] ([PersonelID], [Ad], [Soyad], [Gorev], [IsDelete]) VALUES (15, N'Ayşe', N'Kaya', N'Temizlik Görevlisi', 0)
SET IDENTITY_INSERT [dbo].[Personel] OFF
GO
SET IDENTITY_INSERT [dbo].[Rezervasyon] ON 

INSERT [dbo].[Rezervasyon] ([RezervasyonID], [MusteriID], [OdaID], [GirisTarihi], [CikisTarihi], [IsDelete], [ToplamFiyat]) VALUES (24, 28, 40, CAST(N'2024-08-10' AS Date), CAST(N'2024-08-15' AS Date), 0, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[Rezervasyon] ([RezervasyonID], [MusteriID], [OdaID], [GirisTarihi], [CikisTarihi], [IsDelete], [ToplamFiyat]) VALUES (25, 27, 43, CAST(N'2024-07-28' AS Date), CAST(N'2024-07-30' AS Date), 0, CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[Rezervasyon] ([RezervasyonID], [MusteriID], [OdaID], [GirisTarihi], [CikisTarihi], [IsDelete], [ToplamFiyat]) VALUES (26, 28, 55, CAST(N'2024-07-28' AS Date), CAST(N'2024-07-29' AS Date), 0, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Rezervasyon] ([RezervasyonID], [MusteriID], [OdaID], [GirisTarihi], [CikisTarihi], [IsDelete], [ToplamFiyat]) VALUES (27, 27, 40, CAST(N'2024-08-10' AS Date), CAST(N'2024-08-12' AS Date), 0, CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[Rezervasyon] ([RezervasyonID], [MusteriID], [OdaID], [GirisTarihi], [CikisTarihi], [IsDelete], [ToplamFiyat]) VALUES (28, 28, 56, CAST(N'2024-08-15' AS Date), CAST(N'2024-08-25' AS Date), 0, CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[Rezervasyon] ([RezervasyonID], [MusteriID], [OdaID], [GirisTarihi], [CikisTarihi], [IsDelete], [ToplamFiyat]) VALUES (29, 26, 40, CAST(N'2024-09-10' AS Date), CAST(N'2024-09-15' AS Date), 0, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[Rezervasyon] ([RezervasyonID], [MusteriID], [OdaID], [GirisTarihi], [CikisTarihi], [IsDelete], [ToplamFiyat]) VALUES (30, 27, 41, CAST(N'2024-08-10' AS Date), CAST(N'2024-08-15' AS Date), 0, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[Rezervasyon] ([RezervasyonID], [MusteriID], [OdaID], [GirisTarihi], [CikisTarihi], [IsDelete], [ToplamFiyat]) VALUES (31, 28, 40, CAST(N'2024-06-28' AS Date), CAST(N'2024-07-10' AS Date), 0, CAST(2400.00 AS Decimal(10, 2)))
INSERT [dbo].[Rezervasyon] ([RezervasyonID], [MusteriID], [OdaID], [GirisTarihi], [CikisTarihi], [IsDelete], [ToplamFiyat]) VALUES (32, 28, 40, CAST(N'2024-09-29' AS Date), CAST(N'2024-10-20' AS Date), 0, CAST(4200.00 AS Decimal(10, 2)))
INSERT [dbo].[Rezervasyon] ([RezervasyonID], [MusteriID], [OdaID], [GirisTarihi], [CikisTarihi], [IsDelete], [ToplamFiyat]) VALUES (34, 26, 41, CAST(N'2024-07-30' AS Date), CAST(N'2024-07-29' AS Date), 0, CAST(-400.00 AS Decimal(10, 2)))
INSERT [dbo].[Rezervasyon] ([RezervasyonID], [MusteriID], [OdaID], [GirisTarihi], [CikisTarihi], [IsDelete], [ToplamFiyat]) VALUES (35, 28, 55, CAST(N'2024-08-12' AS Date), CAST(N'2024-08-20' AS Date), 0, CAST(3200.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Rezervasyon] OFF
GO
ALTER TABLE [dbo].[Fatura] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Kasa] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Musteri] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Oda] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Personel] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Rezervasyon] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Fatura]  WITH CHECK ADD FOREIGN KEY([RezervasyonID])
REFERENCES [dbo].[Rezervasyon] ([RezervasyonID])
GO
ALTER TABLE [dbo].[Kasa]  WITH CHECK ADD  CONSTRAINT [FK__Kasa__FaturaID__59063A47] FOREIGN KEY([FaturaID])
REFERENCES [dbo].[Fatura] ([FaturaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Kasa] CHECK CONSTRAINT [FK__Kasa__FaturaID__59063A47]
GO
ALTER TABLE [dbo].[Rezervasyon]  WITH CHECK ADD FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Musteri] ([MusteriID])
GO
ALTER TABLE [dbo].[Rezervasyon]  WITH CHECK ADD FOREIGN KEY([OdaID])
REFERENCES [dbo].[Oda] ([OdaID])
GO
ALTER TABLE [dbo].[Oda]  WITH CHECK ADD CHECK  (([Durum]='Rezerve' OR [Durum]='Tadilatta' OR [Durum]='Temizleniyor' OR [Durum]='Boş' OR [Durum]='Dolu'))
GO
/****** Object:  StoredProcedure [dbo].[FaturaListele]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FaturaListele]
AS
BEGIN
    SELECT FaturaID, RezervasyonID, ToplamTutar, OdemeTarihi
    FROM Fatura
    WHERE IsDelete = 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[KasaGuncelleVeListele]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[KasaGuncelleVeListele]
AS
BEGIN
    UPDATE Kasa
    SET Tutar = (SELECT ToplamTutar FROM Fatura WHERE Fatura.FaturaID = Kasa.FaturaID AND Fatura.IsDelete = 0)
    WHERE IsDelete = 0;

    SELECT 
        KasaID, 
        FaturaID, 
        Tutar, 
        Tarih,
        IsDelete
    FROM 
        Kasa
    WHERE 
        IsDelete = 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[MusteriEkle]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MusteriEkle]
    @Ad NVARCHAR(50),
    @Soyad NVARCHAR(50),
    @Email NVARCHAR(100),
    @Telefon NVARCHAR(20)
AS
BEGIN
    INSERT INTO Musteri (Ad, Soyad, Email, Telefon, IsDelete) 
    VALUES (@Ad, @Soyad, @Email, @Telefon, 0);
END;

GO
/****** Object:  StoredProcedure [dbo].[MusteriGuncelle]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MusteriGuncelle]
    @MusteriID INT,
    @Ad NVARCHAR(50),
    @Soyad NVARCHAR(50),
    @Telefon NVARCHAR(20),
    @Email NVARCHAR(100)
AS
BEGIN
    UPDATE Musteri
    SET Ad = @Ad,
        Soyad = @Soyad,
        Telefon = @Telefon,
        Email = @Email
    WHERE MusteriID = @MusteriID AND IsDelete = 0;
END;

GO
/****** Object:  StoredProcedure [dbo].[MusteriListele]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MusteriListele]
AS
BEGIN
    SELECT MusteriID, Ad, Soyad, Email, Telefon
    FROM Musteri
    WHERE IsDelete = 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[MusteriSil]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MusteriSil]
    @MusteriID INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Musteri WHERE MusteriID = @MusteriID AND IsDelete = 0)
    BEGIN
        UPDATE Musteri
        SET IsDelete = 1
        WHERE MusteriID = @MusteriID;
    END
    ELSE
    BEGIN
        RAISERROR('Müşteri bulunamadı veya zaten silinmiş.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[OdaEkle]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OdaEkle]
    @OdaNo INT,
    @YatakSayisi INT,
    @Durum NVARCHAR(20),
    @Kat INT,
    @Fiyat DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Oda (OdaNo, YatakSayisi, Durum, Kat, Fiyat) 
    VALUES (@OdaNo, @YatakSayisi, @Durum, @Kat, @Fiyat);
END;

GO
/****** Object:  StoredProcedure [dbo].[OdaGuncelle]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OdaGuncelle]
    @OdaID INT,
    @OdaNo INT,
    @YatakSayisi INT,
    @Durum NVARCHAR(20),
    @Kat INT,
    @Fiyat DECIMAL(10, 2)
AS
BEGIN
    UPDATE Oda
    SET OdaNo = @OdaNo, 
        YatakSayisi = @YatakSayisi,
        Durum = @Durum,
        Kat = @Kat,
        Fiyat = @Fiyat
    WHERE OdaID = @OdaID AND IsDelete = 0;
END;

GO
/****** Object:  StoredProcedure [dbo].[OdaListele]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OdaListele]
AS
BEGIN
    SELECT OdaID, OdaNo, YatakSayisi, Durum, Kat, Fiyat
    FROM Oda where IsDelete=0
END
GO
/****** Object:  StoredProcedure [dbo].[OdaSil]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE
PROCEDURE [dbo].[OdaSil]
    @OdaID INT
AS
BEGIN
    UPDATE Oda
    SET IsDelete = 1
    WHERE OdaID = @OdaID;
END;

GO
/****** Object:  StoredProcedure [dbo].[PersonelEkle]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[PersonelEkle]
    @Ad NVARCHAR(50),
    @Soyad NVARCHAR(50),
    @Gorev NVARCHAR(50)
AS
BEGIN
    INSERT INTO Personel (Ad, Soyad, Gorev, IsDelete) 
    VALUES (@Ad, @Soyad, @Gorev, 0);
END;

GO
/****** Object:  StoredProcedure [dbo].[PersonelGuncelle]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[PersonelGuncelle]
    @PersonelID INT,
    @Ad NVARCHAR(50),
    @Soyad NVARCHAR(50),
    @Gorev NVARCHAR(50)
AS
BEGIN
    UPDATE Personel
    SET Ad = @Ad,
        Soyad = @Soyad,
        Gorev = @Gorev
    WHERE PersonelID = @PersonelID AND IsDelete = 0;
END;

GO
/****** Object:  StoredProcedure [dbo].[PersonelListele]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PersonelListele]
AS
BEGIN
    SELECT PersonelID, Ad, Soyad, Gorev
    FROM Personel
    WHERE IsDelete = 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[PersonelSil]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[PersonelSil]
    @PersonelID INT
AS
BEGIN
    UPDATE Personel
    SET IsDelete = 1
    WHERE PersonelID = @PersonelID;
END;

GO
/****** Object:  StoredProcedure [dbo].[RezervasyonEkle]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RezervasyonEkle]
    @MusteriID INT,
    @OdaID INT,
    @GirisTarihi DATE,
    @CikisTarihi DATE
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Musteri WHERE MusteriID = @MusteriID)
    BEGIN
        RAISERROR('Geçerli bir müşteri bulunamadı.', 16, 1);
        RETURN;
    END

    IF @GirisTarihi < CONVERT(DATE, GETDATE()) OR @CikisTarihi < CONVERT(DATE, GETDATE())
    BEGIN
        RAISERROR('Geçmiş tarihler için rezervasyon yapılamaz.', 16, 1);
        RETURN;
    END

    DECLARE @OdaDurumu NVARCHAR(50);
    SELECT @OdaDurumu = Durum FROM Oda WHERE OdaID = @OdaID;

    IF @OdaDurumu <> 'Boş'
    BEGIN
        RAISERROR('Bu oda yalnızca boş ise rezervasyon yapılabilir. (Durum: %s)', 16, 1, @OdaDurumu);
        RETURN;
    END

    IF EXISTS (
        SELECT 1
        FROM Rezervasyon
        WHERE OdaID = @OdaID
        AND (
            (GirisTarihi <= @CikisTarihi AND CikisTarihi >= @GirisTarihi)
        )
    )
    BEGIN
        RAISERROR('Bu oda bu tarihlerde zaten rezerve edilmiş.', 16, 1);
        RETURN;
    END

    DECLARE @Fiyat DECIMAL(10, 2);
    DECLARE @GunSayisi INT;
    DECLARE @ToplamFiyat DECIMAL(10, 2);

    SELECT @Fiyat = Fiyat
    FROM Oda
    WHERE OdaID = @OdaID;

    SET @GunSayisi = DATEDIFF(DAY, @GirisTarihi, @CikisTarihi);
    SET @ToplamFiyat = @GunSayisi * @Fiyat;

    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO Rezervasyon (MusteriID, OdaID, GirisTarihi, CikisTarihi, ToplamFiyat, IsDelete)
        VALUES (@MusteriID, @OdaID, @GirisTarihi, @CikisTarihi, @ToplamFiyat, 0);

        DECLARE @FaturaID INT;
        INSERT INTO Fatura (RezervasyonID, ToplamTutar, OdemeTarihi, IsDelete)
        VALUES (SCOPE_IDENTITY(), @ToplamFiyat, GETDATE(), 0);

        SET @FaturaID = SCOPE_IDENTITY();

        INSERT INTO Kasa (FaturaID, Tutar, Tarih, IsDelete)
        VALUES (@FaturaID, @ToplamFiyat, GETDATE(), 0);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[RezervasyonGuncelle]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RezervasyonGuncelle]
    @RezervasyonID INT,
    @MusteriID INT,
    @OdaID INT,
    @GirisTarihi DATE,
    @CikisTarihi DATE
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Musteri WHERE MusteriID = @MusteriID)
    BEGIN
        RAISERROR('Geçerli bir müşteri bulunamadı.', 16, 1);
        RETURN;
    END

    DECLARE @OdaDurumu NVARCHAR(50);
    SELECT @OdaDurumu = Durum FROM Oda WHERE OdaID = @OdaID;

    IF @OdaDurumu <> 'Boş'
    BEGIN
        RAISERROR('Bu oda yalnızca boş ise güncellenebilir. (Durum: %s)', 16, 1, @OdaDurumu);
        RETURN;
    END

    IF EXISTS (
        SELECT 1
        FROM Rezervasyon
        WHERE OdaID = @OdaID
        AND RezervasyonID <> @RezervasyonID
        AND (
            (GirisTarihi <= @CikisTarihi AND CikisTarihi >= @GirisTarihi)
        )
    )
    BEGIN
        SELECT @OdaDurumu = Durum FROM Oda WHERE OdaID = @OdaID;
        
        IF @OdaDurumu = 'Temizleniyor'
        BEGIN
            RAISERROR('Bu oda müsait değil (Oda temizleniyor).', 16, 1);
        END
        ELSE
        BEGIN
            RAISERROR('Bu oda müsait değil (Bu tarihlerde bir rezervasyon mevcut).', 16, 1);
        END
        RETURN;
    END

    DECLARE @Fiyat DECIMAL(10, 2);
    DECLARE @GunSayisi INT;
    DECLARE @ToplamFiyat DECIMAL(10, 2);

    SELECT @Fiyat = Fiyat
    FROM Oda
    WHERE OdaID = @OdaID;

    SET @GunSayisi = DATEDIFF(DAY, @GirisTarihi, @CikisTarihi);
    SET @ToplamFiyat = @GunSayisi * @Fiyat;

    UPDATE Rezervasyon
    SET MusteriID = @MusteriID,
        OdaID = @OdaID,
        GirisTarihi = @GirisTarihi,
        CikisTarihi = @CikisTarihi,
        ToplamFiyat = @ToplamFiyat
    WHERE RezervasyonID = @RezervasyonID;
END;
GO
/****** Object:  StoredProcedure [dbo].[RezervasyonListele]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RezervasyonListele]
AS
BEGIN
    SELECT 
        r.RezervasyonID, 
        m.Ad + ' ' + m.Soyad AS MusteriAdiSoyadi, 
        o.OdaNo, 
        r.GirisTarihi, 
        r.CikisTarihi, 
        r.ToplamFiyat
    FROM 
        Rezervasyon r
    JOIN 
        Musteri m ON r.MusteriID = m.MusteriID
    JOIN 
        Oda o ON r.OdaID = o.OdaID
    WHERE 
        r.IsDelete = 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[RezervasyonSil]    Script Date: 30.07.2024 20:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RezervasyonSil]
    @RezervasyonID INT
AS
BEGIN
    UPDATE Rezervasyon
    SET IsDelete = 1
    WHERE RezervasyonID = @RezervasyonID;
END;

GO
