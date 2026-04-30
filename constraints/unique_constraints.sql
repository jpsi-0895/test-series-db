ALTER TABLE question_options
ADD CONSTRAINT unique_question_options UNIQUE (question_id, option_text);

ALTER TABLE units
ADD CONSTRAINT unique_subject_id_unit_number UNIQUE(subject_id, unit_name);

ALTER TABLE student_answers
ADD CONSTRAINT unique_answer_select_test_question_option UNIQUE(test_questions_id,select_option_id);