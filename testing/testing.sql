SELECT * FROM exam_categories;
INSERT INTO exam_categories(category_name,description) VALUES
('SSC CHSL','12th passed students and above can give this exam');

SELECT * FROM exam_medium;
INSERT INTO exam_medium(exam_id,medium_type) VALUES
(2,'ENGLISH');

SELECT * FROM subjects;
INSERT INTO subjects(name,medium_id,syllabus) VALUES
('ENGLISH',3,'grammar');

SELECT * FROM units;
INSERT INTO units(subject_id,unit_number,unit_name) VALUES
(3,1,'Grammar'),
(2,2,'Calculus'),
(1,3,'Comprehension'),
(2,3,'Profit & Loss');

SELECT * FROM testseries;
INSERT INTO testseries(name,medium_id,test_duration_min,total_questions,passing_marks) VALUES
('testseries_1',1,60,5,5);
INSERT INTO testseries(name,medium_id,test_duration_min,total_questions,passing_marks) VALUES
('testseries_2',2,60,5,5);
INSERT INTO testseries(name,medium_id,test_duration_min,total_questions,passing_marks) VALUES
('testseries_3',1,60,5,5);

UPDATE testseries
SET medium_id = NULL;

UPDATE testseries
SET medium_id = 3 WHERE id = 3;

SELECT * FROM questions ORDER BY id;
UPDATE questions
SET unit_id = 4 WHERE id IN (5,6,7);

SELECT * FROM test_questions;
TRUNCATE test_questions RESTART IDENTITY;
INSERT INTO test_questions(testseries_id,question_id,marks,sequence) VALUES
(1,1,2,1),(1,2,2,2),(1,3,2,3),(1,4,2,4),(1,8,2,5),(1,9,2,6),(1,10,2,7);
INSERT INTO test_questions(testseries_id,question_id,marks,sequence) VALUES
(3,11,2,1),
(3,12,2,2),
(3,13,2,3),
(2,14,2,1),
(2,15,2,2),
(2,16,2,3),
(2,17,2,4);

EXPLAIN ANALYZE
SELECT q.id,q.question_description,q.unit_id,e.category_name,s.name AS subject,m.medium_type,u.unit_name
FROM questions q
JOIN units u ON q.unit_id = u.id
JOIN subjects s ON u.subject_id = s.id
JOIN exam_medium m ON s.medium_id = m.id
JOIN exam_categories e ON m.exam_id = e.id AND e.id = 1
ORDER BY q.id;

SELECT q.id, q.question_description, e.category_name
FROM questions q
JOIN units u ON q.unit_id = u.id
JOIN subjects s ON u.subject_id = s.id
JOIN exam_medium m ON s.medium_id = m.id
JOIN exam_categories e ON m.exam_id = e.id AND e.id = 1
ORDER BY q.id;

UPDATE testseries
SET subject_id = 1 WHERE id = 1;
UPDATE testseries
SET medium_id = 1 WHERE id = 1;

SELECT
	e.category_name,
	m.medium_type,
	t.name,
	q.question_description 
FROM questions q
JOIN test_questions tq ON q.id = tq.question_id
JOIN testseries t ON tq.testseries_id = t.id
JOIN exam_medium m ON t.medium_id = m.id
JOIN exam_categories e ON m.exam_id = e.id
WHERE e.category_name = 'SSC CHSL'
AND m.medium_type = 'ENGLISH';

SELECT q.*
FROM questions q
JOIN units u ON q.unit_id = u.id
JOIN subjects s ON u.subject_id = s.id
JOIN exam_medium m ON s.medium_id = m.id
JOIN exam_categories e ON m.exam_id = e.id
WHERE e.category_name = 'SSC CGL'
AND q.id IN (1,2,9,14,12)
ORDER BY id;

EXPLAIN ANALYZE
SELECT * FROM users
WHERE email = 'user1@gmail.com';

SELECT * FROM users
WHERE email = 'user1@gmail.com' OR '1'='1';

CREATE ROLE admin;
CREATE ROLE app_user;

GRANT SELECT, INSERT ON users TO admin;
GRANT SELECT ON users TO app_user;

INSERT INTO users(role,full_name,dob,gender,phone_number,email,password) VALUES
('S','yash','2003-12-15','M',9784294429,'yashdhank123@gmail.com','1234');

EXPLAIN ANALYZE
SELECT category_name FROM exams WHERE status = 'ACTIVE';

EXPLAIN ANALYZE
SELECT s.name, syllabus
FROM subjects s
JOIN exams e ON s.exam_id = e.id
WHERE e.category_name = 'SSC CGL';

EXPLAIN ANALYZE
SELECT u.unit_name
FROM units u
JOIN subjects s ON u.subject_id = s.id
JOIN exams e ON e.id = s.exam_id
WHERE e.category_name = 'SSC CGL'
AND s.name = 'English Comprehension';

SELECT * FROM tests;
INSERT INTO tests(user_id,total_marks,duration_in_minutes,exam_id) VALUES
(1,200,180,1);

SELECT * FROM test_questions;
SELECT q.id FROM questions q
JOIN exams e ON q.exam_id = e.id
WHERE e.category_name = 'SSC CGL';

INSERT INTO test_questions(test_id,question_id)
SELECT 1, id FROM questions
LIMIT 1;

SELECT first_name || ' ' || last_name FROM users;

--------------------------------------------------------------------------------------------------------------
