create database ps24083nguyenvantruongqlsv;
use ps24083nguyenvantruongqlsv;

CREATE TABLE MONHOC (
	maMH varchar(7) PRIMARY KEY,
    tenMH varchar(50),
    soTC int 
);
CREATE TABLE SINHVIEN(
	maSV varchar(7) PRIMARY KEY NOT NULL,
    hoSV varchar(50) ,
    tenSV varchar(20) ,
    ngaySinh date
);
CREATE TABLE KETQUA(
	maSV varchar(7) references SINHVIEN(maSV),
    maMH varchar(7) references MONHOC(maMH),
    diemthi float(3,1),
    primary key(maSV,maMH)
    
);

insert into monhoc(maMH,tenMH)
values 
('COM108','Nhập Môn lập Trình'),
('COM2033','HQT SQL Server'),
('MOB1014','Lập trình Java 1');   
insert into  SINHVIEN
values
('PS01242','Lê Thảo','Nguyên','2000-08-15'),
('PS01410','Nguyễn Hải','Yến','2002-10-20'),
('PS15106','Trần Từ','Hải','1996-01-09'),
('PS15250','Nguyễn','Bảo','1998-01-07');
insert into KETQUA
values
('PS01242','COM108',8.5),
('PS01242','COM2033',7),
('PS01242','MOB1014',9),
('PS15106','COM108',6),
('PS15106','COM2033',3.5);
-- 3.	Hiển thị thông tin MaSV, HoTenSV, NgaySinh. Danh sách sắp xếp giảm dần theo NgaySinh.
select 
maSV,
concat(hoSV ," ",tenSV) as 'hotenSv',
ngaySinh
from sinhvien 
order by ngaySinh desc;

-- 4.	Hiển thị đầy đủ thông tin các môn học có Mamh bắt đầu bằng COM.
select *
from monhoc
where maMH like 'COM%';

-- 5.	Hiển thị thông tin MaSV, HoSV, TenSV, TenMH, DiemThi. 

select 
sinhvien.maSV,
hoSV,
tenSV,
tenMH,
diemthi
from sinhvien 
inner join ketqua on sinhvien.maSV = ketqua.maSV
inner join monhoc on monhoc.maMH = ketqua.maMH;

-- 6.	Tính điểm trung bình theo Môn học, thông tin gồm: MaMH, TenMH, DiemTB
select 
monhoc.maMH,
tenMH,
avg(diemthi) as 'DTB'
from monhoc 
inner join ketqua on ketqua.maMH = monhoc.maMH
group by monhoc.maMH; 

-- 7.	Trừ bớt 0.5 điểm trong bảng KETQUA của môn học 'MOB1014'.
set SQL_safe_updates = 0;
update ketqua
set diemthi = diemthi -0.5
where maMH = 'MOB1014';

-- 8.	Hiển thị thông tin tất cả các môn học theo điểm TB.
--  Chỉ hiện thị các môn học có điểm TB không phải là lớn nhất 
--
select maMH,avg(diemThi) as DTB
from ketqua
group by maMH;

--  max
select max(DTB)
from (select maMH,avg(diemThi) as DTB
from ketqua
group by maMH)as A;

select
 monhoc.*,
 avg(ketqua.diemThi) as 'Diểm TB'
from monhoc
 inner join ketqua on monhoc.MaMH = ketqua.MaMH
group by monhoc.MaMH having avg(ketqua.diemThi) < 
(
	select max(DTB)
	from (select MaMH,avg(DiemThi) as DTB
	from ketqua
	group by MaMH)as A
);





 


    
