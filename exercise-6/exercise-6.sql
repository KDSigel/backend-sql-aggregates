-- customer ranking by total amount spent
-- include email and rank
-- use RANK ORDER BY the SUM of the amount in descending order

SELECT
customer.email,
RANK() OVER (ORDER BY SUM(payment.amount)DESC)
FROM
payment
JOIN rental
ON rental.rental_id = payment.rental_id
JOIN customer
ON customer.customer_id = rental.customer_id
GROUP BY customer.email
ORDER BY RANK ASC