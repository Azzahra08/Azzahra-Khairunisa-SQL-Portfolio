select*from orders

--Tampilkan daftar berisi nama-nama produk yang dijual
select distinct product_name from orders

--Tampilkan 10 baris teratas berdasarkan nilai sales mulai dari yang terbesar
select*from orders order by sales desc limit 10

--Tampilkan daftar oder yang masuk pada bulan Maret 2015
-- Hal tersebut dapat dilakukan dengan 2 cara

-- Cara 1
select*from orders where order_date between '2015-03-01' and '2015-03-31' order by order_date asc

-- cara 2
select*from orders where Extract(Year from order_date) = '2015' and Extract(Month from order_date) = '03'
order by order_date asc
