INSERT INTO question_options (
    question_id,
    option_text,
    is_correct
)
SELECT
    q.id,
    'Option ' || opt || ' for Q' || q.id,
    CASE 
        WHEN opt = correct_opt THEN true 
        ELSE false 
    END
FROM questions q
CROSS JOIN generate_series(1,4) opt
CROSS JOIN LATERAL (
    SELECT (floor(random()*4) + 1)::int AS correct_opt
) c;

select * from question_options;