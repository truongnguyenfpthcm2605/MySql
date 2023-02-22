------------------- CREATE DATABASE -------------------
CREATE DATABASE QLXUATKHO_COM1012;
USE QLXUATKHO_COM1012;
------------------- CREATE TABLE -------------------
CREATE TABLE LOAIHANG(
	MALOAI CHAR(4) NOT NULL,
    TENLOAI VARCHAR(100) NOT NULL,
    PRIMARY KEY(MALOAI)
);
CREATE TABLE HANGHOA(
	MAHH CHAR(4) NOT NULL,
    TENHH VARCHAR(30) NOT NULL,
    DONVT VARCHAR(15) NOT NULL,
    DONGIA DOUBLE NOT NULL,
    LOAI CHAR(4) NOT NULL,
    PRIMARY KEY(MAHH),
    FOREIGN KEY(LOAI) REFERENCES LOAIHANG(MALOAI)
);
CREATE TABLE CUAHANG(
	MACH CHAR(4) PRIMARY KEY NOT NULL,
    TENCH VARCHAR(120) NOT NULL,
    DIACHI VARCHAR(50) NOT NULL,
    SODT VARCHAR(15) NOT NULL,
    EMAIL VARCHAR(20),
    NGUOIDD VARCHAR(30)
);
CREATE TABLE PHIEUXUAT(
	SOPHIEU CHAR(5) NOT NULL,
    NGAYLAP DATE NOT NULL,
    NGAYXUAT DATE,
    MACH CHAR(4) NOT NULL,
    PRIMARY KEY(SOPHIEU),
    FOREIGN KEY(MACH) REFERENCES CUAHANG(MACH)
);
CREATE TABLE CTPHIEUXUAT(
	SOPHIEU CHAR(5) NOT NULL,
    MAHH CHAR(4) NOT NULL,
    SOLUONG INT NOT NULL,
    GHICHU VARCHAR(50),
    PRIMARY KEY(SOPHIEU, MAHH),
    FOREIGN KEY(SOPHIEU) REFERENCES PHIEUXUAT(SOPHIEU),
    FOREIGN KEY(MAHH) REFERENCES HANGHOA(MAHH)
);

------------------- INSERT INTO -------------------
INSERT INTO CUAHANG(MACH,TENCH,DIACHI,SODT,EMAIL,NGUOIDD) VALUES
	('CH01', 'Vân Thanh Fashion – Chi nhánh Quận 5','123 Nguyễn Trãi, Quận 5, Tp.HCM','0909099099','thanhtt@gmail.com','Trần Tuấn Thành'),
    ('CH02', 'Vân Thanh Fashion – TTTM AERON TÂN PHÚ','30 Bờ Bao Tân Thắng, Quận Tân Phú, Tp.HCM','0909099099','areontp@gmail.com','Nguyễn Thành Công'),
    ('CH03', 'Vân Thanh Fashion – Chi nhánh Quận 3','123 Nguyễn Trãi, Quận 5, Tp.HCM','0862887733','huongnk@gmail.com','Nguyễn Kim Hương'),
    ('CH04', 'Vân Thanh Fashion – Chi nhánh Vũng Tàu','123 Nguyễn Trãi, Quận 5, Tp.HCM','0909099099','thanhdt@gmail.com','Đỗ Thị Thanh'),
    ('CH05', 'Vân Thanh Fashion – Chi nhánh Hà Nội','123 Nguyễn Trãi, Quận 5, Tp.HCM','0909099099',null,'Trần Quốc Hậu');

INSERT INTO LOAIHANG(MALOAI,TENLOAI) VALUES
	('TTNA','Thời trang Nam công sở'),
    ('TTNU','Thời trang Nữ công sở'),
    ('DPHS','Đồng phục học sinh'),
    ('TTTE','Thời trang Trẻ em'),
    ('TTTN','Thời trang trung niên'),
    ('PKTT','Phụ kiện thời trang');

INSERT INTO HANGHOA(MAHH,TENHH,DONVT,DONGIA,LOAI) VALUES
	('AK01','Áo khoát KaKi nữ hàn Quốc','Cái',285000,'TTNU'),
    ('AK02','Áo khoát nữ dáng dài','cái',675000,'TTNU'),
    ('SM01','Áo sơ mi nam','Cái',315000,'TTNA'),
    ('SM02','Sơ mi ngắn tay cổ trụ','Cái',285000,'TTNA'),
    ('DA01','Đầm caro công sở','Cái',252000,'TTNU'),
    ('DP01','Đồng phục học sinh','Bộ',180000,'DPHS'),
    ('DP02','Đồng phục học sinh THCS','Bộ',220000,'DPHS'),
    ('BO01','Bộ thun trẻ em','Bộ',280000,'TTTE'),
    ('AO01','Áo thun bé trai ngắn tay','Cái',85000,'TTTE'),
    ('AO02','Áo khoát lửng trẻ em cao cấp','Cái',320000,'TTTE');

INSERT INTO PHIEUXUAT(SOPHIEU,NGAYLAP,NGAYXUAT,MACH) VALUES
	('PX011','2021-07-06','2021-07-12','CH01'),
    ('PX012','2021-07-12','2021-07-20','CH02'),
    ('PX013','2021-08-04','2021-08-20','CH05'),
    ('PX021','2021-08-09','2021-08-20','CH01'),
    ('PX022','2021-08-22','2021-09-20','CH01'),
    ('PX023','2021-09-06','2021-09-20','CH02'),
    ('PX024','2021-09-13','2021-09-20','CH05'),
    ('PX025','2021-09-16','2021-09-25','CH01'),
    ('PX031','2021-10-15',null,'CH01'),
    ('PX032','2021-01-15',null,'CH02'),
    ('PX033','2021-12-15',null,'CH01');

INSERT INTO CTPHIEUXUAT(SOPHIEU,MAHH,SOLUONG,GHICHU) VALUES
	('PX021','DA01',20,'Đủ size'),
    ('PX021','AO02',20,null),
    ('PX025','SM01',30,''),
    ('PX025','AK01',10,'Nhiều màu'),
    ('PX025','DP01',100,'Áo + Váy'),
    ('PX031','BO01',30,null),
    ('PX032','DP01',200,'Áo + Váy'),
    ('PX032','DP02',200,null),
    ('PX033','AO02',10,null),
    ('PX033','BO01',50,null),
    ('PX033','AO01',20,'Size 16-20'),
    ('PX033','AK01',12,'Màu Xanh, Hồng, Tím');  



