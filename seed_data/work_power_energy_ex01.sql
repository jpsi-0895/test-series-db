-- Generated from WORK POWER AND ENERGY.pdf (Exercise 01)
-- Extracted Exam Name: JEE
-- Extracted Subject Name: Physics
-- Extracted Unit Name: Work Power And Energy
BEGIN;

WITH inserted_question AS (
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
    ) VALUES (
        'A person A of 50 kg rests on a swing of length 1m making an angle 37 O with the vertical. Another person B pushes him to swing on other side at 53 O with vertical. The work done by person B is : [ g = 10 m/s 2 ]',
        'MCQ',
        1,
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        1,
        1,
        1,
        false
    )
    RETURNING id
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, opt.option_text, opt.is_correct
FROM inserted_question
CROSS JOIN (VALUES
    ('50 J', false),
    ('9.8 J', false),
    ('100 J', true),
    ('10 J', false)
) AS opt(option_text, is_correct);

WITH inserted_question AS (
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
    ) VALUES (
        'The work done by the rope on the block is :',
        'MCQ',
        1,
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        1,
        1,
        1,
        false
    )
    RETURNING id
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, opt.option_text, opt.is_correct
FROM inserted_question
CROSS JOIN (VALUES
    ('Mgx', false),
    ('2 1 Mgx²', false),
    ('– 2 1 Mgx', false),
    ('Mgx²', true)
) AS opt(option_text, is_correct);

WITH inserted_question AS (
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
    ) VALUES (
        'The work done in moving a particle under the effect of a conservative A B C force, from position A to B is 3 joule and from B to C is 4 joule. The work done in moving the particle from A to C is :',
        'MCQ',
        1,
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        1,
        1,
        1,
        false
    )
    RETURNING id
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, opt.option_text, opt.is_correct
FROM inserted_question
CROSS JOIN (VALUES
    ('5 joule', false),
    ('7 joule', true),
    ('1 joule', false),
    ('–1 joule', false)
) AS opt(option_text, is_correct);

WITH inserted_question AS (
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
    ) VALUES (
        'The force of interaction between the particles is repulsive between points E and F on the curve.',
        'MCQ',
        1,
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        1,
        1,
        1,
        false
    )
    RETURNING id
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, opt.option_text, opt.is_correct
FROM inserted_question
CROSS JOIN (VALUES
    ('1 and 3', false),
    ('1 and 4', true),
    ('2 and 4', false),
    ('2 and 3', false)
) AS opt(option_text, is_correct);

WITH inserted_question AS (
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
    ) VALUES (
        'is :',
        'MCQ',
        1,
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        1,
        1,
        1,
        false
    )
    RETURNING id
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, opt.option_text, opt.is_correct
FROM inserted_question
CROSS JOIN (VALUES
    ('+ 4J', false),
    ('–3 J', false),
    ('– 2 J', false),
    ('– 5J', true)
) AS opt(option_text, is_correct);

WITH inserted_question AS (
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
    ) VALUES (
        'Work done in time t on a body of mass m which is accelerated from rest to a speed v in time t 1 as a function of time t is given by :',
        'MCQ',
        1,
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        1,
        1,
        1,
        false
    )
    RETURNING id
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, opt.option_text, opt.is_correct
FROM inserted_question
CROSS JOIN (VALUES
    ('2 1 1 vm t2 t', false),
    ('2 1 vm tt', false),
    ('2 2 1 1 mv t t2 t     ', false),
    ('2 2 2 1 1 vm t2 t', true)
) AS opt(option_text, is_correct);

WITH inserted_question AS (
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
    ) VALUES (
        'Velocity–time graph of a particle of mass 2 kg moving in a straight line 2 20 v (m/s) t (s) is as shown in figure. Work done by all the forces on the particle is :',
        'MCQ',
        1,
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        1,
        1,
        1,
        false
    )
    RETURNING id
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, opt.option_text, opt.is_correct
FROM inserted_question
CROSS JOIN (VALUES
    ('400 J', false),
    ('–400 J', true),
    ('–200 J', false),
    ('200 J', false)
) AS opt(option_text, is_correct);

WITH inserted_question AS (
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
    ) VALUES (
        'A block of mass m moving with speed v compresses a spring through distance x before its speed is halved. What is the value of spring constant ?',
        'MCQ',
        1,
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        1,
        1,
        1,
        false
    )
    RETURNING id
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, opt.option_text, opt.is_correct
FROM inserted_question
CROSS JOIN (VALUES
    ('2 2 3mv 4x', true),
    ('2 2 mv 4x', false),
    ('2 2 mv 2x', false),
    ('2 2 2mv x', false)
) AS opt(option_text, is_correct);

WITH inserted_question AS (
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
    ) VALUES (
        'An engine can pull 4 coaches at a maximum speed of 20 m/s. Mass of the engine is twice the mass of every coach. Assuming resistive forces proportional to the weight, approximate maximum speeds of the engine when it pulls 12 and 6 coaches are :',
        'MCQ',
        1,
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        1,
        1,
        1,
        false
    )
    RETURNING id
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, opt.option_text, opt.is_correct
FROM inserted_question
CROSS JOIN (VALUES
    ('384 mJ', true),
    ('168 mJ', false),
    ('528 mJ', false),
    ('541 mJ', false)
) AS opt(option_text, is_correct);

WITH inserted_question AS (
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
    ) VALUES (
        'A body is moved along a straight line by a machine delivering constant power. The distance moved by the body in time t is proportional to :',
        'MCQ',
        1,
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        1,
        1,
        1,
        false
    )
    RETURNING id
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, opt.option_text, opt.is_correct
FROM inserted_question
CROSS JOIN (VALUES
    ('t1/2', false),
    ('t3/4', false),
    ('t3/2', true),
    ('t2', false)
) AS opt(option_text, is_correct);

WITH inserted_question AS (
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
    ) VALUES (
        'A particle of mass m is moving in a circular path of constant radius r such that its centripetal acceleration a C is varying with time t as a C = k 2rt2, where k is a constant. The power delivered to the particle by the force acting on it is :',
        'MCQ',
        1,
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        1,
        1,
        1,
        false
    )
    RETURNING id
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, opt.option_text, opt.is_correct
FROM inserted_question
CROSS JOIN (VALUES
    ('2mk2r2', false),
    ('mk2r2t', true),
    ('2 54(mk r t ) 3', false),
    ('zero', false)
) AS opt(option_text, is_correct);

WITH inserted_question AS (
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
    ) VALUES (
        'In the figure shown the potential energy (U) of a particle is plotted against U O XX1 X2 X3 its position ''x'' from origin. Then which of the following statement is correct. A particle at :',
        'MCQ',
        1,
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        1,
        1,
        1,
        false
    )
    RETURNING id
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, opt.option_text, opt.is_correct
FROM inserted_question
CROSS JOIN (VALUES
    ('x1 is in stable equilibrium', false),
    ('x 2 is in stable equilibrium', false),
    ('x 3 is in stable equilibrium', false),
    ('None of these', true)
) AS opt(option_text, is_correct);

WITH inserted_question AS (
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
    ) VALUES (
        'A weight is hung freely from the end of a spring. A boy then slowly pushes the weight upwards until the spring becomes slack. The gain in gravitational poetential energy of the weight during this process is equal to :',
        'MCQ',
        1,
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        1,
        1,
        1,
        false
    )
    RETURNING id
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, opt.option_text, opt.is_correct
FROM inserted_question
CROSS JOIN (VALUES
    ('The work done by the boy against the gravitational force acting on the weight.', false),
    ('The loss of the stored energy by the spring minus the work done by the tension in the spring.', false),
    ('The work done on the weight by the boy plus the stored energy lost by the spring.', true),
    ('The work done on the weight by the boy minus the workdone by the tension in the spring plus the stored energy lost by the spring.', false)
) AS opt(option_text, is_correct);

WITH inserted_question AS (
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
    ) VALUES (
        'A rope ladder with a length  carrying a man of mass m at its end is attached to the basket of balloon with a mass M. The entire system is in equilibrium in the air. As the man climbs up the ladder into the balloon, the balloon descends by a height h. Then the potential energy of the man :',
        'MCQ',
        1,
        'MEDIUM',
        'ACTIVE',
        1.00,
        NULL,
        1,
        1,
        1,
        false
    )
    RETURNING id
)
INSERT INTO question_options (question_id, option_text, is_correct)
SELECT id, opt.option_text, opt.is_correct
FROM inserted_question
CROSS JOIN (VALUES
    ('Increases by mg ( –h)', true),
    ('Increases by mg ', false),
    ('Increases by mgh', false),
    ('Increases by mg (2 –h) JEE-Physics E 33 CHECK YOUR GRASP EXERCISE –1', false)
) AS opt(option_text, is_correct);

COMMIT;
