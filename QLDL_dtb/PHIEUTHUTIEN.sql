--Bang Phieu Thu Tien
CREATE TABLE PHIEUTHUTIEN(
    MaPhieuThuTien VARCHAR2(50) PRIMARY KEY,
    MaPhieuXuat VARCHAR2(50) NOT NULL,
    NgayThuTien DATE NOT NULL,
    SoTienThu NUMBER NOT NULL
)
SELECT*FROM PHIEUTHUTIEN;
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';


--INSERT INTO PHIEUTHUTIEN VALUES('PT01','DL002','30/01/2022',692000);
--INSERT INTO PHIEUTHUTIEN VALUES('PT02','DL003','30/01/2022',2000000);
--INSERT INTO PHIEUTHUTIEN VALUES('PT03','DL003','14/02/2022',1160000);
