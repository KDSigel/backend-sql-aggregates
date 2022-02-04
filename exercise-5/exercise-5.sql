-- the total run time of all inventory items if they were all played back to back

SELECT
SUM(length)
FROM
inventory
INNER JOIN film
ON film.film_id = inventory.film_id