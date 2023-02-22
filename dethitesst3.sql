create database test3;
use test3;

-- tao bang
create table monhoc
(
	maMH varchar(7) primary key,
    tenMH varchar(50) ,
    soTC int 
);
create table sinhvien
(
	maSV varchar(7) primary key,
    hoSV varchar(50) ,
    tenSV varchar(20) ,
    ngaySinh date 
);
create table ketqua
(
	maSV varchar(7) references sinhvien(maSV),
    maMH varchar(7) references monhoc(maMH),
    diemthi double ,
    primary key(maSV,maMH)
);

-- them du lieu
insert into  monhoc  (maMH,tenMH) values
('COM107' , 'Tin học Online'),
('COM2033' , 'SQL Server'),
('MOB1014' , 'Lập trình Java 1');

insert into sinhvien values
('PS01242','Lê Thảo','Nguyên','2000-08-15'),
('PS01410','Nguyễn Hải','Yến','2002-10-20'),
('PS15106','Trần Từ','Hải','1996-01-09'),
('PS15250','Nguyễn','Bảo','1998-01-07');

insert into ketqua values
('PS01242','COM107',8.5),
('PS01242','COM2033',7),
('PS01242','MOB1014',9),
('PS15106','COM107',6),
('PS15106','COM2033',3.5);

-- 3.	Hiển thị đầy đủ thông tin danh sách sinh viên sinh sau năm 2000.

select * from sinhvien where year(ngaySinh) > 2000;

-- 4.	Hiển thị thông tin MaSV, HoSV, TenSV, MaMH, DiemThi. Danh sách sắp xếp tăng dần theo Diemthi.
select 
sinhvien.maSV,
hoSV,
tenSV,
monhoc.maMH,
diemthi
from sinhvien
inner join ketqua on   sinhvien.maSV = ketqua.maSV 
inner join monhoc on monhoc.maMH = ketqua.maMH 
group by monhoc.maMH
order by diemthi asc; 

-- 5.	Thay đổi điểm thi môn học COM107 cộng thêm 0.5 điểm
set SQL_safe_updates = 0;
update ketqua
set diemthi = diemthi + 0.5
where maMH = 'COM107';

-- 6.	Tính điểm trung bình theo Môn học,
--  thông tin gồm: MaMH, TenMH, DiemTB. Chỉ hiển thị các môn học có điểm trung bình dưới 7.
select 
monhoc.maMH,
tenMH,
avg(diemthi) as 'diemTB'
from monhoc 
inner join ketqua on monhoc.maMH = ketqua.maMH
group by 
monhoc.maMH
having avg(diemthi) <7;

-- 7.	Hiển thị thông tin của tất cả các môn học có DiemTB thấp nhất

select 
monhoc.*,
avg(diemthi) as 'diemTB'
from monhoc 
inner join ketqua on monhoc.maMH = ketqua.maMH
group by monhoc.maMH
order by avg(diemthi) asc limit 1;

-- 8.	Hiển thi thông tin của tất cả các môn học có DiemTB thấp thứ nhì
select 
avg(diemthi) as 'diemTb'
from ketqua 
group by maMH 
order by avg(diemthi) asc limit 1;


-- Xét diem trung bbinhh thap thứ 2
select 
monhoc.maMH,
avg(diemthi) as 'diemTB'
from monhoc 
inner join ketqua on monhoc.maMH = ketqua.maMH
group by monhoc.maMH having avg(diemthi) >
(
		select 
		avg(diemthi) as 'diemTb'
		from ketqua 
		group by maMH 
		order by avg(diemthi) 
) ;




