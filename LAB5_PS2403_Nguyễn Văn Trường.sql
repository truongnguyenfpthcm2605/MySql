use quanlybanhang;
 -- a. Hiển thị tất cả thông tin có trong bảng khách hàng bao gồm tất cả các cột
 select * from khach_hang;
 -- b. Hiển thị 3 khách hàng đầu tiên trong bảng khách hàng bao gồm các cột: mã 
-- khách hàng, họ và tên, email, số điện thoại
select maKhachHang, concat(tenVaHoLot , " " ,ten) as "Họ Và Tên ", Email, dienthoai from khach_hang limit 3;
-- c. Hiển thị thông tin từ bảng Sản phẩm gồm các cột: mã sản phẩm, tên sản phẩm, 
-- tổng tiền tồn kho. Với tổng tiền tồn kho = đơn giá* số lượng
select maSanPham, tenSanPham, (soLuongTonKho*donGia) as "Tổng tiền tồn kho " from san_pham;
-- d. Hiển thị danh sách khách hàng có tên bắt đầu bởi kí tự ‘H’ gồm các cột: 
-- maKhachHang, hoVaTen, diaChi. Trong đó cột hoVaTen ghép từ 2 cột 
-- hoVaTenLot và Ten
select maKhachHang ,concat(tenVaHoLot , " " ,ten) as "Họ Và Tên ", diachi from khach_hang where ten like 'H%';
-- e. Hiển thị tất cả thông tin các cột của khách hàng có địa chỉ chứa chuỗi ‘Đà Nẵng’
select * from khach_hang where diachi like 'Đà Nẵng'; -- không co ai ở đà nẵng;
-- f. Hiển thị các sản phẩm có số lượng nằm trong khoảng từ 100 đến 500.
select * from san_pham where soLuongTonKho >= 100 and soLuongTonKho <=500;
-- g. Hiển thị danh sách các hoá hơn có trạng thái là chưa thanh toán và ngày mua hàng 
-- trong năm 2019
select * from hoa_don where trangthai like 'Chưa thanh toán' and year(ngayMuaHang) = 2019;
-- h. Hiển thị các hoá đơn có mã Khách hàng thuộc 1 trong 3 mã sau: KH001, KH003, 
-- KH006
select * from hoa_don where maKhachHang in ('KH001','KH003','KH006');
-- a. Hiển thị số lượng khách hàng có trong bảng khách hàng
select count(*) as 'số Lượng Khách Hàng' from khach_hang;
-- b.Hiển thị đơn giá lớn nhất trong bảng SanPham
select max(donGia) as 'đơn gia lớn nhất' , maSanPham, tenSanPham from san_pham;
-- c. Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm
select min(soLuongTonKho),maSanPham, tenSanPham from san_pham; 
-- d. Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm
select sum(soLuongTonKho) as 'Tong so luong sp' from san_pham; 
-- e. Hiển thị số hoá đơn đã xuất trong tháng 12/2019 mà có trạng thái chưa thanh toán
select * from hoa_don
 where year(ngayMuaHang) = 2019 and month(ngayMuaHang) = 12 and trangThai like 'Chưa thanh toán';
 -- f. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn.
 select maHoaDon  , count(maSanPham) as 'Số Loại SP' from hoa_don_chi_tiet group by maHoaDon;
 -- g. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu 
-- chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5.
 select maHoaDon  , count(maSanPham) as 'SP' 
 from hoa_don_chi_tiet  
 group by maHoaDon 
 having count(maSanPham) >=5;
 -- h. Hiển thị thông tin bảng HoaDon gồm các cột maHoaDon, ngayMuaHang, 
-- maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHang
select maHoaDon , ngayMuaHang, maKhachHang from hoa_don  order by ngayMuaHang desc; -- asc la tang;

 