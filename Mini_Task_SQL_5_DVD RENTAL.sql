select
  r.rental_id,
  r.rental_date,
  r.return_date,
  f.title as film_title,
  c.first_name as customer_name_firstname,
  c.last_name as customer_name_lastname
from rental r
left join inventory i on r.inventory_id = i.inventory_id
left join film f on i.film_id = f.film_id
left join customer c on r.customer_id = c.customer_id


