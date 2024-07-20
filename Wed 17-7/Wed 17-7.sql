--As a SQL developer in jaradat Tech solution you are responsible for building the database for the new project
--where the project is library System contains the following tables :
--( Books , Authors , Sections , Categories , Employees , Users ) and any other necessary tables .
--So you have to create these tables with the appropriate fields in each one of them 
--and create the correct relationship between them to be logically and functionally Right 
--and after that insert at least Five records in each table .

--and after that you have to apply all types of the joins on one to many relation and another time on many to many relation . 


create database Library_System;
go

use Library_System;
go

create table authors
(a_id int primary key identity(1,1),
name varchar(50));
go
insert into authors (name)
values
('lewis Carroll'),
('Ibn al-Muqaffa'),
('Dan Brown'),
('Agatha Christie'),
('George Orwell');
go

create table sections
(s_id int primary key identity (1,1),
location varchar(50));
go
insert into sections (location)
values
('West'),
('East'),
('North'),
('South'),
('Middle');
go

create table users
(u_id int primary key identity (1,1),
name varchar(50));
go
insert into users (name)
values
('Lamees'),
('Hashim'),
('Haneen'),
('Othman'),
('Nisreen');
go

create table categories
(c_id int primary key identity (1,1),
name varchar(50));
go
insert into categories (name)
values
('Fiction'),
('Fantasy'),
('Mystery'),
('Thriller'),
('Biography');
go

create table employees
(e_id int primary key identity (1,1),
name varchar(50),
s_id int foreign key references sections(s_id) on delete cascade);
go
insert into employees ( name , s_id)
values
('Salem', 1),
('Nadia', 3),
('Kamil', 1),
('Kholod', 5),
('Aadel', 2);
go

create table books
(b_id int primary key identity (1,1),
name varchar(50),
s_id int foreign key references sections(s_id) on delete cascade,
u_id int foreign key references users(u_id) on delete cascade);
go
insert into books 
(name, s_id, u_id)
values
('Kalīla wa-Dimna', 3, 1),
('Alice''s adventures in wonderland', 2, 5),
('Endless Night', 4, 1),
('1984', 1, 2),
('The Da Vinci Code', 4, 3);
go

create table authors_books
(a_id int foreign key references authors(a_id) on delete cascade,
b_id int foreign key references books(b_id) on delete cascade,
primary key (a_id, b_id));
go
insert into authors_books
values
(1,2),
(3,5),
(4, 3),
(2, 1),
(5, 4);
go

create table book_categories
(b_id int foreign key references books(b_id) on delete cascade,
c_id int foreign key references categories(c_id) on delete cascade,
primary key (b_id, c_id));
go
insert into book_categories
values
(1, 1),
(1,2),
(2, 1),
(2,2),
(3,1),
(3,3),
(3,4),
(4,1),
(4,4),
(5,1),
(5,3),
(5,4);
go

create table sections_categories
(s_id int foreign key references sections(s_id) on delete cascade,
c_id int foreign key references categories(c_id) on delete cascade,
primary key (s_id, c_id));
go
insert into sections_categories
values
(1,1),
(1,4),
(2, 4),
(2,5),
(2,3),
(3,1),
(3,3),
(4,2),
(4,5),
(5,2),
(5,5);
go


select * from authors;
select * from sections;
select * from users;
select * from categories;
select * from employees;
select * from books;
select * from authors_books;
select * from book_categories;
select * from sections_categories;
go

select sections.location, employees.name
from sections
join employees
on sections.s_id = employees.s_id;
go
-- this was one of my first tries to join 3 tables
-- i didn't search a lot for this
--select sections.location, categories.name
--from sections_categories
--join sections
--join categories
--on sections.s_id = sections_categories.s_id AND categories.c_id = sections_categories.c_id;
--go

select sections.location, sections_categories.c_id
from sections
join sections_categories
on sections.s_id = sections_categories.s_id;
go


select users.name, books.name
from users
left join books
on users.u_id = books.u_id;
go
select categories.name, book_categories.b_id
from categories
left join book_categories
on categories.c_id = book_categories.c_id;
go

select sections.location, books.name
from books
right join sections 
on books.s_id = sections.s_id;
go
select authors.name, authors_books.b_id
from authors
right join authors_books
on authors.a_id = authors_books.a_id;
go

select users.name, books.name
from users
full join books
on users.u_id = books.u_id;
go
select books.name, book_categories.c_id
from books
full join book_categories
on books.b_id = book_categories.b_id;
go



-- 3 tables join

-- inner
select sections.location, categories.name
from sections
join sections_categories
on sections.s_id = sections_categories.s_id 
join categories
on categories.c_id = sections_categories.c_id;
go

-- Left
select categories.name, books.name
from categories
left join book_categories
on categories.c_id = book_categories.c_id
left join books
on book_categories.b_id = books.b_id;
go

-- Right
select authors.name, books.name
from authors
right join authors_books
on authors.a_id = authors_books.a_id
right join books
on authors_books.b_id = books.b_id;
go

-- full
select books.name, categories.name
from books
full join book_categories
on books.b_id = book_categories.b_id
full join categories
on categories.c_id = book_categories.c_id;
go