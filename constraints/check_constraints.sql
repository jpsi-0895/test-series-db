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

ALTER TABLE users
ADD CONSTRAINT user_phone_number CHECK(phone_number BETWEEN 1000000000 AND 9999999999);

ALTER TABLE users
ADD CONSTRAINT users_email_check
CHECK (email ~ '^[a-z]+[0-9]+@gmail\.com$' AND email ~ '[a-z]' AND email ~ '[0-9]');

ALTER TABLE users
ADD CONSTRAINT user_full_name_check
CHECK (full_name  ~ '^[A-Za-z0-9 ]{2,}$');

ALTER TABLE test_results
ADD CONSTRAINT test_result_status_check
CHECK (status IN ('P','F'));