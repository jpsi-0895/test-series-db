CREATE TABLE exam_medium(
	id SERIAL PRIMARY KEY,
	medium_type VARCHAR(50),
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE exam_medium
ALTER COLUMN medium_type SET NOT NULL;

SELECT * FROM exam_medium;