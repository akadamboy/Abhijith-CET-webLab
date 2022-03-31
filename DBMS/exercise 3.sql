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




#3. Retrieve the list of all courses and gradesof‘Smith’
SELECT student.s_name,grade_report.g_grade,course.c_name FROM student INNER JOIN grade_report ON student.s_no=grade_report.g_stud_no INNER JOIN section ON grade_report.g_sec_identiy=section.s_identity INNER JOIN  course ON section.s_cno=course.c_no WHERE student.s_name='smith';

#4. List the names of students who took the section of the ‘Database’ course offered in fall 2008 and their grades in that section.
SELECT student.s_name,grade_report.g_grade,course.c_name FROM student INNER JOIN grade_report ON student.s_no=grade_report.g_stud_no INNER JOIN section ON grade_report.g_sec_identiy=section.s_identity INNER JOIN  course ON section.s_cno=course.c_no WHERE course.c_name='Database' AND section.s_sem='fall' AND section.s_year='08';

#5. List the prerequisites of the ‘Database’ course.	
SELECT prerequisite.p_pre_no FROM prerequisite INNER JOIN course ON prerequisite.p_course_no=course.c_no WHERE course.c_name='Database';

#6. Retrieve the names of all senior students majoring in‘CS’(computerscience).
select s_name from student where s_major='CS' and s_class=4;

#7. Retrieve the names of all courses taught by Professor King in 2007 and 2008.
SELECT course.c_name FROM section INNER JOIN course ON section.s_cno=course.c_no WHERE section.s_instructor='king' AND section.s_year IN('07','08'); 

#8. For each section taught by Professor King, retrieve the course number,semester, year, and number of students who took the section
SELECT section.s_cno,section.s_sem,section.s_year,count(DISTINCT grade_report.g_stud_no) FROM section INNER JOIN grade_report ON grade_report.g_sec_identiy=section.s_identity WHERE section.s_instructor='king' GROUP BY grade_report.g_sec_identiy;

#9. Retrieve the name and transcript of each senior student (Class = 4)majoring in CS. A transcript includes course name, course number, credit hours, semester, year, and grade for each course completed by the student.
SELECT student.s_name,course.c_name,course.c_no,course.c_credit,section.s_sem,section.s_year,grade_report.g_grade FROM student INNER JOIN grade_report ON grade_report.g_stud_no=student.s_no INNER JOIN section ON section.s_identity=grade_report.g_sec_identiy INNER JOIN course ON course.c_no=section.s_cno WHERE student.s_class=4;

#10 Write SQL update statements to do the following on the database schema
#A.Insertanewstudent,<‘Johnson’,25,1,‘Math’>,inthedatabase.
INSERT INTO student VALUES(25,'johnson',1,'Math');		
SELECT * FROM student;
								
#B.Change th eclass of student ‘Smith’ t o2.
UPDATE student SET s_class=2 WHERE s_name='smith';
SELECT * FROM student;

#C.Insertanewcourse,<‘KnowledgeEngineering’,‘CS4390’,3,‘CS’>
INSERT INTO course VALUES('CS4390','KnowledgeEngineering',3,'cs');
SELECT * FROM course;

#D.Delete therecord forthestudentwhose nameis ‘Smith’and whosestudent number is17.
DELETE FROM student WHERE s_name='smith' AND s_no=17;
SELECT * FROM student;
