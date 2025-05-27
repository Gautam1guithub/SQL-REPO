-- operator 
-- sql query--> statment question DBMS=> MYSQL
-- between and in operator and or
-- not between not in not like
select database() ;
use sakila;

select * from actor where first_name not like '%A%';
select distinct(first_name) from actor;
select count(first_name) from actor;

-- functions
-- code reusable
-- string function
-- scaler--> one line function
-- multi-row functions
-- 1 row=> apply=> result for each row
select first_name, lower(first_name) , upper(first_name) from actor;

select first_name, lower(first_name) , upper(lower(first_name)), length(first_name) from actor;
# substr(col , index, total_character)
select first_name, substr(first_name,3) from actor;
select first_name, substr(first_name,3), substr(first_name, 2,3),substr(first_name,-3),substr(first_name,-3,2) from actor;
select first_name, substr(first_name,-3,2) from actor;
select first_name, instr(first_name,'I') from actor;
select first_name, last_name, concat(first_name, last_name)from actor;
select first_name, last_name, concat(first_name, '-',last_name)from actor;
select first_name, last_name, concat(first_name, '-',last_name,'$')from actor;
select first_name, last_name, concat_ws('-',first_name,last_name,'$')from actor;
-- trim() --> white space, character
select first_name,trim( '      hey    ') from actor;
select first_name,length(trim( '      hey    ')) from actor;
select first_name,trim( '      h    ey    ') from actor;

-- lower() , upper() , length()* , trim()*, concat()

-- lpad(), rpad(),
select first_name, rpad(first_name,6,'$') from actor; 