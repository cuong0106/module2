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