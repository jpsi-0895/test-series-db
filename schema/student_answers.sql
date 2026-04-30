CREATE TABLE student_answers(
	id BIGSERIAL PRIMARY KEY,
	test_questions_id BIGINT,
	select_option_id BIGINT,
	is_correct BOOL,
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);

SELECT * FROM student_answers;