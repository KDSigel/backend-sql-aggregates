-- customer ranking by total film time watched
-- similar to exercise 6

SELECT
customer.email,
RANK() OVER (ORDER BY SUM(film.length)DESC)
FROM
film
JOIN inventory
ON inventory.film_id = film.film_id
JOIN rental
ON rental.inventory_id = inventory.inventory_id
JOIN customer
ON customer.customer_id = rental.customer_id
GROUP BY customer.email
ORDER BY RANK ASC