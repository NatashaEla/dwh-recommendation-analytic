--удаляем таблицу если есть
DROP TABLE IF EXISTE ods.ods_products;

--создаем новую таблицу
CREATE TABLE IF NOT EXISTS ods_ods_products (
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
	, product_id TEXT
	, title TEXT
	, brand TEXT
	, category TEXT
	, subcategory TEXT
	, price DECIMAL(10,2)
	, old_price DECIMAL(10,2)
	, currency  VARCHAR(4)
	, rating DECIMAL(3,2)
	, reviews_count INTEGER
	, is_available BOOLEAN
	, is_promo BOOLEAN
	, created_at TIMESTAMPTZ
	, load_ods TIMESTAMPTZ DEFAULT NOW()
);
--вставляем данные в таблицу
INSERT INTO ods_ods_products (
	product_id, title, brand, category, subcategory, price, old_price,
	currency, rating, reviews_count, is_available, is_promo, created_at
)
SELECT
	product_id 
	, title 
	, brand 
	, category 
	, subcategory 
	, price 
	, old_price 
	, currency
	, rating 
	, reviews_count 
	, available AS is_available
	, is_promo 
	, created_at 
FROM stg.stg_products
;
