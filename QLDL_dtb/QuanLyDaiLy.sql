
----------------------------Rang Buoc Khoa Ngoai--------------------------------
--Bang PhanQuyen
ALTER TABLE PHANQUYEN ADD CONSTRAINT FK01_PHANQUYEN_CHUCNANG FOREIGN KEY(MaChucNang) REFERENCES CHUCNANG(MaChucNang);
ALTER TABLE PHANQUYEN ADD CONSTRAINT FK02_PHANQUYEN_NHOMNGUOIDUNG FOREIGN KEY(MaNhom) REFERENCES NHOMNGUOIDUNG(MaNhom);

--Bang NguoiDung
ALTER TABLE NGUOIDUNG ADD CONSTRAINT FK01_NGUOIDUNG_NHOMNGUOIDUNG FOREIGN KEY(MaNhom) REFERENCES NHOMNGUOIDUNG(MaNhom);

--Bang NhanVien
ALTER TABLE NHANVIEN ADD CONSTRAINT FK01_NHANVIEN_NGUOIDUNG FOREIGN KEY(TenDangNhap) REFERENCES NGUOIDUNG(TenDangNhap);

--Bang DaiLy
ALTER TABLE DAILY ADD CONSTRAINT FK01_DAILY_LOAIDAILY FOREIGN KEY(MaLoaiDaiLy) REFERENCES LOAIDAILY(MaLoaiDaiLy);
ALTER TABLE DAILY ADD CONSTRAINT FK02_DAILY_QUAN FOREIGN KEY(MaQuan) REFERENCES QUAN(MaQuan);

--Bang PhieuNhapHang
ALTER TABLE PHIEUNHAPHANG ADD CONSTRAINT FK_PHIEUNHAPHANG_NHANVIEN FOREIGN KEY(CMND) REFERENCES NHANVIEN(CMND);

--Bang ChiTietPhieuNhap
ALTER TABLE CHITIETPHIEUNHAP ADD CONSTRAINT FK01_CHITIETPHIEUNHAP_PHIEUNHAPHANG FOREIGN KEY(MaPhieuNhap) REFERENCES PHIEUNHAPHANG(MaPhieuNhap);
ALTER TABLE CHITIETPHIEUNHAP ADD CONSTRAINT FK02_CHITIETPHIEUNHAP_MATHANG FOREIGN KEY(MaMatHang) REFERENCES MATHANG(MaMatHang);

--Bang MatHang
ALTER TABLE MATHANG ADD CONSTRAINT FK_MATHANG_DONVITINH FOREIGN KEY(MaDonViTinh) REFERENCES DONVITINH(MaDonViTinh);

--Bang ChiTietPhieuXuat
ALTER TABLE CHITIETPHIEUXUAT ADD CONSTRAINT FK01_CHITIETPHIEUXUAT_MATHANG FOREIGN KEY(MaMatHang) REFERENCES MATHANG(MaMatHang);
ALTER TABLE CHITIETPHIEUXUAT ADD CONSTRAINT FK02_CHITIETPHIEUXUAT_PHIEUXUATHANG FOREIGN KEY(MaPhieuXuat) REFERENCES PHIEUXUATHANG(MaPhieuXuat);

--Bang PhieuXuatHang
ALTER TABLE PHIEUXUATHANG ADD CONSTRAINT FK_PHIEUXUATHANG_DAILY FOREIGN KEY(MaDaiLy) REFERENCES DAILY(MaDaiLy);
ALTER TABLE PHIEUXUATHANG ADD CONSTRAINT FK01_PHIEUXUATHANG_NHANVIEN FOREIGN KEY(CMND) REFERENCES NHANVIEN(CMND);

--Bang PhieuThuTien
ALTER TABLE PHIEUTHUTIEN ADD CONSTRAINT FK_PHIEUTHUTIEN_DAILY FOREIGN KEY(MaDaiLy) REFERENCES DAILY(MaDaiLy);

--Bang BaoCaoCongNo
ALTER TABLE BAOCAOCONGNO ADD CONSTRAINT FK_BAOCAOCONGNO_DAILY FOREIGN KEY(MaDaiLy) REFERENCES DAILY(MaDaiLy);

--Bang BaoCaoDoanhSo
ALTER TABLE BAOCAODOANHSO ADD CONSTRAINT FK_BAOCAODOANHSO_DAILY FOREIGN KEY(MaDaiLy) REFERENCES DAILY(MaDaiLy);

------------------------------------RBTV---------------------------------------

------------------------------------PROCEDURE----------------------------------
SET SERVEROUTPUT ON;
/*Cac procedure insert*/
--Procedure INSERT NHANVIEN
CREATE OR REPLACE PROCEDURE Insert_NHANVIEN(var_cmnd nhanvien.cmnd%TYPE, var_hoten nhanvien.tennv%TYPE, 
                                            ngsinh nhanvien.ngaysinh%TYPE, var_SDT nhanvien.sdt%TYPE, 
                                            tendn nhanvien.tendangnhap%TYPE) 
AS
BEGIN 
    INSERT INTO NHANVIEN VALUES (var_cmnd, var_hoten, ngsinh, var_SDT, tendn);
    COMMIT;
END;
/
--Procedure INSERT DAILY
CREATE OR REPLACE PROCEDURE Insert_DAILY(var_madl IN daily.madaily%TYPE, var_tendl IN daily.tendaily%TYPE, 
                                            var_maloai IN daily.maloaidaily%TYPE, var_diachi IN daily.diachi%TYPE, 
                                            var_maquan IN daily.maquan%TYPE, ngaytn IN daily.ngaytiepnhan%TYPE,
                                            sdt IN daily.dienthoai%TYPE, var_mail IN daily.email%TYPE,
                                            num_tongno IN daily.tongno%TYPE,
                                            flag OUT number) 
AS
    num_sodaily NUMBER:=0;
    count_daily NUMBER:=0;
BEGIN
    flag := 0;
    
    SELECT SoDaiLyToiDa INTO num_sodaily
    FROM THAMSO;
    
    SELECT COUNT(MaDaiLy) INTO count_daily
    FROM DAILY DL, QUAN Q
    WHERE DL.MaQuan=Q.MaQuan AND Q.MaQuan=var_maquan
    GROUP BY Q.MaQuan;
    
    if (count_daily = 0) then
        flag:= 0;
    end if;
    
    IF(count_daily<num_sodaily) THEN
        flag := 1;
    ELSE
        DBMS_OUTPUT.PUT_LINE('So dai ly toi da trong quan da vuot qua quy dinh, khong the them dai ly');
        flag := 0;
    END IF;
    COMMIT;
END;
/
--Procedure INSERT MATHANG
CREATE OR REPLACE PROCEDURE Pro_Insert_MATHANG(var_mamh mathang.mamathang%TYPE, var_tenmh mathang.tenmathang%TYPE,
                                            num_dgnhap mathang.dongianhap%TYPE, num_dgxuat mathang.dongiaxuat%TYPE,
                                            slton mathang.soluongton%TYPE, madvt mathang.madonvitinh%TYPE,
                                            tenncc mathang.tennhacungcap%TYPE) 
AS
BEGIN
  INSERT INTO MATHANG VALUES (var_mamh, var_tenmh, num_dgnhap, num_dgxuat, slton, 
                                madvt, tenncc);
  COMMIT;
END;
/
--Procedure INSERT PHIEUNHAPHANG
CREATE OR REPLACE PROCEDURE Pro_Insert_PHIEUNHAPHANG(var_mapn phieunhaphang.maphieunhap%TYPE,
                                                    nglap phieunhaphang.ngaylap%TYPE,
                                                    num_tongtien phieunhaphang.tongtien%TYPE,
                                                    var_cmnd phieunhaphang.cmnd%TYPE) 
AS
BEGIN
  INSERT INTO PHIEUNHAPHANG VALUES (var_mapn, nglap, num_tongtien, var_cmnd);
  COMMIT;
END;
/
--Procedure INSERT PHIEUXUATHANG
CREATE OR REPLACE PROCEDURE Pro_Insert_PHIEUXUATHANG(var_mapx phieuxuathang.maphieuxuat%TYPE,
                                                    var_madl phieuxuathang.madaily%TYPE,
                                                    num_tongtien phieuxuathang.tongtien%TYPE,
                                                    nglap phieuxuathang.ngaylap%TYPE,
                                                    num_tientra phieuxuathang.sotientra%TYPE,
                                                    num_sotienno phieuxuathang.sotienno%TYPE,
                                                    var_cmnd phieuxuathang.cmnd%TYPE) 
AS
BEGIN
  INSERT INTO PHIEUXUATHANG VALUES (var_mapx, var_madl, num_tongtien, nglap, 
                                    num_tientra, num_sotienno, var_cmnd);
  COMMIT;
END;
/
--FUNCTION IN THONG TIN
CREATE OR REPLACE FUNCTION Func_ThongTinDaiLy(var_madl IN daily.madaily%TYPE)
RETURN VARCHAR2
AS
    var_tendl daily.tendaily%TYPE;
    var_dc daily.diachi%TYPE;
    var_dt daily.dienthoai%TYPE;
    num_tongno daily.tongno%TYPE;
BEGIN
    SELECT TenDaiLy, DiaChi, DienThoai, TongNo INTO var_tendl, var_dc, var_dt, num_tongno 
    FROM DAILY
    WHERE MaDaiLy=var_madl;
    RETURN ' '||'
    Ten dai ly: '||var_tendl||'
    Dia chi: '||var_dc||'
    So dien thoai: '||var_dt||'
    Tong no: '||num_tongno;
END;
/
DECLARE
    madl daily.madaily%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE(ThongTinDaiLy('DL001'));
END;
/

--PROCEDURE UPDATE TONGNO
CREATE OR REPLACE PROCEDURE Pro_Update_TongNo(var_madl IN daily.madaily%TYPE, 
                                        num_tongno IN daily.tongno%TYPE,
                                        flag OUT number)
AS
    num_maxno NUMBER :=0;
BEGIN
    SELECT SoNoToiDa INTO num_maxno
    FROM LOAIDAILY LDL, DAILY DL
    WHERE LDL.MaLoaiDaiLy=DL.MaLoaiDaiLy AND DL.MaDaiLy=var_madl;
    
    IF(num_tongno<=num_maxno) THEN
        flag := 1;
    ELSE
        flag := 0;
        DBMS_OUTPUT.PUT_LINE('Tien no da vuot quy dinh, khong the cap nhat');
    END IF;
END;
/
DECLARE
BEGIN
    Pro_Update_TongNo('DL001',100000000);
END;
/

CREATE OR REPLACE PROCEDURE Pro_Insert_TongNo(var_maloaidaily IN daily.madaily%TYPE, 
                                        num_tongno IN daily.tongno%TYPE,
                                        flag OUT number)
AS
    num_maxno NUMBER :=0;
BEGIN
    SELECT SoNoToiDa INTO num_maxno
    FROM LOAIDAILY LDL
    WHERE LDL.MaloaiDaiLy=var_maloaidaily;
    
    IF(num_tongno<=num_maxno) THEN
        flag := 1;
    ELSE
        flag := 0;
        DBMS_OUTPUT.PUT_LINE('Tien no da vuot quy dinh, khong the cap nhat');
    END IF;
END;

--FUNCTION BAOCAODOANHSO
--Theo thang
CREATE OR REPLACE FUNCTION Func_TongDoanhSoTheoThang(thang IN NUMBER, nam IN NUMBER)
        RETURN NUMBER
AS
    num_tong NUMBER:=0;
BEGIN
    SELECT SUM(TongTien) INTO num_tong
    FROM PHIEUXUATHANG
    WHERE EXTRACT(YEAR FROM NGAYLAP)=nam AND EXTRACT(MONTH FROM NGAYLAP)=thang;
    RETURN num_tong;
END;
/
--Test
DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('Tong tri gia phieu xuat cua cac dai ly theo thang: '||Func_TongDoanhSoTheoThang(12,2020));
END;
/
--Theo nam
CREATE OR REPLACE FUNCTION Func_TongDoanhSoTheoNam(nam IN NUMBER)
        RETURN NUMBER
AS
    num_tong NUMBER:=0;
BEGIN
    SELECT SUM(TongTien) INTO num_tong
    FROM PHIEUXUATHANG
    WHERE EXTRACT(YEAR FROM NGAYLAP)=nam ;
    RETURN num_tong;
END;
/
--Test
DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('Tong tri gia phieu xuat cua cac dai ly nam: '||Func_TongDoanhSoTheoNam(2020));
END;
--FUNCTION TyLe
CREATE OR REPLACE FUNCTION Func_TyLeTheoThang(var_madl IN daily.madaily%TYPE,thang IN NUMBER,nam IN NUMBER)
        RETURN DECIMAL
AS
    tyle NUMBER:=0;
BEGIN
    SELECT (100*SUM(TongTien)/Func_TongDoanhSoTheoThang(thang,nam)) INTO tyle
    FROM PHIEUXUATHANG
    WHERE EXTRACT(YEAR FROM NGAYLAP)=nam AND EXTRACT(MONTH FROM NGAYLAP)=thang
        AND MaDaiLy=var_madl
    GROUP BY MaDaiLy;
    RETURN tyle;
END;
/
--Test
DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('Ty le: '||Func_TyLeTheoThang('DL002',1,2022));--Ty le: 37
END;
/

--FUNCTION BAOCAOCONGNO
CREATE OR REPLACE FUNCTION Func_NoCuoi(var_madl IN daily.madaily%TYPE,thang IN NUMBER,nam IN NUMBER)
        RETURN NUMBER
AS
    num_nocuoi NUMBER:=0;
    num_nodau NUMBER:=0;
    num_phatsinh NUMBER:=0;
    tongtientra NUMBER:=0;    
BEGIN
    
    SELECT SUM(SoTienThu)INTO tongtientra
    FROM PHIEUTHUTIEN
    WHERE EXTRACT(YEAR FROM NGAYTHUTIEN)=nam AND EXTRACT(MONTH FROM NGAYTHUTIEN)=thang
        AND MaDaiLy=var_madl
    GROUP BY MaDaiLy;
    
    SELECT NoDau, PhatSinh INTO num_nodau, num_phatsinh
    FROM BAOCAOCONGNO
    WHERE EXTRACT(YEAR FROM ThangVaNam)=nam AND EXTRACT(MONTH FROM ThangVaNam)=thang
        AND MaDaiLy=var_madl;
        
   num_nocuoi:=num_nodau+num_phatsinh-tongtientra;
    
    RETURN num_nocuoi;
END;
/
--Test
BEGIN
    DBMS_OUTPUT.PUT_LINE('No cuoi: '||Func_NoCuoi('DL003',1,2022));--No cuoi: 1160000
END;

CREATE OR REPLACE PROCEDURE Pro_HasLoaiDaiLy(var_maloaidl IN daily.maloaidaily%TYPE,flag OUT NUMBER)
AS
    count_maloaidaily NUMBER:=0;
BEGIN
    select count(*) into count_maloaidaily from loaidaily
    where maloaidaily = var_maloaidl;
    
    IF (count_maloaidaily > 0) THEN
        flag := 1;
        DBMS_OUTPUT.PUT_LINE('Ton tai dai ly');
    ELSE
        flag := 0;
    END IF;
END;

DECLARE
begin
    Pro_HASLOAIDAILY('L02');
end;

CREATE OR REPLACE FUNCTION Func_Nodau(var_madl IN daily.madaily%TYPE,thang IN NUMBER,nam IN NUMBER)
        RETURN NUMBER
AS
    num_nodau NUMBER:=0;
BEGIN
    begin
        select sotienno into num_nodau from phieuxuathang 
        where EXTRACT(month FROM ngaylap) = thang and EXTRACT(year FROM ngaylap) = nam
        and madaily = var_madl 
        and ((EXTRACT(day FROM ngaylap)) = (select min(EXTRACT(day FROM ngaylap)) from phieuxuathang));
        EXCEPTION
    wHEN NO_DATA_FOUND THEN
        num_nodau := 0;
    
    end;
    
    RETURN num_nodau;
END;

CREATE OR REPLACE FUNCTION Func_PhatSinh(var_madl IN daily.madaily%TYPE,thang IN NUMBER,nam IN NUMBER)
        RETURN NUMBER
AS
    num_phatsinh NUMBER:=0;
BEGIN
    begin
        select sum(sotienno) into num_phatsinh from phieuxuathang 
        where EXTRACT(month FROM ngaylap) = thang and EXTRACT(year FROM ngaylap) = nam
        and madaily = var_madl 
        and ((EXTRACT(day FROM ngaylap)) != (select min(EXTRACT(day FROM ngaylap)) from phieuxuathang));
        EXCEPTION
    wHEN NO_DATA_FOUND THEN
        num_phatsinh := 0;
    
    end;
    
    if num_phatsinh is null then
        num_phatsinh := 0;
    end if;

    RETURN num_phatsinh;
END;

BEGIN
    DBMS_OUTPUT.PUT_LINE('No phat sinh: '||Func_PhatSinh('DL003',1,2022));
END;

CREATE OR REPLACE FUNCTION Func_TienThu(var_madl IN daily.madaily%TYPE,thang IN NUMBER,nam IN NUMBER)
        RETURN NUMBER
AS
    num_sotienthu NUMBER:=0;
BEGIN
    begin
        select sum(sotienthu) into num_sotienthu from phieuthutien 
        where EXTRACT(month FROM ngaythutien) = thang and EXTRACT(year FROM ngaythutien) = nam
        and madaily = var_madl ;
    EXCEPTION
        wHEN NO_DATA_FOUND THEN
            num_sotienthu := 0;
    end;
    
    if num_sotienthu is null then
        num_sotienthu := 0;
    end if;

    RETURN num_sotienthu;
END;

BEGIN
    DBMS_OUTPUT.PUT_LINE('So tien thu: '||Func_TienThu('DL003',1,2022));
END;


CREATE OR REPLACE PROCEDURE Pro_BaoCaoCongNo(madl in daily.madaily%TYPE ,nam in Number,thang IN Number,
                                            nodau out number,phatsinh out number, nocuoi out number)
AS
    tienthu number := 0;
BEGIN
    nodau := Func_Nodau(madl,thang,nam);
    phatsinh := Func_phatsinh(madl,thang,nam);
    nocuoi := nodau + phatsinh - Func_tienthu(madl,thang,nam);
END;

BEGIN
    DBMS_OUTPUT.PUT_LINE('No phat sinh: '||Func_PhatSinh('DL003',1,2022));
END;

CREATE OR REPLACE FUNCTION Func_SoPhieuXuat(var_madl IN daily.madaily%TYPE,thang IN NUMBER,nam IN NUMBER)
        RETURN NUMBER
AS
    num_SoPhieuXuat NUMBER:=0;
BEGIN
    begin
        select count(*) into num_SoPhieuXuat from phieuxuathang 
        where EXTRACT(month FROM ngaylap) = thang and EXTRACT(year FROM ngaylap) = nam
        and madaily = var_madl ;
    EXCEPTION
        wHEN NO_DATA_FOUND THEN
            num_SoPhieuXuat := 0;
    end;
    
    if num_SoPhieuXuat is null then
        num_SoPhieuXuat := 0;
    end if;

    RETURN num_SoPhieuXuat;
END;
BEGIN
    DBMS_OUTPUT.PUT_LINE('So phieu xuat: '||Func_SoPhieuXuat('DL004',1,2022));
END;

CREATE OR REPLACE FUNCTION Func_TongTriGia(var_madl IN daily.madaily%TYPE,thang IN NUMBER,nam IN NUMBER)
        RETURN NUMBER
AS
    num_tongtrigia NUMBER:=0;
BEGIN
    begin
        select sum(tongtien) into num_tongtrigia from phieuxuathang 
        where EXTRACT(month FROM ngaylap) = thang and EXTRACT(year FROM ngaylap) = nam
        and madaily = var_madl ;
    EXCEPTION
        wHEN NO_DATA_FOUND THEN
            num_tongtrigia := 0;
    end;
    
    if num_tongtrigia is null then
        num_tongtrigia := 0;
    end if;

    RETURN num_tongtrigia;
END;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Tong tri gia: '||Func_TongTriGia('DL003',1,2022));
END;

CREATE OR REPLACE FUNCTION Func_Tyle(var_madl IN daily.madaily%TYPE,thang IN NUMBER,nam IN NUMBER)
        RETURN NUMBER
AS
    num_tongtrigia NUMBER:= Func_TongTriGia(var_madl,thang,nam);
    num_tongall number := 0;
BEGIN
    begin
        select sum(tongtien) into num_tongall from phieuxuathang 
        where EXTRACT(month FROM ngaylap) = thang and EXTRACT(year FROM ngaylap) = nam;
    EXCEPTION
        wHEN NO_DATA_FOUND THEN
            num_tongall := 1;
    end;
    
    if num_tongall is null then
        num_tongall := 1;
    end if;

    RETURN Round(num_tongtrigia/num_tongall,2);
END;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Tyle: '||FUNC_TYLE('DL003',1,2022));
END;

CREATE OR REPLACE PROCEDURE Pro_BaoCaoDoanhSo(madl in daily.madaily%TYPE ,nam in Number,thang IN Number,
                                            sophieuxuat out number,tongtrigia out number, tyle out number)
AS

BEGIN
    sophieuxuat := Func_sophieuxuat(madl,thang,nam);
    tongtrigia := Func_tongtrigia(madl,thang,nam);
    tyle := Func_tyle(madl,thang,nam);
END;



SET SERVEROUTPUT ON;
