--For upcoming tests
--All tests
SELECT ts.ts_title, ts.sub_title, ts.start_date_time, ts.duration_in_min, ts.total_questions, ts.status
FROM testseries ts
ORDER BY start_date_time ASC;

--Open now tests
SELECT ts.ts_title, ts.sub_title, ts.start_date_time, ts.duration_in_min, ts.total_questions, ts.status
FROM testseries ts
WHERE CURRENT_DATE = ts.start_date_time::DATE
ORDER BY ts.start_date_time ASC;

--Schedules tests
SELECT ts.ts_title, ts.sub_title, ts.start_date_time, ts.duration_in_min, ts.total_questions, ts.status
FROM testseries ts
WHERE CURRENT_DATE < ts.start_date_time::DATE
ORDER BY ts.start_date_time ASC;

--Date wise tests
SELECT ts.ts_title, ts.sub_title, ts.start_date_time, ts.duration_in_min, ts.total_questions, ts.status
FROM testseries ts
WHERE ts.start_date_time::DATE = '2025-09-01'
ORDER BY ts.start_date_time ASC;