-- order by, alias, multi-row functions
use sakila;
select * from actor order by first_name;
select * from actor order by first_name, actor_id desc;
select actor_id, actor_id +10  from actor;
select actor_id, first_name as 'new_actor' from actor;

-- multi-row function--> apply on mutli-row and give one ouput

-- sum, count, max, min, avg

select* from payment;
select distinct(customer_id) from payment;

select count(customer_id) from payment;

select count(customer_id) as TotalCustomer ,
count(distinct(customer_id)) as UniqueCustomer,
count(customer_id)- count(distinct(customer_id)) as'repetative_customer'
 from payment;

-- aggregate function--> these are functions which is used to calculate over multiple 
-- certain values and return a single output.
-- select ke baad aur from se phele m aggregate function hi use hote hai.
-- kisi aggregate function ke saat dusra normal column select nhi kr sakte.
 select count(amount),
    sum(amount),
    avg(amount),
    max(amount),
    min(amount) 
 from payment;
 
 -- group by-->
 -- similar values ka group
 
 select sum(amount) from payment where customer_id=1;
 select sum(amount) from payment where customer_id=2;
 
 select * from payment;
 -- group by ke saat aggregate function hi use hote hai.
 -- jis column ka group by kiya usi column ko select karte hai.
 select customer_id from payment group by customer_id;
 
 select customer_id , count(amount) , sum(amount)from payment group by customer_id;
 
 select amount , count(amount) from payment  group by amount;

-- Q. get the total time of rental id the sum of amount spended
--  and the maxiumn rental value for each staff.
SELECT 
    staff_id,
    SUM(amount) ,
    count(rental_id),
    max(rental_id)
FROM 
    payment 
GROUP BY 
    staff_id;
    
-- Q. get the total number of customer with the maximum and minimum rental_id 
--    with the average spended for each month of payment date.

SELECT
    date_format(payment_date, '%m'),
    count( customer_id) ,
    max(rental_id) ,
    min(rental_id) ,
    avg(amount)
FROM
    payment
GROUP BY
    date_format(payment_date, '%m');
 SELECT
    date_format(payment_date, '%m'),
    count( customer_id) ,
    max(rental_id) ,
    min(rental_id) ,
    avg(amount)
FROM
    payment
GROUP BY
    date_format(payment_date, '%m');
 SELECT
    date_format(payment_date, '%m'),
    count( customer_id) ,
    max(rental_id) ,
    min(rental_id) ,
    avg(amount)
FROM
    payment
GROUP BY
    date_format(payment_date, '%m');
  
  -- Method-2
 SELECT
    month(payment_date),
    count( customer_id) ,
    max(rental_id) ,
    min(rental_id) ,
    avg(amount)
FROM
    payment
GROUP BY
    month(payment_date);