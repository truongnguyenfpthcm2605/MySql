use qlxuatkho_com1012;
-- 6.1.	Hiển thị tất cả mặt hàng. Danh sách sắp xếp theo đơn giá tăng dần.
select * FROM hanghoa 
order by hanghoa.DONGIA ASC;
-- 6.2.	Hiển thị tất cả các mặt hàng thuộc loại hàng “Thời trang”.
--  Thông tin gồm: mã mặt hàng, tên mặt hàng, đơn vị tính, qui cách, đơn giá, loại hàng.
-- doi ten cot trong bang
alter table hanghoa change column LOAI MALOAI char(4);
select 
hanghoa.MAHH,
TENHH,
DONVT,
DONGIA,
hanghoa.MALOAI
FROM hanghoa 
inner join loaihang on hanghoa.MALOAI = loaihang.MALOAI
WHERE hanghoa.MALOAI LIKE 'TT%';
 -- 6.3.	Thống kê số mặt hàng theo loại hàng, thông tin gồm: mã loại hàng, tên loại hàng, tổng số mặt hàng.
 -- Danh sách sắp xếp theo tổng số mặt hàng giảm dần.
 select 
 hanghoa.MALOAI,
 loaihang.TENLOAI,
 count(hanghoa.MAHH) as "Tong so MH"
 from hanghoa 
 inner join loaihang on hanghoa.MALOAI = loaihang.MALOAI
 inner join ctphieuxuat on hanghoa.MAHH = ctphieuxuat.MAHH
 group by loaihang.MALOAI,loaihang.TENLOAI order by  count(hanghoa.MAHH) desc;
 
 -- 6.4.	Liệt kê số phiếu xuất, ngày xuất hàng, tên cửa hàng, mã mặt hàng, tên mặt hàng, tên loại hàng, số lượng, đơn giá, thành tiền.
 select 
 phieuxuat.SOPHIEU,
 phieuxuat.NGAYXUAT,
 cuahang.TENCH,
 hanghoa.MAHH,
 hanghoa.TENHH,
 loaihang.TENLOAI,
 ctphieuxuat.SOLUONG,
 hanghoa.DONGIA,
 (ctphieuxuat.SOLUONG*hanghoa.DONGIA) as 'THANH TIEN'
 FROM 
 phieuxuat
 inner JOIN ctphieuxuat ON phieuxuat.SOPHIEU = ctphieuxuat.SOPHIEU
 inner JOIN hanghoa ON hanghoa.MAHH = ctphieuxuat.MAHH
 inner JOIN loaihang ON loaihang.MALOAI = hanghoa.MALOAI
 inner JOIN cuahang ON cuahang.MACH = phieuxuat.MACH;
 
 -- 6.5.	Thống kế tổng thành tiền hàng đã xuất mỗi tháng trong năm 2021 theo cửa hàng,
 -- thông tin gồm: tháng/năm, tên cửa hàng, tổng thành tiền.
 select 
 month(phieuxuat.NGAYXUAT) AS 'THANG',
 year(phieuxuat.NGAYXUAT) AS 'NAM',
 cuahang.TENCH,
 sum(ctphieuxuat.SOLUONG*hanghoa.DONGIA) as 'TONG THANH TIEN'
 from phieuxuat
 inner JOIN ctphieuxuat ON phieuxuat.SOPHIEU = ctphieuxuat.SOPHIEU
 inner JOIN cuahang ON cuahang.MACH = phieuxuat.MACH
 inner JOIN hanghoa ON hanghoa.MAHH = ctphieuxuat.MAHH
 where phieuxuat.NGAYXUAT >= '2021-01-01'
 group by phieuxuat.NGAYXUAT,cuahang.TENCH;
 
 -- 6.6.	Liệt kê 5 mặt hàng có số lượng xuất kho nhiều nhất trong tháng 9 năm 2021
 select 
 hanghoa.MAHH,
 hanghoa.TENHH,
 ctphieuxuat.SOLUONG ,
 phieuxuat.NGAYXUAT
 from hanghoa 
 inner JOIN ctphieuxuat ON ctphieuxuat.MAHH = hanghoa.MAHH
 inner JOIN phieuxuat ON phieuxuat.SOPHIEU = ctphieuxuat.SOPHIEU
 where month(phieuxuat.NGAYXUAT) = 9 AND  year(phieuxuat.NGAYXUAT)=2021 
 group by hanghoa.MAHH 
 order by ctphieuxuat.SOLUONG desc limit 5;
 
 -- 6.7.	Thống kê số hàng nhập về cửa hàng Vân Thanh Fashion - chi nhánh quận 3,
 -- thông tin hiển thị: Tên cửa hàng, số lần nhập hàng, số tiền thanh toán.
 
 select 
 cuahang.TENCH,
 count(phieuxuat.SOPHIEU) as 'SLN',
 sum(ctphieuxuat.SOLUONG*hanghoa.DONGIA) as 'TONG SO THANH TOAN'
 from cuahang 
 INNER JOIN phieuxuat on cuahang.MACH = phieuxuat.MACH
INNER JOIN ctphieuxuat on phieuxuat.SOPHIEU = ctphieuxuat.SOPHIEU
INNER JOIN hanghoa on hanghoa.MAHH = ctphieuxuat.MAHH
where cuahang.TENCH  like 'Vân Thanh Fashion – Chi nhánh Quận 5'
group by cuahang.TENCH;

 
 
 -- 6.8.	Thống kê sô lượng hàng xuất kho theo ngày, 
 -- thông tin hiển thị: Ngày xuất hàng, tổng số lần xuất hàng, tổng thành tiền.
  set SQL_safe_updates = 0;  -- cho phep thay doi du lieu
 select
 NGAYXUAT,
 count(ctphieuxuat.SOPHIEU) as 'Tong so lan xuat hang',
 sum(ctphieuxuat.SOLUONG*hanghoa.DONGIA) as 'TONG THANH TIEN'
from phieuxuat 
INNER JOIN ctphieuxuat on phieuxuat.SOPHIEU = ctphieuxuat.SOPHIEU
 INNER JOIN cuahang on cuahang.MACH = phieuxuat.MACH
INNER JOIN hanghoa on hanghoa.MAHH = ctphieuxuat.MAHH
group by NGAYXUAT
order by NGAYXUAT asc;

-- 6.9.	Cập nhật ngày xuất hàng là ngày hiện hành cho các phiếu xuất chưa có ngày xuất 
update 
phieuxuat
set NGAYXUAT = CURDATE()
where SOPHIEU IN('PX031','PX032','PX033');

-- 6.10.	Cập nhật đơn giá của “Đồng phục học sinh” giảm 10% trên đơn giá hiện tại.

UPDATE hanghoa 
set DONGIA = DONGIA*0.9
where
TENHH = 'Đồng phục học sinh';

-- 6.11.	Thực hiện xóa các cửa hàng chưa có thông tin xuất hàng.
delete from  cuahang
where cuahang.MACH not in
(
select MACH
from  phieuxuat
);

-- 6.12.	Liệt kê danh sách các mặt hàng có số lượng xuất hàng thấp nhất: Mã hàng, tên hàng, tổng số lượng xuất kho.
select 
hanghoa.MAHH,
hanghoa.TENHH,
sum(ctphieuxuat.SOLUONG) as 'Tong Xuat Kho'
from hanghoa 
INNER JOIN ctphieuxuat on ctphieuxuat.MAHH = hanghoa.MAHH
GROUP BY  hanghoa.MAHH,hanghoa.TENHH 
order by sum(ctphieuxuat.SOLUONG) asc ;


-- 6.13.	Liệt kê những mặt hàng chưa từng xuất cho các cửa hàng,
--  thông tin gồm: Mã mặt hàng, tên mặt hàng, tên loại hàng.

select 
hanghoa.MAHH,
TENHH,
loaihang.TENLOAI
from hanghoa 
INNER JOIN loaihang on loaihang.MALOAI = hanghoa.MALOAI
where hanghoa.MAHH NOT IN 
(
	SELECT hanghoa.MAHH
    from hanghoa
     inner join ctphieuxuat on ctphieuxuat.MAHH = hanghoa.MAHH
);

-- Y7 Tổ chức sao lưu dự phòng cho cơ sở dữ liệu.





 
 
 
 
 
  
 
 
 
 
 


