create database new_company;
use new_company;
create table jobs(job_id varchar(10) primary key,job_title varchar(50),min_salary int(10),max_salary int(10));
create table regions(region_id varchar(10) primary key,region_name varchar(50));
create table countries(country_id varchar(10) primary key,country_name varchar(50),region_id varchar(10) not null,foreign key(region_id) references regions(region_id));
create table locations(location_id varchar(10) primary key,street_address varchar(100),postal_code varchar(20),city varchar(50),state_province varchar(50),country_id varchar(10) not null,foreign key(country_id) references countries(country_id));
create table departments(department_id varchar(10) primary key,department_name varchar(50),location_id varchar(10),foreign key(location_id) references locations(location_id));
create table employees(employee_id varchar(10) primary key,first_name varchar(30),last_name varchar(30),email varchar(70),phone_number int(20),hire_date date,job_id varchar(10) not null,salary int(20),manager_id varchar(10),department_id varchar(10),foreign key(job_id) references jobs(job_id),foreign key(manager_id) references employees(employee_id),foreign key(department_id) references departments(department_id));
create table dependents(dependent_id varchar(10) primary key,first_name varchar(30),last_name varchar(30),relationship varchar(30),employee_id varchar(10) not null,foreign key(employee_id) references employees(employee_id));

alter table departments rename to dept;
alter table employees modify column salary smallint;
alter table employees add commission int;

