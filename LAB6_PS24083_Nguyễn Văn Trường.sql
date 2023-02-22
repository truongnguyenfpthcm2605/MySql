use quanlybanhang;
-- a. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột 
-- sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua
select 
 hoa_don.maHoaDon,
 hoa_don.maKhachHang ,
 trangthai,
 maSanPham,
 soLuong,
 ngayMuaHang 
from hoa_don inner join hoa_don_chi_tiet on hoa_don.maHoaDon = hoa_don_chi_tiet.maHoaDon;
-- b. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột 
-- sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua với 
 -- điều kiện maKhachHang = ‘KH001’
select
hoa_don.maHoaDon,
hoa_don.maKhachHang,
trangthai,
soLuong,
ngayMuaHang 
from hoa_don inner join hoa_don_chi_tiet
on hoa_don.maHoaDon = hoa_don_chi_tiet.maHoaDon 
where hoa_don.maKhachHang = 'KH001';
-- c. Hiển thị thông tin từ 3 bảng Hoá đơn, Hoá đơn chi tiết và Sản phẩm gồm các cột 
-- sau: maHoaDon, ngayMua, tenSP, donGia, soLuong mua trong hoá đơn, thành 
-- tiền. Với thành tiền= donGia* soLuong 
select
hoa_don.maHoaDon,
ngayMuaHang,
tenSanPham,
donGia,
hoa_don_chi_tiet.soLuong,
(donGia*soLuong) as 'Thanh Tien'
from hoa_don 
inner join hoa_don_chi_tiet on hoa_don.maHoaDon = hoa_don_chi_tiet.maHoaDon
inner join san_pham on san_pham.maSanPham = hoa_don_chi_tiet.maSanPham; 
-- d. Hiển thị thông tin từ bảng khách hàng, bảng hoá đơn, hoá đơn chi tiết gồm các 
-- cột: họ và tên khách hàng, email, điện thoại, mã hoá đơn, trạng thái hoá đơn và 
-- tổng tiền đã mua trong hoá đơn. Chỉ hiển thị thông tin các hoá đơn chưa thanh 
-- toán.
select
 concat(tenVaHoLot ,' ',ten) as 'Ho va Ten' ,
 Email,
 dienThoai,
 hoa_don.maHoaDon ,
 trangthai, 
 (san_pham.donGia*hoa_don_chi_tiet.soLuong) as 'Tong Tien'
 from  Khach_hang 
inner join hoa_don on Khach_hang.maKhachHang = hoa_don.maKhachHang
inner join hoa_don_chi_tiet on hoa_don_chi_tiet.maHoaDon = hoa_don.maHoaDon
inner join san_pham on san_pham.maSanPham = hoa_don_chi_tiet.maSanPham
where trangthai = 'Chưa thanh toán';
-- e. Hiển thị maHoaDon, ngàyMuahang, tổng số tiền đã mua trong từng hoá đơn. Chỉ
-- hiển thị những hóa đơn có tổng số tiền >=500.000 và sắp xếp theo thứ tự giảm dần 
-- của cột tổng tiền.
select 
hoa_don.maHoaDon ,
ngayMuaHang,
(san_pham.donGia * hoa_don_chi_tiet.soLuong) as summoney
from hoa_don 
inner join hoa_don_chi_tiet on hoa_don.maHoaDon = hoa_don_chi_tiet.maHoaDon
inner join san_pham on san_pham.maSanPham = hoa_don_chi_tiet.maSanPham
where (san_pham.donGia * hoa_don_chi_tiet.soLuong) >= 5000000
order by summoney desc;






 
 


