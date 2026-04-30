EXPLAIN ANALYZE
SELECT * FROM tests
WHERE status = 'COMPLETED';

----
EXPLAIN ANALYZE
SELECT
	q.id AS question_id,
	q.question_description,
	json_agg(
		json_build_object(
			qo.id,
			qo.option_text
		)
	) AS options
FROM questions q
JOIN question_options qo ON q.id = qo.question_id
WHERE qo.is_correct = TRUE
GROUP BY q.id, q.question_description
LIMIT 10;

-----
EXPLAIN ANALYZE
SELECT full_name, email, phone_number FROM users 
WHERE status = 'A'
ORDER BY 1;

-----
