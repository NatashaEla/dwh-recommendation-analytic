-- создаем схему, если она пока не существует
CREATE SCHEMA IF NOT EXISTS stg;

-- удаляем старую таблицу, если она существует
DROP TABLE IF EXISTS stg.stg_rec_logs;

-- создаем новую таблицу stg
CREATE TABLE IF NOT EXISTS stg.stg_rec_logs (
	rec_id TEXT PRIMARY KEY NOT NULL
	, user_id TEXT NOT NULL
	, rec_type TEXT
	, placement TEXT
	, block_id TEXT
	, products JSONB
	, experiment_tags TEXT[]
	, platform TEXT
	, os_version TEXT
	, app_version TEXT
	, request_id TEXT
	, tracking_id TEXT
	, locale TEXT
	, debug_mode BOOLEAN
	, timestamp TIMESTAMPTZ NOT NULL
	, raw_json TEXT
);
