--Bang Dai Ly
CREATE TABLE DAILY(
    MaDaiLy VARCHAR2(50)PRIMARY KEY,
    TenDaiLy NVARCHAR2(255) NOT NULL,
    MaLoaiDaiLy VARCHAR2(50)NOT NULL,
    DiaChi NVARCHAR2(255) NOT NULL,
    MaQuan VARCHAR2(50) NOT NULL,
    NgayTiepNhan DATE,
    DienThoai VARCHAR2(20) NOT NULL,
    Email VARCHAR2(255),
    TongNo NUMBER
)
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';
--Insert Dai Ly
INSERT INTO DAILY VALUES ('DL001',N'Minh Phát','L01',N'50/34, Lê ??i Hành, Qu?n 1,TPHCM','Q1','20/07/2021','0925468217','minhphat@gmail.com',5400000);								
INSERT INTO DAILY VALUES ('DL002',N'V?n Kim','L02', N'837 Lê H?ng Phong, Qu?n 2, TPHCM','Q2','24/06/2021','0984937552','vankim@gmail.com',4500000);							
INSERT INTO DAILY VALUES ('DL003',N'Phúc Th?','L02','45/2 An D??ng V??ng, Qu?n 3,TPHCM','Q3','27/04/2021','0973829127','phuctho@gmail.com',8900000)	;								
INSERT INTO DAILY VALUES ('DL004',N'Th?nh Phát','L01','45/3 Nguy?n Ki?m, Qu?n 4,TPHCM','Q4','21/05/2021','964372184','thinhphat@gmail.com',3400000);								
			