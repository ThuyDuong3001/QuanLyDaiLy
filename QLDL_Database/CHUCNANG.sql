--Bang Chuc Nang
CREATE TABLE CHUCNANG(
    MaChucNang VARCHAR2(50) PRIMARY KEY NOT NULL,
    TenChucNang NVARCHAR2(50) NOT NULL,
    TenManHinhDuocLoad VARCHAR2(50) NOT NULL
)

INSERT INTO CHUCNANG VALUES ('HSDL',N'H? S? ??i L�', 'Ho so dai ly');
INSERT INTO CHUCNANG VALUES ('QLNH',N'Qu?n L� Nh?p H�ng', 'Quan ly nhap hang');
INSERT INTO CHUCNANG VALUES ('QLXH',N'Qu?n L� Xu?t H�ng', 'Quan ly xuat hang');
INSERT INTO CHUCNANG VALUES ('QLPT',N'Qu?n L� Phi?u Thu', 'Quan ly phieu thu');
INSERT INTO CHUCNANG VALUES ('BCTK',N'B�o C�o Th?ng K�', 'Bao cao thong ke');
INSERT INTO CHUCNANG VALUES ('TTQD',N'Thay ??i Quy ??nh', 'Thay doi quy dinh');
INSERT INTO CHUCNANG VALUES ('QLTK',N'Qu?n L� T�i Kho?n', 'Quan ly tai khoan');



