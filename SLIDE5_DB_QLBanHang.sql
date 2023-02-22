create database quanlybanhang;
use quanlybanhang;
create table Khach_Hang(
	maKhachHang varchar(5) primary key not null, -- mã khách hành, khóa chính
    tenVaHoLot varchar(50) ,-- Họ và tên lót khách hàng
    ten varchar(50), -- ten khách hang
    diaChi varchar(255), -- địa chỉ khách hàng
    Email varchar(50), -- email khách hàng
    dienThoai varchar(13) -- số điện thoại khách hàng
);
create table San_Pham(
	maSanPham int primary key auto_increment not null,
    tenSanPham varchar(50), -- tên sản phẩm
    moTa varchar(255), -- mô tả về Sản phẩm
    soLuongTonKho int, -- số lượng tồn kho
    check (soLuongTonKho > 0),
    donGia decimal -- đơn giá sản phẩm
    check (donGia > 0)
);
create table Hoa_Don(
	maHoaDon int primary key not null auto_increment,
    ngayMuaHang date, -- Ngày mua hàng
    trangThai varchar(255), -- Trang thái của đơn hàng ( đã thanh toán, chưa thanh toán...)
    maKhachHang varchar(5),
    foreign key(maKhachHang) references Khach_Hang (maKhachHang)
);
create table Hoa_Don_Chi_Tiet(
	maHoaDon int,
    maSanPham int,
    soLuong int,
    primary key(maHoaDon,maSanPham),
    foreign key(maHoaDon) references Hoa_Don(maHoaDon),
    foreign key(maSanPham) references San_Pham (maSanPham)
);
    
    
	
    