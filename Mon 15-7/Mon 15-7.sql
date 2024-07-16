--Database Design: Design and implement a database named "Library" with tables for books (Books) and authors (Authors), including appropriate columns for each entity.
--Data Insertion: Populate each table with at least 5 sample records to simulate a functional library database.

--Books Table:
--BookID 
--Title 
--AuthorID 
--PublishedYear 
--CopiesAvailable 
--BookCategory

--Authors Table:
--AuthorID 
--FirstName 
--LastName 
--BirthYear 

create database Library;
go

create table Books (
BookID int ,
Title varchar(50),
AuthorID int ,
PublishedYear int ,
CopiesAvailable int ,
BookCategory varchar(20) );
go

create table Authers (
AuthorID int ,
FirstName varchar(50) ,
LastName varchar(50) ,
BirthYear int );
go

insert into Books
values 
(1, 'Alice''s adventures in wonderland', 1, 1865, 23, 'Fantasy Fiction'),
(2, 'The Da Vinci Code', 3, 2003, 13, 'Thriller Mystery'),
(3, 'Kalīla wa-Dimna', 2, 200 , 16, 'Beast fable'),
(4, 'Endless Night', 4, 1967, 7, 'Crime Fiction'),
(5, '1984', 5, 1949, 5, ' dystopian novel');
go

insert into Authers 
values 
(1, 'Lewis', 'Carroll', 1832),
(2, 'Abū Muhammad', 'Ibn al-Muqaffa', 724),
(3, 'Dan', 'Brown', 1964),
(4, 'Agatha', 'Christie', 1890),
(5, 'George', 'Orwell', 1903);
go


--Expected Outputs : 
--1- Display All Books and Authors: ( Query to retrieve and print details of all books along with their respective authors).

select * from Books;
select * from Authers;
go

--2-  Book Availability: ( Query to show the book with the highest and lowest number of available copies )

select MAX(CopiesAvailable) as 'most available' from Books;
select min(CopiesAvailable) as 'least availabe' from Books;
go


--3- Average Publication Year:( Query to calculate and display the average publication year of books in the library )

select avg(PublishedYear) as 'average published year' from Books;
go


--4- Total Books Count:( Query to count and print the total number of books in the library )

select count(*) as'total books titles' from Books; -- how many book titles are there
select sum(CopiesAvailable) as 'total books in library' from Books; -- all books in library counting the copies
go


--5- Empty Books Table ( i just need make Books Table with out any record )

truncate table Books;
go


--6- Delete Authors Table (هاي واضحه خلص زهقت بديش اكتب كمان  )

drop table Authers;
go