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


INSERT INTO users(role,first_name,dob,gender,phone_number,email,password,last_name) VALUES
('S','yash','2003-12-15','M',9784294429,'yashdhank123@gmail.com','1234','dhankar');
INSERT INTO users(role,first_name,dob,gender,phone_number,email,password,last_name) VALUES
('S','ankit','2003-12-15','M',9784294410,'ankit123@gmail.com','1234','karodiya');

SELECT * FROM users ORDER BY 1;
