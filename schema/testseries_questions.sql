CREATE TABLE testseries_questions(
	id SERIAL PRIMARY KEY,
	question_id BIGINT,
	testseries_id BIGINT,
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
