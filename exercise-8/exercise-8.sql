-- rank of film category by times rented
-- include the name, count, and rank

SELECT
category.name,
RANK() OVER (ORDER BY COUNT(*)DESC),
COUNT(*)
FROM
rental
INNER JOIN inventory
ON inventory.inventory_id = rental.inventory_id
INNER JOIN film
ON film.film_id = inventory.film_id
INNER JOIN film_category
ON film_category.film_id = film.film_id
INNER JOIN category
ON film_category.category_id = category.category_id
GROUP BY category.name