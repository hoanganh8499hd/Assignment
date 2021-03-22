USE MASTER
GO
DROP DATABASE IF EXISTS QuanLyBanHang
GO
CREATE DATABASE [QuanLyBanHang] 
GO
USE [QuanLyBanHang]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonDatHang](
	[MaChiTietDDH] [int] IDENTITY(1,1) NOT NULL,
	[MaDDH] [int] NULL,
	[MaSP] [int] NULL,
	[SizeID] [int] NULL,
	[TenSP] [nvarchar](255) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaChiTietPN] [int] IDENTITY(1,1) NOT NULL,
	[MaPN] [int] NULL,
	[MaSP] [int] NULL,
	[SizeID] [int] NULL,
	[DonGiaNhap] [decimal](18, 0) NULL,
	[SoLuongNhap] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietPN] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
	[Icon] [nvarchar](max) NULL,
	[BiDanh] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThanhVien](
	[MaLoaiTV] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[UuDai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiTV] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[SoDienThoai] [varchar](12) NULL,
	[Fax] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](100) NULL,
	[ThongTin] [nvarchar](255) NULL,
	[Logo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [int] IDENTITY(1,1) NOT NULL,
	[MaNCC] [int] NULL,
	[NgayNhap] [datetime] NULL,
	[DaXoa] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](255) NULL,
	[DonGia] [decimal](18, 0) NULL,
	[NgayCapNhap] [datetime] NULL,
	[MoTa] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[SoLuongTon] [int] NULL,
	[LuotXem] [int] NULL,
	[LuotBinhChon] [int] NULL,
	[SoLanMua] [int] NULL,
	[Moi] [int] NULL,
	[MaNCC] [int] NULL,
	[MaNSX] [int] NULL,
	[MaLoaiSP] [int] NULL,
	[DaXoa] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
	[NgayGiao] [datetime] NULL,
	[DaThanhToan] [bit] NULL,
	[MaThanhVien] [int] NULL,
	[UuDai] [int] NULL,
	[DaHuy] [bit] NULL,
	[DaXoa] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[MaThanhVien] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](100) NULL,
	[HoTen] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[SoDienThoai] [varchar](12) NULL,
	[MaLoaiTV] [int] NULL,
	[vCode] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThanhVien] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)


GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Size]
(
    SizeID INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    Number INT,
    NgayTao DATETIME DEFAULT GETDATE(),
)
GO

SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Size_SanPham]
(
    Size_SanPhamID INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    SizeID INT NULL,
    MaSP INT NULL,
	SoLuong INT NULL
)
GO

SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [User]
(
    UserID INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    [TaiKhoan] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](100) NULL,
	[HoTen] [nvarchar](100) NULL,
)
GO



ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang] FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonDatHang] ([MaDDH])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang]
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_SanPham]
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Size] ([SizeID])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_Size]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhap_PhieuNhap] FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_PhieuNhap]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD CONSTRAINT [FK_ChiTietPhieuNhap_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_SanPham]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD CONSTRAINT [FK_ChiTietPhieuNhap_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Size] ([SizeID])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_Size]
GO
ALTER TABLE dbo.DonDatHang  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_ThanhVien] FOREIGN KEY([MaThanhVien])
REFERENCES dbo.ThanhVien ([MaThanhVien])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_ThanhVien]
GO

ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSP] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSP]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaSanXuat] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaSanXuat]
GO
ALTER TABLE [dbo].[ThanhVien]  WITH CHECK ADD  CONSTRAINT [FK_ThanhVien_LoaiThanhVien] FOREIGN KEY([MaLoaiTV])
REFERENCES [dbo].[LoaiThanhVien] ([MaLoaiTV])
GO
ALTER TABLE [dbo].[ThanhVien] CHECK CONSTRAINT [FK_ThanhVien_LoaiThanhVien]
GO

ALTER TABLE [dbo].[Size_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_Size_SanPham_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Size] ([SizeID])
GO
ALTER TABLE [dbo].[Size_SanPham] CHECK CONSTRAINT [FK_Size_SanPham_Size]
GO
ALTER TABLE [dbo].[Size_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_Size_SanPham_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[Size_SanPham] CHECK CONSTRAINT [FK_Size_SanPham_SanPham]
GO


USE QuanLyBanHang
GO

SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (1, N'Japan', N'abc/abc', N'japan@yahoo.com', N'0123456789', N'0777883')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (2, N'Bình Chánh', N'123/123 H .Bình Chánh', N'qweq@ewe.ew', N'0123456789', N'123123')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (3, N'United states of america', N'123/321 iraq', N'barack.obama@gmail.com', N'012345689', N'0777.777')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (4, N'Trung Quốc', N'abc', N'TQ@gmail.com', N'123456', N'111.111')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (5, N'Hàn Quốc', N'Seoul', N's@gmail.com', N'1234444', N'222.222')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (6, N'Việt Nam', N'Hà Nội', N'hanoi@gmail.com', N'0364345094', N'121212')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF

GO
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (1, N'Nike', N'nike@gmail.com', N'nike-logo.jpg')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (2, N'Adidas', N'adidas@gmail.com', N'adidas-3-la.jpg')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (3, N'Puma', N'puma@gmail.com', N'puma.jpg')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (4, N'Converse', N'con@gmail.com', N'converse.jpg')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (5, N'MCQueen', N'mc@gmail.com', N'mcqueen.png')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (6, N'Balenciaga', N'ba@gmail.com', N'logo-thuong-hieu-balenciaga-elle-man-1-475x312.jpg')
--INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (7, N'Gucci', N'Gucci@gmail.com', N'gucci-logo-su-hinh-thanh-va-phat-trien.jpg')
--INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (8, N'Vans', N'van@gmail.com', N'vans-logo_2.jpg')
--INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (9, N'New Balance', N'nb@gmail.com', N'newbalance.jpg')
--INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (10, N'Fendi', N'fen@gmail.com', N'fendi.png')
--INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (11, N'Biti''s', N'bi@gmail.com', N'1200px-Bitis_logo.svg.png')
--INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (12, N'Asics', N'a@gmail.com', N'asic.png')
--INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (13, N'Fila', N'fi@gmail.com', N'Fila_logo.svg.png')
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF

GO
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (1, N'Nam', NULL, NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (2, N'Nữ', NULL, NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (3, N'Trẻ Em', NULL, NULL)
--INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (4, N'Low Top', NULL, NULL)
--INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (5, N'Baby', NULL, NULL)
--INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (6, N'Adult', NULL, NULL)
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (1, N'Nike Air Max', CAST(2000000 AS Decimal(18, 0)), NULL, NULL, N'airmax.jpg', NULL, NULL, NULL,  NULL, 1, NULL, 1, 1, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (2, N'Nike Air Force 1', CAST(2000000 AS Decimal(18, 0)), NULL, NULL, N'Nike-Air-Force-1-nu-dep.jpg', NULL, NULL, NULL, NULL, 1, NULL, 1, 2, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (3, N'Nike Zoom', CAST(2000000 AS Decimal(18, 0)), NULL, NULL, N'giay-the-thao-Nike-Zoom-cho-nam.jpg', NULL, NULL,  NULL, NULL, 1, NULL, 1, 3, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (4, N'Nike Flyknit', CAST(1235555 AS Decimal(18, 0)), NULL, NULL, N'WMNS-NIKE-FREE-40-FLYKNIT-717076_600_A_PREM-600x600.jpg', NULL,  NULL, NULL, NULL, 1, NULL, 1, 1, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (5, N'Nike SF-AF1 “Desert Camo”', CAST(1234444 AS Decimal(18, 0)), NULL, NULL, N'nike-sf-af1-desert-camo-where-to-buy.jpg', NULL, NULL,  NULL, NULL, NULL, NULL, 1, 2, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (6, N'Nike Air Huarache “Legion Green”', CAST(1234444 AS Decimal(18, 0)), NULL, NULL, N'tim-hieu-giay-Nike-Air-Huarache-“Legion-Green”.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (7, N'Nike Air TR 17', CAST(4444444 AS Decimal(18, 0)), NULL, NULL, N'cac-loai-giay-nike-nam-hot-nhat-2017-nike-air-tr17-768x539.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (8, N'Nike Air Jordan 1 “Royal”', CAST(3456788 AS Decimal(18, 0)), NULL, NULL, N'cac-loai-giay-nike-nam-hot-nhat-2017-nike-the-nike-jordan-1-tr17.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (9, N'Adidas super star', CAST(1200000 AS Decimal(18, 0)), NULL, NULL, N'1-1-1024x576.jpg', NULL, NULL, NULL, NULL,  NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (10, N'Adidas NMD', CAST(2300000 AS Decimal(18, 0)), NULL, NULL, N'2-1.jpg', NULL, NULL,  NULL, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (11, N'Adidas Neo', CAST(2300009 AS Decimal(18, 0)), NULL, NULL, N'3-1.jpg', NULL, NULL, NULL,  NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (12, N'Adidas Ultra Boost', CAST(4560000 AS Decimal(18, 0)), NULL, NULL, N'4-1-1024x683.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (13, N'Adidas Stan Smith', CAST(2344444 AS Decimal(18, 0)), NULL, NULL, N'5-1-1024x683.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (14, N'Adidas EQT', CAST(2345678 AS Decimal(18, 0)), NULL, NULL, N'6-1024x682.jpg', NULL, NULL, NULL, NULL,  NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (15, N'Adidas Prophere', CAST(4567890 AS Decimal(18, 0)), NULL, NULL, N'7-1.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (16, N'Adidas Yeezy 350 V2', CAST(9000000 AS Decimal(18, 0)), NULL, NULL, N'img01-jpg-auto-format-compress-q-90-updated-at-1559748037-w-1000.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (17, N'Puma Fenty Creeper', CAST(8000000 AS Decimal(18, 0)), NULL, NULL, N'puma-fenty-creeper-trang-den-1.jpg', NULL,  NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (18, N'PUMA nữ Fenty P698', CAST(5444444 AS Decimal(18, 0)), NULL, NULL, N'rsz_giay_puma57.jpg', NULL, NULL, NULL,  NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (19, N'Puma Fenty Trainer', CAST(3435654 AS Decimal(18, 0)), NULL, NULL, N'rsz_giay_puma528.jpg', NULL, NULL, NULL,  NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (20, N'PUMA Suede', CAST(6680000 AS Decimal(18, 0)), NULL, NULL, N'rsz_giay_puma7.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (21, N'PUMA Ignite Evoknit', CAST(5687675 AS Decimal(18, 0)), NULL, NULL, N'giay-PUMA-Ignite-Evoknit.jpg', NULL, NULL,  NULL, NULL, NULL, NULL, 3, NULL, NULl)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (22, N'BAPE x PUMA Ignite', CAST(1515000 AS Decimal(18, 0)), NULL, NULL, N'rsz_giay_puma52.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (23, N'Converse classic', CAST(1112000 AS Decimal(18, 0)), NULL, NULL, N'giay-converse-classic-cao-cao-mau-den.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (24, N'Converse 1970s', CAST(2115100 AS Decimal(18, 0)), NULL, NULL, N'Converse-70s-Chuck-Taylor-Ox-Black-1.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (25, N'Converse Jack Purcell', CAST(1200000 AS Decimal(18, 0)), NULL, NULL, N'mua-giay-Converse-Jack-Purcell-gia-re-tai-dia-chi-nao.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (26, N'Converse One Star', CAST(5313212 AS Decimal(18, 0)), NULL, NULL, N'mua-giay-Converse-One-Star.jpg', NULL, NULL, NULL, NULL, NULL,  NULL, 4, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (27, N'Converse Chuck Taylor All Star', CAST(1213212 AS Decimal(18, 0)), NULL, NULL, N'mua-giay-Converse-Chuck-Taylor-All-Star.jpg', NULL,  NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (28, N'Converse Chuck Taylor II', CAST(1111112 AS Decimal(18, 0)), NULL, NULL, N'tim-hieu-Converse-Chuck-Taylor-II.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (29, N'Converse Rubber', CAST(4545455 AS Decimal(18, 0)), NULL, NULL, N'Converse-Rubber-thach-thuc-moi-thoi-tiet.jpg', NULL, NULL, NULL,  NULL, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (30, N'Converse Dainty', CAST(8484515 AS Decimal(18, 0)), NULL, NULL, N'Converse-Dainty-mau-den.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (31, N'Converse Seasonal Color', CAST(2121211 AS Decimal(18, 0)), NULL, NULL, N'Converse-Seasonal-Color.jpg', NULL, NULL, NULL,  NULL, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (32, N'Alexander Mcqueen', CAST(2121212 AS Decimal(18, 0)), NULL, NULL, N'giay-sneaker-alexander-mcqueen-vhh-10-jpg-1569838511-30092019171511.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (33, N'Balenciaga Triple', CAST(2121211 AS Decimal(18, 0)), NULL, NULL, N'Giay_Balenciaga_Triple_S_xanh.jpg', NULL, NULL,  NULL, NULL, NULL, NULL, 5, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (34, N'Balenciaga Triple S Bicolour', CAST(2121212 AS Decimal(18, 0)), NULL, NULL, N'Giay_Balenciaga_Triple_S_Bicolour.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (35, N'Balenciaga Track Trainers', CAST(1212121 AS Decimal(18, 0)), NULL, NULL, N'Giay_Balenciaga_Track_Trainers.jpg', NULL,  NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (36, N'Balenciaga Speed Trainers', CAST(2121212 AS Decimal(18, 0)), NULL, NULL, N'Giay_Balenciaga_Speed_Trainers.jpg', NULL,  NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (37, N'Balenciaga Speed Trainer Cuffed', CAST(1212121 AS Decimal(18, 0)), NULL, NULL, N'Giay_Balenciaga_Speed_Trainer_Cuffed.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (38, N'Gucci Ace Embroidered', CAST(2121212 AS Decimal(18, 0)), NULL, NULL, N'Gucci-Sneaker.jpg', NULL,  NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (39, N'Mid-heel Loafer', CAST(5455151 AS Decimal(18, 0)), NULL, NULL, N'Gucci-2.jpg', NULL, NULL, NULL,  NULL, NULL, NULL, 6, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (40, N'Gucci Nữ Daphne', CAST(1212122 AS Decimal(18, 0)), NULL, NULL, N'giay-bup-be-gucci.jpg', NULL,  NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (41, N'Jordan Leather Loafer', CAST(2121212 AS Decimal(18, 0)), NULL, NULL, N'Gucci-4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (42, N'Gucci Rhyton', CAST(1111212 AS Decimal(18, 0)), NULL, NULL, N'Gucci-5.jpg', NULL, NULL, NULL, NULL,  NULL, NULL, 6, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (43, N'Vans Old School', CAST(2121212 AS Decimal(18, 0)), NULL, NULL, N'45454.png', NULL, NULL, NULL, NULL,  NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (44, N'Vans Classic Authentic', CAST(2212121 AS Decimal(18, 0)), NULL, NULL, N'vans-classic-authentic-black-white-vn000ee3blk-2.png',  NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (45, N'Vans Era', CAST(2121212 AS Decimal(18, 0)), NULL, NULL, N'vn000ewzblk-5.png', NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (46, N'Vans Sk8-Hi', CAST(2121212 AS Decimal(18, 0)), NULL, NULL, N'vans-classic-sk8-hi-black-white-vn000d5ib8c-2-1.png',  NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (47, N'Vans Anaheim Factory Style 73 DX', CAST(2212212 AS Decimal(18, 0)), NULL, NULL, N'627608.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (48, N'Vans Classic ComfyCush Era', CAST(2121212 AS Decimal(18, 0)), NULL, NULL, N'tải xuống.jpg', NULL,  NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (49, N'Vans x FOG', CAST(2121212 AS Decimal(18, 0)), NULL, NULL, N'image-15227458980371056157560.webp',  NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (50, N'Vans Style 36 marshmallow', CAST(2212121 AS DECIMAL(18, 0)), NULL, NULL, N'vn0a3dz3oxs-5.jpg', NULL,  NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (51, N'New Balance 327', CAST(1212122 AS Decimal(18, 0)), NULL, NULL, N'giay-new-balance-co-tot-khong-9-jpg-1608196050-17122020160730.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (52, N'New Balance 574', CAST(2212111 AS Decimal(18, 0)), NULL, NULL, N'giay-new-balance-co-tot-khong-8-jpg-1608195742-17122020160222.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (53, N'New Balance 576', CAST(5451212 AS Decimal(18, 0)), NULL, NULL, N'giay-new-balance-co-tot-khong-10-jpg-1608196353-17122020161233.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (54, N'New Balance 577', CAST(2121212 AS Decimal(18, 0)), NULL, NULL, N'giay-new-balance-co-tot-khong-11-jpg-1608196453-17122020161413.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (55, N'New Balance 996', CAST(2121211 AS Decimal(18, 0)), NULL, NULL, N'giay-new-balance-co-tot-khong-12-jpg-1608196529-17122020161529.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (56, N'New Balance 997', CAST(2211121 AS Decimal(18, 0)), NULL, NULL, N'giay-new-balance-co-tot-khong-13-jpg-1608196634-17122020161714.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (57, N'New Balance 998', CAST(2121212 AS Decimal(18, 0)), NULL, NULL, N'giay-new-balance-co-tot-khong-14-jpg-1608196760-17122020161920.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (58, N'New Balance 999', CAST(2121212 AS Decimal(18, 0)), NULL, NULL, N'giay-new-balance-co-tot-khong-15-jpg-1608196821-17122020162021.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (59, N'New Balance 1300', CAST(2121212 AS Decimal(18, 0)), NULL, NULL, N'giay-new-balance-co-tot-khong-16-jpg-1608196889-17122020162129.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (60, N'New Balance 1500', CAST(114444 AS Decimal(18, 0)), NULL, NULL, N'giay-new-balance-co-tot-khong-17-jpg-1608196996-17122020162316.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (61, N'New Balance 1600', CAST(1212121 AS Decimal(18, 0)), NULL, NULL, N'giay-new-balance-co-tot-khong-18-jpg-1608197105-17122020162505.jpg',  NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [MoTa], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon],  [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (62, NULL, NULL, NULL, NULL, NULL, NULL,  NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
--SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 
--INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (3, 4, NULL, 0)
--INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (4, 3, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 0)
--INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (5, 4, CAST(N'2020-01-02T00:00:00.000' AS DateTime), 0)
--INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (6, 4, CAST(N'2020-01-09T00:00:00.000' AS DateTime), 0)
--INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (7, 4, CAST(N'2021-02-20T00:00:00.000' AS DateTime), 0)
--INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (8, 3, CAST(N'2021-02-21T00:00:00.000' AS DateTime), NULL)
--INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (9, 6, CAST(N'2021-02-22T00:00:00.000' AS DateTime), NULL)
--INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (10, 8, CAST(N'2021-02-22T00:00:00.000' AS DateTime), NULL)
--SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 
INSERT [dbo].[Size] ([SizeID], [Number], [NgayTao]) VALUES (1, 35, CAST(N'2021-02-20T20:49:30.107' AS DateTime))
INSERT [dbo].[Size] ([SizeID], [Number], [NgayTao]) VALUES (2, 36, CAST(N'2021-02-20T20:49:31.930' AS DateTime))
INSERT [dbo].[Size] ([SizeID], [Number], [NgayTao]) VALUES (3, 37, CAST(N'2021-02-20T20:49:33.000' AS DateTime))
INSERT [dbo].[Size] ([SizeID], [Number], [NgayTao]) VALUES (4, 38, CAST(N'2021-02-20T20:49:34.173' AS DateTime))
INSERT [dbo].[Size] ([SizeID], [Number], [NgayTao]) VALUES (5, 39, CAST(N'2021-02-20T20:49:35.410' AS DateTime))
INSERT [dbo].[Size] ([SizeID], [Number], [NgayTao]) VALUES (6, 40, CAST(N'2021-02-20T20:49:38.227' AS DateTime))
INSERT [dbo].[Size] ([SizeID], [Number], [NgayTao]) VALUES (7, 41, CAST(N'2021-02-20T20:49:39.210' AS DateTime))
INSERT [dbo].[Size] ([SizeID], [Number], [NgayTao]) VALUES (8, 42, CAST(N'2021-02-20T20:49:40.720' AS DateTime))
INSERT [dbo].[Size] ([SizeID], [Number], [NgayTao]) VALUES (9, 43, CAST(N'2021-02-20T20:49:42.010' AS DateTime))
INSERT [dbo].[Size] ([SizeID], [Number], [NgayTao]) VALUES (10, 44, CAST(N'2021-02-20T20:49:44.417' AS DateTime))
INSERT [dbo].[Size] ([SizeID], [Number], [NgayTao]) VALUES (11, 45, CAST(N'2021-02-20T20:49:45.523' AS DateTime))
INSERT [dbo].[Size] ([SizeID], [Number], [NgayTao]) VALUES (12, 46, CAST(N'2021-02-20T20:49:46.950' AS DateTime))
INSERT [dbo].[Size] ([SizeID], [Number], [NgayTao]) VALUES (13, 47, CAST(N'2021-02-20T20:49:47.957' AS DateTime))
INSERT [dbo].[Size] ([SizeID], [Number], [NgayTao]) VALUES (14, 48, CAST(N'2021-02-20T20:49:49.277' AS DateTime))
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
SET IDENTITY_INSERT [dbo].[Size_SanPham] ON 
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(1,1,1,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(2,2,1,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(3,3,1,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(4,4,1,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(5,5,1,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(6,6,1,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(7,7,1,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(8,8,1,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(9,9,1,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(10,10,1,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(11,1,2,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(12,2,2,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(13,3,2,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(14,4,2,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(15,5,2,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(16,6,2,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(17,7,2,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(18,8,2,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(19,9,2,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(20,10,2,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(21,1,3,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(22,2,3,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(23,3,3,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(24,4,3,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(25,5,3,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(26,6,3,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(27,7,3,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(28,8,3,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(29,9,3,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(30,10,11,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(31,1,11,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(32,2,11,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(33,3,11,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(34,4,11,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(35,5,11,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(36,6,11,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(37,7,11,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(38,8,11,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(39,9,11,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(40,10,11,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(41,1,4,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(42,2,4,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(43,3,4,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(44,4,4,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(45,5,4,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(46,6,4,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(47,7,4,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(48,8,4,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(49,9,4,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(50,10,4,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(51,1,5,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(52,2,5,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(53,3,5,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(54,4,5,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(55,5,5,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(56,6,5,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(57,7,5,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(58,8,5,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(59,9,5,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(60,10,5,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(61,1,6,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(62,2,6,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(63,3,6,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(64,4,6,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(65,5,6,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(66,6,6,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(67,7,6,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(68,8,6,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(69,9,6,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(70,10,6,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(71,1,7,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(72,2,7,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(73,3,7,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(74,4,7,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(75,5,7,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(76,6,7,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(77,7,7,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(78,8,7,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(79,9,7,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(80,10,7,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(81,1,8,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(82,2,8,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(83,3,8,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(84,4,8,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(85,5,8,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(86,6,8,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(87,7,8,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(88,8,8,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(89,9,8,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(90,10,8,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(91,1,9,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(92,2,9,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(93,3,9,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(94,4,9,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(95,5,9,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(96,6,9,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(97,7,9,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(98,8,9,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(99,9,9,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(100,10,9,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(101,1,10,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(102,2,10,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(103,3,10,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(104,4,10,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(105,5,10,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(106,6,10,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(107,7,10,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(108,8,10,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(109,9,10,NULL)
INSERT INTO dbo.Size_SanPham(Size_SanPhamID,SizeID,MaSP,SoLuong)VALUES(110,10,10,NULL)
SET IDENTITY_INSERT [dbo].[Size] OFF
GO 

UPDATE dbo.SanPham SET Moi=1 WHERE MaSP IN (SELECT TOP(10) MaSP FROM dbo.SanPham)
USE QuanLyBanHang
select * from sanpham
select * from PhieuNhap
select * from ThanhVien
select * from Size_SanPham
select * from DonDatHang
select * from ChiTietDonDatHang
SELECT * FROM dbo.ThanhVien
SELECT * FROM dbo.NhaSanXuat

--Query


--Thống kê doanh thu đơn đặt hàng theo tháng

SELECT* FROM dbo.ChiTietDonDatHang

SELECT* FROM dbo.DonDatHang
GO

SELECT SUM(DonGia*SoLuong) AS [Doanh Thu]  FROM dbo.ChiTietDonDatHang 
INNER JOIN dbo.DonDatHang ON DonDatHang.MaDDH = ChiTietDonDatHang.MaDDH
WHERE MONTH(NgayDat)=2 AND YEAR(NgayDat)=2021 AND
DaHuy=0 AND DaXoa=0
GO

CREATE PROC ThongKeDoanhThuDatHangTheoThang @Thang INT, @Nam INT
AS
SELECT SUM(DonGia*SoLuong) FROM dbo.ChiTietDonDatHang 
INNER JOIN dbo.DonDatHang ON DonDatHang.MaDDH = ChiTietDonDatHang.MaDDH
WHERE MONTH(NgayDat)=@Thang AND YEAR(NgayDat)=@Nam AND
DaHuy=0 AND DaXoa=0
GO
EXEC dbo.ThongKeDoanhThuDatHangTheoThang @Thang = 3, -- int
                                         @Nam = 2021    -- int



--Thống kê nhập hàng theo tháng
SELECT * FROM dbo.PhieuNhap
SELECT * FROM dbo.ChiTietPhieuNhap
GO

SELECT SUM(SoLuongNhap*DonGiaNhap) FROM dbo.ChiTietPhieuNhap
INNER JOIN dbo.PhieuNhap ON PhieuNhap.MaPN = ChiTietPhieuNhap.MaPN
WHERE MONTH(NgayNhap)=3 AND YEAR(NgayNhap)=2021
AND DaXoa=0
GO

CREATE PROC ThongKeNhapHangTheoThang @Thang INT, @Nam INT
AS
SELECT SUM(SoLuongNhap*DonGiaNhap) FROM dbo.ChiTietPhieuNhap
INNER JOIN dbo.PhieuNhap ON PhieuNhap.MaPN = ChiTietPhieuNhap.MaPN
WHERE MONTH(NgayNhap)=@Thang AND YEAR(NgayNhap)=@Nam
AND DaXoa=0
GO
EXEC dbo.ThongKeNhapHangTheoThang @Thang = 3, -- int
                                  @Nam = 2021    -- int

GO

--Thống kê đặt hàng

SELECT * FROM dbo.DonDatHang 
INNER JOIN dbo.ChiTietDonDatHang ON ChiTietDonDatHang.MaDDH = DonDatHang.MaDDH
WHERE DaThanhToan=1 AND TinhTrangGiaoHang=1 AND
MONTH(NgayDat)=2 AND YEAR(NgayDat)=2021 AND DaHuy=0

GO
CREATE PROC ThongKeDatHang @Thang INT, @Nam INT, @DaThanhToan INT,@TinhTrangGiaoHang int
AS
SELECT * FROM dbo.DonDatHang 
INNER JOIN dbo.ChiTietDonDatHang ON ChiTietDonDatHang.MaDDH = DonDatHang.MaDDH
WHERE DaThanhToan=@DaThanhToan AND TinhTrangGiaoHang=@TinhTrangGiaoHang AND
MONTH(NgayDat)=@Thang AND YEAR(NgayDat)=@Nam AND DaHuy=0
GO

EXEC dbo.ThongKeDatHang @Thang = 2,            -- int
                        @Nam = 2021,              -- int
                        @DaThanhToan = 1,      -- int
                        @TinhTrangGiaoHang = 1 -- int








--Danh sách sản phẩm theo nhà sản xuất

SELECT * FROM dbo.SanPham WHERE MaNSX=2 

GO
CREATE PROC ListProductsByIdProducer @IdNSX int
AS
SELECT * FROM dbo.SanPham WHERE MaNSX=@IdNSX
GO

EXEC dbo.ListProductsByIdProducer @IdNSX = 1 -- int
GO

--Danh sách sản phẩm theo loại sản phẩm

SELECT * FROM dbo.SanPham WHERE MaLoaiSP=1

GO
CREATE PROC ListProductsByIdCategory @IdMaLoaiSP INT
AS
SELECT * FROM dbo.SanPham WHERE MaLoaiSP=@IdMaLoaiSP
GO
 
EXEC dbo.ListProductsByIdCategory @IdMaLoaiSP = 1 -- int
GO


--Danh sách sản phẩm theo loại sản phẩm và nhà sản xuất

SELECT * FROM dbo.SanPham WHERE MaLoaiSP=1 AND MaNSX=2

GO
CREATE PROC ListProductsByIdCategoryAndIdProducer @IdMaLoaiSP INT, @IdNSX int
AS
SELECT * FROM dbo.SanPham WHERE MaLoaiSP=@IdMaLoaiSP AND MaNSX=@IdNSX
GO
 
EXEC dbo.ListProductsByIdCategoryAndIdProducer @IdMaLoaiSP = 1, -- int
                                               @IdNSX = 1       -- int

GO
