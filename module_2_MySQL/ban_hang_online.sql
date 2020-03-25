drop database if exists website;
create database website;
use website;
create table suppliers(
id int(11) auto_increment primary key,
name varchar(100) not null,
email varchar(50) not null,
phone_number varchar(20),
address varchar(500)
);
create table categories(
id int(11) auto_increment primary key,
name varchar(50) not null,
description varchar(500)
);
create table products(
id int(11) auto_increment primary key,
name varchar(50) not null,
image_url varchar(1000) not null,
price decimal(18.2),
discount decimal(18.2),
stock decimal(18.2),
category_id int(11),
supplier_id int(11),
description varchar(1000),
foreign key (category_id) references categories(id) on delete cascade,
foreign key (supplier_id) references suppliers(id) on delete cascade
);
create table employees(
id int(11) auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
phone_number varchar(20),
address varchar(500) not null,
email varchar(50) not null,
birthday DATETIME
);
create table customers(
id int(11) auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
phone_number varchar(20),
address varchar(500) not null,
email varchar(50) not null,
birthday date
);
create table orders(
id int(11) auto_increment primary key,
created_date datetime not null,
shipped_date datetime,
status varchar(50) not null,
description varchar(1000),
shipping_address varchar(500) not null,
shipping_Oty varchar(50) not null,
payment_type varchar(20) not null,
customer_id int(11),
employee_id int(11),
foreign key (customer_id) references customers(id) on delete cascade,
foreign key (employee_id) references employees(id) on delete cascade
);
create table orderdetails(
id int(11) auto_increment primary key,
order_id int(11),
product_id int(11),
quantity decimal(18,2),
foreign key (order_id) references orders(id) on delete cascade,
foreign key (product_id) references products(id) on delete cascade
);

use website;
SET SQL_SAFE_UPDATES = 0;
insert into suppliers values(null,'SONY','SONY@gmail.com',0000000001,'dia chi so 1'),
(null,'SAMSUNG','SAMSUNG@gmail.com',0000000002,'dia chi so 2'),
(null,'TOSHIBA','TOSHIBA@gmail.com',0000000003,'dia chi so 3'),
(null,'APPLE','APPLE@gmail.com',0000000004,'dia chi so 4'),
(null,'PHAM THAI CUONG','PHAMTHAICUONG@gmail.com',0000000005,'dia chi so 5');

insert into categories values(null,'ten loai 1','mieu ta 1'),
(null,'ten loai 2','mieu ta 2'),
(null,'ten loai 3','mieu ta 3'),
(null,'ten loai 4','mieu ta 4'),
(null,'ten loai 5','mieu ta 5');

insert into products values(null,'ten san pham 1','url hinh anh 1',50000,5,10,1,1,'mieu ta 1'),
(null,'ten san pham 2','url hinh anh 2',200000,10,11,2,2,'mieu ta 2'),
(null,'ten san pham 3','url hinh anh 3',200000,20,12,3,3,'mieu ta 3'),
(null,'ten san pham 4','url hinh anh 4',200000,30,13,4,4,'mieu ta 4'),
(null,'ten san pham 5','url hinh anh 5',200000,40,14,5,5,'mieu ta 5'),
(null,'ten san pham 6','url hinh anh 6',200000,40,14,5,5,'mieu ta 6'),
(null,'ten san pham 7','url hinh anh 7',200000,40,14,5,5,'mieu ta 7');

-- delete from employees;
insert into employees values(null,'a','a nguyen van',0000000011,'dia chi NV so 1','NVanguyenvana@gmail.com','1990-10-10'),
(null,'b','b nguyen van',0000000012,'dia chi NV so 2','NVbnguyenvanb@gmail.com','1991-10-10'),
(null,'c','c nguyen van',0000000013,'dia chi NV so 3','NVcnguyenvanc@gmail.com','1992-10-10'),
(null,'d','d nguyen van',0000000014,'dia chi NV so 4','NVdnguyenvand@gmail.com','1993-10-10'),
(null,'e','e nguyen van',0000000015,'dia chi NV so 5','NVenguyenvane@gmail.com','1994-10-10');


insert into customers values(null,'KHa','a nguyen van',0000000021,'dia chi KH so 1','KHanguyenvana@gmail.com','1990-03-25'),
(null,'KHb','b nguyen van',0000000022,'dia chi KH so 2','KHbnguyenvanb@gmail.com','1991-10-10'),
(null,'KHc','c nguyen van',0000000023,'dia chi KH so 3','KHcnguyenvanc@gmail.com','1992-10-10'),
(null,'KHd','d nguyen van',0000000024,'dia chi KH so 4','KHdnguyenvand@gmail.com','1993-10-10'),
(null,'KHe','e nguyen van',0000000025,'dia chi KH so 5','KHenguyenvane@gmail.com','1994-10-10');

insert into orders values(null,'2020-03-25','2020-03-25','COMPLETED','description 1', 'dia chi nhan hang 1', 'shipping_Oty 1', 'payment_type 1',1,1),
(null,'2020-02-11','2020-02-12','trang thai 6','description 6', 'dia chi nhan hang 1', 'shipping_Oty 4', 'payment_type 4',1,1),
(null,'2019-10-10','2019-10-11','trang thai 2','description 2', 'dia chi nhan hang 2', 'shipping_Oty 2', 'payment_type 2',2,2),
(null,'2019-10-10','2019-10-11','trang thai 3','description 3', 'dia chi nhan hang 3', 'shipping_Oty 3', 'payment_type 3',3,3),
(null,'2019-10-10','2019-10-11','trang thai 4','description 4', 'dia chi nhan hang 4', 'shipping_Oty 4', 'payment_type 4',4,4),
(null,'2019-10-10','2019-10-11','trang thai 5','description 5', 'dia chi nhan hang 5', 'shipping_Oty 5', 'payment_type 5',5,5);

insert into orderdetails values(null,1,1,10),
(null,2,2,11),
(null,3,3,12),
(null,4,4,13),
(null,5,5,14),
(null,6,5,14),
(null,6,6,15);


-- câu 1
UPDATE products 
SET 
    price = price * 1.1
WHERE
    price < 100000;

-- câu 2
UPDATE products 
SET 
    discount = discount + 5
WHERE
    discount <= 10;

-- cau 3
SELECT 
    *
FROM
    products
WHERE
    discount <= 10;
    
-- cau 4
SELECT 
    *
FROM
    products
WHERE
    stock < 5;
    
-- cau 5
SELECT 
    *
FROM
    customers
WHERE
    address like '%quan hai chau%';
    
-- cau 6
select
   *
FROM
    customers
WHERE
    year(birthday)=1990;
    
-- cau 7
select
   *
FROM
    customers
WHERE
    month(birthday)=month(CURDATE())
    and day(birthday)=day(CURDATE());

-- cau 8 
SELECT 
    *
FROM
    orders
WHERE
    status = 'COMPLETED';
    
-- cau 9
SELECT 
    *
FROM
    orders
WHERE
    status = 'COMPLETED'
    and created_date=CURDATE();
    
-- cau 10
SELECT 
    *
FROM
    orders
WHERE
    status = 'CANCELED';
    
-- cau 11
SELECT 
    *
FROM
    orders
WHERE
    payment_type = 'CASH';
    
-- cau 12
SELECT 
    *
FROM
    orders
WHERE
    payment_type = 'CREADIT CARD';
    
-- cau 13
SELECT 
    *
FROM
    orders
WHERE
    shipping_address = 'Hà Nội';
    
-- cau 14
select
   *
FROM
    employees
WHERE
    month(birthday)=month(CURDATE())
    and day(birthday)=day(CURDATE());

-- cau 15
SELECT 
    *
FROM
    suppliers
WHERE
    name IN ('SONY','SAMSUNG','TOSHIBA','APPLE');

-- cau 16
SELECT 
    products.*, categories.name
FROM
    products
        JOIN
    categories ON category_id = categories.id;

-- cau 17
SELECT 
    *
FROM
    orders
        LEFT JOIN
    customers ON customer_id = customers.id;
    
-- cau 18 
SELECT 
    *
FROM
    products
        LEFT JOIN
    categories ON category_id = categories.id
        LEFT JOIN
    suppliers ON supplier_id = suppliers.id;
    
-- câu 19
-- cách 1

SELECT 
    categories.*, sum(stock)
FROM
    categories
        LEFT JOIN
    products ON  categories.id=category_id
    group by category_id;
    
-- cách 2
-- SELECT 
--     categories.*, products.stock
-- FROM
--     products
--         right JOIN
--     categories ON  categories.id=category_id  
--     where  ;
--     
-- câu 20
-- cách 1
SELECT 
    suppliers.*, sum(stock)
FROM
    suppliers
        LEFT JOIN
    products ON  suppliers.id=category_id
    group by category_id;
    
-- cách 2
-- SELECT 
--     suppliers.*, products.stock
-- FROM
--     products
--         right JOIN
--     suppliers ON  suppliers.id=category_id;    
    
-- câu 21 
SELECT 
    products.*
FROM
	orderdetails
        JOIN
    products ON products.id = product_id
        JOIN
    orders ON orders.id = order_id
    where created_date>=DATE_SUB(CURDATE(),INTERVAL 3000 DAY)
    group by product_id;
    
SELECT 
    products.*
FROM
    products
        JOIN
    orderdetails ON products.id = product_id
        JOIN
    orders ON orders.id = order_id
    where created_date>='2020-01-01'
    and created_date<=CURDATE()
    group by product_id;
    
-- câu 22
SELECT distinct
    customers.*
FROM
	customers
        JOIN
    orders ON customers.id = customer_id
    where created_date>=DATE_SUB(CURDATE(),INTERVAL 1000 DAY);
    
-- câu 23
SELECT 
    customers.*,
    SUM(quantity * price * (1 - discount / 100)) AS 'tổng số tiền'
FROM
    customers
        JOIN
    orders ON customers.id = customer_id
        JOIN
    orderdetails ON orders.id = order_id
        JOIN
    products ON products.id = product_id
WHERE
    created_date >= DATE_SUB(CURDATE(), INTERVAL 1000 DAY)
GROUP BY customer_id;
    
-- câu 24
SELECT 
    orders.*, SUM(quantity * price * (1 - discount / 100)) 'tổng số tiền'
FROM
    orders
        JOIN
    orderdetails ON orders.id = order_id
        JOIN
    products ON products.id = product_id
GROUP BY order_id;
    
-- câu 25
select
employees.*,SUM(quantity * price * (1 - discount / 100)) 'tổng số tiền'
from
employees
join orders on employees.id = employee_id
join orderdetails on orders.id = order_id
join products ON products.id = product_id
group by employees.id
    
    
    
