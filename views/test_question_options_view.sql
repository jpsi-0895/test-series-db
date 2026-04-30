CREATE VIEW question_option_test_vw AS
SELECT
	id,
	question_id,
	option_text
FROM question_options;

select * from question_option_test_vw;