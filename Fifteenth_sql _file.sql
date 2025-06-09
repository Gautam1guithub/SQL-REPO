use sakila;
select * from payment;

-- rank()=> same value and skip value
select payment_id, customer_id, amount,
 sum(amount) over (partition by customer_id),
 rank() over(partition by customer_id order by amount desc) as rank1
 from sakila.payment;
 
 -- dense rank()
 select payment_id, customer_id, amount,
 sum(amount) over (partition by customer_id),
 dense_rank() over(partition by customer_id order by amount desc) as dense_rank1
 from sakila.payment;
 
 -- subquery in from 
 select * from 
  (select payment_id, customer_id, amount,
 dense_rank() over( order by amount desc) as dense_rank1
 from sakila.payment ) as tab where dense_rank1=3;
 
 -- how to insert and update the data?==> DML
 use skila;
 create table xyz( id  int, fname varchar (20));
 insert into xyz values (10,'aman');
 insert into xyz values (11) ;  -- error
 insert into xyz(id) values (11); -- fname=> null
 insert into xyz (fname) values ('hey');
 select * from xyz;
 
 -- update
 SET SQL_SAFE_UPDATES = 0; 
 update xyz set fname ='regex'; -- all rows are update
 update xyz set fname ='regex2' where id=10;
 select * from xyz;
 
 -- delete-- all data deleted
 delete from xyz where id=10;
 select * from xyz;
 
 -- dml=> insert, update, delete
 
 -- drop=> DDL => delete table and database 
 drop table xyz;
 select * from xyz;
 
 
 
 