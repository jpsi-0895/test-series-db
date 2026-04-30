CREATE INDEX idx_test_questions_test_id ON test_questions(test_id);
CREATE INDEX idx_student_answers_tq_id ON student_answers(test_questions_id);
CREATE INDEX idx_tests_user_exam_created ON tests(user_id, exam_id, created_at DESC);
CREATE INDEX idx_questions_unit_id ON questions(unit_id);
CREATE INDEX unit_subject_id_idx ON units(subject_id);
CREATE INDEX idx_subjects_exam_id ON subjects(exam_id);
CREATE INDEX idx_user_question_history_user_question ON user_question_history(user_id, question_id);

CREATE INDEX idx_tests_active ON tests(user_id, exam_id, status, created_at DESC) WHERE status = 'STARTED';
CREATE INDEX idx_question_options_question_id ON question_options(question_id);
CREATE INDEX idx_student_answers_option_id ON student_answers(select_option_id);
CREATE INDEX idx_test_results_test_id ON test_results(test_id);

CREATE INDEX idx_test_questions_cover ON test_questions(test_id, question_id);
CREATE INDEX idx_test_user_id ON tests(user_id);
CREATE INDEX idx_test_exam_id ON tests(exam_id);

CREATE UNIQUE INDEX unique_test_user_started ON tests(user_id) WHERE status = 'STARTED';

CREATE INDEX idx_questions_id_unit_id ON questions(id,unit_id);
CREATE INDEX idx_question_history_user_id_question_id ON user_question_history(user_id, question_id);

CREATE INDEX idx_student_answers_full ON student_answers(test_questions_id, select_option_id);
--CREATE INDEX idx_tests_user_status ON tests(user_id, status, created_at DESC);