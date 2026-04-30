CREATE TABLE user_sessions(
	id BIGSERIAL PRIMARY KEY,
	user_id BIGINT,
	device_info VARCHAR(50),
	ip_address VARCHAR(30),
	location TEXT,
	login_time TIMESTAMPTZ DEFAULT NOW(),
	logout_time TIMESTAMPTZ,
	is_active BOOL DEFAULT TRUE,
	refresh_token TEXT
);