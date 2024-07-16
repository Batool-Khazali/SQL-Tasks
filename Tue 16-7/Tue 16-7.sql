-- As a SQL developer you are responsible for building the database for the new project, 
--where the project is School System contains the following tables : 
--( Teachers, TeacherDetails, Courses, Students ).
--So you have to create these tables with the appropriate fields in each one of them 
--and create the correct relationship between them to be logically and functionally Right 
--and after that insert at least Five records in each table .


create database School_System;
go

create table Teachers (
TeacherID int primary key,
Name varchar(35),
Age int );
go

create table Courses (
CourseID int primary key,
CourseName varchar(35),
Grade int,
TeacherID int foreign key references Teachers(TeacherID)
);
go

create table TeacherDetails (
TeachersID int foreign key references Teachers(TeacherID) unique,
CourseID int foreign key references Courses(CourseID),
JobTenure int,
Salary int
);
go

create table Students (
StudentID int primary key,
Name varchar(35),
HomeRoomTeacherID int foreign key references Teachers(TeacherID) 
);
go

insert into Teachers
values
(1, 'Jood', 33),
(2, 'Mona', 50),
(3, 'Amal', 27),
(4, 'Hanadi', 42),
(5, 'Balqees', 36);
go

insert into Courses
values
(101, 'Maths', 10, 2),
(103, 'Maths', 12, 2),
(202, 'English', 11, 4),
(201, 'English', 9, 5),
(503, 'Science', 11, 1),
(401, 'arabic', 10, 3);
go

insert into TeacherDetails 
values 
(1, 503, 7, 400),
(2, 101, 25, 600),
(3, 401, 3, 300),
(4, 202, 17, 500),
(5, 201, 10, 400);
go

insert into Students
values
(1112, 'Aseel', 2),
(1205, 'Raghad', 3),
(1020, 'Malak', 1),
(1125, 'Dana', 2),
(0916, 'Bushra', 5);
go


select * from Teachers;
select * from TeacherDetails;
select * from Courses;
select * from Students;
go



