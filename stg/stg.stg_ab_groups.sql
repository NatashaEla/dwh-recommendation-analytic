-- удаляем старую таблицу, если она существует
DROP TABLE IF EXISTS stg.stg_ab_groups;

-- создаем новую таблтцу 
CREATE TABLE IF NOT EXISTS stg.stg_ab_group (
	ab_groupe TEXT PRIMARY KEY NOT NULL
	, experiment_id TEXT
	, user_id TEXT NOT NULL
	, assigned_at TIMESTAMPTZ
	, experimetn_tags TEXT []
	, allocation_method TEXT
	, cohort TEXT
	, raw_json TEXT
);
