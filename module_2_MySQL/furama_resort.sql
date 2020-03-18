drop database if exists database_furama;
create database database_furama;
use database_furama;
create table vitri(
idViTri int NOT NULL AUTO_INCREMENT,
ten varchar(50) NOT NULL,
PRIMARY KEY (idViTri)
);
create table trinhdo(
idTrinhDo int NOT NULL AUTO_INCREMENT,
trinhdo varchar(50) NOT NULL,
PRIMARY KEY (idTrinhDo)
);
create table bophan(
idBoPhan int NOT NULL AUTO_INCREMENT,
tenBoPhan varchar(50) NOT NULL,
PRIMARY KEY (idBoPhan)
);
create table nhanVien(
idNhanVien int NOT NULL AUTO_INCREMENT,
hoTen varchar(50) NOT NULL,
idViTri int NOT NULL,
idTrinhDo int NOT NULL,
idBoPhan int NOT NULL,
ngaySinh date NOT NULL,
soCMND varchar(45) NOT NULL,
luong varchar(45) NOT NULL,
SDT varchar(10) NOT NULL,
email varchar(50),
diaChi varchar(50),
PRIMARY KEY (idNhanVien),
FOREIGN KEY (idViTri) REFERENCES vitri(idViTri),
FOREIGN KEY (idTrinhDO) REFERENCES trinhdo(idTrinhDO),
FOREIGN KEY (idBoPhan) REFERENCES bophan(idBoPhan)
);
create table dichVuDiKem(
idDichVuDiKem int NOT NULL AUTO_INCREMENT,
tenDichVuDiKem varchar(50) NOT NULL,
gia int NOT NULL,
donVi int NOT NULL,
trangThaiKhaDung varchar(45) NOT NULL,
PRIMARY KEY (idDichVuDiKem)
);
create table loaiKhach(
idLoaiKhach int NOT NULL AUTO_INCREMENT,
tenLoaiKhach varchar(50) NOT NULL,
PRIMARY KEY (idLoaiKhach)
);
create table khachHang(
idKhachHang int NOT NULL AUTO_INCREMENT,
idLoaiKhach int NOT NULL,
hoTen varchar(50) NOT NULL,
ngaySinh date NOT NULL,
soCMND varchar(45) NOT NULL,
SDT varchar(10) NOT NULL,
email varchar(50),
diaChi varchar(50),
PRIMARY KEY (idKhachHang),
FOREIGN KEY (idLoaiKhach) REFERENCES loaikhach(idLoaiKhach)
);
create table kieuthue(
idKieuThue int NOT NULL AUTO_INCREMENT,
tenKieuThue varchar(50) NOT NULL,
gia int NOT NULL,
PRIMARY KEY (idKieuThue)
);
create table loaidichvu(
idLoaiDichVu int NOT NULL AUTO_INCREMENT,
tenLoaiDichVu varchar(50) NOT NULL,
PRIMARY KEY (idLoaiDichVu)
);
create table dichvu(
idDichVu int NOT NULL AUTO_INCREMENT,
tenDichVu varchar(50) NOT NULL,
dienTich int NOT NULL,
soNguoiToiDa int NOT NULL,
chiPhiThue varchar(45) NOT NULL,
idKieuThue int NOT NULL,
idLoaiDichVu int NOT NULL,
trangThai varchar(10) NOT NULL,
PRIMARY KEY (idDichVu),
FOREIGN KEY (idKieuThue) REFERENCES kieuthue(idKieuThue),
FOREIGN KEY (idLoaiDichVu) REFERENCES loaidichvu(idLoaiDichVu)
);
create table hopdong(
idHopDong int NOT NULL AUTO_INCREMENT,
idNhanVien int NOT NULL,
idKhachHang int NOT NULL,
idDichVu int NOT NULL,
ngayLamHopDong date NOT NULL,
ngayKetThucHopDong date NOT NULL,
tienDatCoc int NOT NULL,
tongTien int NOT NULL,
PRIMARY KEY (idHopDong),
FOREIGN KEY (idNhanVien) REFERENCES nhanvien(idNhanVien) ON DELETE CASCADE,
FOREIGN KEY (idKhachHang) REFERENCES khachhang(idKhachHang) ON DELETE CASCADE,
FOREIGN KEY (idDichVu) REFERENCES dichvu(idDichVu)
);
create table hopdongchitiet(
idHopDongChiTiet int NOT NULL AUTO_INCREMENT,
idHopDong int NOT NULL,
idDichVuDiKem int NOT NULL,
soLuong int NOT NULL,
PRIMARY KEY (idHopDongChiTiet),
FOREIGN KEY (idHopDong) REFERENCES hopdong(idHopDong) ON DELETE CASCADE,
FOREIGN KEY (idDichVuDiKem) REFERENCES dichvudikem(idDichVuDiKem)
);
-- tạo bảng

SET SQL_SAFE_UPDATES = 0;
delete from hopdongchitiet;
delete from hopdong;
delete from dichvu;
delete from loaidichvu;
delete from kieuthue;
delete from khachhang;
delete from loaikhach;
delete from dichvudikem;
delete from nhanvien;
delete from bophan;
delete from trinhdo;
delete from vitri;

insert into vitri(idViTri,ten) value(1,'nhân viên bán hàng');
insert into vitri(idViTri,ten) value(2,'giám đốc');

insert into trinhdo(idTrinhDo, trinhdo) value(1, 'đại học');
insert into trinhdo(idTrinhDo, trinhdo) value(2, 'cao đẳng');

insert into bophan(idBoPhan, tenBoPhan) value(1, 'bán hàng');
insert into bophan(idBoPhan, tenBoPhan) value(2, 'quảng lý');

insert into nhanvien(idNhanVien, hoTen, idViTri, idTrinhDo, idBoPhan, ngaySinh, soCMND, luong, SDT, email, diaChi) 
value(1, 'Nguyễn Văn A',1,1,1,'1990/10/10',123456789,10000000,0123456789,'nguyenvana@gmail.com', 'sơn trà đà nẵng');
insert into nhanvien(idNhanVien, hoTen, idViTri, idTrinhDo, idBoPhan, ngaySinh, soCMND, luong, SDT, email, diaChi) 
value(2, 'Hồ Văn B',1,1,1,'1990/10/10',123456799,10000000,0123456799,'hovanb@gmail.com', 'sơn trà đà nẵng');
insert into nhanvien(idNhanVien, hoTen, idViTri, idTrinhDo, idBoPhan, ngaySinh, soCMND, luong, SDT, email, diaChi) 
value(3, 'Trần Tuấn Anh Kiệt',1,1,1,'1990/10/10',123456999,10000000,0123456999,'trantuananhkiet@gmail.com', 'sơn trà đà nẵng');

insert into dichvudikem(idDichVuDiKem,tenDichVuDiKem,gia,donVi,trangThaiKhaDung) 
value(1,'massage',1,1000,'trạng thái không biết');
insert into dichvudikem(idDichVuDiKem,tenDichVuDiKem,gia,donVi,trangThaiKhaDung) 
value(2,'karaoke',2,1000,'trạng thái không biết');
insert into dichvudikem(idDichVuDiKem,tenDichVuDiKem,gia,donVi,trangThaiKhaDung) 
value(3,'thức ăn',3,1000,'trạng thái không biết');
insert into dichvudikem(idDichVuDiKem,tenDichVuDiKem,gia,donVi,trangThaiKhaDung) 
value(4,'nước uống',4,1000,'trạng thái không biết');
insert into dichvudikem(idDichVuDiKem,tenDichVuDiKem,gia,donVi,trangThaiKhaDung) 
value(5,'thuê xe di chuyển tham quan resort',5,1000,'trạng thái không biết');

insert into loaikhach(idLoaiKhach,tenLoaiKhach) value(1,'Diamond');
insert into loaikhach(idLoaiKhach,tenLoaiKhach) value(2,'Platinium');
insert into loaikhach(idLoaiKhach,tenLoaiKhach) value(3,'Gold');
insert into loaikhach(idLoaiKhach,tenLoaiKhach) value(4,'Silver');
insert into loaikhach(idLoaiKhach,tenLoaiKhach) value(5,'Member');

insert into khachhang(idKhachHang,idLoaiKhach,hoTen,ngaySinh,soCMND,SDT,email,diaChi)
value(1,1,'Hồ Văn Quốc A','2010/11/10',123456781,0123456781,'hovanquoca@gmail.com','trần cao vân đà nẵng việt nam');
insert into khachhang(idKhachHang,idLoaiKhach,hoTen,ngaySinh,soCMND,SDT,email,diaChi)
value(2,1,'Hồ Văn Quốc B','1990/11/10',123456721,0123456782,'hovanquocb@gmail.com','trần cao vân quãng trị việt nam');
insert into khachhang(idKhachHang,idLoaiKhach,hoTen,ngaySinh,soCMND,SDT,email,diaChi)
value(3,1,'Hồ Văn Quốc C','1900/11/10',123456783,0123456783,'hovanquocv@gmail.com','trần cao vân việt nam');
insert into khachhang(idKhachHang,idLoaiKhach,hoTen,ngaySinh,soCMND,SDT,email,diaChi)
value(4,2,'Hồ Văn','1990/11/10',123456784,0123456784,'hovan@gmail.com','trần cao vân vinh việt nam');
insert into khachhang(idKhachHang,idLoaiKhach,hoTen,ngaySinh,soCMND,SDT,email,diaChi)
value(5,3,'Hồ Văn Quốc D','1991/11/10',123456785,0123456785,'hovanquocd@gmail.com','trần cao vân quảng ngãi việt nam');
insert into khachhang(idKhachHang,idLoaiKhach,hoTen,ngaySinh,soCMND,SDT,email,diaChi)
value(6,1,'Nguyễn Văn A','1992/11/10',123456786,0123456786,'nguyenvana@gmail.com','trần cao vân vinh việt nam');
insert into khachhang(idKhachHang,idLoaiKhach,hoTen,ngaySinh,soCMND,SDT,email,diaChi)
value(7,1,'Nguyễn Văn A','1992/11/10',123456786,0123456786,'nguyenvana@gmail.com','trần cao vân quảng ngãi việt nam');

insert into	kieuthue(idKieuThue,tenKieuThue,gia)
value (1,'thuê theo năm',3650);
insert into	kieuthue(idKieuThue,tenKieuThue,gia)
value (2,'thuê theo tháng',300);
insert into	kieuthue(idKieuThue,tenKieuThue,gia)
value (3,'thuê theo ngày',10);
insert into	kieuthue(idKieuThue,tenKieuThue,gia)
value (4,'thuê theo giờ',1);

insert into loaidichvu(idLoaiDichVu,tenLoaiDichVu) value(1,'Villa');
insert into loaidichvu(idLoaiDichVu,tenLoaiDichVu) value(2,'House');
insert into loaidichvu(idLoaiDichVu,tenLoaiDichVu) value(3,'Room');

insert into dichvu(idDichVu,tenDichVu,dienTich,soNguoiToiDa,chiPhiThue,idKieuThue,idLoaiDichVu,trangThai)
value(1,'tên dịch vụ 1', 10, 5, 1, 1, 1,'trống');
insert into dichvu(idDichVu,tenDichVu,dienTich,soNguoiToiDa,chiPhiThue,idKieuThue,idLoaiDichVu,trangThai)
value(2,'tên dịch vụ 2', 20, 10, 2, 2, 2,'trống');
insert into dichvu(idDichVu,tenDichVu,dienTich,soNguoiToiDa,chiPhiThue,idKieuThue,idLoaiDichVu,trangThai)
value(3,'tên dịch vụ 3', 30, 15, 3, 3, 3,'trống');
insert into dichvu(idDichVu,tenDichVu,dienTich,soNguoiToiDa,chiPhiThue,idKieuThue,idLoaiDichVu,trangThai)
value(4,'tên dịch vụ 4', 40, 20, 4, 4, 1,'trống');

insert into hopdong(idHopDong,idNhanVien,idKhachHang,idDichVu,ngayLamHopDong,ngayKetThucHopDong,tienDatCoc,tongTien)
value (1, 1, 1, 1, '2020/03/12', '2021/03/12', 10, 1000);
insert into hopdong(idHopDong,idNhanVien,idKhachHang,idDichVu,ngayLamHopDong,ngayKetThucHopDong,tienDatCoc,tongTien)
value (2, 1, 1, 1, '2018/03/12', '2019/03/12', 10, 1000);
insert into hopdong(idHopDong,idNhanVien,idKhachHang,idDichVu,ngayLamHopDong,ngayKetThucHopDong,tienDatCoc,tongTien)
value (3, 2, 2, 2, '2018/03/12', '2018/04/12', 10, 1000);
insert into hopdong(idHopDong,idNhanVien,idKhachHang,idDichVu,ngayLamHopDong,ngayKetThucHopDong,tienDatCoc,tongTien)
value (4, 3, 2, 2, '2019/03/12', '2019/04/12', 10, 1000);
insert into hopdong(idHopDong,idNhanVien,idKhachHang,idDichVu,ngayLamHopDong,ngayKetThucHopDong,tienDatCoc,tongTien)
value (5, 2, 2, 3, '2019/11/12', '2019/12/12', 10, 1000);
insert into hopdong(idHopDong,idNhanVien,idKhachHang,idDichVu,ngayLamHopDong,ngayKetThucHopDong,tienDatCoc,tongTien)
value (6, 1, 5, 3, '2019/10/12', '2019/10/12', 10, 1000);

insert into hopdongchitiet(idHopDongChiTiet,idHopDong,idDichVuDiKem,soLuong)
value(1,1,1,2),
(2,2,1,3),
(3,1,2,3),
(4,6,1,3),
(5,6,2,3),
(6,6,3,3),
(7,5,4,3),
(8,5,2,3);

-- dữ liệu

-- câu 2;
-- use tên database
select * 
from nhanvien
where (hoTen regexp '^[htk].*')  and length(hoTen)<=15;

-- câu 3;
SELECT 
    *
FROM
    khachhang AS kh
WHERE
    (((YEAR(CURDATE()) - YEAR(kh.ngaySinh) > 18)
        OR (YEAR(CURDATE()) - YEAR(ngaySinh) = 18
        AND MONTH(CURDATE()) > MONTH(ngaySinh))
        OR (YEAR(CURDATE()) - YEAR(ngaySinh) = 18
        AND MONTH(CURDATE()) = MONTH(ngaySinh)
        AND DAY(CURDATE()) > DAY(ngaySinh)))
        AND ((YEAR(CURDATE()) - YEAR(ngaySinh) < 50)
        OR (YEAR(CURDATE()) - YEAR(ngaySinh) = 50
        AND MONTH(CURDATE()) < MONTH(ngaySinh))
        OR (YEAR(CURDATE()) - YEAR(ngaySinh) = 50
        AND MONTH(CURDATE()) = MONTH(ngaySinh)
        AND DAY(CURDATE()) < DAY(ngaySinh))))
        AND (DiaChi LIKE ('%quang tri%')
        OR diaChi LIKE ('%da nang%'));

-- câu 4

select  kh.idKhachHang, kh.HoTen,count(*) as 'số lần đặt phòng'
from (hopdong hd join khachhang kh on hd.IDKhachHang=kh.IDKhachHang) join loaikhach lk on lk.IDLoaiKhach=lk.IDLoaiKhach
where lk.TenLoaiKhach='Diamond'
group by kh.HoTen
order by count(*);

-- câu 5

select kh.IDKhachHang, kh.HoTen, hd.IDHopDong, hd.NgayLamHopDong, hd.ngayKetThucHopDong, (dv.ChiPhiThue+hdct.SoLuong*dvdk.Gia) as TongTien
from khachhang kh
left join hopdong hd on hd.IDKhachHang = kh.IDKhachHang
left join dichvu dv on dv.IDDichvu=hd.IDDichvu 
left join hopdongchitiet hdct on hdct.IDHopDong=hd.IDHopDong
left join dichvudikem dvdk on dvdk.IDDichVuDiKem=hdct.IDDichVuDiKem  ;


-- câu 6
select * from dichvu;
select * from hopdong;
SELECT 
    dv.idDichVu,
    tenDichVu,
    dienTich,
    chiPhiThue,
    tenLoaiDichVu,
    ngayLamHopDong
FROM
    dichvu dv
        INNER JOIN
    loaidichvu ldv ON dv.idLoaiDichVu = ldv.idLoaiDichVu
        LEFT JOIN
    hopdong hd ON dv.idDichVu = hd.idDichVu
WHERE
    NOT EXISTS( SELECT 
            idDichVu
        FROM
            hopdong hd
        WHERE
            hd.idDichVu=dv.idDichVu and
            YEAR(hd.ngayLamHopDong) >= 2019);

-- câu 7

SELECT 
    DV.idDichVu,
    DV.tenDichVu,
    DV.dienTich,
    DV.soNguoiToiDa,
    DV.chiPhiThue,
    LDV.tenLoaiDichVu
FROM
    dichvu DV
        INNER JOIN
    loaidichvu LDV ON DV.idLoaiDichVu = LDV.idLoaiDichVu
        LEFT JOIN
    hopdong HD ON DV.idDichVu = HD.idDichVu
WHERE
		EXISTS( SELECT 
            idDichVu
        FROM
            hopdong HD
        WHERE
            HD.idDichVu=dv.idDichVu 
            and YEAR(HD.ngayLamHopDong) = 2019 )
    and NOT EXISTS( SELECT 
            idDichVu
        FROM
            hopdong HD
        WHERE
            HD.idDichVu=DV.idDichVu 
            and YEAR(HD.ngayLamHopDong) >= 2019 );
            
-- bài 8
-- cách 1
select distinct Hoten
from khachhang;

-- cách 2
SELECT
    Hoten
FROM
    khachhang
GROUP BY HoTen
HAVING COUNT(HoTen) >= 1;

-- cách 3
SELECT 
    Hoten
FROM
    khachhang
UNION SELECT 
    Hoten
FROM
    khachhang;

-- bài 9
select month(NgayLamHopDong) as thang,sum(tongTien) as 'tổng tiền trong tháng'
from hopdong
where year(NgayLamHopDong)=2019
group by thang;

-- bài đúng
drop table if exists Temp;
create temporary table Temp
select 1 as Month
union
select 2 as Month
union
select 3 as Month
union
select 4 as Month
union
select 5 as Month
union
select 6 as Month
union
select 7 as Month
union
select 8 as Month
union
select 9 as Month
union
select 10 as Month
union
select 11 as Month
union
select 12 as Month;
Select Month, count(month(NgayLamHopDong)) as 'Số lần đặt'
From Temp
Left join hopdong on month(NgayLamHopDong) = Month
and year(ngayLamHopDong) = 2019
group by Month
order by Month;

-- bài 10
select hopdong.idHopDong, ngayLamHopDong, ngayKetThucHopDong, tienDatCoc, count(idHopDongChiTiet) as soLuongDichVuDiKem
from hopdong
right join hopdongchitiet on hopdong.idHopDong = hopdongchitiet.idHopDong
group by idHopDong;

-- bài 11
select *
from dichvudikem DVDK
where DVDK.idDichVuDiKem in(
select HDCT.idDichVuDiKem from hopdongchitiet HDCT,hopdong HD,khachhang KH ,loaikhach LKH
where (LKH.tenLoaiKhach = 'Diamond'
and (KH.diaChi like '%vinh%' 
or KH.diaChi like '%quảng ngãi%')));

-- bài 12
select HD.idHopDong, NV.hoTen 'họ tên nhân viên', KH.hoTen 'họ tên khách hàng',
 KH.SDT, tenDichVu, count(HDCT.idHopDong) as 'số lượng dịch vụ đi kèm',tienDatCoc
from hopdong HD
inner join nhanvien  NV on HD.idNhanVien = NV.idNhanVien 
inner join khachhang KH on HD.idKhachHang = KH.idKhachHang
inner join dichvu DV on HD.idDichVu = DV.idDichVu
left join hopdongchitiet HDCT on HD.idHopDong = HDCT.idHopDong
where HD.idHopDong in(
select HD.idHopDong from	hopdong HD
where 
year(ngayLamHopDong)=2019
and month(ngayLamHopDong)>9
and HD.idHopDong not in(
select HD.idHopDong from hopdong HD
where year(ngayLamHopDong)=2019
and month(ngayLamHopDong)<7))
group by HDCT.idHopDong;

-- bài 13
 SELECT 
    *
FROM
    dichvudikem
WHERE
    IDDichVuDiKem IN (SELECT 
            IDDichVuDiKem
        FROM
            hopdongchitiet
        GROUP BY IDDichVuDiKem
        HAVING COUNT(IDDichVuDiKem) = (SELECT 
                MAX(soluongDV)
            FROM
                (SELECT 
                    idDichVuDiKem, COUNT(*) AS soluongDV
                FROM
                    hopdongchitiet
                GROUP BY IDDichVuDiKem) a));

-- bài 14
select HDCT.IDHopDong,TenLoaiDichVu, TenDichVuDiKem,count(DVDK.idDichVuDiKem) SoLanSuDung
from hopdongchitiet HDCT
join dichvudikem DVDK on HDCT.idDichVuDiKem = DVDK.idDichVuDiKem
join hopdong HD on HDCT.idHopDong = HD.idHopDong
join dichvu DV on HD.idDichVu = DV.idDichVu
join loaidichvu LDV on DV.idLoaiDichVu = LDV.idLoaiDichVu
group by DVDK.idDichVuDiKem
having SoLanSuDung=1;

-- bài 15
select idNhanVien,hoTen,trinhDo,tenBoPhan,SDT,diaChi
from nhanvien NV
join trinhdo TD on NV.idTrinhDo = TD.idTrinhDo
join bophan BP on NV.idBoPhan = BP.idBoPhan
where idNhanVien in(
select idNhanVien
from hopdong HD
where year(ngayLamHopDong) between 2018 and 2019
group by idNhanVien
having count(idNhanVien)<4);

-- bài 16
delete from nhanvien
where idNhanVien not in(select idNhanVien
from hopdong HD 
where year(ngayLamHopDong) between 2017 and 2019
);

-- bài 17
update khachHang KH
set idLoaiKhach= 2  
where idLoaiKhach = 1
and idKhachHang in(select idKhachHang
from hopdong HD
where year(ngayLamHopDong)=2019
group by idKhachHang
having sum(tongTien)>10000000);

-- bài 18
delete from khachhang
where idKhachHang in(select idKhachHang
from hopdong HD
where year(ngayLamHopDong)<2019
);

-- bài 19
update dichvudikem
set gia = gia*2
where idDichVuDiKem in(select idDichVuDiKem
from hopdongchitiet HDCT
join hopdong HD on HDCT.idhopdong = HD.idHopDong
where year(ngayLamHopDong)=2019
group by idDichVuDiKem
having count(idDichVuDiKem)>1);

-- bài 20
select  idNhanVien ID, hoTen, email, SDT, ngaySinh, diaChi
from nhanvien as NV
UNION all
select idkhachhang, hoTen, email, SDT, ngaySinh, diaChi
from khachhang as KH

-- bài tập