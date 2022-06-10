create database product;
use product;
create table product(pid varchar(50), pname varchar(50), pqty varchar(50), price varchar(50));
delimiter //
create procedure insert_product(IN pid varchar(50), IN pname varchar(50), IN pqty varchar(50), IN price varchar(50))
begin
if(pqty>=0 and price>0) then
 insert into product values(pid,pname,pqty,price);
 end if;
end //
delimiter ;

call insert_product("101","Donut","10","350");
call insert_product("102","Brush","10","50");
call insert_product("106","Soap","0","0");

select * from product;
