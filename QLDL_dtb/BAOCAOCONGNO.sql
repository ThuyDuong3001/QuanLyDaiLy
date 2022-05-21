--Bang Bao Cao Cong No
CREATE TABLE BAOCAOCONGNO(
    MaDaiLy VARCHAR2(50) NOT NULL,
    ThangVaNam DATE NOT NULL,
    NoDau NUMBER,
    PhatSinh NUMBER,
    NoCuoi NUMBER,
    CONSTRAINT PK_BAOCAOCONGNO PRIMARY KEY(MaDaiLy,ThangVaNam)
)
SELECT*FROM BAOCAOCONGNO;
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';
--Insert Bao Cao Cong No
INSERT INTO BAOCAOCONGNO VALUES ('DL001','20/07/2022',0,0,0);						
INSERT INTO BAOCAOCONGNO VALUES ('DL002','24/06/2022',692000,0,0);							
INSERT INTO BAOCAOCONGNO VALUES ('DL003','27/04/2022',3160000,0,0);							


select * from baocaocongno

BEGIN
    DBMS_OUTPUT.PUT_LINE(Func_NoCuoi('DL001',12,2020));
END;

Func_NoCuoi(
INSERT INTO BAOCAOCONGNO VALUES ('DL003','27/04/2022',0,0,0);							
