use quanlybanhang;
-- a. Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2020
select * from khach_hang
where khach_hang.maKhachHang
  in(
  select hoa_don.maKhachHang
  from hoa_don
  where
	hoa_don.ngayMuaHang <= '2020-01-01'
 );
 -- p/s : xuat ra toan bộ bang khach hang, với điều kiện xet mã khach hang co nằm trong ma khach hang cua hóa đơn 
 -- với điều kiện makh lơn chua tung xuat hien trong sau nam 2020/1/1 ( có nghĩa la chua mua lan nao sua năm 2020)
 -- với IN la nằm trong, NOT IN không nằm trong
 
 -- b. Hiển thị mã sản phẩm, tên sản phẩm có lượt mua nhiều nhất trong tháng 12/2019
select 
A.maSanPham , 
A.tenSanPham,
count(B.maSanPham) as 'Luot Mua'
from san_pham A
inner join hoa_don_chi_tiet B on B.maSanPham = A.maSanPham
inner join hoa_don C  on C.maHoaDon= B.maHoaDon
where month(C.ngayMuaHang) = 12  and year(C.ngayMuaHang) =2019
group by B.maSanPham order by 'Luot Mua' desc limit 1;
 
 
 -- c. Hiển thị top 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2020
select 
 khach_hang.maKhachHang,
 concat(tenVaHoLot , " ", ten) as 'HO VA TEN',
 sum(hoa_don_chi_tiet.soLuong * san_pham.donGia) as TONG
 
 from khach_hang 
 inner join hoa_don on hoa_don.maKhachHang = khach_hang.maKhachHang
 inner join hoa_don_chi_tiet on hoa_don.maHoaDon = hoa_don_chi_tiet.maHoaDon
 inner join san_pham on san_pham.maSanPham = hoa_don_chi_tiet.maSanPham
where 
	year(hoa_don.ngayMuaHang) = 2020
group by khach_hang.maKhachHang
order by TONG desc limit 3;

-- d. Hiển thị thông tin các khách hàng sống ở ‘Đà Nẵng’ có mua sản phẩm có tên 
-- “Iphone 7 32GB” trong tháng 12/2016
select 
khach_hang.maKhachHang ,
khach_hang.diaChi,
 concat(tenVaHoLot , " ", ten) as 'HO VA TEN'
 from hoa_don
 inner join hoa_don_chi_tiet on hoa_don_chi_tiet.maHoaDon = hoa_don.maHoaDon
 inner join khach_hang on khach_hang.maKhachHang = hoa_don.maKhachHang
 inner join san_pham on san_pham.maSanPham = hoa_don_chi_tiet.maSanPham
 where 
 khach_hang.diaChi like 'Nha Trang'
 and san_pham.tenSanPham = 'iPhone 11' 
 and month(hoa_don.ngayMuaHang) = 04
 and year(hoa_don.ngayMuaHang) = 2020;

-- e. Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản phẩm
select count(*) from san_pham;
select count(*) from hoa_don_chi_tiet;
select (select count(*) from hoa_don_chi_tiet)/ (select count(*) from san_pham) as 'LM';
select 
a.tenSanPham, count(a.maSanPham) as 'LM' 
from san_pham a, hoa_don_chi_tiet b , hoa_don c
where a.maSanPham = b.maSanPham  and b.maHoaDon = c.maHoaDon
group by a.maSanPham having count(a.maSanPham) <= (select count(*) from hoa_don_chi_tiet)/ (select count(*) from san_pham);








