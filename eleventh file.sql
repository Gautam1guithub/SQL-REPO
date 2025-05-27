-- Subquery--> query within a query
use sakila;
select * from payment;
select * from payment where payment_id=6;
select * from payment where amount=4.99;

select * from payment where amount=(select amount from payment where payment_id=6);

select * from actor;
-- get all the columns for a user whose actor_id is greater than the actor_id of a person whose first_name is ED and last_name is chase;

select actor_id from actor where first_name= 'ed' and last_name='chase';
select * from actor where actor_id> (select actor_id from actor where first_name= 'ed' and last_name='chase');

select * from payment;

-- Q. get all the payment details for those payment where the pyment month should be equal to month of payment for payment_id =5
select month(payment_date) from payment where payment_id=5;
select * from payment where month(payment_date)= (select month(payment_date) from payment where payment_id=5);

-- Q.get the customer_id, the payment_id and the amount for the payments where the rental_id is less than
-- the rental_id of payment_id =7 and amount less than 5;

select rental_id from payment where payment_id=7 and amount <5;
select customer_id, payment_id , amount from payment where rental_id <(select rental_id  from payment where payment_id=7 and amount <5);

-- get the amount and the total number of paymetn done where the total number of payments is greater than
-- the total number of payment done by amount 5.99
select count(payment_id) from payment where  amount=5.99;
select amount, count(payment_id) from payment group by amount having count(payment_id)  > (select count(payment_id) from payment where  amount=5.99);

-- multi-line-query
select payment_id , amount from payment where payment_id in (3,1);
select * from payment where amount =(select  amount from payment where payment_id in (3,1));  -- error multi row.


-- in operator (2.99, 5.99)
select * from payment where amount in (select  amount from payment where payment_id in (3,1));

-- equal to any operator
select * from payment where amount = any (select  amount from payment where payment_id in (3,1));

-- greater than any--> greater than the minimum vLUE of subquery
select * from payment where amount >any (select  amount from payment where payment_id in (3,1));

-- less than any-->less than the maxmium vLUE of subquery
select * from payment where amount < any (select  amount from payment where payment_id in (3,1));

-- greter than all-> greater than the maxium value of subquery (5.99)
select * from payment where amount > all (select  amount from payment where payment_id in (3,1));


-- less than all-> less than the maxium value of subquery (2.99)
select * from payment where amount < all (select  amount from payment where payment_id in (3,1));
