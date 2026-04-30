CREATE TABLE certificates(
	id BIGSERIAL PRIMARY KEY,
	user_id BIGINT,
	c_name VARCHAR(30),
	certificate_path TEXT,
	valid_type VARCHAR(20),
	valide_days INT,
	is_expired BOOL DEFAULT FALSE,
	created_at TIMESTAMPTZ DEFAULT NOW(),
	updated_at TIMESTAMPTZ
);