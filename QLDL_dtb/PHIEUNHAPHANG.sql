--Bang Phieu Nhap Hang
CREATE TABLE PHIEUNHAPHANG(
    MaPhieuNhap VARCHAR2(50) PRIMARY KEY NOT NULL,
    NgayLap DATE NOT NULL,
    TongTien NUMBER NOT NULL,
    CMND VARCHAR2(50) NOT NULL
)
--Insert Phieu Nhap Hang
INSERT INTO PHIEUNHAPHANG VALUES('PN001', '10/10/2021',5500000,'12345678');
INSERT INTO PHIEUNHAPHANG VALUES('PN002', '08/01/2021',7500000,'12345679');

