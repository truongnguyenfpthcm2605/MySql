create database duanbds;
use duanbds;
create table vanphong(
	maVP varchar(5) primary key,
    diadiem varchar(255) 
);
create table nhavien(
	maNV varchar(5) primary key,
    tenNV varchar(50) not null,
    maVP varchar(5), -- references vanphong(maVP),
    foreign key(maVP) references vanphong(maVP)
    
);
create table nhanthan(
	tenNT varchar(30),
    ngaysinh date,
    maNV varchar(5) references nhanvien(maNV)
);
create table bds(
	maBDS varchar(5) primary key,
    diachi varchar(255),
    maVP varchar(5) references vanphong(maVP),
    maCSH varchar(5) references chusohuu(maCSH)
    
);
create table chusohuu(
	maCSH varchar(5) primary key,
    ten varchar(30) ,
    sdt int(12),
    diachi varchar(255)
);
create table truongphong(
	maVP varchar(5) references vanphong(maVP),
    maNV varchar(5) references nhanvien(maNV),
    primary key (maVP,maNV)

);