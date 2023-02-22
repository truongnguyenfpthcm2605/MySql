create database PS24083_NGUYENVANTRUONG_QLSV;
USE PS24083_NGUYENVANTRUONG_QLSV;
CREATE TABLE MONHOC (
	MAMH varchar(7) PRIMARY KEY,
    TENMH varchar(50),
    SOTC int 
);
CREATE TABLE SINHVIEN(
	MASV varchar(7) PRIMARY KEY NOT NULL,
    HOSV varchar(50) ,
    TENSV varchar(20) ,
    NGAYSINH date
);
CREATE TABLE KETQUA(
	MASV varchar(7) references SINHVIEN(MASV),
    MAMH varchar(7) references MONHOC(MAMH),
    DIEMTHI float(3,1),
    primary key(MASV,MAMH)
    
);
INSERT INTO MONHOC(MAMH, TENMH)
VALUES ('COM1024',N'Tin học văn phòng'),
('COM2012',N'Cơ sở dữ liệu'),
('MOB1013',N'Lập trình Java 1'); 
INSERT INTO SINHVIEN
VALUES ('PS02942',N'Lê Thảo',N'Nguyên','2000-08-15'),
('PS04510',N'Nguyễn Hải',N'Yến','2002-10-20'),
 ('PS10106',N'Trần Từ',N'Hải','1996-01-09'),
 ('PS10250',N'Nguyễn',N'Bảo','1998-01-07');
INSERT INTO KETQUA
VALUES ('PS02942','COM1024',8.5),
('PS02942','COM2012',7),
 ('PS02942','MOB1013',9),
('PS10106','COM1024',6),
 ('PS10106','COM2012',3.5);
 
 -- 2. Cập nhật Số tín chỉ cho các môn hoc là 3
  set SQL_safe_updates = 0; 
 UPDATE monhoc
 set SOTC = 3;
 
 -- 3. Thêm một môn học mới, thông tin gồm: Mã MH: COM108, Tên MH: Lập trình cơ bản, 
-- Số TC: 2
INSERT INTO monhoc values('COM108','lập trình cơ bản',2
);

-- 4. Liệt kê các môn học mà Mã MH bắt đầu là COM gồm: Mã MH, TenMH, DiemTB. 
-- Sắp xếp theo DiemTB giảm dần.
select 
monhoc.MAMH,
TENMH,
DIEMTHI
FROM monhoc INNER JOIN ketqua on monhoc.MAMH = ketqua.MAMH
WHERE monhoc.MAMH like "COM%" 
group by monhoc.MAMH
order by DIEMTHI ASC;

-- 5. Danh sách sinh viên có điểm TB các môn nhỏ hơn 5 điểm.
select 
sinhvien.MASV
HOSV,
TENSV,
NGAYSINH,
DIEMTHI
 FROM sinhvien 
inner join ketqua on sinhvien.MASV = ketqua.MASV
WHERE DIEMTHI < 5
group by sinhvien.MASV;

-- 6. Lấy ra danh sách sinh viên có tuổi từ 18-21 tuổi.
select * FROM sinhvien 
where (year(curdate()) - year(NGAYSINH)) >=18 AND (year(curdate()) - year(NGAYSINH))<=21;

-- 7. Hiển thị danh sách sinh viên chưa thi môn nào gồm: Mã SV, Họ và Tên, Ngày sinh.
select * FROM sinhvien 
where sinhvien.MASV NOT IN(
select ketqua.MASV
 FROM ketqua
) group by sinhvien.MASV;


 

