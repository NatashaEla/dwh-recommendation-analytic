-- удаляем старую таблицу, если она существует
DROP TABLE IF EXISTS stg.stg_products;

-- сощдаем новую таблицу 
CREATE TABLE IF NOT EXISTS stg.stg_products (
	product_id TEXT PRIMARY KEY NOT NULL
	, title TEXT
	, brand TEXT
	, category TEXT
	, subcategory TEXT
	, price DECIMAL
	, old_price DECIMAL
	, currency TEXT
	, rating DECIMAL
	, reviews_count INTEGER
	, available BOOLEAN
	, stock_qty INTEGER
	, is_promo BOOLEAN
	, warranty_months INTEGER
	, created_at TIMESTAPTZ
	, country_of_origin TEXT
	, vendor_code TEXT
	, raw_json TEXT
);
