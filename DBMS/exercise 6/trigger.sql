create database shop;
use shop;
create table product(product_id varchar(10) primary key,name varchar(20),price varchar(20),quantity_in_stock varchar(20)) ;
create table sale(sale_id varchar(10) primary key,delivery_address varchar(30));
create table sale_item(sale_id varchar(10),product_id varchar(10),quantity varchar(10),foreign key(product_id) references product(product_id),foreign key(sale_id) references sale(sale_id));

insert into product values(100,'Soap',200,35);
insert into sale values(1101,'kkkk');
insert into sale_item values(1101,100,12);
select * from sale_item;
select * from sale;
select * from product;