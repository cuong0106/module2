-- câu 1;
select * 
from nhanvien
where (hoTen regexp '^[htk].*')  and length(hoTen)<=15;

-- câu 2;
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

-- câu 3

select  kh.idKhachHang, kh.HoTen,count(*) as 'số lần đặt phòng'
from (hopdong hd join khachhang kh on hd.IDKhachHang=kh.IDKhachHang) join loaikhach lk on lk.IDLoaiKhach=lk.IDLoaiKhach
where lk.TenLoaiKhach='Diamond'
group by kh.HoTen
order by count(*);

-- câu 4

select kh.IDKhachHang, kh.HoTen, hd.IDHopDong, hd.NgayLamHopDong, hd.ngayKetThucHopDong, (dv.ChiPhiThue+hdct.SoLuong*dvdk.Gia) as TongTien
from khachhang kh
left join hopdong hd on hd.IDKhachHang = kh.IDKhachHang
left join dichvu dv on dv.IDDichvu=hd.IDDichvu 
left join hopdongchitiet hdct on hdct.IDHopDong=hd.IDHopDong
left join dichvudikem dvdk on dvdk.IDDichVuDiKem=hdct.IDDichVuDiKem  ;


-- câu 5
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

-- câu 6

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
            
-- bài 7
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

-- bài 8
select month(NgayLamHopDong) as thang,sum(tongTien) as 'tổng tiền trong tháng'
from hopdong
where year(NgayLamHopDong)=2019
group by thang;

-- bài 9
select hopdong.idHopDong, ngayLamHopDong, ngayKetThucHopDong, tienDatCoc, count(idHopDongChiTiet) as soLuongDichVuDiKem
from hopdong
right join hopdongchitiet on hopdong.idHopDong = hopdongchitiet.idHopDong
group by idHopDong;

-- bài 10
select *
from dichvudikem DVDK
where DVDK.idDichVuDiKem in(
select HDCT.idDichVuDiKem from hopdongchitiet HDCT,hopdong HD,khachhang KH ,loaikhach LKH
where (LKH.tenLoaiKhach = 'Diamond'
and (KH.diaChi like '%vinh%' 
or KH.diaChi like '%quảng ngãi%')));

-- bài 11
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

-- bài 12
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

-- bài 13
select HDCT.IDHopDong,TenLoaiDichVu, TenDichVuDiKem,count(DVDK.idDichVuDiKem) SoLanSuDung
from hopdongchitiet HDCT
join dichvudikem DVDK on HDCT.idDichVuDiKem = DVDK.idDichVuDiKem
join hopdong HD on HDCT.idHopDong = HD.idHopDong
join dichvu DV on HD.idDichVu = DV.idDichVu
join loaidichvu LDV on DV.idLoaiDichVu = LDV.idLoaiDichVu
group by DVDK.idDichVuDiKem
having SoLanSuDung=1;

-- bài 14
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

-- bài 15
delete from nhanvien
where idNhanVien not in(select idNhanVien
from hopdong HD 
where year(ngayLamHopDong) between 2017 and 2019
);

-- bài 16
update khachHang KH
set idLoaiKhach= 2  
where idLoaiKhach = 1
and idKhachHang in(select idKhachHang
from hopdong HD
where year(ngayLamHopDong)=2019
group by idKhachHang
having sum(tongTien)>10000000);

-- bài 17
delete from khachhang
where idKhachHang in(select idKhachHang
from hopdong HD
where year(ngayLamHopDong)<2019
);

-- bài 18
update dichvudikem
set gia = gia*2
where idDichVuDiKem in(select idDichVuDiKem
from hopdongchitiet HDCT
join hopdong HD on HDCT.idhopdong = HD.idHopDong
where year(ngayLamHopDong)=2019
group by idDichVuDiKem
having count(idDichVuDiKem)>1);

-- bài 19
select id, hoten, email, sdt, ngaysinh, diachi
from nhanvien as NV,khachhang as KH