CREATE TABLE question_options(
	id BIGSERIAL PRIMARY KEY,
	question_id BIGINT,
	option_text TEXT,
	is_correct BOOL,
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE question_options
ALTER COLUMN question_id SET NOT NULL,
ALTER COLUMN option_text SET NOT NULL,
ALTER COLUMN is_correct SET NOT NULL;

SELECT * FROM question_options;