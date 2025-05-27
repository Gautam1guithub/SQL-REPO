use sakila;
select first_name, count(actor_id) from actor group by first_name order by count(actor_id) desc limit 5;


-- datatype in Sql
-- datatype 
-- Number( int, float, double)
-- character( char, varchar, string)
-- date, timestamp

-- create statement-> to create table
create table test( id int);
insert into test values(10);
select * from test;

-- tiny datatype--> aisa datatype jo size me bhut chota hai.size->1 byte
--  8 bit -> 2^8=>256  -> -128 to 127
create table test2( id tinyint);
insert into test2 values(127);
select * from test2;


-- unsigned--> all numbers are postive.
create table test3( id tinyint unsigned);
insert into test3 values(255);
select * from test3;

create table test4( id tinyint unsigned);
insert into test4 values(True);
select * from test4;

-- precison   after(,)-> scale
create table test5( id decimal(5,2));
insert into test5 values(845);
insert into test5 values(845.74125);
insert into test5 values(8454.7);   -- will give error
select * from test5;

-- 2 character (2 byte) --char-> memory wastege--> fixed character
create table test6( fname char(5) ); -- fixed length character
insert into test6 values('hi');
insert into test6 values('hiasd');
insert into test6 values('hishasjjad'); -- will give an error -> only 5 character allowed
select * from test6;

-- varchar-> variable character
create table test7( fname varchar(5) ); 
insert into test7 values('hi');
insert into test7 values('hiasd');
insert into test7 values('hishasjjad'); -- will give an error -> only 5 character allowed
insert into test7 values('hey    ');
select * from test7;
select fname, char_length(fname) from test7;

-- date, timestamp
create table test8( dob date ); 
insert into test8 values('2023-12-01');-- right yyyy-MM-DD
insert into test8 values('01-01-2025'); -- #error (incorrect format)
select * from test8;

-- 
create table test9( dob timestamp ); 
insert into test9 values('2023-12-01 10:15:59');
select * from test9;


-- subquery
-- query within a query

select payment_id, amount from payment;
select amount from payment where payment_id=10;

select * from payment where amount=5.99;

select * from payment where amount= (select amount from payment where payment_id=10) ;

select * from payment;
-- get the payment_id, customer_id, rental_id, AMOUNT , staff_id only for those payment where the staff_id is equal to 1422 renatal_id

select staff_id from payment where rental_id =1422;
select  payment_id, customer_id, rental_id,amount , staff_id from payment where staff_id= (select staff_id from payment where rental_id=1422) ;