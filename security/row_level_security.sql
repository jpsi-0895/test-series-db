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

CREATE POLICY test_update_policy
ON tests
FOR UPDATE
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

CREATE POLICY user_all_policy
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

CREATE POLICY test_result_update_policy
ON test_results
FOR UPDATE
TO student
USING(
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