INSERT INTO exams(category_name,status) VALUES
('SSC CGL','ACTIVE');
INSERT INTO exams(category_name,status) VALUES
('SSC CHSL','ACTIVE');

INSERT INTO exams(
	category_name,
	description,
	status
)
SELECT
	'Category' || gs,
	'Description for exam' || gs,
	CASE WHEN random() < 0.8 THEN 'ACTIVE' ELSE 'INACTIVE' END
FROM generate_series(3, 10000) gs;

SELECT * FROM exams ORDER BY 1;