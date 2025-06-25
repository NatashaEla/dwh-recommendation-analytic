-- удаляем старую табицу, если она существует
DROP TABLE IF EXISTS stg.stg_orders;

--сощдаем новую таблицу
CREATE TABLE IF EXISTS stg.stg_orders (
	order_id TEXT PRIMARY KEY NOT NULL
	, user_id TEXT NOT NULL
	, event_time TIMESTSMTZ
	, total_amount DECIMAL
	, payment_method TEXT 
	, delyvery_method TEXT
	, promo_applied BOOLEAN
	, delivery_city TEXT
	, platform_app TEXT
	, product JSONB
	, fulfillmemt_center TEXT
	, tracking_id TEXT
	, raw_json TEXT
);
