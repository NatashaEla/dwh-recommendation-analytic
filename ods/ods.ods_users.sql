-- удаляем таблицу, если она существует
DROP TABLE IF EXISTS ods.ods_users;

-- создаем новую табицу
CREATE TABLE IF NOT EXISTS ods.ods_users (
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL
	, user_id TEXT
	, gender VARCHAR(10)
	, age_group VARCHAR(10)
	, country TEXT
	, region_country TEXT
	, language_user TEXT
	, registration_date DATE
	, customer_status TEXT
	, total_orders_count INTEGER
	, total_spend_usd DECIMAL(12,2)
	, avg_order_value_usd DECIMAL(12,2)
	, first_purchase_date DATE
	, last_purchase_date DATE
	, load_ods TIMESTAMPTZ DEFAULT NOW()
);
-- загружаем данные (без массивов и json)
INSERT INTO ods.ods_users (
	user_id, gender, age_group, country, region_country, language_user, registration_date, customer_status,
	total_orders_count, total_spend_usd, avg_order_value_usd, first_purchase_date, last_purchase_date)
SELECT 
	s.user_id AS user_id
	, s.gender AS gender
	, s.age_group AS age_group
	, s.country AS country
	, s.region AS region_country
	, s.language AS language_user
	, s.customer_status AS customer_status
	, s.total_orders_count AS total_orders_count
	, s.total_spend_usd AS total_spend_usd 
	, s.average_order_value_usd AS avg_order_value_usd
	, s.first_purchase_date AS first_purchase_date
	, s.last_purchase_date AS last_purchase_date
FROM stg.stg_users s
;
