CREATE TABLE units(
	id BIGSERIAL PRIMARY KEY,
	subject_id INT,
	unit_name VARCHAR(100),
	created_at TIMESTAMP(0) DEFAULT NOW(),
	updated_at TIMESTAMP(0) DEFAULT NOW()
);
ALTER TABLE units
ALTER COLUMN subject_id SET NOT NULL,
ALTER COLUMN unit_name SET NOT NULL;

ALTER TABLE units
ADD CONSTRAINT unique_unit_subject_id_unit_name UNIQUE(subject_id,unit_name);

SELECT * FROM units;