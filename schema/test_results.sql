CREATE TABLE test_results(
	id BIGSERIAL PRIMARY KEY,
	test_id BIGINT,
	total_marks NUMERIC(5,2),
	obtained_marks NUMERIC(5,2),
	status VARCHAR(10),
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);

ALTER TABLE test_results
ADD COLUMN testseries_id BIGINT;