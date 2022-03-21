create database university;
use university;

create table course (course_name varchar(50),course_number varchar(10) primary key,credit_hours int,department varchar(10));
create table student (sname varchar(20),student_number varchar(10) primary key, class int,major varchar(10));
create table section (section_identifier varchar(10) primary key,course_number varchar(10), foreign key(course_number) references course(course_number),semester varchar(10),year int, instructor varchar(20));
create table grade_report(student_number varchar(20), foreign key(student_number) references student(student_number), section_identifier varchar(20), grade varchar(20), foreign key(section_identifier) references section(section_identifier));
create table prerequisite(course_number varchar(20), foreign key(course_number) references course(course_number),prerequisite_number varchar(20));
insert into student values('Smith','17',1,'CS');
insert into student values('Brown','8',2,'CS');
insert into course values('intro to computer science','CS1310',4,'CS');
insert into course values('DATA STRUCTURES','CS3320',4,'CS');
insert into course values('DISCRETE MATHEMATICS','MATH2410',3,'MATH');
insert into course values('DATABASE','CS3380',3,'CS');
INSERT INTO section VALUES('85','MATH2410','FALL','07','KING');
INSERT INTO section VALUES('92','CS1310','FALL','07','ANDERSON');
INSERT INTO section VALUES('102','CS3320','SPRING','08','KNUTH');
INSERT INTO section VALUES('112','MATH2410','FALL','08','CHANG');
INSERT INTO section VALUES('119','CS1310','FALL','08','ANDERSON');
INSERT INTO section VALUES('135','CS3380','FALL','08','STONE');
INSERT INTO grade_report values('17','112','B');
INSERT INTO grade_report values('17','119','C');
INSERT INTO grade_report values('8','85','A');
INSERT INTO grade_report values('8','92','A');
INSERT INTO grade_report values('8','102','B');
INSERT INTO grade_report values('8','135','A');
INSERT INTO prerequisite values('CS3380','CS3320');
INSERT INTO prerequisite values('CS3380','MATH2410');
INSERT INTO prerequisite values('CS3320','CS1310');

#select course_number from section where section_identifier in (select section_identifier from grade_report where student_number="17" );
