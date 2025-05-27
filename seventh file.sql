-- join--> aalg alag data extract based on condition
use sakila;
select * from actor;
select * from film_actor;

select f.film_id,  f.actor_id from film_actor as f
join actor as a ;


create database regex;
use regex;
create table product( pid int, pname varchar(20), price int);
insert into product values(10,"Iphone",20000), (11,"TV",10000),
(12,"LED",3000), (13,"Jeans",800);

select * from product;

create table orders1( oid int, city varchar(20), pid int);
insert into orders1 values(124111,"Jaipur",10), (124112,"GOA",11),
(145631,"Manali",12), (59869011,"Raipur",16);
select * from orders1;

-- common condition
select o.oid, o.city ,o.pid, p.pname from orders1 as o
join product as p where o.pid = p.pid;

-- cross or cartesian join (A * B    M*N)
select o.oid, o.city ,o.pid, p.pname from orders1 as o
join product as p ;

-- new syntax
-- Inner join--> common elements between the tables.
select o.oid, o.city ,o.pid, p.pname from orders1 as o
 INNER join product as p where o.pid = p.pid;

-- outer join--> 
-- right join,, left join

select o.oid, o.city ,o.pid, p.pname from orders1 as o
LEFT join product as p ON o.pid = p.pid;

select o.oid, o.city ,o.pid, p.pname from product as p
LEFT join orders1 as o ON o.pid = p.pid;


use sakila;

select * from actor;
select * from film_actor;
select * from film;



SELECT a.actor_id,a.film_id, f.title FROM film_actor AS a  
INNER JOIN film AS f ON a.film_id = f.film_id ;

-- Q. find out the actor id, the movie name only for those e movie which has a length more than 100.

SELECT 
    actor.actor_id, 
    film.title AS movie_name
FROM 
    actor
JOIN 
    film_actor ON actor.actor_id = film_actor.actor_id
JOIN 
    film ON film_actor.film_id = film.film_id
WHERE 
    film.length > 100;
    
    
-- q. get the actor id and the number of movies he has done in his career.
SELECT 
    actor.actor_id,
    COUNT(film_actor.film_id) AS number_of_movies
FROM 
    actor
JOIN 
    film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY 
    actor.actor_id;




-- Q. get the title and the film id for the movies who has ratings is NC-17. and sort all the movies based on descending order of film id.

select film_id, title, rating from film where rating='nc-17' order by film_id desc;



