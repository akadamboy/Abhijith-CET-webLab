create database college;
use college;

create table department(dept_id varchar(10) primary key,dept_name varchar(30));
create table staff(staff_id varchar(20) primary key,sname varchar(20),designation varchar(20),qualification varchar(30),type_of_appointment varchar(20),dept_id varchar(10),salary varchar(10),foreign key(dept_id) references department(dept_id));

insert into department values(5,"Computer Application");
insert into department values(1,"CSE");
insert into department values(2,"Civil Engineering");
insert into department values(3,"Mechanical");
insert into department values(4,"Electrical and Electronics");

insert into staff values(1001,"Reena","Professor","PhD","Regular",5,200000);
insert into staff values(2022,"Virat","Asst. Professor","PhD","Regular",2,150000);
insert into staff values(3123,"Devika","Lecturer","MCA","Contract",5,70000);
insert into staff values(3341,"Prem","Lecturer","MTech","Contract",3,72000);
insert into staff values(1502,"Ashwin","Assoc. Professor","PhD","Regular",5,175000);
insert into staff values(4815,"Reshma","Lecturer","MTech","Contract",4,67000);

#Q1
select department.dept_name ,count(staff.dept_id) as no_of_faculties
from staff, department 
where staff.dept_id=department.dept_id and
type_of_appointment = "Contract" 
group by staff.dept_id;

#Q2
select max(p_count), dept_name from 
((select department.dept_name, count(staff.dept_id) as p_count
from staff, department
where staff.dept_id=department.dept_id and
staff.qualification="PhD"
group by staff.dept_id)

as pros) 
group by dept_name
order by dept_name desc LIMIT 1;

#OR 

select count(staff.dept_id), department.dept_name 
from staff, department
where staff.dept_id=department.dept_id and
staff.qualification="PhD"
group by staff.dept_id 
order by dept_name desc LIMIT 1;

#Q3
select  department.dept_name, avg(staff.salary)
from staff, department
where staff.dept_id=department.dept_id
group by staff.dept_id;

#Q4 
select max(staff.salary), staff.sname, department.dept_name 
from staff, department
where staff.dept_id=department.dept_id
group by staff.dept_id
order by staff.salary desc;