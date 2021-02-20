-- Lab 2.09 
use sakila;

-- 1
select title, length, rank() over(order by length desc) as 'Rank' from film
where length !='=' or length is not null;

-- 2
select title, rating, length, rank() over(order by rating desc) as 'Rank' from film
where length !='=' or length is not null;

-- 3
select count(film_id) as NumberOfFilms, category_id from film_category
group by category_id;

-- 4
select count(a.actor_id) as 'NumberOfFilms', d.first_name, d.last_name, a.film_id from film_actor a
join actor d on a.actor_id=d.actor_id
group by a.actor_id
order by count(a.actor_id) desc;

-- 5
select count(a.rental_id) as Times, d.customer_id from rental a
join customer d on a.customer_id=d.customer_id
group by d.customer_id
order by count(a.rental_id) desc
limit 10;