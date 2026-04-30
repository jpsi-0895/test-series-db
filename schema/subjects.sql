CREATE TABLE subjects(
	id SERIAL PRIMARY KEY,
	name VARCHAR(200),
	exam_id INT,
	syllabus TEXT,
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE subjects
ALTER COLUMN name SET NOT NULL,
ALTER COLUMN exam_id SET NOT NULL;

ALTER TABLE subjects
ADD CONSTRAINT unique_subject_name_exam_id UNIQUE(name,exam_id);

SELECT * FROM subjects;