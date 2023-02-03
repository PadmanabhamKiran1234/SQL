use lms_db;

Select * from LMS_BOOK_DETAILS;
Select * from LMS_FINE_DETAILS;
Select * from LMS_BOOK_ISSUE;
Select * from LMS_MEMBERS;
Select * from LMS_SUPPLIERS_DETAILS;



Select * from LMS_BOOK_DETAILS;

--Display the bookcode,book name and supplier name of the books
--in library

--inner join 

Select l1.book_code,l1.book_title,l2.supplier_name
from lms_book_details as l1  join LMS_SUPPLIERS_DETAILS as l2
on l1.SUPPLIER_ID=l2.SUPPLIER_ID;

--N tables will need N-1 joins

--Display the book_title and member_id who has taken books from the library

Select * from LMS_BOOK_DETAILS;

Select * from LMS_MEMBERS;

Select * from LMS_BOOK_ISSUE;

Select distinct BOOK_TITLE,MEMBER_ID from LMS_BOOK_DETAILS join LMS_BOOK_ISSUE on
LMS_BOOK_DETAILS.BOOK_CODE=LMS_BOOK_ISSUE.BOOK_CODE;



--Display the Book name and member name who has taken book from the library


Select * from LMS_BOOK_DETAILS;

Select * from LMS_MEMBERS;

Select * from LMS_BOOK_ISSUE;

Select distinct l1.book_title, l3.member_name  from lms_book_details as l1 join
lms_book_issue as l2 on
l1.book_code = l2.book_code join LMS_MEMBERS as l3 on l2.member_id=l3.MEMBER_ID;


--Display the supplier_id and number of books supplied by each supplier

Select * from LMS_BOOK_DETAILS;
Select * from LMS_SUPPLIERS_DETAILS;

select supplier_id ,count(book_code) as NumberOfBooks from LMS_BOOK_DETAILS
where supplier_id is not null
group by supplier_id;

--Display the supplier_name and number of book supplied by each supplier

select l1.SUPPLIER_NAME,COUNT(BOOK_CODE) AS 'NO OF BOOK SUPPLIED' FROM LMS_SUPPLIERS_DETAILS as l1
JOIN LMS_BOOK_DETAILS l2 ON l1.SUPPLIER_ID = l2.SUPPLIER_ID
GROUP BY l1.SUPPLIER_NAME;










--Employeee_DBS
select * from employee;
Select * from department;
select * from location;

--Display employee name,email and department name

Select first_name+','+last_name as Name ,email,name from employee join department
on employee.department_id=department.id;

--Display empl name,dept name and the state location

Select e.first_name ,d.name as Dept,l.state
from employee as e join department as d on e.department_id=d.id join
location as l on l.id=d.location_id;

--Display department_id and number of employees in each department

Select department_id ,count(id) as CountofEmps from employee group by department_id;

--Display department name and number of employees in each department

Select  d.name ,count(e.id) as CountOfEmps from  employee as e join department as d on e.department_id=d.id
group by d.name;




--1.Write a query to display the book title, supplier name who has supplied books to library.


Select l1.BOOK_TITLE,l2.SUPPLIER_NAME from LMS_BOOK_DETAILS as l1 join LMS_SUPPLIERS_DETAILS as l2
on l1.SUPPLIER_ID=l2.SUPPLIER_ID



--2.Write a query to display member name and book code for the book he/she taken from 
--the library.



Select * from LMS_FINE_DETAILS;
Select * from LMS_MEMBERS;
Select * from LMS_BOOK_DETAILS;
Select * from LMS_BOOK_ISSUE;


Select distinct l3.member_name ,l1.book_code from lms_book_details as l1 join
lms_book_issue as l2 on
l1.book_code = l2.book_code join LMS_MEMBERS as l3 on l2.member_id=l3.MEMBER_ID;



--3.Write a query to display the book title and date
--when the book was taken from the library.


Select l1.book_title ,l2.date_issue from LMS_BOOK_DETAILS as l1 join LMS_BOOK_ISSUE as l2
on l1.book_code=l2.book_code;


--4.Write a query to display the member id and the fine amount paid by the member 
--in the library.


Select * from LMS_FINE_DETAILS;
Select * from LMS_BOOK_ISSUE;

Select l1.member_id,l2.fine_amount from LMS_BOOK_ISSUE as l1 join
LMS_FINE_DETAILS as l2 on l1.FINE_RANGE=l2.FINE_RANGE;



--5.Write a query to display the member name and 
--the date difference between the date return and date returned.


Select l1.member_name ,DATEDIFF(day,l2.date_return,l2.date_returned) as diff from LMS_MEMBERS as l1
join LMS_BOOK_ISSUE as l2 on l1.MEMBER_ID=l2.MEMBER_ID;



--6.Write a query to display the book title and the member name of member 
--who has taken book from library.



Select distinct l1.book_title, l3.member_name  from lms_book_details as l1 join
lms_book_issue as l2 on
l1.book_code = l2.book_code join LMS_MEMBERS as l3 on l2.member_id=l3.MEMBER_ID;



--7.	Write a query to display the book title, member name and the supplier name 
--for the books taken from the library.


Select * from LMS_BOOK_DETAILS;

Select * from LMS_MEMBERS;

Select * from LMS_SUPPLIERS_DETAILS;

Select * from LMS_BOOK_ISSUE;
 
Select distinct l1.book_title, l3.member_name ,l4.supplier_name from lms_book_details as l1 
join lms_book_issue as l2 on l1.book_code = l2.book_code
join LMS_MEMBERS as l3 on l2.member_id=l3.MEMBER_ID 
join LMS_SUPPLIERS_DETAILS as l4 on l1.SUPPLIER_ID=l4.SUPPLIER_ID;

--8.	Write a query to display the book title and 
--the difference fine amount paid for the book in library.

Select * from LMS_FINE_DETAILS;
Select * from LMS_BOOK_DETAILS;
Select * from LMS_BOOK_ISSUE;
Select distinct l1.book_title ,l3.fine_amount from LMS_BOOK_DETAILS as l1 
join LMS_BOOK_ISSUE as l2 on l1.BOOK_CODE=l2.BOOK_CODE 
join LMS_FINE_DETAILS as l3 on l2.FINE_RANGE=l3.FINE_RANGE;

--Easy
--Problem#17:
--Write a query to display the member id, member name, city and
--member status of members with the total fine paid by them with alias name “Fine”.
Select * from LMS_FINE_DETAILS;
Select * from LMS_MEMBERS;
Select * from LMS_BOOK_ISSUE;
Select l1.member_id ,l1.member_name,l1.city , l1.membership_status ,l3.FINE_AMOUNT as fine 
from LMS_MEMBERS as l1 join LMS_BOOK_ISSUE as l2 on l1.MEMBER_ID=l2.MEMBER_ID
join LMS_FINE_DETAILS as l3 on l3.FINE_RANGE=l2.FINE_RANGE;


--Average
--Problem 1
--Write a query to display the member id, member name of the members, book code and
--book title of the books taken by them

Select * from LMS_MEMBERS;
Select * from LMS_BOOK_DETAILS;
Select * from LMS_BOOK_ISSUE;

Select l1.member_id,l1.member_name ,l3.book_code,l3.book_title from LMS_MEMBERS as l1
join LMS_BOOK_ISSUE as l2 on l1.MEMBER_ID=l2.MEMBER_ID 
join LMS_BOOK_DETAILS as l3 on l3.BOOK_CODE=l2.BOOK_CODE;


--Problem 3
--Write a query to display the member id, member name, fine range and
--fine amount of the members whose fine amount is less than 100.
Select * from LMS_MEMBERS;
Select * from LMS_FINE_DETAILS;
Select * from LMS_BOOK_ISSUE;

Select l1.member_id,l1.member_name,l3.fine_range ,l3.fine_amount  from LMS_MEMBERS as l1 
join LMS_BOOK_ISSUE as l2 on l1.MEMBER_ID=l2.MEMBER_ID 
join LMS_FINE_DETAILS as l3 on l3.FINE_RANGE=l2.FINE_RANGE
WHERE l3.fine_amount<100;


--Problem 4
--Write a query to display the book code, book title, publisher, edition, price and 
--year of publication and sort based on year of publication, publisher and edition.


Select book_code,book_title,publication,book_edition,price ,publish_date from LMS_BOOK_DETAILS
order by PUBLISH_DATE,PUBLICATION,book_edition;

-- Problem 5:
-- Write a query to display the book code, book title and rack number of the books which are placed in rack 'A1' and sort by book title in ascending order.

select book_code,book_title,rack_num from LMS_BOOK_DETAILS where RACK_NUM='A1' order by BOOK_TITLE;

-- Problem 6:
-- Write a query to display the member id, member name, due date and date returned of the members who has returned the books after the due date. Hint: Date_return is due date and Date_returned is actual book return date.

select l1.member_id,member_name,Date_return as due_date,Date_returned from LMS_MEMBERS as l1
join LMS_BOOK_ISSUE as l2 on l2.MEMBER_ID=l1.MEMBER_ID where DATE_RETURNED>DATE_RETURN;

-- Problem 7:
-- Write a query to display the member id, member name and date of registration who have not taken any book.

select  member_id,member_name,date_register from LMS_MEMBERS
where MEMBER_ID not in(select MEMBER_ID from LMS_BOOK_ISSUE);

-- Problem 8:
-- Write a Query to display the member id and member name of the members 
--who has not paid any fine in the year 2012.
select member_id,member_name from LMS_MEMBERS where MEMBER_ID in (select MEMBER_ID from LMS_BOOK_ISSUE where year(DATE_RETURNED)=2012
and FINE_RANGE in(select FINE_RANGE from LMS_FINE_DETAILS where FINE_AMOUNT=0 ));


-- Problem 10:
-- Write a query to list the book title and supplier id for the books authored by “Herbert Schildt" and the book edition is 5 and supplied by supplier ‘S01’.

select book_title,supplier_id from LMS_BOOK_DETAILS where AUTHOR='Herbert Schildt' and 
BOOK_EDITION=5 and SUPPLIER_ID='S01';


-- Problem 11:
-- Write a query to display the rack number and the number of books in each rack with alias 
--name “NOOFBOOKS” and sort by rack number in ascending order.

select rack_num,COUNT(book_code) as NOOFBOOKS from LMS_BOOK_DETAILS group by RACK_NUM;


-- Problem 12:
-- Write a query to display book issue number, member name, date or registration, date of expiry, 
--book title, category author, price, date of issue, date of return, actual returned date, issue status, fine amount.

select distinct book_issue_no,member_name,date_register,date_expire,book_title,category,author,price,date_issue,
date_return,date_returned,fine_amount from LMS_BOOK_DETAILS as l1 
join LMS_BOOK_ISSUE as l2 on l1.BOOK_CODE=l2.BOOK_CODE 
join LMS_MEMBERS as l3 on l3.MEMBER_ID=l2.MEMBER_ID 
join LMS_FINE_DETAILS as l4 on l2.FINE_RANGE=l4.FINE_RANGE;


-- Problem 13:
-- Write a query to display the book code, title, publish date of the books which is been published 
--in the month of December.
select book_code,book_title,publish_date from LMS_BOOK_DETAILS where MONTH(PUBLISH_DATE)=12 ; 


-- Problem 14:
-- Write a query to display the book code, book title ,supplier name and price of the book witch 
--takes maximum price based on each supplier.

select distinct book_code,book_title,l2.supplier_name,max(price) as maxPrice from LMS_BOOK_DETAILS as l1
join LMS_SUPPLIERS_DETAILS as l2 on l1.SUPPLIER_ID=l2.SUPPLIER_ID group by book_code,book_title,l2.SUPPLIER_NAME; 







