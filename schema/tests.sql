CREATE TABLE tests(
	id BIGSERIAL PRIMARY KEY,
	user_id BIGINT,
	exam_id BIGINT,
	subject_id BIGINT,
	unit_id BIGINT,
	total_marks NUMERIC(5,2),
	duration_in_minutes INT,
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE tests
ADD COLUMN status VARCHAR(20),
ADD COLUMN start_time TIMESTAMP(0) DEFAULT NOW(),
ADD COLUMN end_time TIMESTAMP(0);

ALTER TABLE tests
ADD CONSTRAINT test_user_id_created_at UNIQUE(user_id,created_at,status);

SELECT * FROM tests;