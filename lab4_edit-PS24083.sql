use duanbds;
rename table nhavien to nhanvien;
create table nhanvien1 like nhanvien; 
create table nhanvien2 select * from nhanvien;
drop table nhanvien1;
drop table nhanvien2;
insert into vanphong values 
('PS1','TP.HCM'),
('PS2','HA NOI'),
('PS3','TAY NGUYEN'),
('PS4','DA NANG'),
('PS5','CAN THO');
insert into nhanvien values 
('NV1','NGUYEN VAN NAM','PS1'),
('NV2','PHAM THI NGOC NGAN','PS2'),
('NV3','NGUYEN VAN TRUONG','PS3'),
('NV4','NGUYEN VAN HAU','PS4'),
('NV5','NGO HOANG TUAN','PS5');
insert into nhanthan values 
('NAM','2000-3-23','NV1'),
('TRUNG','2000-3-23','NV2'),
('HOANG','2000-3-23','NV3'),
('NGA','2000-3-23','NV4'),
('ANH','2000-3-23','NV5');

create table chusohuu(
 maCSH varchar(5) primary key,
 tenCSH varchar(30) not null,
 sdt int(12),
 diachiCSH varchar(255)
 
);
alter table bds add constraint fk_maCSH foreign key(maCSH) references chusohuu(maCSH);
insert into chusohuu values 
('CSH1','TRUONG','012345','HA NOI'),
('CSH2','NAM','012345','TP.HCM'),
('CSH3','TRUNG','012345','DA NANG'),
('CSH4','SON','012345','NHA TRANG'),
('CSH5','HIEU','012345','TAY NGUYEN');
 insert into bds values 
 ('BDS1','TP.HCM','PS1','CSH1'),
 ('BDS2','TP.HCM','PS2','CSH2'),
 ('BDS3','TP.HCM','PS3','CSH3'),
 ('BDS4','TP.HCM','PS4','CSH4'),
 ('BDS5','TP.HCM','PS5','CSH5');
 insert into truongphong values
 ('PS1','NV1'),
 ('PS2','NV2'),
 ('PS3','NV3'),
 ('PS4','NV4'),
 ('PS5','NV5');
 rename table vanphong to truso;
 rename table truso to vanphong;
 create  table nhanvien1 select *from nhanvien;
 alter table nhanvien1 change column tenNV hotenNV varchar(30);
 alter table nhanvien1 add primary key(maNV);
 alter table nhanvien1 add constraint fk_maVP foreign key(maVP) references vanphong(maVP);
 alter table nhanvien1 modify column hotenNV varchar(30) not null;
 alter table nhanvien1 add column luong int(10);
 alter table nhanvien1 add column gioitinh tinyint(1) default 0;
 alter table nhanvien1 add column thuong decimal(10) check(thuong>2000);
 alter table nhanvien1 drop column luong;
 alter table truongphong add unique(maVP,maNV);
 alter table nhanvien add column luong int(11);
select * from nhanvien;
select concat(maNV,' ',maVP)'ma nhan vien - van phong' from nhanvien;
 select all maNV as 'ma nhan vien' , tenNV 'Ten nhan vien' from nhanvien;
 select maNV ,maVP, 'Du an bds' from nhanvien;
select * from chusohuu;
select *
from chusohuu
where tenCSH ='TRUONG';
select * from nhanthan;
select tenNT  from nhanthan
where (year(curdate())- year(ngaysinh)) >19 and tenNT ='̀TR%';
select * from nhanvien;
select maNV, tenNv from nhanvien where luong between 8500 and 10500;
select maNV, tenNv from nhanvien where luong not between 8500 and 10500;
select * from nhanvien where tenNV ='NGO%' ;
select * from vanphong;
select count(*) 'so luong nhan vien' from nhanvien ;
select count(*) 'so luong van phong', maVP from vanphong group by maVP;
select sum(luong) 'tong luong', maNV from nhanvien group by maNV;
select * from nhanvien;
select count(tenNT) , tenNT from nhanthan where month(ngaysinh) = 03 group by tenNT;
select * from nhanvien where  tenNV like '̀%VAN%';
use duanbds;
select * from chusohuu;













 
 
 
 


