Use Employee_DBS;

select * from employee;

select * from manager;

select * from department;

select * from location;

select * from Region;

select * from Countries;

--A subquery is of 2 types
--Non-correlated subquery
--Correlated subquery
--Select the employee details of HR department

Select first_name,email,salary from employee where department_id=2; --Hard Coding

--Subquery
Select first_name,email,salary from employee
where department_id =(Select id  from department where name='HR')


--Display the states of India

Select state from location where country_id =
(Select id from Countries where name='India') and  city='Bombay'


Select * from manager;

--Multiple subquery

Select first_name from employee where id IN (Select employee_id from manager)
and department_id = (Select id from department where name ='HR')


--Display the employee detail whose department's location is in state Texas
--Multi-level Subquery

select first_name from employee where  department_id=
(select id from department where location_id =
(Select id from location where state='New Jersey'))


--Employee with Max Salary

Select first_name from employee where salary=
(Select Max(salary) from employee);


--Employee with Min Salary

Select first_name from employee where salary =
(Select Min(salary) from employee);


--Employee with Avg Salary

Select first_name from employee where salary =
(Select Avg(salary) from employee);


--Employee with Salary greater than Avg Salary

Select first_name,salary from employee where salary >
(Select Avg(salary) from employee);


--2nd highest salary

select first_name, salary from employee where salary=
(Select Max(salary) from employee where salary !=(
Select Max(salary) from employee));


--3rd highest salary

Select Max(salary) from employee where salary <(
Select Max(salary) from employee where salary !=(
Select Max(salary) from employee));


--4th highest salary

Select Max(salary) from employee where salary <(
Select Max(salary) from employee where salary <(
Select Max(salary) from employee where salary !=(
Select Max(salary) from employee)));



--2.	Write a query to display the names of all states belonging to the country Canada. 
--Display the records sorted in ascending order based on state name.(Q 2).


Select state from location where country_id IN
(Select id from Countries where name='CANADA')
order by state ASC;

--3.	Write a query to display the first name of the managers of Accounts department.
--Display the records sorted in ascending order based on manager name.(Q7).


Select first_name from employee where id in
( Select employee_id from manager where department_id in
(select id from department where name='Accounts'))
order by first_name ASC;


--9.Write a query to display the names of all countries belonging to region Europe. 
--Display the records sorted in ascending order based on country name.(Q1)


Select name from Countries where region_id IN
(Select id from Region where name='Europe')
order by name ASC;


--14.	Write a query to display the first name of the managers of HR department. 
--Display the records sorted in ascending order based on manager name(Q6)


Select first_name from employee where id in
( Select employee_id from manager where department_id in
(Select id from department where name='HR')) 
order by first_name ASC;



--15.	Write a query to display the first name of all employees who are managers.
--Display the records sorted in ascending order based on first name.(Q5)


Select first_name from employee where id in 
(Select employee_id from manager)
order by first_name ASC;


--Find out how many employees are available in the IT department


Select COUNT(id) as employees_of_It from employee
where department_id =(select id from department where name='IT');

Select * from employee;

Select department_id ,count(id) as EmployeesInEachDept from employee
group by department_id;


Select country_id, count(state) from location group by country_id;


Select department_id,max(salary) from employee group by department_id;


--Write a query to display the department id and the number of managers in the department.
--Display the records sorted in ascending order based on department id.
--Give an alias to the number of managers as manager_count.(Q15).

Select * from manager;
Select department_id,count(employee_id) as manager_count from manager group by department_id;


