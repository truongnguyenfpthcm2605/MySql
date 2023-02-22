create table nhan_vien_PB001 like nhan_vien;
insert into nhan_vien_PB001 
select * from nhan_vien where ma_pb = 'PB001';
insert into nhan_vien_pb001 ( ho_nv, ten_nv,ma_pb) 
select ho_nv, ten_nv, ma_pb 
from nhan_vien 
where ma_pb ='pb001';


-- them bang moi ---
insert into phong_ban 
values( 'pb008', 'bao ve');


insert into nhan_vien(ho_nv, ten_nv, ma_pb)
values ('Tran','Huong','pb005'),('Do','Long','pb007');

-- ham updates du lieu 0 la k cho , 1 la cho
set SQL_safe_updates = 0;

-- su theo dieu kien
update phong_ban 
set ten_pb = 'Cong nghe 1' where ma_pb ='pb001';

-- sua luong 
update nhan_vien
set luong = (luong+(luong*0.5)) where ma_pb ='pb001';

create table du_an_test select * from du_an;


-- xoa du lieu bang
delete from du_an_test;

-- xoa all phong ban , khong co nhan vien
delete from nhan_vien 
where ma_pb in  
(
select ma_pb 
from phong_ban
where ten_pb like '%Thiet Ke%'
);
-- khong xoa dc do co khoai ngoai ow cac ban khac 






 
