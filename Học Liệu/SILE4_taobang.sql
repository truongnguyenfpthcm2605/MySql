create database if not exists congtyphanmemabc;
use congtyphanmemabc;
create table phong_ban(
	ma_pb varchar(7) not null primary key,
    ten_pb varchar(50)
);
create table nhan_vien (
	ma_nv int primary key auto_increment,
    ho_nv varchar(255),
    ten_nv varchar(50),
    ngay_sinh date,
    gioi_tinh int(1) default 0,
    dia_chi varchar(255),
    luong decimal(10) check( luong > 500),
    ma_pb varchar(7),
    foreign key(ma_pb) references phong_ban(ma_pb)
);
create table truong_phong (
	ma_nv int unique,
    ma_pb varchar(7) unique,
    primary key(ma_nv,ma_pb),
    foreign key (ma_nv) references nhan_vien(ma_nv),
    foreign key(ma_pb) references phong_ban(ma_pb)
);
create table du_an (
	ma_da varchar(7) not null primary key,
    ten_da varchar(50),
    ngay_bat_dau date,
    ngay_ket_thuc date,
    check(ngay_bat_dau < ngay_ket_thuc),
    ma_pb varchar(7),
    foreign key(ma_pb) references phong_ban(ma_pb)
);
create table phan_cong (
	ma_nv int,
    ma_da varchar(7),
    ngay_tham_gia date,
    ngay_ket_thuc date,
    check(ngay_tham_gia <= ngay_ket_thuc),
    so_gio double,
    vai_tro varchar(50),
    primary key(ma_nv,ma_da),
    foreign key(ma_nv) references nhan_vien(ma_nv),
    foreign key(ma_da) references du_an(ma_da)
);

