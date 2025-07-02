use sakila;
-- offset
select * from actor order by actor_id desc limit 2,5;

with cte as
(select * from actor where actor_id<6
order by actor_id)
select * from cte;

 -- multi row subquery(in,<any,>any)
 -- case is like if else.

 
 -- 1 => actor has worked in movies
 -- 10 => actor has worked in 8 movies?
 
 select * from film_actor;
 select 
 *,
 case 
 when actor_id =1 then "actor has worked in a movie"
when actor_id =10 then "actor worked in 8 movies"
else "average"
end as number_of_times
from film_actor;
 
 SELECT
  actor_id,
  COUNT(*) AS movie_count,
  CASE
    WHEN COUNT(*) = 1 THEN 'Works in one movie'
    ELSE 'Works in many movies'
  END AS work_description
FROM film_actor
GROUP BY actor_id;

-- windows function

-- Step 1: Create the EmployeeSales table

CREATE TABLE EmployeeSales (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);


INSERT INTO EmployeeSales (EmployeeID, EmployeeName, Department, SaleDate, SaleAmount) VALUES
(1, 'Alice', 'Sales', '2025-06-01', 1200.00),
(1, 'Alice', 'Sales', '2025-06-03', 1800.00),
(1, 'Alice', 'Sales', '2025-06-07', 1500.00),
(2, 'Bob', 'Sales', '2025-06-01', 2000.00),
(2, 'Bob', 'Sales', '2025-06-05', 2200.00),
(2, 'Bob', 'Sales', '2025-06-08', 2100.00),
(3, 'Carol', 'Marketing', '2025-06-02', 3000.00),
(3, 'Carol', 'Marketing', '2025-06-06', 2800.00),
(3, 'Carol', 'Marketing', '2025-06-10', 2700.00),
(4, 'Dave', 'Marketing', '2025-06-01', 1000.00),
(4, 'Dave', 'Marketing', '2025-06-03', 1100.00),
(4, 'Dave', 'Marketing', '2025-06-09', 1300.00),
(5, 'Eve', 'HR', '2025-06-04', 900.00),
(5, 'Eve', 'HR', '2025-06-07', 950.00),
(5, 'Eve', 'HR', '2025-06-10', 1000.00),
(6, 'Frank', 'Sales', '2025-06-02', 1700.00),
(6, 'Frank', 'Sales', '2025-06-05', 1900.00),
(6, 'Frank', 'Sales', '2025-06-09', 1600.00),
(7, 'Grace', 'Finance', '2025-06-01', 2500.00),
(7, 'Grace', 'Finance', '2025-06-06', 2400.00),
(7, 'Grace', 'Finance', '2025-06-10', 2600.00),
(8, 'Hank', 'Finance', '2025-06-03', 2300.00),
(8, 'Hank', 'Finance', '2025-06-04', 2200.00),
(8, 'Hank', 'Finance', '2025-06-08', 2100.00),
(9, 'Ivy', 'HR', '2025-06-02', 800.00),
(9, 'Ivy', 'HR', '2025-06-06', 850.00),
(9, 'Ivy', 'HR', '2025-06-09', 950.00),
(10, 'Jake', 'IT', '2025-06-05', 3000.00),
(10, 'Jake', 'IT', '2025-06-07', 3200.00),
(10, 'Jake', 'IT', '2025-06-10', 3100.00);

select * from employeeSales;

select *,
sum(saleamount) over(partition by employeename)
from employeesales;
 
select *,
sum(saleamount) over(partition by employeename order by saleamount)
from employeesales;
 
select *,
sum(saleamount) over(partition by employeename order by saledate)
from employeesales;

select *,
sum(saleamount) over(partition by employeename order by department)      -- running sum or running average.
from employeesales;

-- use extract for find particular year month and date.

SELECT order_id, customer_id, order_date, revenue,
       SUM(revenue) OVER(PARTITION BY customer_id ORDER BY order_date) AS running_revenue
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2024;

