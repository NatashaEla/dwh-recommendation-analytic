-- удаляет старую таблицу, если она существует
DROP TABLE IF EXISTS stg.stg_clicks_web;

-- создаем новую таблицу
CREAT TABLE IF NOT EXISTS stg.stg_clicks_web (
	click_id TEXT PRIMARY KEY NOT NULL
	, rec_id TEXT NOT NULL
	, user_id TEXT NOT NULL
	, product_id TEXT
	, timestamp TIMESTAMPTZ
	, position INTEGER
	, source_page TEXT
	, entry_point TEXT
	, platform TEXT
	, referrer TEXT
	, tracking_id TEXT
	, interaction_type TEXT
	, network_type TEXT
	, latency_ms INTEGER
	, raw_json TEXT
);
