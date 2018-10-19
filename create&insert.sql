/* Using Database PostgreSQL */

create database ecommerce;


/*Create table users*/

create table users(id SERIAL PRIMARY KEY,name text check(name ~ '^[a-zA-Z]*$') NOT NULL,email varchar(40) UNIQUE NOT NULL,password char(20) check(length(password)>7),type int NOT NULL);


create table user_types(id SERIAL PRIMARY KEY,type varchar(30) NOT NULL UNIQUE);

alter table users add FOREIGN KEY (type) REFERENCES user_types(id);

/*INSERTION*/

insert into user_types(type)values('buyer');
insert into user_types(type)values('invertory_manager');

insert into users (name,email,password,type) values ('kailas','kailas.joshi@weboniselab.com','kailas123',1);
insert into users (name,email,password,type) values ('kiran','kiran@weboniselab.com','kiran123',2);
insert into users (name,email,password,type) values ('rahul','rahul@weboniselab.com','rahul123',1);
insert into users (name,email,password,type) values ('nikhil','nikhil@weboniselab.com','nikhil123',2);
insert into users (name,email,password,type) values ('amar','amar@weboniselab.com','amar1234',1);


/*Create table products AND variants */

create table products(id SERIAL PRIMARY KEY,name varchar(40) NOT NULL UNIQUE);

create table variants(id SERIAL PRIMARY KEY,name varchar(40),color varchar(20),product_size varchar(10),price int,product_id int NOT NULL);

alter table variants add FOREIGN KEY (product_id) REFERENCES products(id);

insert into products (name) values('T-Shirt');
insert into products (name) values('Pant');
insert into products (name) values('Shorts');
insert into products (name) values('Teddy');
insert into products (name) values('Jackets');

insert into variants(name,color,product_size,price,product_id) values('T-shirt','red',34,400,1);
insert into variants(name,color,product_size,price,product_id) values('pant','black',36,1200,2);
insert into variants(name,color,product_size,price,product_id) values('shorts','blue',38,300,3);
insert into variants(name,color,product_size,price,product_id) values('teddy','pick',30,800,4);
insert into variants(name,color,product_size,price,product_id) values('jackets','black',40,1600,5);


/*Create table cart */

create table cart(id SERIAL PRIMARY KEY,product_id int NOT NULL,variant_id int,variant_price int,user_id int NOT NULL);

alter table cart add FOREIGN KEY (product_id) REFERENCES products(id);

alter table cart add FOREIGN KEY (variant_id) REFERENCES variants(id);

alter table cart add FOREIGN KEY (user_id) REFERENCES users(id);

insert into cart (product_id,variant_id,variant_price,user_id) values (1,1,400,1);


/* Discounts and orders*/

create table discounts(id SERIAL NOT NULL,discount_type varchar(50),amount bigint ,PRIMARY KEY(id));

create table orders(id SERIAL NOT NULL,order_price bigint,discount_price int,user_id int,discount_id int,order_status varchar(60),total bigint,PRIMARY KEY(id));


alter table orders add FOREIGN KEY (discount_id) REFERENCES discounts(id);

alter table orders add FOREIGN KEY (user_id) REFERENCES users(id);

INSERT INTO discounts values(1,'Flat',20);
INSERT INTO discounts values(2,'extra',30);
ALTER TABLE discounts RENAME amount TO percentage; 

/*payment*/

create table payments(id SERIAL PRIMARY KEY, modes varchar(40), payment_status varchar(40),transaction_date date, user_id int NOT NULL);



alter table payments add FOREIGN KEY (user_id) REFERENCES users(id);

/*orderproduct*/

create table orderproduct(id SERIAL PRIMARY KEY,product_id int NOT NULL,variant_id int,variant_price int,user_id int NOT NULL);

alter table orderproduct add FOREIGN KEY (product_id) REFERENCES products(id);

alter table orderproduct add FOREIGN KEY (variant_id) REFERENCES variants(id);

alter table orderproduct add FOREIGN KEY (user_id) REFERENCES users(id);






