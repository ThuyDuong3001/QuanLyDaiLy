--Bang Mat Hang
CREATE TABLE MATHANG(
    MaMatHang VARCHAR2(50)PRIMARY KEY,
    TenMatHang VARCHAR2(255) NOT NULL,
    DonGiaNhap NUMBER NOT NULL,
    DonGiaXuat NUMBER NOT NULL,
    SoLuongTon NUMBER,
    MaDonViTinh VARCHAR2(50) NOT NULL,
    TenNhaCungCap VARCHAR2(255) NOT NULL
)
--Insert Mat Hang
INSERT INTO MATHANG VALUES ('MH01',N'Đá',20000,20400,200,'DVM','Granit');									
INSERT INTO MATHANG VALUES ('MH02',N'Xi măng',80000,81600,50,'DVB',N'Hà Tiên');								
INSERT INTO MATHANG VALUES ('MH03',N'Cát',135000,137700,700,'DVK',N'Cát Thành Vinh');									