INSERT INTO users(role,full_name,dob,gender,phone_number,email) VALUES
('S','Yash Dhankar','2003-12-15','M','9784294429','yashdhank123@gmail.com');
INSERT INTO users(role,full_name,dob,gender,phone_number,email) VALUES
('S','Ankit','2003-12-15','M','7984294429','ankit123@gmail.com');
SELECT * FROM users;
--------------------------------------------------------------------------------

INSERT INTO subjects (name, exam_id, syllabus) VALUES
('Quantitative Aptitude', 1, 'Number system, algebra, geometry, trigonometry, mensuration, data interpretation'),
('General Intelligence & Reasoning', 1, 'Analogies, coding-decoding, series, blood relations, puzzles, syllogism'),
('English Comprehension', 1, 'Grammar, vocabulary, comprehension, sentence correction, error spotting'),
('General Awareness', 1, 'History, geography, polity, economics, science, current affairs'),
('Quantitative Aptitude', 2, 'Basic arithmetic, percentages, profit & loss, time & work, simple interest'),
('General Intelligence', 2, 'Classification, analogy, coding-decoding, matrix, pattern completion'),
('English Language', 2, 'Vocabulary, grammar basics, sentence structure, comprehension'),
('General Awareness', 2, 'General knowledge, current affairs, static GK, basic science'),
('Computer Knowledge', 1, 'Basics of computers, MS Office, internet, cybersecurity fundamentals'),
('Data Interpretation', 1, 'Charts, graphs, tables, caselets, data sufficiency');
SELECT * FROM subjects;

--------------------------------------------------------------------------------

INSERT INTO units (subject_id, unit_name) VALUES
-- Quantitative Aptitude (CGL)
(1, 'Number System'),(1, 'Algebra'),(1, 'Geometry'),(1, 'Trigonometry'),
-- Reasoning (CGL)
(2, 'Analogies'),(2, 'Coding-Decoding'),(2, 'Series'),(2, 'Blood Relations'),
-- English (CGL)
(3, 'Grammar'),(3, 'Vocabulary'),(3, 'Reading Comprehension'),
-- General Awareness (CGL)
(4, 'History'),(4, 'Geography'),(4, 'Polity'),(4, 'Economics'),
-- Quantitative Aptitude (CHSL)
(5, 'Percentages'),(5, 'Profit and Loss'),(5, 'Time and Work'),
-- Reasoning (CHSL)
(6, 'Classification'),(6, 'Analogy'),(6, 'Pattern Completion'),
-- English (CHSL)
(7, 'Basic Grammar'),(7, 'Sentence Structure'),
-- General Awareness (CHSL)
(8, 'Current Affairs'),(8, 'Static GK'),
-- Computer Knowledge
(9, 'Basics of Computers'),(9, 'MS Office'),
-- Data Interpretation
(10, 'Tables'),(10, 'Bar Graphs');
SELECT * FROM units;
SELECT s.name, s.syllabus, u.unit_name FROM exams e JOIN subjects s ON e.id = s.exam_id JOIN units u ON s.id = u.subject_id WHERE category_name = 'SSC CHSL';

--------------------------------------------------------------------------------------

INSERT INTO questions (question_description, question_type, unit_id, difficulty_level, status, explanation) VALUES
('What is the HCF of 36 and 48?', 'MCQ', 1, 'EASY', 'Active', 'HCF of 36 and 48 is 12'),
('Solve: 2x + 5 = 15', 'MCQ', 2, 'EASY', 'Active', '2x = 10 so x = 5'),
('Find the area of a circle with radius 7 cm', 'MCQ', 3, 'MEDIUM', 'Active', 'Area = pi*r^2 = 49pi'),
('sin 30° value is?', 'MCQ', 4, 'EASY', 'Active', 'sin 30° = 1/2'),
('Find the missing number: 2, 6, 12, 20, ?', 'MCQ', 5, 'MEDIUM', 'Active', 'Pattern n(n+1), next is 30'),
('If A=1, B=2, what is CAT?', 'MCQ', 6, 'EASY', 'Active', 'C=3, A=1, T=20 so sum = 24'),
('Complete the series: 3, 9, 27, ?', 'MCQ', 7, 'EASY', 'Active', 'Multiply by 3, next is 81'),
('Pointing to a man, Ravi said he is my uncle’s son. Who is he?', 'MCQ', 8, 'MEDIUM', 'Active', 'He is Ravi’s cousin'),
('Identify the error: She go to school daily', 'MCQ', 9, 'EASY', 'Active', 'go should be goes'),
('Synonym of "Happy"?', 'MCQ', 10, 'EASY', 'Active', 'Correct synonym is joyful'),
('Read passage and answer question', 'MCQ', 11, 'MEDIUM', 'Active', 'Based on passage'),
('Who was the first Prime Minister of India?', 'MCQ', 12, 'EASY', 'Active', 'Jawaharlal Nehru'),
('Capital of Rajasthan?', 'MCQ', 13, 'EASY', 'Active', 'Jaipur'),
('Indian Constitution came into effect in?', 'MCQ', 14, 'EASY', 'Active', '26 January 1950'),
('What is GDP?', 'MCQ', 15, 'MEDIUM', 'Active', 'Gross Domestic Product'),
('Find profit percentage if CP=100, SP=120', 'MCQ', 16, 'EASY', 'Active', 'Profit = 20%'),
('Time taken to complete work if 5 men do it in 10 days?', 'MCQ', 17, 'MEDIUM', 'Active', 'Work formula applied'),
('Find odd one out: Apple, Banana, Carrot, Mango', 'MCQ', 18, 'EASY', 'Active', 'Carrot is vegetable'),
('Basic sentence structure consists of?', 'MCQ', 19, 'EASY', 'Active', 'Subject + Verb + Object'),
('What is MS Word?', 'MCQ', 20, 'EASY', 'Active', 'Word processing software');

SELECT * FROM questions;
SELECT q.* FROM questions q JOIN units u ON q.unit_id = u.id WHERE u.subject_id = 1;
SELECT q.question_description, o.option_text, o.is_correct FROM questions q JOIN question_options o ON q.id = o.question_id;

SELECT e.category_name,s.name,u.unit_name,q.question_description,q.id 
FROM exams e JOIN subjects s ON e.id = s.exam_id
JOIN units u ON s.id = u.subject_id
JOIN questions q ON u.id = q.unit_id
WHERE q.id IN (2,1,9,14,10);

UPDATE questions
SET marks = 2;

--------------------------------------------------------------------------------------------------------

INSERT INTO question_options (question_id, option_text, is_correct) VALUES
-- Q1
(1, '6', FALSE),(1, '12', TRUE),(1, '18', FALSE),(1, '24', FALSE),
-- Q2
(2, '5', TRUE),(2, '10', FALSE),(2, '15', FALSE),(2, '20', FALSE),
-- Q3
(3, '49', FALSE),(3, '154', TRUE),(3, '343', FALSE),(3, '22', FALSE),
-- Q4
(4, '1', FALSE),(4, '1/2', TRUE),(4, '√3/2', FALSE),(4, '0', FALSE),
-- Q5
(5, '28', FALSE),(5, '30', TRUE),(5, '32', FALSE),(5, '36', FALSE),
-- Q6
(6, '24', TRUE),(6, '26', FALSE),(6, '22', FALSE),(6, '20', FALSE),
-- Q7
(7, '54', FALSE),(7, '72', FALSE),(7, '81', TRUE),(7, '90', FALSE),
-- Q8
(8, 'Brother', FALSE),(8, 'Cousin', TRUE),(8, 'Uncle', FALSE),(8, 'Friend', FALSE),
-- Q9
(9, 'She goes to school daily', TRUE),(9, 'She go to school daily', FALSE),(9, 'She going to school daily', FALSE),(9, 'She gone to school daily', FALSE),
-- Q10
(10, 'Sad', FALSE),(10, 'Joyful', TRUE),(10, 'Angry', FALSE),(10, 'Tired', FALSE),
-- Q11
(11, 'Option A', FALSE),(11, 'Option B', TRUE),(11, 'Option C', FALSE),(11, 'Option D', FALSE),
-- Q12
(12, 'Mahatma Gandhi', FALSE),(12, 'Jawaharlal Nehru', TRUE),(12, 'Sardar Patel', FALSE),(12, 'Rajendra Prasad', FALSE),
-- Q13
(13, 'Udaipur', FALSE),(13, 'Jodhpur', FALSE),(13, 'Jaipur', TRUE),(13, 'Kota', FALSE),
-- Q14
(14, '1947', FALSE),(14, '1950', TRUE),(14, '1949', FALSE),(14, '1952', FALSE),
-- Q15
(15, 'Gross Domestic Product', TRUE),(15, 'General Development Plan', FALSE),(15, 'Global Data Process', FALSE),(15, 'Government Debt Policy', FALSE),
-- Q16
(16, '10%', FALSE),(16, '15%', FALSE),(16, '20%', TRUE),(16, '25%', FALSE),
-- Q17
(17, '5 days', FALSE),(17, '10 days', TRUE),(17, '15 days', FALSE),(17, '20 days', FALSE),
-- Q18
(18, 'Apple', FALSE),(18, 'Banana', FALSE),(18, 'Carrot', TRUE),(18, 'Mango', FALSE),
-- Q19
(19, 'Verb only', FALSE),(19, 'Subject + Verb + Object', TRUE),(19, 'Object only', FALSE),(19, 'Adjective only', FALSE),
-- Q20
(20, 'Spreadsheet software', FALSE),(20, 'Presentation software', FALSE),(20, 'Word processing software', TRUE),(20, 'Operating system', FALSE);
SELECT * FROM question_options;

-----------------------------------------------------------------------------------------

INSERT INTO tests (user_id, exam_id, total_marks, duration_in_minutes) VALUES
(1, 1, 25.00, 30),
(3, 1, 30.00, 45);

SELECT * FROM tests;

------------------------------------------------------------------------------------------


--TRUNCATE test_questions RESTART IDENTITY CASCADE;

INSERT INTO test_questions(test_id,question_id,marks,question_text)
SELECT 1,q.id,2,q.question_description
FROM exams e JOIN subjects s ON e.id=s.exam_id
JOIN units u ON u.subject_id = s.id 
JOIN questions q ON q.unit_id = u.id
JOIN tests t ON t.exam_id = e.id
WHERE e.id = t.exam_id
AND q.id NOT IN (SELECT 1 FROM user_question_history)
AND t.user_id = 3
ORDER BY RANDOM()
LIMIT 5;

SELECT tq.*,qo.id,qo.option_text,is_correct FROM test_questions tq
JOIN question_options qo ON tq.question_id = qo.question_id;

SELECT * FROM test_questions;


---------------------------------------------------------------------------

INSERT INTO student_answers(test_questions_id,select_option_id) VALUES
(1,7),(2,2),(3,33),(4,54),(5,37);

UPDATE student_answers sa
SET is_correct = qo.is_correct
FROM question_options qo, test_questions tq
WHERE sa.select_option_id = qo.id
AND sa.test_questions_id = tq.id
AND qo.question_id = tq.question_id;

SELECT * FROM student_answers;


----------------------------------------------------------------------------

INSERT INTO test_results(test_id) VALUES
(1);

WITH marks AS (
	SELECT
		tq.test_id,
		SUM(tq.marks) AS total_marks,
		SUM(
			CASE
				WHEN sa.is_correct = TRUE THEN tq.marks
				ELSE 0
			END 
		) AS optained_marks
	FROM test_questions tq
	JOIN tests t ON tq.test_id = t.id
	JOIN student_answers sa ON sa.test_questions_id = tq.id
	GROUP BY tq.test_id
),
test_status_update AS (
	UPDATE tests t
	SET status = 'COMPLETED'
	FROM marks m
	WHERE t.id = m.test_id
),
question_history AS (
	INSERT INTO user_question_history(user_id,question_id)
	SELECT t.user_id, tq.question_id
	FROM tests t JOIN test_questions tq
	ON t.id = tq.test_id
	WHERE t.status = 'COMPLETED'
	ON CONFLICT (user_id, question_id) DO NOTHING
)
UPDATE test_results tr
	SET total_marks = m.total_marks,
		optained_marks = m.optained_marks
FROM marks m
WHERE tr.test_id = m.test_id;

SELECT * FROM test_results;
SELECT e.category_name,q.* FROM exams e
JOIN subjects s ON e.id = s.exam_id
JOIN units u ON s.id = u.subject_id
JOIN questions q ON u.id = q.unit_id;

-----------------------------------------------------------------------

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
JOIN questions q ON tq.question_id = q.id
JOIN question_options qo ON q.id = qo.question_id
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
					ELSE 0
				END 
			) AS optained_marks
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
			optained_marks = m.optained_marks
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




select * from tests ORDER BY id;
select * from test_questions ORDER BY id;
select * from student_answers;
select * from test_results;
select * from user_question_history;
--TRUNCATE tests RESTART IDENTITY CASCADE;
--TRUNCATE test_questions RESTART IDENTITY CASCADE;
--TRUNCATE student_answers RESTART IDENTITY CASCADE;
--TRUNCATE test_results RESTART IDENTITY CASCADE;
--TRUNCATE user_question_history RESTART IDENTITY CASCADE;
--TRUNCATE users RESTART IDENTITY CASCADE;



--DO $$
--DECLARE
--	i INT;
--BEGIN
--	FOR i IN 1..1000 LOOP
		
--		CALL auto_submit_test(i, 1);

--		INSERT INTO student_answers(test_questions_id, select_option_id, is_correct)
--		SELECT 
--			tq.id,
--			qo.id,
--			qo.is_correct
--		FROM test_questions tq
--		JOIN LATERAL (
--			SELECT id, is_correct
--			FROM question_options
--			WHERE question_id = tq.question_id
--			OFFSET floor(random()*4)
--			LIMIT 1
--		) qo ON TRUE
--		WHERE tq.test_id = (
--			SELECT id FROM tests 
--			WHERE user_id = i 
--			ORDER BY created_at DESC 
--			LIMIT 1
--		);
--
--		CALL test_result_update(i,1);
--
--	END LOOP;
--END;
--$$;



---------------------------------------------------------------------------

select * from users order by id;
update users
set full_name = 'ankit' where id = 2;



_______________________________________________________________________________

INSERT INTO exam_medium(medium_type) VALUES
('ENGLISH'),('HINDI');

CREATE INDEX idx_orders_user_date ON orders(user_id, order_date);



select * from pg_stat_activity;
ALTER SYSTEM SET log_min_duration_statement = 1000;