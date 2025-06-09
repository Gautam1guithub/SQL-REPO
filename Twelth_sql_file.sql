-- subquery-->
use employees;
show tables;
select * from employees;
select * from titles;



-- Q. get those employees information here of hiring year is same as the hiring year of 10002?
select year(hire_date) from employees where emp_no=10002;
select * from employees where year(hire_date) = (select year(hire_date) from employees where emp_no=10002);


-- Q.get the employee number birth date full name of persone whose birthfdate is greater than 
-- birthdate of all the persone among of employees 10003 to 10006
select emp_no, birth_date , concat(first_name,' ', last_name) from employees where birth_date > all (select birth_date from employees where emp_no between 10003 and 10006);


-- Q. get the employee no, first_name and title for all those employee who are curretnly working on 
-- the senior engineer position;
select e.emp_no, e.first_name, t.title from employees as e join titles as t on e.emp_no = t.emp_no where title='Senior Engineer';

-- Q.get the employee name and the birth date for a person who has satarted working in 1986
select concat(first_name,' ',last_name) as full_name, birth_date,year(hire_date) from employees where year(hire_date)=1986; 


-- get all the employee information only for that employee who have work on
-- 3 or 4 more position
select emp_no from titles group by emp_no having count(distinct title)>=3;

select * from employees 