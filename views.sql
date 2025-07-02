use sakila;

use regex;

create table xyz(id int , name varchar(20));

insert into xyz value(10, "tushar"), (20, "ashika"), (30,"omi"), (40, "ishan"), (50, "tushar"), (60, "ujjwal"), (70, "tushar");

explain select * from xyz where id = 10;

-- TYPES OF CLUSTERS

-- inbuilt preimary key ya unique key is called a cluster index.alter

drop table xyz;

create table xyz(id int primary key
, name varchar(20));

insert into xyz value(10, "tushar"), (20, "ashika"), (30,"omi"), (40, "ishan"), (50, "tushar"), (60, "ujjwal"), (70, "tushar");

select * from xyz;

explain select * from xyz where name ='tushar';          -- every primary key helps a cluster to find the output is called row_od.
explain select * from xyz where id = 10;

explain select * from xyz where id = 10;

create index index_name on xyz(name);
explain select * from xyz where name ='tushar'; 
explain select * from xyz where name ='ujjwal';

show index from  xyz;

drop index index_name on xyz;

-- composite index => index made on one or more column.

CREATE INDEX index_name     -- (read ke liye banai jati ha) => we do not create index in for writing. 
ON xyz (id, name);

explain select * from xyz where name ='tushar';   
explain select * from xyz where id =10 and name ='tushar';  

 