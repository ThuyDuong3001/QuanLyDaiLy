--Bang Loai Dai Ly
CREATE TABLE LOAIDAILY(
    MaLoaiDaiLy VARCHAR2(50) PRIMARY KEY,
    TenLoaiDaiLy VARCHAR2(255) NOT NULL,
    SoNoToiDa NUMBER
)
--Insert Loai Dai Ly
INSERT INTO LOAIDAILY VALUES ('L01',N'Đại lý cấp 1',50000000);
INSERT INTO LOAIDAILY VALUES ('L02',N'Đại lý cấp 2', 80000000);
