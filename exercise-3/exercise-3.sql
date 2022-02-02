-- the average rental amount by country
-- include the country name and avg amount
-- use AVG to average the amount

SELECT
country.country,
AVG(amount)
FROM
payment
INNER JOIN customer
ON customer.customer_id = payment.customer_id
INNER JOIN address
ON address.address_id = customer.address_id
INNER JOIN city
ON city.city_id = address.city_id
INNER JOIN country
ON country.country_id = city.country_id
GROUP BY country.country
ORDER BY AVG DESC
LIMIT(10)