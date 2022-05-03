--Bang Chuc Nang
CREATE TABLE CHUCNANG(
    MaChucNang VARCHAR2(50) PRIMARY KEY NOT NULL,
    TenChucNang NVARCHAR2(50) NOT NULL,
    TenManHinhDuocLoad VARCHAR2(50) NOT NULL
)

INSERT INTO CHUCNANG VALUES ('HSDL',N'Hồ Sơ Đại Lý', 'Ho so dai ly');
INSERT INTO CHUCNANG VALUES ('QLNH',N'Quản Lý Nhập Hàng', 'Quan ly nhap hang');
INSERT INTO CHUCNANG VALUES ('QLXH',N'Quản Lý Xuất Hàng', 'Quan ly xuat hang');
INSERT INTO CHUCNANG VALUES ('QLPT',N'Quản Lý Phiếu Thu', 'Quan ly phieu thu');
INSERT INTO CHUCNANG VALUES ('BCTK',N'Báo Cáo Thống Kê', 'Bao cao thong ke');
INSERT INTO CHUCNANG VALUES ('TTQD',N'Thay Đổi Quy Định', 'Thay doi quy dinh');
INSERT INTO CHUCNANG VALUES ('QLTK',N'Quản Lý Tài Khoản', 'Quan ly tai khoan');



