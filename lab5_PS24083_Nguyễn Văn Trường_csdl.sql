-- chon database 
use lab2_quanlybanhang;
-- 5.a 
select * from khachhang;
-- xoa ban cũ 
drop  table khachhang1,hoadon1,sanpham1;
-- 5.b hien thị 3 khac hang trong 
-- 5 khach hang dau tien dùng lệnh limit "x";
select maKH,concat(hoVaTenLot, " ", Ten ) as "Họ Và Tên", email,dienthoai
from khachhang limit 3;
-- 5.c hien thi thong tin sp, masp,tensp, tong tien = dongia* so lg;
select maSP,tenSP, (donGia*soLuong) as "Tong Tien" 
from sanpham; 
-- 5.d  Hiển thị danh sách khách hàng có tên bắt đầu bởi kí tự ‘H’ gồm các cột: 
-- maKhachHang, hoVaTen, diaChi. Trong đó cột hoVaTen ghép từ 2 cột 
-- hoVaTenLot và Ten

select  maKH ,  concat(hoVaTenLot, " ", Ten ) as "Ho Va Ten" , diachi
 from khachhang 
 where Ten like 'H%';
 -- 5.e Hiển thị tất cả thông tin các cột của khách hàng có địa chỉ chứa chuỗi ‘Đà Nẵng’
 select * from khachhang where diachi like "Thái Lan";
 -- 5.f  Hiển thị các sản phẩm có số lượng nằm trong khoảng từ 100 đến 500.
 select * from sanpham where soluong >= 100 and soLuong <= 500;
 -- 5g. Hiển thị danh sách các hoá hơn có trạng thái là chưa thanh toán và ngày mua hàng 
-- trong năm 2016
select * from hoadon where trangthai = "dangcho" and year(ngaymuahang) = year(2022);
-- 5.h. Hiển thị các hoá đơn có mã Khách hàng thuộc 1 trong 3 mã sau: KH001, KH003, 
-- KH006
select * from hoadon where maKH in ('ps1','ps2','ps3');

-- phần 2
-- 5.a . Hiển thị số lượng khách hàng có trong bảng khách hàng
select count(*) from khachhang;
-- 5.b Hiển thị đơn giá lớn nhất trong bảng SanPham
select max(donGia) as 'Don gia lơn nhat' from sanpham;
-- 5.c Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm
select min(soLuong) as 'So luong san Phẩm thấp nhát', maSP, tenSP from sanpham;
-- 5.d Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm
select sum(soLuong) as 'Tong So luong' from sanpham;
 -- 5.e Hiển thị số hoá đơn đã xuất trong tháng 12/2016 mà có trạng thái chưa thanh toán
 select * from hoadon where month(ngaymuahang) = 12 and year(ngaymuahang)=2022 and trangthai = "dangcho";
 -- 5.f hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn.
 select maHD, count(maSP) from hoadonchitiet group by maHD;
 -- 5g Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu 
-- chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5.
select maHD, count(maSP) from hoadonchitiet where soluong >=5 group by maHD;
-- 5h Hiển thị thông tin bảng HoaDon gồm các cột maHoaDon, ngayMuaHang, 
-- maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHang
select maHD, ngaymuahang,maKH from hoadon order by ngaymuahang DESC; -- TĂNG ĐẦN LÀ ASC
 

