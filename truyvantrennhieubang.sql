select ho_nv, ten_nv, ten_pb from nhan_vien, phong_ban where nhan_vien.ma_pb = phong_ban.ma_pb; -- chon ho,ten nhan so sanh tu mab cua phong ban
select * from nhan_vien, phong_ban where nhan_vien.ma_pb = phong_ban.ma_pb; -- chon ca bang nhan vien bang mapb phong ban;
select ho_nv, ten_nv ,ten_da, ngay_bat_dau, C.ngay_ket_thuc
from nhan_vien A,du_an B,phan_cong C
 where C.ma_nv = A.ma_nv and C.ma_da = B.ma_da; -- đặt bí danh A,B.C;
-- điều kiện bảng với điều kiện khác
select ten_nv,luong,ten_pb 
from nhan_vien,phong_ban
 where nhan_vien.ma_pb =phong_ban.ma_pb and luong>900; -- tim ma pb tu phong ban; với điều kiện where;
 -- phép nói Join
 select ho_nv, ten_nv ,ten_pb
 from nhan_vien
 inner join phong_ban on nhan_vien.ma_pb = phong_ban.ma_pb
 where luong>=900;
 select ho_nv,ten_nv,ten_da,ngay_tham_gia , phan_cong.ngay_ket_thuc
 from phan_cong 
 inner join nhan_vien on phan_cong.ma_nv = nhan_vien.ma_nv 
 inner join du_an on phan_cong.ma_da = du_an.ma_da;
 
 -- use join 
 select ho_nv, ten_nv ,luong, ten_pb ,ngay_tham_gia,so_gio
 from phan_cong
 inner join nhan_vien on nhan_vien.ma_nv = phan_cong.ma_nv
 inner join du_an on du_an.ma_da = phan_cong.ma_da
 inner join phong_ban on phong_ban.ma_pb = nhan_vien.ma_pb;
 -- use join question two
  select nhan_vien.ma_nv, ho_nv, ten_nv ,luong, ten_pb ,ngay_tham_gia,so_gio
 from phan_cong
 inner join nhan_vien on nhan_vien.ma_nv = phan_cong.ma_nv
 inner join du_an on du_an.ma_da = phan_cong.ma_da
 inner join phong_ban on phong_ban.ma_pb = nhan_vien.ma_pb
 where phong_ban.ten_pb  like '%Thiet ke%' and ngay_bat_dau >='2016-01-01';
 
 select avg(luong), ma_pb from nhan_vien group by ma_pb;
 select count(*) ,ma_pb from nhan_vien group by ma_pb;
 select sum(luong) "tong luong", ma_pb from nhan_vien group by ma_pb having sum(luong )> 1000;
 select sum(luong) ma_pb from nhan_vien group by ma_pb having sum(luong) >1000 and min(luong)> 700;
 
