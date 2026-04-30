INSERT INTO questions (
    question_description,
    question_type,
    unit_id,
    difficulty_level,
    status,
    marks,
    explanation,
    subject_id,
    exam_id,
    medium_id,
    is_deleted
)
SELECT
    'Sample SSC ' ||
    CASE WHEN g <= 1000 THEN 'CGL' ELSE 'CHSL' END ||
    ' Question #' || g AS question_description,

    'MCQ' AS question_type,

    ((random()*10)::int % 10) + 1 AS unit_id,

    CASE
        WHEN random() < 0.4 THEN 'EASY'
        WHEN random() < 0.8 THEN 'MEDIUM'
        ELSE 'HARD'
    END AS difficulty_level,

    'ACTIVE' AS status,
    2.00 AS marks,

    'Auto generated explanation for question #' || g AS explanation,

    ((random()*4)::int % 4) + 1 AS subject_id,

    CASE
        WHEN g <= 1000 THEN 1   -- SSC CGL
        ELSE 2                  -- SSC CHSL
    END AS exam_id,

    1 AS medium_id,
    false AS is_deleted

FROM generate_series(1,2000) g;

-------------------------------------------------