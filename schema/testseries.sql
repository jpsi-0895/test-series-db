CREATE TABLE testseries(
	id SERIAL PRIMARY KEY,
	unit_id BIGINT,
	subject_id BIGINT,
	exam_id BIGINT,
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);

ALTER TABLE testseries
ADD COLUMN start_date_time TIMESTAMPTZ,
ADD COLUMN ts_title VARCHAR(50),
ADD COLUMN sub_title VARCHAR(50),
ADD COLUMN duration_in_min INT,
ADD COLUMN total_questions INT;

ALTER TABLE testseries
ADD COLUMN status VARCHAR(20);