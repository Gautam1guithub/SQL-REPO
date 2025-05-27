select database();
use sakila;
-- string function
-- numbers, date

-- dual table
select 2*4 from dual;

-- now()
select sysdate(),curdate(),curtime(),current_timestamp(),now() from dual;

-- adddate()
select now(), adddate( now(), 2) from dual;
select now(), adddate( now(),interval 2 month) from dual;
select now(), adddate( now(),interval 2 week) from dual;

select datediff( now(),'2025-05-30 17:17:32' ) from dual;
select datediff( '2025-05-30 17:17:32','2025-05-12 17:17:32' ) from dual;

select last_day( now() ) from dual;
select month( now() ), year( now() ) from dual;
select extract( year from now()) from dual;
select extract( second from now()) from dual;
select extract( minute from now()) from dual;

-- %Y--> access modifier
select now(), date_format(now(),'this year is %Y') from dual;
select now(), date_format(now(),'this year is %m') from dual;
select now(), date_format(now(),'this year is %M') from dual;


-- round(), truncate(), pow(), floor(), ceil()
select 24.325, round(24,325) from dual;
select 24.325, round(24,325), round(24.625,1) from dual;
select 24.325, round(24,325), round(24.685,1) from dual;
select 24.325, round(24,325), round(24.685,2) from dual;
-- .27 = .3
-- .32 = .3
-- .48 = .5
select 24.325, round(24,325), round(24.685,2) from dual;

-- round off to nearest 
select round(24.32, -1) from dual;
select round(24.32, -2) from dual;
select round(64.32, -2) from dual;
select round(364.32, -2) from dual;

select round(364.32, -2), truncate(364.37,1) from dual;
select mod(11,2), pow(2,3), floor(10.999), ceil(9.0001) from dual;

-- 
select * from actor;
-- if(condition , true, false)
-- if(condition , true, if(condition, true,false)
select first_name, actor_id*10 from actor where first_name='nick';
select first_name, actor_id, if(first_name='nick', true,false) from actor ;
select first_name, actor_id, if(first_name='nick', actor_id*10,'no value') from actor ;
select first_name, actor_id, if(first_name='nick','Yash',  if(first_name='ed','hello','no value') ) from actor;
-- if(first_name='nick','Yash')
-- if(first_name='ed','hello','no value')

select first_name, if(actor_id % 2=0, concat(first_name, last_name),false) from actor;
select first_name, if(mod(actor_id ,2)=0, concat(first_name, last_name),concat(first_name,'$',last_name)) from actor;


-- case   end--> if elif condition
select * from actor;
select actor_id, first_name,
case
   when mod(actor_id,2)=0 then 'yes'
   when actor_id=5 then 'no'
   else 'false'
end
from actor;   