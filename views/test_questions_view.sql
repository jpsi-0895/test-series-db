CREATE OR REPLACE VIEW question_test_vw AS
	SELECT
		q.id,
		q.question_description,
		q.question_type,
		q.marks,
		q.unit_id,
		q.exam_id,
		q.subject_id
	FROM questions q;

SELECT * FROM question_test_vw order by 1;