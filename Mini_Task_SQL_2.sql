select*from orders

-- Tampilan hanya kolom order_id, customer_id, dan sales
select order_id, customer_id, sales from orders

-- Tampilan semua transaksi yang berasal dari Kota Seattle
select*from orders where city = 'Seattle'

-- Tampilan semua daftar transaksi dari konsumen perorangan (segment = Consumer) yang membeli produk Furniture di Kota New York City
select*from orders where segment = 'Consumer' and city = 'New York City'