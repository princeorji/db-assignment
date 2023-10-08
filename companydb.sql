-- create table users
create table users(
    id int,
    name varchar(25),
    password varchar(25),
    address varchar(45),
    postal_code int(6),
    city varchar(25),
    phone varchar(25),
    PRIMARY KEY (id)
);

-- create table admin
create table admin(
    id int,
    name varchar(25),
    role varchar(25),
    user_id int,
    FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY (id)
);

-- create table categories
create table categories(
	id int,
	name varchar(25),
    PRIMARY KEY (id)
);

-- create table products
create table products(
	id int,
    name varchar(45),
    price decimal(8, 2),
    size enum('small', 'medium', 'large'),
    category_id int,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    PRIMARY KEY (id)
);

-- create table orders
create table orders(
    id int,
    order_no varchar(25),
    order_total decimal,
    order_date datetime,
    shipping_date datetime,
    is_delivered boolean,
    user_id int,
    FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY (id)
);

-- create table order_details
create table order_details(
    id int,
    order_id int,
    product_id int,
    product_price decimal(8, 2),
    quantity int,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    PRIMARY KEY (id)
);

-- insert into users
insert into users
(id, name, password, address, postal_code, city, phone)
values(1, 'bruce wayne', '!123', 'wayne mansion', 000111, 'gotham', '+1 (234) 567-8910');

insert into users
(id, name, password, address, postal_code, city, phone)
values(2, 'shrek', '!arrh', 'swamp', 101010, 'far far away', '+1 (098) 765-4321');

-- insert into admin
insert into admin
(id, name, role, user_id)
values(1, 'batman', 'is_admin', 1);

-- insert into categories
insert into categories
(id, name) 
values(1, 'Tops'), (2, 'Dresses'), (3, 'Beach wear');

-- insert into products
insert into products
(id, name, price, size, category_id)
values(1, 'Hollow Out Tie Back Cover Up', 15.00, 'medium', 3);

insert into products
(id, name, price, size, category_id)
values(2, 'EMERY ROSE Floral Print Notched Neck Tee', 16.00, 'small', 1);

insert into products
(id, name, price, size, category_id)
values(3, 'Maternity Solid Bodycon Dress', 8.00, 'large', 2);

-- insert into orders
insert into orders
(id, order_no, order_total, order_date, shipping_date, is_delivered, user_id)
values(1, '1111FFA', 16.00, '1000-01-01 00:00:00', '9999-12-31 23:59:59', FALSE, 2);

-- insert into order_details
insert into order_details
(id, order_id, product_id, product_price, quantity)
values(1, 1, 3, 8.00, 2);

-- select from products
select name, size from products;

-- update categories
update categories 
set name = 'Sports & outdoors' 
where id = 1;

-- delete products
delete from products
where id = 1;

-- select all products based on category id(joins)
select * from products join categories on categories.id = products.category_id;

-- update order based on user id(joins)
update orders 
join users on orders.user_id = users.id
set is_delivered = TRUE
where users.id = 2;

-- delete order based on user id(joins)
delete orders 
from orders 
join users on orders.user_id = users.id
where users.id = 2;


SET FOREIGN_KEY_CHECKS=0; -- to disable them
SET FOREIGN_KEY_CHECKS=1; -- to re-enable them