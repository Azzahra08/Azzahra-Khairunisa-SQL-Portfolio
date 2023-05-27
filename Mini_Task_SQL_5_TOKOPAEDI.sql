select sum(sales)/count(sales) as spend_rata from orders

select customer_id, customer_name, sum(sales)/count(sales) as rataa_spend from orders 
group by customer_id, customer_name order by rataa_spend desc limit 287