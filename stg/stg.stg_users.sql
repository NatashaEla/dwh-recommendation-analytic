-- удаляем страую таблицу, если она существует
DROP TABLE IF EXISTS stg.stg_users;

-- создает новую таблицу stg
CREATE TABLE IF NOT EXISTS stg.stg_users (
	user_id TEXT PRIMARY KEY NOT NULL
	, external_crm_id TEXT
	, gender TEXT
	, age_group TEXT
	, region TEXT
	, country TEXT
	, language TEXT
	, registration_date DATE
	, last_login_date DATE
	, customer_status TEXT
	, loyaltu_prodram_status TEXT
	, customer_segment TEXT
	, opt_in_email_marketing BOOLEAN
	, opt_in_sms_marketing BOOLEAN
	, newsletter_subscription_status TEXT
	, total_orders_count INTEGER
	, total_spend_usd DECIMAL
	, average_order_value_usd DECIMAL
	, first_purchase_date DATE
	, last_purchase_date DATE
	, referrer_source TEXT
	, last_viewed_category TEXT
	, favorite_brand TEXT
	, preferred_payment_type TEXT
	, preferred_device_type TEXT
	, raw_json TEXT
);
