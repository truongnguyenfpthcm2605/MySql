
INSERT INTO khach_hang VALUES 
('KH001','Nguyễn Thị','Hồng','15 Quang Trung, TpHCM','hongnt@gmail.com','0912345678'),
('KH002','Nguyễn Thị Tường','Vy','12 Tô Ngoc Van, Q12. HCM','vyntt@gmail.com','0903936117'),
('KH003','Lê Văn','Hùng','Hộ Diêm, Ninh Thuận','phungsts@gmail.com','0903414749'),
('KH004','Lê Hiếu','Kiên','Nha Trang','kienlh@gmail.com','0903494949'),
('KH005','Lê Hiếu','An','12 Nguyễn Trãi, Đà Nẵng','anlh@gmail.com','0903474747');
INSERT INTO hoa_don VALUES 
(1001,'2020-02-04','Đã thanh toán','KH001'),
(1002,'2020-01-13','Đã thanh toán','KH001'),
(1003,'2020-03-15','Chưa thanh toán','KH002'),
(1004,'2019-05-23','Đã thanh toán','KH003'),
(1005,'2020-04-06','Chưa thanh toán','KH004'),
(1006,'2019-12-25','Chưa thanh toán','KH005'),
(1007,'2019-12-20','Chưa thanh toán','KH003');
INSERT INTO san_pham VALUES 
(1,'Samsung Galaxy J7','Samsung Galaxy J7 Pro la smarthome thông minh với nhiều tính năng',200,6600000),
(2,'iPhone 11','iPhone 11 64G',300,9000000),
(3,'Laptop Dell Inspison 6550','Dell Inspiron 6650 ị/RAM 4G, SDD 1T/ Win10',20,11000000),
(4,'Pin sạc dự phòng','Pin sac dự phòng 20000mma',100,200000),
(5,'Nokia 3100','Nokia 3100 bình dân',100,5000000);
INSERT INTO hoa_don_chi_tiet VALUES 
(1001,1,20),(1001,2,30),(1001,3,2),
(1002,1,4),(1002,4,5),(1003,5,2),
(1004,3,3),(1005,2,6),(1001,4,7),(1001,5,2);

