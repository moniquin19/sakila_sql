use sakila

-- 1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312?
-- Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

select * from customer;
select * from address;

select address from address
where city_id = 312
;

select first_name, last_name, email from customer
where address_id in (256,517)
;

select customer.first_name as nombre, customer.last_name as apellido, customer.email, address.address as direccion from customer
INNER JOIN address ON address.address_id = customer.address_id 
where address.address_id in (256,517)
and address.city_id = 312
;

-- ¿Qué consulta harías para obtener todas las películas de comedia? 
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).

select f.title, f.description, f.release_year, f.rating, f.special_features, cat.name from film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
where cat.name="comedy";

-- ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? 
-- Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, la descripción y el año de lanzamiento.

select * from film;
select * from actor;
select * from film_actor;


select a.actor_id, a.first_name, a.last_name, f.title, f.description, f.release_year  from actor a 
join film_actor fa on a.actor_id=fa.actor_id
join film f on fa.film_id=f.film_id
where a.actor_id = 5;

-- ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? 
-- Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

select cu.first_name, cu.last_name, cu.email, address.address from customer cu
join address on cu.address_id = address.address_id
where cu.store_id = 1
and address.city_id in (1, 42, 312,459);

-- ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena", unidas por actor_id = 15? 
-- Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la calificación y la función especial. 
-- Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.

select fa.actor_id, f.title, f.description,f.release_year, f.rating, f.special_features from film f
join film_actor fa on fa.film_id = f.film_id
where f.rating = "G"
and f.special_features like "Behind%"
and fa.actor_id = 15;


select * from film_actor fa
join film f on fa.film_id = f.film_id
where fa.actor_id = 15
and f.rating = "G";

-- ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? 
-- Su consulta debe devolver film_id, title, actor_id y actor_name.
select f.film_id, f.title, a.actor_id, a.first_name from film_actor fa
join actor a on a.actor_id = fa.actor_id
join film f on f.film_id = fa.film_id
where fa.film_id = 369;

-- ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99?
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).

select f.title,f.description, f.release_year, f.rating, f.special_features, c.name from film_category fc
join film f on fc.film_id = f.film_id
join category c on fc.category_id = c.category_id
where f.rental_rate = 2.99
and c.name like "dra%";

-- ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? 
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales, el género (categoría) y el nombre y apellido del actor.

select f.title,f.description, f.release_year, f.rating, f.special_features, ca.name, ac.first_name, ac.last_name from film_actor fa
join actor ac on ac.actor_id = fa.actor_id
join film f on f.film_id = fa.film_id
join film_category fc on fc.film_id = f.film_id
join category ca on ca.category_id = fc.category_id
where ac.first_name like "san%"
and ac.last_name like "kil%"
and ca.name like "act%";


