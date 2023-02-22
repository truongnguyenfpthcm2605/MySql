create database quanlynhansu55;
use quanlynhansu55;
CREATE TABLE PHONGBAN
(
mapb varchar(10) primary key,
tenpb varchar(255) not null unique,
matruongphong varchar(10)
);
CREATE TABLE NHANVIEN
(
manv int  primary key,
honv varchar(255),
tennv varchar(255),
ngaysinh date,
gioitinh bit,
diachi varchar(500),
luong decimal(18,0) default 0,
mapb varchar(10),
 foreign key(mapb) references PHONGBAN(mapb)
);

insert into PHONGBAN values('PB01', N'phòng giám đốc', 'nv01');
insert into PHONGBAN values('PB02', N'phòng kế toán', 'nv02');
insert into PHONGBAN values('PB03', N'phòng kinh doanh', 'nv03'),
('PB04',N'Phòng phát triển', 'nv04');

insert into NHANVIEN values(1,N'Nguyễn Văn', N'Tú', '1985-02-02',1,'tphcm',1000,'PB01');
insert into NHANVIEN values(2,N'nguyễn văn',N'Tú','1985-02-02',1,'141/15 tphcm',1000,'pb01'),
(3,N'phạm Văn',N'Đậu', '1997-04-07',1,N'Đồng Nai', 2000, 'pb01'),
(4,N'Nguyễn Thị',N'Nụ', '1997-04-07',0,N'Huế', 2000, 'pb01'),
(5,N'phạm Văn',N'Đậu', '1999-04-07',1,N'Đà nẵng', 2500, 'pb02'),
(6,N'Lê Thị',N'Đậu', '1998-05-07',1,N'Huế', 3000, 'pb02'),
(7,N'phạm Văn',N'Đậu', '1997-05-07',1,N'Đồng Nai', 2000, 'pb03');

-- Câu 3. Lấy ra 3 Nhân Viên
--  với thông tin gồm: Họ Và Tên, Địa Chỉ, Giới Tính, Tuổi (từ 18-22 ) N, Tuổi được sắp xếp giảm dần.
select 
concat(honv ," ", tennv) as 'HoTen',
diachi,
(year(curdate())- year(ngaysinh)) as 'Tuoi',
ngaysinh
from nhanvien 
where (year(curdate())- year(ngaysinh) )>=18 and  (year(curdate())- year(ngaysinh)) <=22 
group by manv
order by 'Tuoi' asc;
-- khong co ai tu 18-22 tuoi hets

-- Câu 4. Lấy ra những Nhân Viên ở ‘Huế’ có lương từ 2000 đến 2500
select * from nhanvien
where diachi like 'Huế' and luong >=2000 and luong <=2500
group by manv;

-- Câu 5. Lấy ra những phòng ban nào có số nhân viên <3
select phongban.*, count(nhanvien.mapb) as SLNV from phongban
inner join nhanvien on nhanvien.mapb = phongban.mapb
group by phongban.mapb having count(nhanvien.mapb) < 3;

-- Câu 6. Lấy ra những phòng ban không có nhân viên
select mapb from phongban 
where mapb not in (
select phongban.mapb 
from phongban
inner join nhanvien on nhanvien.mapb = phongban.mapb
);

-- Câu 7. Lấy ra mức lương trung bình lớn nhất của tất cả các phòng ban: 
-- Thông tin gồm: mã phòng ban, tên phòng ban, mức lương trung bình lớn nhất.

select phongban.mapb , phongban.tenpb , avg(nhanvien.luong) as LuongTB
from phongban 
inner join nhanvien on nhanvien.mapb = phongban.mapb
group by phongban.mapb
order by LuongTB desc limit 1 ;

-- Câu 8. Cập nhật Mã nhân Viên 1 sửa lại Họ và tên là Lê Anh Tú, Lương=2000, Địa Chỉ ở Gò-Vấp TPHCM, 
update nhanvien 
set honv = 'Lê Anh',
 tennv = "Tú" ,
 luong =2000,
  diachi = "Gò-Vấp TPHCM"
where manv = 1;

-- Câu 9. Thêm một nhân viên: 
-- insert into NHANVIEN: có họ tên là : Lê Văn Siêng, sinh năm 2002, địa chỉ ở Hà Nội thuộc phòng PB01
insert into nhanvien values (manv, honv,tennv,ngaysinh,gioitinh,diachi,luong,mapb), (8,'Lê Văn ','Siêng','2002-01-01',0,'Hà Nội',2000,'pb01');
-- Câu 10. Xóa phòng ban Pb03
delete from phongban
where mapb = 'pb03';
-- phai xoa khoa ngoai trước mới xóa dc











