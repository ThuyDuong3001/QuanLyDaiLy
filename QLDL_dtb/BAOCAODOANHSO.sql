--Bang Bao Cao Doanh So
CREATE TABLE BAOCAODOANHSO(
    MaDaiLy VARCHAR2(50) NOT NULL,
    ThangVaNam DATE NOT NULL,
    SoPhieuXuat NUMBER,
    TongTriGia NUMBER,
    TyLe DECIMAL,
    CONSTRAINT PK_BAOCAODOANHSO PRIMARY KEY(MaDaiLy,ThangVaNam)
)
SELECT*FROM BAOCAODOANHSO;
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';

--INSERT INTO BAOCAODOANHSO VALUES ('DL001','20/08/2022',1,7500000,0.02);						
--INSERT INTO BAOCAODOANHSO VALUES ('DL002','24/07/2022',1,2000000,0.01);						
--INSERT INTO BAOCAODOANHSO VALUES ('DL003','27/05/2022',1,9500000,0.01);						
--
--delete from baocaodoanhso
