CREATE TABLE test_questions(
	id SERIAL PRIMARY KEY,
	test_id BIGINT,
	question_id BIGINT,
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE test_questions
ADD COLUMN question_text TEXT;

SELECT * FROM test_questions;