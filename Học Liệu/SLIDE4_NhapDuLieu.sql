use congtyphanmemabc;
insert into phong_ban
values ('PB001','San xuat 1'),('PB002','San xuat 2'),('PB003','Quan ly chat luong'),
        ('PB004','Thiet ke'),('PB005','Nghien cuu cong nghe'),('PB006','Kinh Doanh'),
        ('PB007','Truyen thong');
insert into nhan_vien
values (1,'Nguyen','An','1987-01-01',1,'15 Quang trung Da Nang',1000,'PB001'),
		(2,'Le','Bao','1982-02-03',0,'16 Le loi',800,'PB002'),
        (3,'Tran','Cuong','1988-06-05',1,'24 Tran Cao Van',1200,'PB001'),
        (4,'Hoang','Lan','1982-03-04',0,'137 Nguyen Thi Thap Dan Nang',900,'PB002'),
        (5,'Van','Toan','1984-04-02',1,'34 Yen Bai',1500,'PB003'),
        (6,'Nguyen','Thi','1988-03-12',0,'67 Yen Bai',700,'PB003'),
        (7,'Le','Loi','1987-04-23',1,'90 Ngo Van So',900,'PB004'),
        (8,'Hoang','Nga','1992-05-05',0,'70 Nguyen Du',1000,'PB005'),
        (9,'Tran','Thuy','1988-06-09',1,'123 Nguyen Van Troi',1200,'PB001'),
        (10,'Hoang','Chinh','1990-06-05',0,'23 Hoang Dieu',1200,'PB004'),
        (11,'Le','Hoang','1987-05-04',0,'13 Hoang Van Thu',1000,'PB001'),
        (12,'Hoang','Quan','1990-06-07',1,'46 Ngo Thua Nham',700,'PB003');
insert into du_an
values ('DA001','Library System','2017-01-01','2017-03-08','PB001'),
		('DA002','Employee System','2017-03-03','2017-08-14','PB003'),
        ('DA003','Travel Website','2017-07-19','2017-08-26','PB002'),
        ('DA004','lee Fashion Website','2017-02-08','2018-01-08','PB001');
insert into phan_cong
values (1,'DA001','2017-01-01','2017-03-08',300,'Dev'),
	   (7,'DA001','2017-01-01','2017-03-08',50,'Designer'),
       (8,'DA001','2011-01-01','2017-03-08',60,'QA');
insert into truong_phong
values (2,'PB001'),(3,'PB002'),(4,'PB003'),(5,'PB007'),(8,'PB004'),(9,'PB005'),(12,'PB006');
        
