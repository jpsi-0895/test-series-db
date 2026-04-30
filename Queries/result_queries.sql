--Result queries per individual user
--total attempts query
SELECT COUNT(id) FROM test_results;

--total passed tests query
SELECT 
	COUNT(CASE WHEN status = 'P' THEN 1 END) || '/' || COUNT(id) AS passed
FROM test_results;

--Average percent
SELECT
	ROUND(SUM(total_marks)*100/SUM(obtained_marks),0) || '%' AS average
FROM test_results;

--Highest percent
SELECT
	ROUND(total_marks*100/obtained_marks,0) || '%' AS average
FROM test_results
ORDER BY average DESC
LIMIT 1;

--All tests results
SELECT
	ts.ts_title AS exam, ts.start_date_time::DATE AS date, tr.obtained_marks||'/'||tr.total_marks AS score, 
	tr.obtained_marks*100/tr.total_marks||'%' AS percent, tr.status AS outcome
FROM testseries ts
JOIN test_results tr ON ts.id = tr.testseries_id;

--Passed results
SELECT
	ts.ts_title AS exam, ts.start_date_time::DATE AS date, tr.obtained_marks||'/'||tr.total_marks AS score, 
	tr.obtained_marks*100/tr.total_marks||'%' AS percent, tr.status AS outcome
FROM testseries ts
JOIN test_results tr ON ts.id = tr.testseries_id
WHERE tr.status = 'P';

--Not passed results
SELECT
	ts.ts_title AS exam, ts.start_date_time::DATE AS date, tr.obtained_marks||'/'||tr.total_marks AS score, 
	tr.obtained_marks*100/tr.total_marks||'%' AS percent, tr.status AS outcome
FROM testseries ts
JOIN test_results tr ON ts.id = tr.testseries_id
WHERE tr.status = 'F';