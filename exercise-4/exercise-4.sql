-- the average film length by category
-- include the category name and avg length

SELECT
category.name,
AVG(length)
FROM
film
INNER JOIN film_category
ON film_category.film_id = film.film_id
INNER JOIN category
ON category.category_id = film_category.category_id
GROUP BY category.name