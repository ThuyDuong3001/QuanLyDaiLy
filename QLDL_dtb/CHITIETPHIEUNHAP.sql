--Bang Chi Tiet Phieu Nhap
CREATE TABLE CHITIETPHIEUNHAP(
    Ma_CTPN VARCHAR2(50) PRIMARY KEY NOT NULL,
    MaMatHang VARCHAR2(50) NOT NULL,
    MaPhieuNhap VARCHAR2(50) NOT NULL,
    SoLuong NUMBER NOT NULL,
    DonGiaNhap NUMBER NOT NULL,
    ThanhTien NUMBER,
    TenNhaCungCap VARCHAR2(255) NOT NULL
)
select * from CHITIETPHIEUNHAP
INSERT INTO CHITIETPHIEUNHAP VALUES('CTPN01', 'MH01','PN001',50,20000,1000000,'Granit');
INSERT INTO CHITIETPHIEUNHAP VALUES('CTPN02', 'MH02','PN001',50,75000,3750000,N'Hà Tiên');
