select database();
use sakila;
show databases;
show tables;
select actor_id, first_name,last_name,first_name from actor;
select * from actor;
select * from actor where actor_id=2;

select * from actor where actor_id=5;
select * from actor where first_name='ED';
select * from actor where first_name='ED'and actor_id>100;

select * from actor where first_name='ED'or actor_id>100;
select * from actor where actor_id>10 and actor_id<25;

-- comment between operator between lower and higher

select * from actor where actor_id between 11 and 24;

select actor_id, first_name from actor where actor_id=5;
select first_name from actor where actor_id=5;

select * from actor where actor_id in(2,5);
-- select statement
-- sql case-insenstative
-- sql multi-line query
-- and or operator
-- between and in

-- like --> pattern per kam karega
select * from actor where first_name='NICK';
select * from actor where first_name like 'NICK';

select * from actor where first_name like 'N';
 -- like % [zero or more character]  _[only 1 character]
 select * from actor where first_name like 'N%';

select * from actor where first_name like '%T';
 
select * from actor where first_name like 's%t';
  
 select * from actor where first_name like 'ED%';
 
 select * from actor where first_name like 'E_';
  select * from actor where first_name like '__';
   select * from actor where first_name like '_A%';
 
select * from actor where actor_id in(3,5,7);
select * from actor where actor_id=7 or actor_id= 3;
select * from actor where actor_id not between 3 and 100;
select * from actor where first_name like '_E%R';
select * from actor where first_name like '%NN%';
select * from actor where last_name like '%S__';
select * from actor where first_name like '_____';
select * from actor where first_name like '_A%T%H__';

