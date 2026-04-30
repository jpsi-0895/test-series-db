CREATE TABLE user_question_history(
	id BIGSERIAL PRIMARY KEY,
	user_id BIGINT,
	question_id BIGINT,
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE user_question_history
ADD CONSTRAINT unique_history_user_id_question_id UNIQUE(user_id,question_id);

SELECT * FROM user_question_history;