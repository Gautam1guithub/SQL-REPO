use sakila;
select * from film_actor;   -- find the number of actors who have worked in film_id =40?
-- find out those actors who have worked in film_id =40?

select count(actor_id) as actor_count from film_actor where film_id =40;
-- get the total number of movies by each actor 
-- get the number of actors who have worked in each movie?
-- get only the film id where the the number of actors is greater then 2?


select actor_id ,count(film_id) as total_film from film_actor group by actor_id;
select film_id,count(actor_id) as total_actors from film_actor group by film_id;
select film_id,count(actor_id) as actor_count from film_actor group by film_id having actor_count>2;

select * from payment;
-- get the number of staff serving each customer the total amount and the average amount spendid by ech customer?
-- get the total amount spend by each staff member  for each customer?

select customer_id,staff_id,sum(amount) as total_spend from payment group by customer_id, staff_id;
select customer_id,count(staff_id) as total_staff,sum(amount) as total_amount,avg(amount) as average_amount from payment group by customer_id;

 -- total amount spend for each month of a year?

 select year(payment_date),month(payment_date) from payment;
 select year(payment_date),month(payment_date),sum(amount) as total_amount from payment group by year(payment_date),month(payment_date);

select * from payment;
-- get all the columns  payment_date is greater then the payment_date for id =3?

select * from payment where payment_date>(select payment_date from payment where payment_id =3);

-- get those information where the staff_id and the amount is same as the staff_id and amount of payment_id =2?
select * from payment where (staff_id , amount) =( Select staff_id,amount from payment where payment_id =2);
-- get those customer and the total number of payments done where the total number of payment done is greater then the totla number of payments done by customer id =2;
select * from payment;
SELECT customer_id, COUNT(*) AS total_payments
FROM payment GROUP BY customer_id
HAVING COUNT(*) > (SELECT COUNT(*) FROM payment WHERE customer_id = 2
);

-- assignmet wrok=>

CREATE TABLE sales (
    sales_date DATE,
    customer_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price_per_unit DECIMAL(10, 2),
    region VARCHAR(50)
);

INSERT INTO sales (sales_date, customer_id, product_name, category, quantity, price_per_unit, region) VALUES
('2025-06-01', 201, 'iPhone 13', 'Electronics', 2, 699.99, 'North'),
('2025-06-02', 202, 'Samsung Galaxy S21', 'Electronics', 1, 649.99, 'West'),
('2025-06-02', 203, 'Sony Headphones', 'Accessories', 3, 79.99, 'East'),
('2025-06-03', 204, 'Organic Apples', 'Groceries', 10, 1.50, 'South'),
('2025-06-03', 205, 'HP Laptop', 'Electronics', 1, 899.99, 'North'),
('2025-06-04', 206, 'T-shirt', 'Clothing', 5, 19.99, 'West'),
('2025-06-04', 207, 'Milk 1L', 'Groceries', 6, 0.99, 'East'),
('2025-06-05', 208, 'Blender', 'Home Appliances', 2, 49.99, 'South'),
('2025-06-06', 209, 'Nike Shoes', 'Footwear', 1, 120.00, 'North'),
('2025-06-06', 210, 'Jeans', 'Clothing', 2, 39.99, 'West');

select * from sales;

-- 5. Display the region, number of customers, and the average length of product names per region.
-- 4. Group sales by the first 3 letters of the product name and count how many sales are in each group.
-- 3. Find total sales revenue grouped by product category, but display category names in uppercase.
-- 2. Group products by their lowercase name and calculate total quantity sold for each.
-- 1. Group sales by uppercase region and count how many sales occurred in each region
-- 9. Group by region and show the region name along with the total number of characters in all product names sold in that region.
-- 10. Group by category and display the category name reversed along with total revenue.

select region,count(customer_id) as number_of_customers,avg(length(product_name)) as average_name from sales group by region;
select substr(product_name,1,3) as three_characters,count(*) from sales group by three_characters;
select sum(quantity*price_per_unit) as total_sales,upper(category) as category_name from sales group by category;
select lower(product_name) as products_name,sum(quantity) as total_quantity from sales group by products_name;
select upper(region) as region,count(*) as total_number_of_sales from sales group by region;
select region,count(product_name) as total_counts,length(product_name) as total_length_of_characters from sales group by region,total_length_of_characters;
select reverse(category) as reverse_category_name,sum(quantity*price_per_unit) as total_revenue from sales group by reverse_category_name;

use sakila;

select * from payment;
-- get the payment_id,customer_id ,amount from the payment tbale 
-- where the amount spend by the customer is greater then the average amount spend by that particular user.  

select payment_id,customer_id ,amount  from  payment as p1 where amount>
(select avg(amount) as average_amount from payment as p2 where p1.customer_id =p2.customer_id);

-- Get the payment_id, customer_id, and amount where the amount is less than the average amount spent by that customer.

select payment_id,customer_id,amount from payment as p1 where amount<
(select avg(amount) as average_amount from  payment as p2 where p1.customer_id =p2.customer_id);

select customer_id,avg(amount) as average_amount from payment where customer_id =1 group by customer_id;

-- 
