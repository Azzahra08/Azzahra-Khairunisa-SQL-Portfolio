
select*from orders where product_id = 'TEC-MA-10002927'

select product_name, quantity from orders order by quantity desc 

select customer_name, customer_id, product_id, product_name, quantity from orders
where customer_name = 'Joel Eaton' order by quantity asc

select customer_name, customer_id, count(order_id)/count(distinct customer_id) as rata_rata_order from orders 
group by customer_name, customer_id order by rata_rata_order desc limit 100

select order_date, Count(order_id) As jumlah_order from orders group by order_date 
order by jumlah_order desc

select product_id, product_name, Sum(profit)/count(profit) As rata_rata_keuntungan from orders 
group by product_id, product_name order by rata_rata_keuntungan desc




