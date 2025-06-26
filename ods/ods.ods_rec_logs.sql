-- создаем схему, если она пока не существует
CREATE SCHEMA IF NOT EXISTS ods;

-- удаляем старую таблицу, если она существует
DROP TABLE IF EXISTS ods.ods_rec_logs;

-- создаем новую таблицу ods
CREATE TABLE IF NOT EXISTS ods.ods_rec_logs (
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL
	, rec_id TEXT NOT NULL
	, user_id TEXT NOT NULL
	, rec_time TIMESTAMPTZ NOT NULL
	, rec_type TEXT
	, placement_rec_location TEXT
	, block_id TEXT
	, request_id TEXT
	, product_id TEXT NOT NULL
	, position_on_rec SMALLINT
	, model_score NUMERIC(6,4)
	, is_available BOOLEAN
	, product_tags TEXT[]
	, image_product_url TEXT
	, experiment_tags TEXT[]
	, platform_device TEXT
	, os_version_device TEXT
	, app_version TEXT
	, locale_zone TEXT
	, debug_mode BOOLEAN
	, load_ods TIMESTAMPTZ DEFAULT NOW()
);
-- загружаем данные, раскрыв массив
INSERT INTO ods.ods_rec_logs (
	rec_id, rec_time, rec_type, placement_rec_location, block_id, reqest_id, product_id, position_on_rec,
	model_score, is_availebale, product_tags, image_producte_url, experiment_tags, platform_device, 
	os_version_device, app_version, locale_zone, debug_mode, load_ods
)
SELECT 
	r.rec_id
	, r.user_id AS user_id
	, r.event_time AS rec_time
	, r.rec_type AS rec_type
	, r.placement AS placement_rec_location
	, r.block_id AS block_id
	, r.request_id AS request_id
	, p.product_id AS product_id
	, p.position AS position_on_rec
	, p.score AS model_score
	, p.is_available AS is_available
	, p.tags AS product_tags
	, p.image_url AS image_product_url
	, r.experiment_tags AS experiment_tags
	, r.platform AS platform_device
	, r.os_version AS os_version_device
	, r.app_version AS app_version
	, r.locale AS locale_zone
	, r.debug_mode AS debug_mode
FROM stg.stg_rec_logs r,
	jsonb_to_recordset(r.products) AS p(
		product_id TEXT
		, position SMALLINT
		, score NUMERIC(6,4)
		, image_url TEXT
		, is_availeble BOOLEAN
		, tags TEXT[]
)
);
