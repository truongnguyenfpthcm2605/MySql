create database quanlyduanmoi;
use quanlyduanmoi;
create table phongban(
maPB varchar(5) primary key,
tenPB varchar(50)
);
create table duan(
 maDA varchar(5) primary key,
 tenDA varchar(50),
 ngaybd date,
 ngaykt date,
 maPB varchar(5), 
 foreign key(maPB) references phongban(maPB)
 
);
create table nhanvien(
	maNV int(5) primary key auto_increment,
    tenNV varchar(50),
    hoNV varchar(255),
    ngaysinh date,
    gioitinh tinyint(1) default 0,
    diachi varchar(255),
    luong decimal(10) check(luong>5000000),
    maPB varchar(5),
    foreign key (maPB) references phongban(maPB)
);
create table truongphong(
	maPB varchar(5),
    maNV int(5),
    primary key(maPB,maNV),
    foreign key (maPB) references phongban(maPB),
    foreign key (maNV) references nhanvien(maNV),
    unique(maPB, maNV)
);
create table phancong(
 maNV int(5)references nhanvien(maNV),
 maDA varchar(5) references duan(maDA),
 primary key(maNV,maDA),
 ngaythamgia date,
 ngakt date
 
 
);
