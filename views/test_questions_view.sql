CREATE OR REPLACE VIEW question_test_vw AS
	SELECT
		q.id,
		q.question_description,
		q.question_type,
		q.marks,
		q.unit_id
	FROM questions q;