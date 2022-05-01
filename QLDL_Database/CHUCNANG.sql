--Bang Chuc Nang
CREATE TABLE CHUCNANG(
    MaChucNang VARCHAR2(50) PRIMARY KEY NOT NULL,
    TenChucNang NVARCHAR2(50) NOT NULL,
    TenManHinhDuocLoad VARCHAR2(50) NOT NULL
)

INSERT INTO CHUCNANG VALUES ('HSDL',N'H? S? ??i Lý', 'Ho so dai ly');
INSERT INTO CHUCNANG VALUES ('QLNH',N'Qu?n Lý Nh?p Hàng', 'Quan ly nhap hang');
INSERT INTO CHUCNANG VALUES ('QLXH',N'Qu?n Lý Xu?t Hàng', 'Quan ly xuat hang');
INSERT INTO CHUCNANG VALUES ('QLPT',N'Qu?n Lý Phi?u Thu', 'Quan ly phieu thu');
INSERT INTO CHUCNANG VALUES ('BCTK',N'Báo Cáo Th?ng Kê', 'Bao cao thong ke');
INSERT INTO CHUCNANG VALUES ('TTQD',N'Thay ??i Quy ??nh', 'Thay doi quy dinh');
INSERT INTO CHUCNANG VALUES ('QLTK',N'Qu?n Lý Tài Kho?n', 'Quan ly tai khoan');



