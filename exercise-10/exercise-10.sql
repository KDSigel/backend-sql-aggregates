-- CUBE of amount made per year, month, day, and film rating
-- similar to exercise 9 but include the rating with joins
-- replace ROLLUP with CUBE

SELECT
    EXTRACT (YEAR FROM payment.payment_date) Y,
	EXTRACT (MONTH FROM payment.payment_date) M,
    EXTRACT (DAY FROM payment.payment_date) D,
    SUM(amount),
    film.rating
FROM
    payment
INNER JOIN rental
ON rental.rental_id = payment.rental_id
INNER JOIN inventory
ON inventory.inventory_id = rental.inventory_id
INNER JOIN film
ON film.film_id = inventory.film_id
GROUP BY
    CUBE (Y, M, D, film.rating)
ORDER BY film.rating, Y, M, D;