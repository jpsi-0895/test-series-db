ALTER TABLE subjects
ADD CONSTRAINT subject_exam_id_fkey FOREIGN KEY (exam_id)
REFERENCES exams(id);

ALTER TABLE units
ADD CONSTRAINT unit_subject_id FOREIGN KEY (subject_id)
REFERENCES subjects(id);

ALTER TABLE questions
ADD CONSTRAINT question_unit_id_fkey FOREIGN KEY (unit_id)
REFERENCES units(id);

ALTER TABLE question_options
ADD CONSTRAINT question_option_question_id FOREIGN KEY (question_id)
REFERENCES questions(id);

ALTER TABLE tests
ADD CONSTRAINT test_user_id_fkey FOREIGN KEY (user_id)
REFERENCES users(id);

ALTER TABLE tests
ADD CONSTRAINT test_exam_id_fkey FOREIGN KEY (exam_id)
REFERENCES exams(id);

ALTER TABLE tests
ADD CONSTRAINT test_subject_id_fkey FOREIGN KEY (subject_id)
REFERENCES subjects(id);

ALTER TABLE tests
ADD CONSTRAINT test_unit_id_fkey FOREIGN KEY (unit_id)
REFERENCES units(id);

ALTER TABLE test_questions
ADD CONSTRAINT test_question_test_id_fkey FOREIGN KEY (test_id)
REFERENCES tests(id);

ALTER TABLE test_questions
ADD CONSTRAINT test_question_question_id_fkey FOREIGN KEY (question_id)
REFERENCES questions(id);

ALTER TABLE student_answers
ADD CONSTRAINT student_answer_test_question_id_fkey FOREIGN KEY (test_questions_id)
REFERENCES test_questions(id);

ALTER TABLE student_answers
ADD CONSTRAINT student_answer_select_option_id_fkey FOREIGN KEY (select_option_id)
REFERENCES question_options(id);

ALTER TABLE test_results
ADD CONSTRAINT test_result_test_id_fkey FOREIGN KEY (test_id)
REFERENCES tests(id);

ALTER TABLE user_question_history
ADD CONSTRAINT user_question_history_user_id_fkey FOREIGN KEY (user_id)
REFERENCES users(id);

ALTER TABLE user_question_history
ADD CONSTRAINT user_question_history_question_id_fkey FOREIGN KEY (question_id)
REFERENCES questions(id);

ALTER TABLE questions
ADD CONSTRAINT question_subject_id_fkey FOREIGN KEY (subject_id)
REFERENCES subjects(id);

ALTER TABLE questions
ADD CONSTRAINT question_exam_id_fkey FOREIGN KEY (exam_id)
REFERENCES exams(id);

ALTER TABLE questions
ADD CONSTRAINT question_medium_id_fkey FOREIGN KEY (medium_id)
REFERENCES exam_medium(id);

ALTER TABLE test_results
ADD CONSTRAINT test_results_testseries_id_fkey FOREIGN KEY (testseries_id)
REFERENCES testseries(id);