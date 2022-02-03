use sakila;

Select DISTINCT(COUNT(last_name)) from actor;

SELECT DISTINCT(COUNT(language_id)) from FILM;

SELECT COUNT(FILM_ID) from FILM
where Rating = 'PG-13';

#Get 10 the longest movies from 2006.

SELECT TITLE, LENGTH, release_year from FILM
where release_year = '2006'
order by length desc
limit 10;

#How many days has been the company operating (check DATEDIFF() function)?


SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS DateDiff FROM rental;

#Show rental info with additional columns month and weekday. Get 20.


select *, DATE_FORMAT(RENTAL_DATE,"%M") as month, weekday(RENTAL_DATE) as weekday from rental
limit 20; 

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select *, DATE_FORMAT(RENTAL_DATE,"%M") as month, weekday(RENTAL_DATE) as weekday,
case
	when weekday(rental_date) <=4 Then "weekday"
    when weekday(rental_date) >4 Then "weekend"
END as day_type
from rental;

#How many rentals were in the last month of activity?

select count(rental_date) from rental
     where rental_date > current_date() - interval 5863 day;
