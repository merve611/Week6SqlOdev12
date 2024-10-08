--1. film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT COUNT(*) FROM film
WHERE length > (SELECT AVG(length) FROM film);


--2. film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?

SELECT COUNT(*) FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film)



--3. film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.

SELECT * FROM film
WHERE replacement_cost = (SELECT MIN(replacement_cost) FROM film)
AND rental_rate = (SELECT MIN(rental_rate) FROM film) ;


--4. payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.

SELECT * FROM (
	SELECT customer_id,COUNT(*) AS total_payments
	FROM payment 
	group by customer_id
	order by Count(*) desc	
) as payment_counts 
inner join customer c on c.customer_id =  payment_counts.customer_id
ORDER BY total_payments DESC






