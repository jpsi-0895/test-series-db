INSERT INTO users (
    role,
    full_name,
    dob,
    gender,
    phone_number,
    email,
    status,
	password
)
SELECT
    CASE WHEN random() < 0.7 THEN 'S' ELSE 'T' END,
    'User' || gs,
    DATE '1995-01-01' + (random() * 5000)::INT,
    CASE WHEN random() < 0.5 THEN 'M' ELSE 'F' END,
    (1000000000 + gs),
    'user' || gs || '@gmail.com',
    CASE WHEN random() < 0.8 THEN 'A' ELSE 'IA' END,
	'pass' || gs
FROM generate_series(10001, 900000) gs;

UPDATE users
SET full_name = 'YaSh dHAnKAr' WHERE id = 1;

UPDATE users
SET password = 'Pass';

SELECT * FROM users ORDER BY 1;

 

TRUNCATE users RESTART IDENTITY CASCADE;
