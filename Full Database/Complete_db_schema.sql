--Tables Schema

CREATE TABLE users(
	id BIGSERIAL PRIMARY KEY,
	role VARCHAR(20),
	full_name VARCHAR(200),
	dob DATE,
	gender VARCHAR(10),
	phone_number VARCHAR(15),
	email VARCHAR(50),
	status VARCHAR(10),
	subscription_status VARCHAR(10),
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE users
ALTER COLUMN role SET NOT NULL,
ALTER COLUMN full_name SET NOT NULL,
ALTER COLUMN phone_number SET NOT NULL;



CREATE TABLE exams(
	id SERIAL PRIMARY KEY,
	category_name VARCHAR(200),
	description TEXT,
	status VARCHAR(50),
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE exams
ALTER COLUMN category_name SET NOT NULL,
ALTER COLUMN description SET NOT NULL;
TRUNCATE exams RESTART IDENTITY CASCADE;


CREATE TABLE exam_medium(
	id SERIAL PRIMARY KEY,
	medium_type VARCHAR(50),
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE exam_medium
ALTER COLUMN medium_type SET NOT NULL;




CREATE TABLE subjects(
	id SERIAL PRIMARY KEY,
	name VARCHAR(200),
	exam_id INT,
	syllabus TEXT,
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE subjects
ALTER COLUMN name SET NOT NULL,
ALTER COLUMN exam_id SET NOT NULL;

ALTER TABLE subjects
ADD CONSTRAINT unique_subject_name_exam_id UNIQUE(name,exam_id);


CREATE TABLE units(
	id BIGSERIAL PRIMARY KEY,
	subject_id INT,
	unit_name VARCHAR(100),
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE units
ALTER COLUMN subject_id SET NOT NULL,
ALTER COLUMN unit_name SET NOT NULL;

ALTER TABLE units
ADD CONSTRAINT unique_unit_subject_id_unit_name UNIQUE(subject_id,unit_name);


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

CREATE OR REPLACE VIEW question_test_vw AS
	SELECT
		q.id,
		q.question_description,
		q.question_type,
		q.marks,
		q.unit_id
	FROM questions q;

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

CREATE VIEW question_option_test_vw AS
SELECT
	id,
	question_id,
	option_text
FROM question_options;

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

--TRUNCATE tests RESTART IDENTITY CASCADE;


CREATE TABLE test_questions(
	id SERIAL PRIMARY KEY,
	test_id BIGINT,
	question_id BIGINT,
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE test_questions
ADD COLUMN question_text TEXT;


--TRUNCATE test_questions RESTART IDENTITY CASCADE;

CREATE TABLE student_answers(
	id BIGSERIAL PRIMARY KEY,
	test_questions_id BIGINT,
	select_option_id BIGINT,
	is_correct BOOL,
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);

--TRUNCATE student_answers RESTART IDENTITY CASCADE;


CREATE TABLE test_results(
	id BIGSERIAL PRIMARY KEY,
	test_id BIGINT,
	total_marks NUMERIC(5,2),
	obtained_marks NUMERIC(5,2),
	status VARCHAR(10),
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
--TRUNCATE test_results RESTART IDENTITY CASCADE;

CREATE TABLE user_question_history(
	id BIGSERIAL PRIMARY KEY,
	user_id BIGINT,
	question_id BIGINT,
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE user_question_history
ADD CONSTRAINT unique_history_user_id_question_id UNIQUE(user_id,question_id);

--TRUNCATE user_question_history RESTART IDENTITY CASCADE;

CREATE TABLE testseries(
	id SERIAL PRIMARY KEY,
	unit_id BIGINT,
	subject_id BIGINT,
	exam_id BIGINT,
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);

CREATE TABLE testseries_questions(
	id SERIAL PRIMARY KEY,
	question_id BIGINT,
	testseries_id BIGINT,
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);


------------------------------------------------------------------------------------------
--Relationships
ALTER TABLE subjects
ADD CONSTRAINT subject_exam_id_fkey FOREIGN KEY (exam_id)
REFERENCES exams(id);

ALTER TABLE units
ADD CONSTRAINT unit_subject_id FOREIGN KEY (subject_id)
REFERENCES subjects(id);

ALTER TABLE questions
ADD CONSTRAINT question_unit_id_fkey FOREIGN KEY (unit_id)
REFERENCES units(id);

ALTER TABLE question_options
ADD CONSTRAINT question_option_question_id FOREIGN KEY (question_id)
REFERENCES questions(id);

ALTER TABLE tests
ADD CONSTRAINT test_user_id_fkey FOREIGN KEY (user_id)
REFERENCES users(id);

ALTER TABLE tests
ADD CONSTRAINT test_exam_id_fkey FOREIGN KEY (exam_id)
REFERENCES exams(id);

ALTER TABLE tests
ADD CONSTRAINT test_subject_id_fkey FOREIGN KEY (subject_id)
REFERENCES subjects(id);

ALTER TABLE tests
ADD CONSTRAINT test_unit_id_fkey FOREIGN KEY (unit_id)
REFERENCES units(id);

ALTER TABLE test_questions
ADD CONSTRAINT test_question_test_id_fkey FOREIGN KEY (test_id)
REFERENCES tests(id);

ALTER TABLE test_questions
ADD CONSTRAINT test_question_question_id_fkey FOREIGN KEY (question_id)
REFERENCES questions(id);

ALTER TABLE student_answers
ADD CONSTRAINT student_answer_test_question_id_fkey FOREIGN KEY (test_questions_id)
REFERENCES test_questions(id);

ALTER TABLE student_answers
ADD CONSTRAINT student_answer_select_option_id_fkey FOREIGN KEY (select_option_id)
REFERENCES question_options(id);

ALTER TABLE test_results
ADD CONSTRAINT test_result_test_id_fkey FOREIGN KEY (test_id)
REFERENCES tests(id);

ALTER TABLE user_question_history
ADD CONSTRAINT user_question_history_user_id_fkey FOREIGN KEY (user_id)
REFERENCES users(id);

ALTER TABLE user_question_history
ADD CONSTRAINT user_question_history_question_id_fkey FOREIGN KEY (question_id)
REFERENCES questions(id);

ALTER TABLE questions
ADD CONSTRAINT question_subject_id_fkey FOREIGN KEY (subject_id)
REFERENCES subjects(id);

ALTER TABLE questions
ADD CONSTRAINT question_exam_id_fkey FOREIGN KEY (exam_id)
REFERENCES exams(id);

ALTER TABLE questions
ADD CONSTRAINT question_medium_id_fkey FOREIGN KEY (medium_id)
REFERENCES exam_medium(id);

--------------------------------------------------------------------------------------------
--CHECK constraints
ALTER TABLE exam_medium
ADD CONSTRAINT check_medium_type CHECK(medium_type IN ('ENGLISH','HINDI','BENGALI','TAMIL'));

ALTER TABLE users
ADD CONSTRAINT check_user_role CHECK(role IN ('S','T'));

ALTER TABLE users
ADD CONSTRAINT check_user_dob CHECK(dob < NOW());

ALTER TABLE users
ADD CONSTRAINT check_user_gender CHECK(gender IN ('M','F','T'));

ALTER TABLE exams
ADD CONSTRAINT exam_status CHECK(status IN ('ACTIVE','INACTIVE'));

ALTER TABLE questions
ADD CONSTRAINT check_question_difficulty_level CHECK(difficulty_level IN ('EASY','MEDIUM','HARD'));

ALTER TABLE tests
ADD CONSTRAINT test_status CHECK(status IN ('STARTED','COMPLETED','PENDING'));

----------------------------------------------------------------------------------------------
--DEFAULT values
ALTER TABLE exams
ALTER COLUMN status SET DEFAULT 'ACTIVE';

------------------------------------------------------------------------------------------------
--UNIQUE constraints
ALTER TABLE question_options
ADD CONSTRAINT unique_question_options UNIQUE (question_id, option_text);

ALTER TABLE units
ADD CONSTRAINT unique_subject_id_unit_number UNIQUE(subject_id, unit_name);

ALTER TABLE student_answers
ADD CONSTRAINT unique_answer_select_test_question_option UNIQUE(test_questions_id,select_option_id);

------------------------------------------------------------------------------------------------

--INDEXING
CREATE INDEX idx_test_questions_test_id ON test_questions(test_id);
CREATE INDEX idx_student_answers_tq_id ON student_answers(test_questions_id);
CREATE INDEX idx_tests_user_exam_created ON tests(user_id, exam_id, created_at DESC);
CREATE INDEX idx_questions_unit_id ON questions(unit_id);
CREATE INDEX idx_units_subject_id ON units(subject_id);
CREATE INDEX idx_subjects_exam_id ON subjects(exam_id);
CREATE INDEX idx_user_question_history_user_question ON user_question_history(user_id, question_id);

CREATE INDEX idx_tests_active ON tests(user_id, exam_id, status, created_at DESC) WHERE status = 'STARTED';
CREATE INDEX idx_question_options_question_id ON question_options(question_id);
CREATE INDEX idx_student_answers_option_id ON student_answers(select_option_id);
CREATE INDEX idx_test_results_test_id ON test_results(test_id);

CREATE INDEX idx_test_questions_cover ON test_questions(test_id, question_id);
CREATE INDEX idx_test_user_id ON tests(user_id);
CREATE INDEX idx_test_exam_id ON tests(exam_id);

CREATE UNIQUE INDEX unique_test_user_started ON tests(user_id) WHERE status = 'STARTED';

CREATE INDEX idx_questions_id_unit_id ON questions(id,unit_id);
CREATE INDEX idx_question_history_user_id_question_id ON user_question_history(user_id, question_id);

CREATE INDEX idx_student_answers_full ON student_answers(test_questions_id, select_option_id);
--CREATE INDEX idx_tests_user_status ON tests(user_id, status, created_at DESC);

----------------------------------------------------------------------------------------------------

--User Management

CREATE ROLE student;
GRANT USAGE ON SCHEMA public TO student;
GRANT SELECT,INSERT,UPDATE ON TABLE tests TO student;
GRANT USAGE, SELECT ON SEQUENCE tests_id_seq TO student;
GRANT SELECT, INSERT ON TABLE test_questions TO student;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO student;
GRANT SELECT ON TABLE exams TO student;
GRANT SELECT ON TABLE subjects TO student;
GRANT SELECT ON TABLE units TO student;
GRANT SELECT ON TABLE question_test_vw TO student;
GRANT SELECT,INSERT ON TABLE user_question_history TO student;
GRANT SELECT, INSERT ON TABLE student_answers TO student;
GRANT SELECT ON TABLE question_option_test_vw TO student;
GRANT SELECT, INSERT, UPDATE ON TABLE test_results TO student;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE users TO student;
GRANT SELECT ON TABLE exam_medium TO student;
CREATE USER yash WITH PASSWORD 'yash123';
GRANT student TO yash;
GRANT student TO ankit;
ALTER ROLE yash INHERIT;


ALTER TABLE tests ENABLE ROW LEVEL SECURITY;
ALTER TABLE tests FORCE ROW LEVEL SECURITY;
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE users FORCE ROW LEVEL SECURITY;
ALTER TABLE test_questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE test_questions FORCE ROW LEVEL SECURITY;
ALTER TABLE student_answers ENABLE ROW LEVEL SECURITY;
ALTER TABLE student_answers FORCE ROW LEVEL SECURITY;
ALTER TABLE test_results ENABLE ROW LEVEL SECURITY;
ALTER TABLE test_results FORCE ROW LEVEL SECURITY;
ALTER TABLE user_question_history ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_question_history FORCE ROW LEVEL SECURITY;

CREATE POLICY test_select_policy
ON tests
FOR SELECT 
TO student
USING(
	user_id = CURRENT_SETTING('app.user_id')::INT
);

CREATE POLICY test_insert_policy
ON tests
FOR INSERT
WITH CHECK(
	user_id = CURRENT_SETTING('app.user_id')::INT
);

CREATE POLICY user_full_policy
ON users
FOR ALL
TO student
USING(
	id = CURRENT_SETTING('app.user_id')::INT
)
WITH CHECK(
	id = CURRENT_SETTING('app.user_id')::INT
);

CREATE POLICY test_question_insert_policy
ON test_questions
FOR INSERT
TO student
WITH CHECK(
	test_id IN (
		SELECT id FROM tests
		WHERE user_id = CURRENT_SETTING('app.user_id')::INT
	)
);

CREATE POLICY test_question_select_policy
ON test_questions
FOR SELECT
TO student
USING(
	test_id IN (
		SELECT id FROM tests
		WHERE user_id = CURRENT_SETTING('app.user_id')::INT
	)
);

CREATE POLICY student_answer_full_policy
ON student_answers
FOR ALL
TO student
USING(
	test_questions_id IN (
		SELECT tq.id 
		FROM test_questions tq
		JOIN tests t ON t.id = tq.test_id
		WHERE t.user_id = CURRENT_SETTING('app.user_id')::INT
	)
)
WITH CHECK(
	test_questions_id IN (
		SELECT tq.id
		FROM test_questions tq
		JOIN tests t ON t.id = tq.test_id
		WHERE t.user_id = CURRENT_SETTING('app.user_id')::INT
	)
);

CREATE POLICY test_result_select_policy
ON test_results
FOR SELECT
TO student
USING(
	test_id IN (
		SELECT id
		FROM tests
		WHERE user_id = CURRENT_SETTING('app.user_id')::INT
	)
);

CREATE POLICY test_result_insert_policy
ON test_results
FOR INSERT
TO student
WITH CHECK(
	test_id IN (
		SELECT id
		FROM tests
		WHERE user_id = CURRENT_SETTING('app.user_id')::INT
	)
);

CREATE POLICY history_select_policy
ON user_question_history
FOR SELECT
TO student
USING(
	user_id = CURRENT_SETTING('app.user_id')::INT
);

CREATE POLICY history_insert_policy
ON user_question_history
FOR INSERT
TO student
WITH CHECK(
	user_id = CURRENT_SETTING('app.user_id')::INT
);

CREATE POLICY user_all_policy
ON users
FOR ALL
TO student
USING(
	id = current_setting('app.user_id')::INT
)
WITH CHECK(
	id = current_setting('app.user_id')::INT
);

SELECT * FROM tests;
SELECT * FROM student_answers;
SELECT * FROM test_results;
SELECT * FROM question_options where question_id in (742,568,694,948,893,151,540,610,473,829) and is_correct = 'true';
order by question_id;