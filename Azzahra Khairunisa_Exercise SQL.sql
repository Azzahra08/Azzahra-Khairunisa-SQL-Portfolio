-- QUERY EXERCISE SQL
-- no 1
select distinct Bulan_transaksi_2021, sum(total_transaksi) as  total_transaksi_2021 from
	(select order_date, extract(month from order_date) as Bulan_transaksi_2021, sum(after_discount)
	 as total_transaksi from order_detail
	 where is_valid = 1 and extract(year from order_date) = '2021'
	 group by order_date
	 order by total_transaksi desc) as c group by Bulan_transaksi_2021 order by total_transaksi_2021 desc
	 
-- no 2
select distinct Bulan_transaksi_2021, sum(total_customer) as total_customer_2021 from
	(select order_date, extract(month from order_date) as Bulan_transaksi_2021, count(distinct customer_id)
	as total_customer from order_detail
	where is_valid = 1 and extract(year from order_date) = '2021'
	group by order_date
	order by total_customer desc) as nt group by Bulan_transaksi_2021 order by total_customer_2021 desc

select distinct Bulan_transaksi_2021, sum(total_order) as total_order_2021 from
	(select order_date, extract(month from order_date) as Bulan_transaksi_2021, count(distinct id)
	as total_order from order_detail
	where is_valid = 1 and extract(year from order_date) = '2021'
	group by order_date
	order by total_order desc) as nt group by Bulan_transaksi_2021 order by total_order_2021 desc
	
select distinct Bulan_transaksi_2021, sum(total_qty) as total_qty_2021 from
	(select order_date, extract(month from order_date) as Bulan_transaksi_2021, sum(qty_ordered)
	as total_qty from order_detail
	where is_valid = 1 and extract(year from order_date) = '2021'
	group by order_date
	order by total_qty desc) as nt group by Bulan_transaksi_2021 order by total_qty_2021 desc

-- no 3
select distinct category, sum(total_transaksi) as transaksi_2022
from (select category, sum(after_discount) as total_transaksi
	 from (select o.order_date, o.is_valid, o.after_discount, s.category from
		   order_detail o
		   left join sku_detail s on o.sku_id = s.id) as nt
	 where is_valid = 1 and extract(year from order_date) = '2022' group by order_date,
category order by total_transaksi desc)
as a group by category order by transaksi_2022 desc

-- no 4
select distinct category, sum(total_transaksi) as transaksi_2021
from (select category, sum(after_discount) as total_transaksi
	 from (select o.order_date, o.is_valid, o.after_discount, s.category from
		  order_detail o
		  left join sku_detail s on o.sku_id = s.id) as nt
	 where is_valid = 1 and extract(year from order_date) = '2021' group by order_date,
	 category order by total_transaksi desc)
	 as a group by category order by transaksi_2021 desc

select distinct category, sum(total_transaksi) as transaksi_2022
from (select category, sum(after_discount) as total_transaksi
	 from (select o.order_date, o.is_valid, o.after_discount, s.category from
		  order_detail o
		  left join sku_detail s on o.sku_id = s.id) as nt
	 where is_valid = 1 and extract(year from order_date) = '2022' group by order_date,
	 category order by total_transaksi desc)
	 as a group by category order by transaksi_2022 desc
	 
-- no 5
select distinct sku as Sku_name, ca as Category, sum(total_transaksi) as transaksi_2022,
sum(cust) as customer, sum(order_id) as id_order, sum(Kuantitas) as quantity
from (select distinct sku_name as sku, category as ca, sum(after_discount)as total_transaksi,
	count(distinct customer_id) as cust, count(distinct id) as order_id, sum(qty_ordered) as Kuantitas
	from(select o.order_date, o.customer_id, o.id, o.is_valid, o.after_discount, o.qty_ordered,
		s.category, s.sku_name from order_detail o
		left join sku_detail s on o.sku_id = s.id) as nt 
	where is_valid = 1 and extract(year from order_date) = '2022' group by
sku, ca order by total_transaksi desc) as nt2
group by Sku_name, Category order by transaksi_2022 desc limit 10

select distinct boths as Sku_name_and_Category, sum(total_transaksi) as transaksi_2022,
sum(cust) as customer, sum(order_id) as id_order, sum(Kuantitas) as quantity
from (select distinct concat(sku_name, category) as boths, sum(after_discount)as total_transaksi,
	count(distinct customer_id) as cust, count(distinct id) as order_id, sum(qty_ordered) as Kuantitas
	from(select o.order_date, o.customer_id, o.id, o.is_valid, o.after_discount, o.qty_ordered,
		s.category, s.sku_name from order_detail o
		left join sku_detail s on o.sku_id = s.id) as nt 
	where is_valid = 1 and extract(year from order_date) = '2022' group by
boths order by total_transaksi desc) as nt2
group by Sku_name_and_Category order by transaksi_2022 desc limit 10

-- no 6
select count(distinct a) as jumlah_id, payment_method
from(select o.id as a, o.order_date, o.is_valid, p.payment_method
from order_detail o left join payment_detail p on o.payment_id = p.id) as nt where is_valid = 1 and
Extract(year from order_date) = '2022' group by payment_method order by jumlah_id desc limit 5

-- no 7
select sum(jumlah_transaksi) as total_transaksi_samsung
from (select distinct id as order_id, sku_name, sum(after_discount) as jumlah_transaksi
	  from(select o.order_date, o.customer_id, o.id, o.is_valid, o.after_discount, o.qty_ordered,
		   s.category, s.sku_name from order_detail o
		   left join sku_detail s on o.sku_id = s.id) as nt where sku_name like '%Samsung%'
	  and category = 'Mobiles & Tablets' and is_valid = 1 group by sku_name, order_id
order by jumlah_transaksi desc) as nt2

select sum(jumlah_transaksi) as total_transaksi_apple
from (select distinct id as order_id, sku_name, sum(after_discount) as jumlah_transaksi
	  from(select o.order_date, o.customer_id, o.id, o.is_valid, o.after_discount, o.qty_ordered,
		   s.category, s.sku_name from order_detail o
		   left join sku_detail s on o.sku_id = s.id) as nt where sku_name like '%Apple%' or sku_name like '%iphone%'
	  and category = 'Mobiles & Tablets' and is_valid = 1 group by sku_name, order_id
order by jumlah_transaksi desc) as nt2

select sum(jumlah_transaksi) as total_transaksi_sony
from (select distinct id as order_id, sku_name, sum(after_discount) as jumlah_transaksi
	  from(select o.order_date, o.customer_id, o.id, o.is_valid, o.after_discount, o.qty_ordered,
		   s.category, s.sku_name from order_detail o
		   left join sku_detail s on o.sku_id = s.id) as nt where sku_name like '%Sony%'
	  and category = 'Mobiles & Tablets' and is_valid = 1 group by sku_name, order_id
order by jumlah_transaksi desc) as nt2

select sum(jumlah_transaksi) as total_transaksi_huawei
from (select distinct id as order_id, sku_name, sum(after_discount) as jumlah_transaksi
	  from(select o.order_date, o.customer_id, o.id, o.is_valid, o.after_discount, o.qty_ordered,
		   s.category, s.sku_name from order_detail o
		   left join sku_detail s on o.sku_id = s.id) as nt where sku_name like '%Huawei%'
	  and category = 'Mobiles & Tablets' and is_valid = 1 group by sku_name, order_id
order by jumlah_transaksi desc) as nt2

select sum(jumlah_transaksi) as total_transaksi_lenovo
from (select distinct id as order_id, sku_name, sum(after_discount) as jumlah_transaksi
	  from(select o.order_date, o.customer_id, o.id, o.is_valid, o.after_discount, o.qty_ordered,
		   s.category, s.sku_name from order_detail o
		   left join sku_detail s on o.sku_id = s.id) as nt where sku_name like '%Lenovo%'
	  and category = 'Mobiles & Tablets' and is_valid = 1 group by sku_name, order_id
order by jumlah_transaksi desc) as nt2

-- no 8
select ca as category, total_profit_2021, total_profit_2022, (total_profit_2022 - total_profit_2021)/total_profit_2021
as perbedaan_profit from(select category as ca, sum(profit) as total_profit_2021
from (select order_date, category, (after_discount - (cogs*qty_ordered)) as profit
from (select o.order_date, o.is_valid, o.after_discount, o.qty_ordered, s.category, s.cogs
	 from order_detail o left join sku_detail s on o.sku_id = s.id)
as nt where is_valid = 1 and extract(year from order_date) = '2021') as nt2 group by ca
order by total_profit_2021 desc) as subquery1
Join (select category, sum(profit) as total_profit_2022
from (select order_date, category, (after_discount - (cogs*qty_ordered)) as profit
from (select o.order_date, o.is_valid, o.after_discount, o.qty_ordered, s.category, s.cogs
	 from order_detail o left join sku_detail s on o.sku_id = s.id)
as nt where is_valid = 1 and extract(year from order_date) = '2022') as nt2 group by category
order by total_profit_2022 desc) as subquery2 on subquery1.ca = subquery2.category
order by perbedaan_profit desc

-- no 9
select sku_name, sum(profit) as total_profit from
(select Extract(year from order_date), sku_name, category, (after_discount - (cogs*qty_ordered)) as profit
from (select o.order_date, o.is_valid, o.after_discount, o.qty_ordered, s.category, s.cogs, s.sku_name
	  from order_detail o left join sku_detail s on o.sku_id = s.id) as nt where is_valid = 1
	  and extract(year from order_date) = '2022' and category = 'Women Fashion' order by profit desc) as nt group by sku_name
	  order by total_profit desc limit 5

-- no 10
select category, sum(jumlah) as jumlah_order_COD from(
select category, count(distinct id) as jumlah, payment_method 
from(select o.order_date, o.is_valid, o.id, o.after_discount, o.qty_ordered, s.category, s.cogs, s.sku_name,
p.payment_method from order_detail o 
left join sku_detail s on o.sku_id = s.id
left join payment_detail p on o.payment_id = p.id) as nt where is_valid = 1 and 
Extract(year from order_date) = '2022' group by category, payment_method) as nt2 where payment_method = 'cod'
group by category order by jumlah_order_COD desc

select category, sum(jumlah) as jumlah_order_payaxis from(
select category, count(distinct id) as jumlah, payment_method 
from(select o.order_date, o.is_valid, o.id, o.after_discount, o.qty_ordered, s.category, s.cogs, s.sku_name,
p.payment_method from order_detail o 
left join sku_detail s on o.sku_id = s.id
left join payment_detail p on o.payment_id = p.id) as nt where is_valid = 1 and 
Extract(year from order_date) = '2022' group by category, payment_method) as nt2 where payment_method = 'Payaxis'
group by category order by jumlah_order_payaxis desc

select category, sum(jumlah) as jumlah_order_Easypay from(
select category, count(distinct id) as jumlah, payment_method 
from(select o.order_date, o.is_valid, o.id, o.after_discount, o.qty_ordered, s.category, s.cogs, s.sku_name,
p.payment_method from order_detail o 
left join sku_detail s on o.sku_id = s.id
left join payment_detail p on o.payment_id = p.id) as nt where is_valid = 1 and 
Extract(year from order_date) = '2022' group by category, payment_method) as nt2 where payment_method = 'Easypay'
group by category order by jumlah_order_Easypay desc

select category, sum(jumlah) as jumlah_order_Customercredit from(
select category, count(distinct id) as jumlah, payment_method 
from(select o.order_date, o.is_valid, o.id, o.after_discount, o.qty_ordered, s.category, s.cogs, s.sku_name,
p.payment_method from order_detail o 
left join sku_detail s on o.sku_id = s.id
left join payment_detail p on o.payment_id = p.id) as nt where is_valid = 1 and 
Extract(year from order_date) = '2022' group by category, payment_method) as nt2 where payment_method = 'customercredit'
group by category order by jumlah_order_Customercredit desc

select category, sum(jumlah) as jumlah_order_jazzwallet from(
select category, count(distinct id) as jumlah, payment_method 
from(select o.order_date, o.is_valid, o.id, o.after_discount, o.qty_ordered, s.category, s.cogs, s.sku_name,
p.payment_method from order_detail o 
left join sku_detail s on o.sku_id = s.id
left join payment_detail p on o.payment_id = p.id) as nt where is_valid = 1 and 
Extract(year from order_date) = '2022' group by category, payment_method) as nt2 where payment_method = 'jazzwallet'
group by category order by jumlah_order_jazzwallet desc	  