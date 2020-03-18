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