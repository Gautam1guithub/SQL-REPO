-- DCL(Data control language)=> permissions(grant,revoke)

-- Work of DBA(data control administrator)
 create user isha identified by 'isha123';
 -- current user
 select current_user();
 -- mysql stoe the infromation of the user(data dictionary)
 
 select * from mysql.user;
 select * from mysql.user where user='isha';
 
 use sakila;
 create table sakila.test87(id int);
 insert into sakila.test87 (id) values
 (123);
 
 grant all privileges on sakila.test87 to isha;
 show grants for isha;
 grant select on sakila.actor to isha;
 show grants;
 
 
  Revoke all privileges on sakila.test87 from 'isha';
  revoke select on sakila.actor from 'isha';
  
  grant select(actor_id,first_name) on sakila.actor to 'isha';
  show grants for 'isha';
  
  alter user 'isha' identified by 'regex';
  set password ='new password';
  
  -- setting password
  set password for 'localhost' ='new password' ;
  
  select * from mysql.user;
  
  -- cerate a table user annd from a table id and user
  -- you have to enter a new column ad add email in it
  -- change id column toprimary,email should be unique.
  -- create a new column from varchar datatype insert a record in this phone nmber as 'abc'
  -- change the datatype of this phone number to int.
  
  -- change the coolumn name from phone number to phone.
  
  -- read dumpfile.(SQL data file dump to dump file).
  
  --  read roles in DCL.
  
  
  create table table56(id int,name   varchar(20));
  insert into table56 (id,name) values (123,'roshan'),(345,'ravi'),(567,'aman');
  select * from table56;
  
  -- column email to the table56.
  
  alter table table56 add column email varchar(30);
  -- and now i make the table56 id column into primary key.
  alter table table56 add primary key(id);
  
--   now add the column name phone number totable56
  
  alter table table56 add column phone_number varchar(20);
  insert into table56 (id,phone_number) values(123,'abc');
  select * from table56;
  
  -- here we change the phone number datatype to int.
  
  alter table table56 modify column phone_number int; 
-- error
  
  alter table table56 change column phone_number phone varchar(20);
  
  select * from table56;
  