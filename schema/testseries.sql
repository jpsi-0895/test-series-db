CREATE TABLE testseries(
	id SERIAL PRIMARY KEY,
	unit_id BIGINT,
	subject_id BIGINT,
	exam_id BIGINT,
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
