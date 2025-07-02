use sakila;
select * from actor;
-- correlated subquery takes too much time means it 
-- code readable

with data as 
(select * from actor where actor_id between 2 and 5
order by actor_id desc)

select * from actor
inner join data  on actor.actor_id =data.actor_id;

with data1 as
(select customer_id,avg(amount)  as average_amount from payment group by customer_id)


 -- select customer_id,amount from data1 as d1 where amount>(select customer_id,avg(amount) as average_amount from data1 as d2 where d1.customer_id =d2.customer_id group by customer_id); 

-- Get the actor_id the actor_name the film_id and the title of the movie for which the actor has work

select * from actor;
select * from film_actor;
select * from film;

with  data2 as
(select a.actor_id,a.first_name ,f.film_id from actor as a join film_actor as f on a.actor_id =f.actor_id)
select a.actor_id,a.first_name,f.film_id,f.title from data2 as a join film as f on a.film_id =f.film_id;

-- recursive CTE=> when  the function call again and again for the required result.

with cte as
(select 1 as id)
select id+1 from cte;

with recursive cte as
(select 1 as id
union
select id+1 from cte where id<5)

select * from cte;

-- heirkey

CREATE TABLE employees (
    id INT ,
    name VARCHAR(100),
    manager_id INT
);

INSERT INTO employees (id, name, manager_id) VALUES
(1, 'Alice', NULL),     -- Alice is the CEO (no manager)
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'David', 2),
(5, 'Eve', 2);

select * from employees;

SELECT name
FROM employees
WHERE manager_id IS NULL;
