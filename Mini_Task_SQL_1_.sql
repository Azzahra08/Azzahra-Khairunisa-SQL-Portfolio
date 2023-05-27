-- Membuat tabel
create table tokopaedi(
	row_id Integer,
	order_id Varchar,
	order_date Date,
	ship_date Date,
	ship_mode Varchar,
	customer_id Varchar,
	customer_name Varchar,
	segment Varchar,
	country Varchar,
	city Varchar,
	state_ Varchar,
	postal_code Integer,
	region Varchar,
	product_id Varchar,
	category Varchar,
	subcategory Varchar,
	product_name Varchar,
	sales Decimal,
	quantity Integer,
	discount Integer,
	profit Money)

-- Menghapus tabel
drop table tokopaedi

-- Memasukan nilai kedalam tabel
insert into
	tokopaedi
values
(1234, 'OR28919', '08/07/2023', '09/07/2023', 'Ekspress', 'Kayl408', 'Kayla', 
'Rumah', 'Indonesia', 'Jakarta', 'DKI Jakarta', 12620, 'Jakarta Selatan', 'EF24567', 
'Pakaian', 'Onesie', 'Onesie Panda', '20.00', 2, 15, '15.000'),
(3145, 'OR34567', '02/08/2023', '09/08/2023', 'Reguler', 'Dims045', 'Dimas', 
'Rumah', 'Indonesia', 'Jakarta', 'DKI Jakarta', 13440, 'Jakarta Timur', 'GH14869', 
'Sepatu', 'Sneakers', 'X_PLRBOOST SHOES', '210.00', 1, 20, '30.000'),
(5147, 'OR49872', '01/12/2023', '05/12/2023', 'Reguler', 'Aleners32', 'Alea', 
'Rumah', 'Indonesia', 'Jakarta', 'DKI Jakarta', 13450, 'Jakarta Timur', 'ZN15679', 
'Make Up', 'Blush On', 'Make Over Blush On Single', '10.00', 1, 5, '25.000')

-- Menampilkan tabel
Select row_id, order_id, to_char(order_date, 'dd-mm-yyyy') As order_date, 
to_char(ship_date, 'dd-mm-yyyy') As ship_date, ship_mode, customer_id, customer_name, 
segment, country, city, state_, postal_code, region, product_id, category, subcategory,
product_name, Concat('$', sales) As sales, quantity, Concat(discount, '%') As discount, 
profit from tokopaedi


