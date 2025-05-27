use sakila;
select* from payment;

-- -- where-> phele data filter hoga. phele se available column per lagega.
 
select customer_id ,count(payment_id) from payment  where customer_id >3 group by customer_id;
select customer_id ,count(payment_id) from payment   group by customer_id having count(payment_id) >30 ;
select customer_id ,count(payment_id) from payment  where customer_id >3 group by customer_id having count(payment_id) >30 ;


-- get the number of payments for each amount
-- count the total number of customer who have done the payment for each amount except amount 2.99 and 0.99.alter
-- Q. get the sum of rental_id and the total amount of payment only for the amount 2.99 and 0.99 and 5.99. and the sum of rental_id should be greater than 1000. 

select  amount, count(payment_id) from payment group by amount;

select amount, count(customer_id)   from payment where amount not in (2.99,0.99) group by amount  ;

select amount, sum(rental_id), sum(amount) from payment where amount in (2.99, 5.99, 0.99) group by amount having sum(rental_id) > 1000;

select * from actor;
select * from  film_actor;

select a.actor_id, count(film_id)  from actor as a 
join film_actor as fa where a.actor_id= fa.actor_id
group by a.actor_id ;

-- 
select a.actor_id, count(film_id)  from actor as a 
join film_actor as fa where a.actor_id= fa.actor_id
group by a.actor_id having count(film_id) ;
