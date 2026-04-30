SELECT * FROM users;
INSERT INTO users(role,full_name,phone_number) VALUES
('S','yash',9784294429);
INSERT INTO users(role,full_name,phone_number) VALUES
('S','ankit',9784294410);
truncate users restart identity cascade;

SELECT * FROM exams;
INSERT INTO exams(category_name,status) VALUES
('SSC CGL','ACTIVE');

SELECT * FROM subjects;
INSERT INTO subjects(name,exam_id) VALUES
('Mathematics',1);

SELECT * FROM units;
INSERT INTO units(subject_id,unit_name) VALUES
(1,'Profit and loss');

TRUNCATE questions RESTART IDENTITY CASCADE;
SELECT * FROM questions;
INSERT INTO questions
(question_description, question_type, unit_id, difficulty_level, status, marks, explanation, subject_id, exam_id, medium_id)
SELECT 
    'Sample Question ' || gs,
    CASE 
        WHEN gs % 3 = 0 THEN 'NUMERIC'
        ELSE 'MCQ'
    END,
    1,
    CASE 
        WHEN gs % 3 = 0 THEN 'EASY'
        WHEN gs % 3 = 1 THEN 'MEDIUM'
        ELSE 'HARD'
    END,
    'ACTIVE',
    2,
    'Auto generated explanation ' || gs,
    1,
    1,
    (gs % 2) + 1
FROM generate_series(1, 1000) gs;


SELECT * FROM question_options;
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT
	q.id,
	'Option ' || opt.option_no || ' for Question ' || q.id,
	CASE
		WHEN opt.option_no = ((q.id % 4) + 1) THEN TRUE
		ELSE FALSE
	END
FROM questions q
CROSS JOIN (
	SELECT 1 AS option_no
	UNION ALL SELECT 2
	UNION ALL SELECT 3
	UNION ALL SELECT 4
) opt;

EXPLAIN ANALYZE
SELECT * FROM question_options qo
WHERE EXISTS (SELECT question_id FROM test_questions tq WHERE tq.question_id = qo.question_id);


SELECT * FROM tests;
SELECT * FROM questions
WHERE question_type = 'MCQ'
ORDER BY id;
UPDATE questions
SET marks = 3
WHERE question_type = 'MCQ'
AND difficulty_level = 'HARD';

SELECT * FROM tests;
SELECT * FROM test_results;