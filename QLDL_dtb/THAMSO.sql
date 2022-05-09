--Bang Tham So
CREATE TABLE THAMSO(
    SoDaiLyToiDa NUMBER,
    TyLeDonGiaXuat float,
    KiemTraSoTienThu NUMBER DEFAULT 1 
)
DROP TABLE THAMSO;
alter table thamso
MODIFY tyledongiaxuat float

--Insert Tham So
delete from thamso where tyledongiaxuat  = 1
INSERT INTO THAMSO VALUES(4,1.02,1);