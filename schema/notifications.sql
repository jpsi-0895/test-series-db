CREATE TABLE notifications(
	id BIGSERIAL PRIMARY KEY,
	user_id BIGINT,
	title TEXT,
	message TEXT,
	is_read BOOL DEFAULT FALSE,
	created_at TIMESTAMPTZ DEFAULT NOW()
);