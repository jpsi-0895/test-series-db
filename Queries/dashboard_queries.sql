--For individual user
--Find total completed tests
EXPLAIN ANALYZE
SELECT COUNT(*)
FROM tests
WHERE status = 'COMPLETED';

--Find average score
SELECT *
FROM test_results tr
JOIN tests t ON tr.test_id = t.id
JOIN users u ON u.id = t.user_id
WHERE u.email = 'yashdhank123@gmail.com';

SELECT
	ROUND(SUM(obtained_marks)*100/SUM(total_marks),0) || '%' AS average_score 
FROM ( 
	SELECT * FROM test_results
	ORDER BY created_at DESC
	LIMIT 5
);

--Find total certificates
SELECT COUNT(id) FROM certificates WHERE is_expired = 'FALSE';

--Upcoming & opne tests
SELECT ts_title, sub_title, start_date_time, duration_in_min, total_questions, status
FROM testseries
WHERE start_date_time >= NOW()
ORDER BY created_at DESC
LIMIT 3;

--Recent results
SELECT ts.ts_title AS exam, start_date_time::DATE AS date, obtained_marks || '/' || tr.total_marks AS score, tr.status AS outcome
FROM testseries ts
JOIN test_results tr ON ts.id = tr.testseries_id
ORDER BY tr.created_at DESC
LIMIT 3;