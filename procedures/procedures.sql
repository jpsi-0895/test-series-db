CREATE OR REPLACE PROCEDURE auto_submit_test(
	s_exam_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE
	v_duration INT;
	v_test_id INT;
	v_user_id INT;
BEGIN
	v_user_id := current_setting('app.user_id')::INT;

	v_duration := CASE 
                    WHEN s_exam_id = 1 THEN 180 
                    ELSE 120 
                  END;

	INSERT INTO tests (user_id, exam_id, total_marks, duration_in_minutes,status,end_time) VALUES
	(v_user_id,s_exam_id,CASE WHEN s_exam_id = 1 THEN 100 ELSE 70 END, CASE WHEN s_exam_id = 1 THEN 180 ELSE 120 END,'STARTED',
	NOW() + (v_duration * INTERVAL '1 minute'))
	RETURNING id INTO v_test_id;

	INSERT INTO test_questions(test_id,question_id,question_text)
	SELECT v_test_id,q.id,q.question_description
	FROM exams e JOIN subjects s ON e.id=s.exam_id
	JOIN units u ON u.subject_id = s.id 
	JOIN question_test_vw q ON q.unit_id = u.id
	JOIN tests t ON t.exam_id = e.id
	WHERE e.id = s_exam_id
	AND NOT EXISTS (
		SELECT 1 
		FROM user_question_history uqh
		WHERE uqh.question_id = q.id
		AND uqh.user_id = v_user_id
	)
	ORDER BY random()
	LIMIT 10;
	
END;
$$;
SET app.user_id = 2;
CALL auto_submit_test(1);


SELECT 
	tq.id,
	q.question_description,
	json_agg(
		json_build_object(
			'option_id', qo.id,
			'option_text', qo.option_text
		)
	) AS options
FROM tests t
JOIN test_questions tq ON tq.test_id = t.id
JOIN question_test_vw q ON tq.question_id = q.id
JOIN question_option_test_vw qo ON q.id = qo.question_id
WHERE t.user_id = 2
AND t.exam_id = 1
AND t.status = 'STARTED'
GROUP BY tq.id, q.question_description;

CREATE OR REPLACE PROCEDURE auto_select_answer(
	p_exam_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO student_answers(test_questions_id, select_option_id)
	SELECT 
		tq.id,
		qo.id
	FROM tests t
	JOIN test_questions tq ON tq.test_id = t.id
	JOIN LATERAL (
		SELECT id
		FROM question_option_test_vw qo
		WHERE qo.question_id = tq.question_id
		OFFSET floor(random()*4)
		LIMIT 1
	) qo ON TRUE
	WHERE t.user_id = current_setting('app.user_id')::INT
	AND t.exam_id = p_exam_id
	AND t.status = 'STARTED';
END;
$$;
CALL auto_select_answer(1);

UPDATE student_answers sa
SET is_correct = qo.is_correct
FROM question_options qo, test_questions tq
WHERE sa.select_option_id = qo.id
AND sa.test_questions_id = tq.id
AND qo.question_id = tq.question_id
AND sa.is_correct IS NULL;


CREATE OR REPLACE PROCEDURE test_result_update(
	p_exam_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE
	p_user_id INT;
	v_test_id INT;
BEGIN
	p_user_id := current_setting('app.user_id')::INT;

	SELECT id INTO v_test_id FROM tests WHERE user_id = p_user_id AND exam_id = p_exam_id AND status = 'STARTED' ORDER BY created_at DESC LIMIT 1;
	INSERT INTO test_results(test_id) VALUES
	(v_test_id);

	WITH marks AS (
		SELECT
			tq.test_id,
			SUM(q.marks) AS total_marks,
			SUM(
				CASE
					WHEN sa.is_correct = TRUE THEN q.marks
					WHEN sa.is_correct IS NULL THEN 0
					ELSE -(q.marks/3)
				END 
			) AS obtained_marks
		FROM test_questions tq
		JOIN tests t ON tq.test_id = t.id
		JOIN student_answers sa ON sa.test_questions_id = tq.id
		JOIN question_test_vw q ON q.id = tq.question_id
		WHERE tq.test_id = v_test_id
		GROUP BY tq.test_id
	),
	test_status_update AS (
		UPDATE tests t
		SET status = 'COMPLETED'
		FROM marks m
		WHERE t.id = v_test_id
		RETURNING t.id
	),
	question_history AS (
		INSERT INTO user_question_history(user_id,question_id)
		SELECT t.user_id, tq.question_id
		FROM tests t JOIN test_questions tq
		ON t.id = tq.test_id
		ON CONFLICT (user_id, question_id) DO NOTHING
	)
	UPDATE test_results tr
		SET total_marks = m.total_marks,
			obtained_marks = m.obtained_marks
	FROM marks m
	WHERE tr.id = (SELECT id 
					FROM test_results 
					WHERE test_id = m.test_id
					ORDER BY created_at DESC
					LIMIT 1
					);
END;
$$;
CALL test_result_update(1);