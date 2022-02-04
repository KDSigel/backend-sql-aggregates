-- ROLLUP of amount made per year, month, day
-- use ROLLUP and EXTRACT YEAR, MONTH, DAY from payment_date

SELECT
    EXTRACT (YEAR FROM payment.payment_date) Y,
	EXTRACT (MONTH FROM payment.payment_date) M,
    EXTRACT (DAY FROM payment.payment_date) D,
    SUM(amount)
FROM
    payment
GROUP BY
    ROLLUP (Y, M, D);
