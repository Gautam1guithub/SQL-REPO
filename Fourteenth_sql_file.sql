-- Window functions=> 

use sakila;
select avg(amount) from payment;
select customer_id, amount, payment_id ,(select avg(amount) from payment) from payment;
select avg(amount) from payment; 
select payment_id, customer_id, amount, avg(amount) over(),
sum(amount) over(),
max(amount) over () from payment;


-- partition by
select payment_id, customer_id, amount, avg(amount) over(partition by customer_id) from payment;

-- running sum=>
select payment_id, customer_id, amount, 
sum(amount) over(order by payment_id )
  from payment;
 
 
 select payment_id, customer_id, amount, 
sum(amount) over(order by customer_id ),
sum(amount) over(partition by customer_id order by payment_id )
  from payment;






use employees;
select * from salaries;
 create table salary1
  as select * from salaries limit 200;
  
-- get the emp_no, salary, total salary, avg(salary) from the employees table?

select * from salary1;
 select emp_no,  sum(salary) over(), avg(salary) over() from salary1;
 
 -- get the emp_no, saalry , yeqar ogf hoiring along with the avg(salary) of that employee from mthe salaries table
 select emp_no,  year(from_date) , avg(salary) over(partition by emp_no) from salary1 ;
 
  -- get the emp_no, salary and the running salary of each customer from the salary table?
 select emp_no, sum(salary) over (partition by emp_no order by to_date),salary
 from salary1;
  
  
  
 
 