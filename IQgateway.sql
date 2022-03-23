create database IQgateway;
use  IQgateway;

create table exam (
student_id integer not null, student_name text, 
class int, subject text,  marks float);
insert into exam values(1, 'Vikash Mishra', 10, 'Science', 85.03);
insert into exam values(2, 'Vivek Mishra', 8, 'Mathematics', 86.35);
insert into exam values(3, 'Aditya Shukla', 12, 'Physics', 84.25);
insert into exam values(4, 'Sanjay Kumar', 11, 'Chemistry', 82.35);
insert into exam values(5, 'Krishna Agnihotri',7, 'Social Studies', 93.55);
select * from exam;

create table student_details(
student_id integer not null, student_name text, 
age int, gender char(1), address text);
insert into student_details values(1, 'Vikash Mishra', 16, 'M', 'Bhopal');
insert into student_details values(2, 'Vivek Mishra', 18, 'M', 'Pune');
insert into student_details values(3, 'Aditya Shukla', 13, 'M', 'Banglore');
insert into student_details values(4, 'Sanjay Kumar', 16, 'M', 'Bhopal');
insert into student_details values(5, 'Krishna Agnihotri', 15, 'M', 'Chennai');
insert into student_details values(6, 'Rajni Pandey', 15, 'M', 'Chennai');
select * from student_details;

/*details of the student class wise and age wise*/
select student_details.student_id, student_details.student_name, 
exam.class, exam.marks, 
student_details.age, student_details.gender, student_details.address
from student_details
inner join exam
on student_details.student_id = exam.student_id
order by class, age;

/*the Highest marks scored*/
select max(marks) from exam;

/*the total number of students in each class*/
select count(student_id) as 'no._of_students', class from exam
group by class order by class;

/*Name of the students who didn’t take exam*/
select student_name from student_details
where student_id not in 
(select student_id
from exam);

/*average marks of each student*/
select round(avg(marks),2) as 'avg_marks', student_name from exam
group by student_name;