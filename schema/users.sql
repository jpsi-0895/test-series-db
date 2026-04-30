CREATE TABLE users(
	id BIGSERIAL PRIMARY KEY,
	role VARCHAR(20),
	full_name VARCHAR(200),
	dob DATE,
	gender VARCHAR(10),
	phone_number BIGINT,
	email VARCHAR(50),
	status VARCHAR(10),
	subscription_status VARCHAR(10),
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE users
ALTER COLUMN role SET NOT NULL,
ALTER COLUMN full_name SET NOT NULL,
ALTER COLUMN phone_number SET NOT NULL;

ALTER TABLE users
ADD COLUMN password VARCHAR(30);

ALTER TABLE users
ALTER COLUMN password SET NOT NULL;

