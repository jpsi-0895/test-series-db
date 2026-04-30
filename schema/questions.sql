CREATE TABLE questions(
	id BIGSERIAL PRIMARY KEY,
	question_description TEXT,
	question_type VARCHAR(20),
	unit_id BIGINT,
	difficulty_level VARCHAR(10),
	status VARCHAR(10),
	marks NUMERIC(5,2),
	explanation TEXT,
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE questions
ALTER COLUMN question_description SET NOT NULL,
ALTER COLUMN unit_id SET NOT NULL;

ALTER TABLE questions
ADD COLUMN subject_id BIGINT,
ADD COLUMN exam_id BIGINT,
ADD COLUMN medium_id INT;

ALTER TABLE questions
ADD COLUMN is_deleted BOOL DEFAULT FALSE;

SELECT * FROM questions;