-- schema
--https://drawsql.app/teams/bk-18/diagrams/school

create table Family_info
(p_id int primary key identity (1,1),
name nvarchar(max),
relation nvarchar(max),
phone int );
go

create table Classes
(cl_id int primary key identity (1,1),
code int ,
room_number int ,
schedule int );
go

create table Students
(s_id int primary key identity (1,1),
name nvarchar(max),
date_of_birth date,
address nvarchar(max),
p_id int foreign key references Family_info,
cl_id int foreign key references Classes on delete cascade);
go

create table Attendance 
(at_id int primary key identity (1,1),
date date,
absence_type nvarchar(max),
s_id int foreign key references Students on delete cascade );
go

create table Courses
(cr_id int primary key identity (1,1),
name nvarchar(max),
description nvarchar(max),
resouces nvarchar(max) );
go

create table Students_Cources
(s_id int foreign key references Students on delete cascade,
cr_id int foreign key references Courses on delete cascade,
primary key (s_id, cr_id));
go

create table Assignments 
(as_id int primary key identity (1,1),
name nvarchar(max),
description nvarchar(max),
due_date date,
state nvarchar(max),
s_id int foreign key references Students on delete cascade,
cr_id int foreign key references Courses on delete cascade );
go

create table Classes_Courses
(cl_id int foreign key references Classes on delete cascade,
cr_id int foreign key references Courses on delete cascade,
primary key (cl_id, cr_id));
go


--1- Select students in a specific Date date ?

select * from Students where date_of_birth = '1996-05-05';
go

--2- Select details of a course by its name ? 

select description from Courses where name = 'Math';
go

--3-Add a new column 'Email' to the Students table ?

alter table Students
add Email nvarchar(max);
go

--4- Insert a new student record ?

insert into Students
(name, date_of_birth, address, p_id, cl_id)
values
('talia', '1996-08-27', 'Mafraq', 3, 6);
go

select * from Students;
go

--5- Select students who have relatives listed in the system ? 

select * from Students where p_id is not null;
go

--6- Select students who are enrolled in a specific course (e.g : Math) ? 

-- each of these classes has a SQL course (cr_id = 4)
select * from Students where (cl_id = 2 OR  cl_id = 3 OR  cl_id = 4);
go

--select by the course itself
select Students.s_id, Students.name
from Students 
join Students_Cources
on Students.s_id = Students_Cources.s_id
where Students_Cources.cr_id = 4;
go


--7- Select students who have submitted and passed a specific assignment (e.g : sql  Assignment ) ? 

select s_id from Assignments where state = 'pass' AND name = 'SQL';
go

select Students.s_id, Students.name
from Students
join Assignments
on Students.s_id = Assignments.s_id
where Assignments.state = 'pass' AND Assignments.name = 'SQL';
go

--8- i need the student who tooke an leaving between last sunday and the Thursday ? (e.g: between this date : 1/1/2024 - 5/1/2024 )

select s_id from Attendance where date > '2010-10-10' AND date < '2010-11-10';
go

select Students.s_id, Students.name
from Students
join Attendance
on Students.s_id = Attendance.s_id
where date > '2010-10-10' AND date < '2010-11-10';
go


--9- i need the names of students who have absence mre than 4 ? ( not late of leaving )

select s_id from Attendance where absence_type = 'absence';
select s_id from Attendance where absence_type = 'absence' group by s_id having COUNT(s_id) > 4;
go

select Students.name, Students.s_id
from Students
join Attendance
on Students.s_id = Attendance.s_id
where Attendance.absence_type = 'absence' 
group by Students.name, Students.s_id
having COUNT(Attendance.s_id) > 4;
go

