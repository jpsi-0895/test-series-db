CREATE TABLE exams(
	id SERIAL PRIMARY KEY,
	category_name VARCHAR(20),
	description TEXT,
	status VARCHAR(50),
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE exams
ALTER COLUMN category_name SET NOT NULL,
ALTER COLUMN description SET NOT NULL;
ALTER TABLE exams
ALTER COLUMN description DROP NOT NULL;


SELECT * FROM exams;