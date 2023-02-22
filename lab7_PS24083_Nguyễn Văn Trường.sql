use quanlybanhang;
-- 1A thêm data vao bang khach_hang
insert into khach_hang 
(maKhachHang,tenvaHoLot,ten,diaChi,Email,dienthoai)
values
('KH006','Nguyễn Thị','Nga','15 Quang Trung , TP.Đà Nẵng','ngant@gmail.com','0912345670'),
('KH007','Trần Công','Thành','234 Lê Lợi, Quảng Nam','thanhhtc@gmail.com','16109423443'),
('KH008','Lê Hoàng','Nam','23 Trần Phú , TP. Huế','namlt@yahoo.com','0989354556'),
('KH009','Vũ Ngọc ','Hiền','37 Nguyễn Thị Thập , TP. Đà Nẵng','hienvn@gmail.com','0894545435');

insert into san_pham
(maSanPham,tenSanPham,mota,soLuongTonKho,donGia)
values
(6,'SamSung Galaxy J7 Pro','Samsung Galaxy J7 Pro là một chiếc 
smartphone phù hợp với những người 
yêu thích một sản phẩm pin tốt, thích 
hệ điều hành mới cùng những tính 
năng đi kèm độc quyền',800,6600000),
(7,'iPhone 6 32Gb','iPhone 6 là một trong những 
smartphone được yêu thích nhất. 
Lắng nghe nhu cầu về thiết kế, khả 
năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối 
chính hãng tại Việt Nam hứa hẹn sẽ 
là một sản phẩm rất "Hot"',500,8990000),
(8,'Laptop Dell Inspiron 3467','Dell Inspiron 3467 i3 
7100U/4GB/1TB/Win10/(M20NR21)',507,11290000),
(9,'Pin sạc dự phong','Pin sạc dự phòng Polymer 5.000 
mAh eSaver JP85',600,200000),
(10,'Nokia 3100','Nokia 3100 phù hợp với SINH VIÊN',100,700000);
insert into 
hoa_don
(maHoaDon,ngayMuaHang,trangThai,maKhachHang)
values 
(120954,'2016-03-23','Đã thanh toán','KH001'),
(120955,'2016-04-02','Đã thanh toán','KH002'),
(120956,'2016-07-12','chưa thanh toán','KH001'),
(125957,'2016-12-04','chưa thanh toán','KH004');
 set SQL_safe_updates = 0;
insert into
hoa_don_chi_tiet
(maHoaDon,maSanPham,soLuong)
values 
(120954 ,3,40),
(120954 ,1,20),
(120955 ,2,100),
(120956 ,4,6),
(120956 ,2,60),
(120956 ,1,10),
(125957 ,2,50);



create table khachhang_Danang like khach_hang;
insert into khachhang_Danang
 select * from khach_hang
 where khach_hang.diaChi like '%Đà Nẵng';

-- CÂU 2 
-- A . Cập nhật lại thông tin số điện thoại của khách hàng có mã ‘KH002’ có giá trị mới 
-- là ‘16267788989’

 update khach_hang
 set dienThoai = '16267788989'
 where khach_hang.maKhachHang = 'KH002';
 
 -- B 	b. Tăng số lượng mặt hàng có mã ‘3’ lên thêm ‘200’ đơn vị
 update san_pham 
 set soLuongTonKho = soLuongTonKho+200
 where maSanPham = '3';
 
 -- C  Giảm giá cho tất cả sản phẩm giảm 5%
 set SQL_safe_updates = 0; -- cho phep update gia tri 0 la cho , 1 k cho
 update san_pham
 set donGia = donGia*0.95;


-- D  Tăng số lượng của mặt hàng bán chạy nhất trong tháng 12/2016 lên 100 đơn vi
-- tim san pham ban chay nhat
select 
maSanPham,
sum(soLuong) as 'SL'
from hoa_don_chi_tiet
group by maSanPham;
-- tong maxx
select max(SL)
from (
select 
maSanPham,
sum(soLuong) as 'SL'
from hoa_don_chi_tiet
inner join hoa_don on hoa_don.maHoaDon = hoa_don_chi_tiet.maHoaDon
where year(ngayMuaHang) =2016 and month(ngayMuaHang)
group by maSanPham
) as A;

update san_pham
set soLuongTonKho = soLuongTonKho+100
where maSanPham in (
				select maSanPham
                from hoa_don_chi_tiet 
				inner join hoa_don on hoa_don.maHoaDon = hoa_don_chi_tiet.maHoaDon
				where year(ngayMuaHang) =2016 and month(ngayMuaHang) =12
				group by maSanPham 
				having sum(soLuong) = (
										select 
										
										max(soLuong) as 'SL'
										from hoa_don_chi_tiet
										inner join hoa_don on hoa_don.maHoaDon = hoa_don_chi_tiet.maHoaDon
										where year(ngayMuaHang) =2016 and month(ngayMuaHang)
										group by maSanPham
										) 
);



 
 -- E . Giảm giá 10% cho 2 sản phẩm bán ít nhất trong năm 2016
select 
hoa_don_chi_tiet.maSanPham ,
min(soLuong) as 'SL'
from hoa_don_chi_tiet 
inner join san_pham on san_pham.maSanPham = hoa_don_chi_tiet.maSanPham
inner join hoa_don on hoa_don.maHoaDon = hoa_don_chi_tiet.maHoaDon
where year(ngayMuaHang) =2016
group by hoa_don_chi_tiet.maSanPham 
order by min(soLuong);
-- tong min
select min(tongSL)
from(
		select 
		maSanPham ,
		sum(soLuong) tongSL
		from hoa_don_chi_tiet 
		group by maSanPham)
		 as SL;
select * from hoa_don_chi_tiet group by maSanPham having sum(soLuong) != (
select min(tongSL)
from(
		select 
		maSanPham ,
		sum(soLuong) tongSL
		from hoa_don_chi_tiet 
		group by maSanPham)
		 as SL);


-- f. Cập nhật lại trạng thái “đã thanh toán” cho hoá đơn có mã 120956
update hoa_don
set trangThai = "Đã Thanh Toán"
where
 maHoaDon = 120956;
 
 -- g. Xoá mặt hàng có mã sản phẩm là ‘2’ ra khỏi hoá đơn ‘120956’ và trạng thái là 
-- chưa thanh toán.
delete from hoa_don
where san_pham.maSanPham in
 (
	select san_pham.maSanPham
	from san_pham 
	inner join hoa_don_chi_tiet on hoa_don_chi_tiet.maSanPham = san_pham.maSanPham
	inner join hoa_don on hoa_don_chi_tiet.maHoaDon = hoa_don.maHoaDon
	where hoa_don_chi_tiet.maSanPham = 2 and trangThai ='chưa thanh toán' and maHoaDon = 120956
 );

-- h. Xoá khách hàng chưa từng mua hàng kể từ ngày “1-1-2016”
delete from khach_hang 
where maKhachHang
 not in
 (
	select maKhachHang from hoa_don
	where ngayMuaHang >= '2016-01-01'
);






 
 
 






