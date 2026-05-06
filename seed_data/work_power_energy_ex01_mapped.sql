-- Generated from WORK POWER AND ENERGY.pdf (Exercise 01)
-- Extracted Exam Name: JEE
-- Extracted Subject Name: Physics
-- Extracted Unit Name: Work Power And Energy
BEGIN;

-- Resolve exam/subject/unit by name (insert if missing)
WITH existing_exam AS (
    SELECT id FROM exams WHERE lower(category_name) = lower('JEE') LIMIT 1
),
inserted_exam AS (
    INSERT INTO exams(category_name, description, status)
    SELECT 'JEE', 'Auto-created from PDF import', 'ACTIVE'
    WHERE NOT EXISTS (SELECT 1 FROM existing_exam)
    RETURNING id
),
resolved_exam AS (
    SELECT id FROM inserted_exam
    UNION ALL
    SELECT id FROM existing_exam
),
existing_subject AS (
    SELECT s.id
    FROM subjects s
    WHERE lower(s.name) = lower('Physics')
      AND s.exam_id = (SELECT id FROM resolved_exam LIMIT 1)
    LIMIT 1
),
inserted_subject AS (
    INSERT INTO subjects(name, exam_id, syllabus)
    SELECT
        'Physics',
        (SELECT id FROM resolved_exam LIMIT 1),
        'Auto-created from PDF import'
    WHERE NOT EXISTS (SELECT 1 FROM existing_subject)
    RETURNING id
),
resolved_subject AS (
    SELECT id FROM inserted_subject
    UNION ALL
    SELECT id FROM existing_subject
),
existing_unit AS (
    SELECT u.id
    FROM units u
    WHERE lower(u.unit_name) = lower('Work Power And Energy')
      AND u.subject_id = (SELECT id FROM resolved_subject LIMIT 1)
    LIMIT 1
),
inserted_unit AS (
    INSERT INTO units(subject_id, unit_name)
    SELECT
        (SELECT id FROM resolved_subject LIMIT 1),
        'Work Power And Energy'
    WHERE NOT EXISTS (SELECT 1 FROM existing_unit)
    RETURNING id
)
SELECT 1;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'A person A of 50 kg rests on a swing of length 1m making an angle 37O with the vertical. Another person B pushes him to swing on other side at 53O with vertical. The work done by person B is : [ g = 10 m/s2 ]'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'A person A of 50 kg rests on a swing of length 1m making an angle 37O with the vertical. Another person B pushes him to swing on other side at 53O with vertical. The work done by person B is : [ g = 10 m/s2 ]',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('50 J', false),
    ('9.8 J', false),
    ('100 J', true),
    ('10 J', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'The work done by the rope on the block is : 1 Mgx²'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'The work done by the rope on the block is : 1 Mgx²',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('Mgx', false),
    ('', false),
    ('- 2 1 Mgx', false),
    ('Mgx²', true)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'The force of interaction between the particles is repulsive between points E and F on the curve.'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'The force of interaction between the particles is repulsive between points E and F on the curve.',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('1 and 3', false),
    ('1 and 4', true),
    ('2 and 4', false),
    ('2 and 3 E F B D r C', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'is :'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'is :',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('+ 4J', false),
    ('-3 J', false),
    ('- 2 J', false),
    ('- 5J', true)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'Work done in time t on a body of mass m which is accelerated from rest to a speed v in time t1 as a function of time t is given by : 2 2 1 v m t 2 t'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'Work done in time t on a body of mass m which is accelerated from rest to a speed v in time t1 as a function of time t is given by : 2 2 1 v m t 2 t',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('1 1 1 v (m/s)', false),
    ('v m t t', false),
    ('1 v m t 2 t 1 mv t t 2 t      ', false),
    ('2 2 2 2 1 2', true)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'Velocity-time graph of a particle of mass 2 kg moving in a straight line 20 is as shown in figure. Work done by all the forces on the particle is :'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'Velocity-time graph of a particle of mass 2 kg moving in a straight line 20 is as shown in figure. Work done by all the forces on the particle is :',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('400 J', false),
    ('-400 J t (s)', true),
    ('-200 J', false),
    ('200 J', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'A block of mass m moving with speed v compresses a spring through distance x before its speed is halved. What is the value of spring constant ? 2 2 2 2 2 3mv 2 mv 2 mv 2 2mv'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'A block of mass m moving with speed v compresses a spring through distance x before its speed is halved. What is the value of spring constant ? 2 2 2 2 2 3mv 2 mv 2 mv 2 2mv',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('4x', true),
    ('4x', false),
    ('2x', false),
    ('x', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'An engine can pull 4 coaches at a maximum speed of 20 m/s. Mass of the engine is twice the mass of every coach. Assuming resistive forces proportional to the weight, approximate maximum speeds of the engine when it pulls 12 and 6 coaches are :'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'An engine can pull 4 coaches at a maximum speed of 20 m/s. Mass of the engine is twice the mass of every coach. Assuming resistive forces proportional to the weight, approximate maximum speeds of the engine when it pulls 12 and 6 coaches are :',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('384 mJ', true),
    ('168 mJ', false),
    ('528 mJ', false),
    ('541 mJ', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'A body is moved along a straight line by a machine delivering constant power. The distance moved by the body in time t is proportional to :'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'A body is moved along a straight line by a machine delivering constant power. The distance moved by the body in time t is proportional to :',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('t1/2', false),
    ('t3/4', false),
    ('t3/2', true),
    ('t2', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'A particle of mass m is moving in a circular path of constant radius r such that its centripetal acceleration aC is varying with time t as aC = k2rt2, where k is a constant. The power delivered to the particle by the force acting on it is : Rajan Physics 2 5 4 (mk r t )'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'A particle of mass m is moving in a circular path of constant radius r such that its centripetal acceleration aC is varying with time t as aC = k2rt2, where k is a constant. The power delivered to the particle by the force acting on it is : Rajan Physics 2 5 4 (mk r t )',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('2πmk2r2', false),
    ('mk2r2t', true),
    ('3', false),
    ('zero', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'In the figure shown the potential energy (U) of a particle is plotted against U its position ''x'' from origin. Then which of the following statement is correct. A particle at :'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'In the figure shown the potential energy (U) of a particle is plotted against U its position ''x'' from origin. Then which of the following statement is correct. A particle at :',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('x1 is in stable equilibrium', false),
    ('x2 is in stable equilibrium', false),
    ('x3 is in stable equilibrium', false),
    ('None of these O X X1 X2 X3', true)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'A weight is hung freely from the end of a spring. A boy then slowly pushes the weight upwards until the spring becomes slack. The gain in gravitational poetential energy of the weight during this process is equal to :'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'A weight is hung freely from the end of a spring. A boy then slowly pushes the weight upwards until the spring becomes slack. The gain in gravitational poetential energy of the weight during this process is equal to :',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('The work done by the boy against the gravitational force acting on the weight.', false),
    ('The loss of the stored energy by the spring minus the work done by the tension in the spring.', false),
    ('The work done on the weight by the boy plus the stored energy lost by the spring.', true),
    ('The work done on the weight by the boy minus the workdone by the tension in the spring plus the stored energy lost by the spring.', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'A rope ladder with a length λ carrying a man of mass m at its end is attached to the basket of balloon with a mass M. The entire system is in equilibrium in the air. As the man climbs up the ladder into the balloon, the balloon descends by a height h. Then the potential energy of the man :'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'A rope ladder with a length λ carrying a man of mass m at its end is attached to the basket of balloon with a mass M. The entire system is in equilibrium in the air. As the man climbs up the ladder into the balloon, the balloon descends by a height h. Then the potential energy of the man :',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('Increases by mg (λ-h)', true),
    ('Increases by mgλ', false),
    ('Increases by mgh', false),
    ('Increases by mg (2λ-h) 32 E JEE-Physics', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'A block attached to a spring, pulled by a constant horizontal force, is k F kept on a smooth surface as shown in the figure. Initially, the spring is in the natural state. Then the maximum positive work that the applied force F can do is : [Given that spring does not break] 2 F 2 2F 2 F 2k'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'A block attached to a spring, pulled by a constant horizontal force, is k F kept on a smooth surface as shown in the figure. Initially, the spring is in the natural state. Then the maximum positive work that the applied force F can do is : [Given that spring does not break] 2 F 2 2F 2 F 2k',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('k', false),
    ('k', true),
    ('', false),
    ('', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'A simple pendulum has a string of length λ and bob of mass m. When the bob is at its lowest position, it is given the minimum horizontal speed necessary for it to move in a circular path about the point of suspension. The tension in the string at the lowest position of the bob is :'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'A simple pendulum has a string of length λ and bob of mass m. When the bob is at its lowest position, it is given the minimum horizontal speed necessary for it to move in a circular path about the point of suspension. The tension in the string at the lowest position of the bob is :',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('3mg', false),
    ('4mg', false),
    ('5mg', false),
    ('6mg', true)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'In the previous question, when the string is horizontal, the net force on the bob is :'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'In the previous question, when the string is horizontal, the net force on the bob is :',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('mg', false),
    ('3mg', false),
    ('10mg', true),
    ('4mg', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'A particle of mass m is fixed to one end of a light rigid rod of length λ and rotated in a vertical circular path about its other end. The minimum speed of the particle at its highest point must be : Rajan Physics'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'A particle of mass m is fixed to one end of a light rigid rod of length λ and rotated in a vertical circular path about its other end. The minimum speed of the particle at its highest point must be : Rajan Physics',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('zero', true),
    ('gλ', false),
    ('1.5gλ', false),
    ('2gλ', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'A stone tied to a string of length L is whirled in a vertical circle, with the other end of the string at the centre. At a certain instant of time, the stone is at its lowest position and has a speed u. The magnitude of the change in its velocity as it reaches a position where the string is horizontal is :'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'A stone tied to a string of length L is whirled in a vertical circle, with the other end of the string at the centre. At a certain instant of time, the stone is at its lowest position and has a speed u. The magnitude of the change in its velocity as it reaches a position where the string is horizontal is :',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('2 u 2gL -', false),
    ('2gL', false),
    ('2 u gL -', false),
    ('2 2(u gL) -', true)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'A marble of mass m and radius b is placed in a hemispherical bowl of radius r. The minimum velocity to be given to the marble so that it reaches the highest point is :'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'A marble of mass m and radius b is placed in a hemispherical bowl of radius r. The minimum velocity to be given to the marble so that it reaches the highest point is :',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('2g(r b) -', true),
    ('2 g r', false),
    ('2 g (r b ) ', false),
    ('g (r b ) -', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'The work done in moving a particle under the effect of a conservative A Rajan Physics force, from position A to B is 3 joule and from B to C is 4 joule. The work done in moving the particle from A to C is :'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'The work done in moving a particle under the effect of a conservative A Rajan Physics force, from position A to B is 3 joule and from B to C is 4 joule. The work done in moving the particle from A to C is :',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('5 joule', false),
    ('7 joule', true),
    ('1 joule', false),
    ('-1 joule B C', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'A particle is placed at the top of a sphere of radius r. It is given a little jerk so that it just starts slipping down. Find the point where it leaves the sphere.'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'A particle is placed at the top of a sphere of radius r. It is given a little jerk so that it just starts slipping down. Find the point where it leaves the sphere.',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('r/2', false),
    ('r/3', true),
    ('r/4', false),
    ('r', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'A particle is moving in a circular path with a constant speed v. If θ is the angular displacement, then starting from θ = 00, the maximum and minimum change in the linear momentum will occur when value of θ is respectively :'
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'A particle is moving in a circular path with a constant speed v. If θ is the angular displacement, then starting from θ = 00, the maximum and minimum change in the linear momentum will occur when value of θ is respectively :',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('45° & 90°', false),
    ('90° & 180°', false),
    ('180° & 360°', true),
    ('90° & 270°', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

WITH existing_question AS (
    SELECT q.id
    FROM questions q
    WHERE q.question_description = 'In a simple pendulum, the breaking strength of the string is double the weight of the bob. The bob is released from rest when the string is horizontal. The string breaks when it makes an angle θ with the vertical- 1 1 cos 3 1 2 cos 3 -   θ    '
      AND q.unit_id = (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1)
      AND q.subject_id = (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1)
      AND q.exam_id = (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1)
    LIMIT 1
),
inserted_question AS (
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
        'In a simple pendulum, the breaking strength of the string is double the weight of the bob. The bob is released from rest when the string is horizontal. The string breaks when it makes an angle θ with the vertical- 1 1 cos 3 1 2 cos 3 -   θ    ',
        'MCQ',
        (SELECT u.id FROM units u WHERE lower(u.unit_name) = lower('Work Power And Energy') ORDER BY u.id DESC LIMIT 1),
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        (SELECT s.id FROM subjects s WHERE lower(s.name) = lower('Physics') ORDER BY s.id DESC LIMIT 1),
        (SELECT e.id FROM exams e WHERE lower(e.category_name) = lower('JEE') ORDER BY e.id DESC LIMIT 1),
        1,
        false
    WHERE NOT EXISTS (SELECT 1 FROM existing_question)
    RETURNING id
),
resolved_question AS (
    SELECT id FROM inserted_question
    UNION ALL
    SELECT id FROM existing_question
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT rq.id, opt.option_text, opt.is_correct
FROM resolved_question rq
CROSS JOIN (VALUES
    ('CHECK YOUR GRASP EXERCISE -1', false),
    ('θ = 60°', false),
    ('-   θ    ', true),
    ('θ = 0', false)
) AS opt(option_text, is_correct)
ON CONFLICT (question_id, option_text) DO NOTHING;

COMMIT;
