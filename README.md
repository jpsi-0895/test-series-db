# Online Exam System Database (PostgreSQL)

## Project Overview

This repository contains a PostgreSQL database system for an online exam platform (SSC/UPSC-style test workflow).
It models the full lifecycle:

`User -> Exam/TestSeries Selection -> Test Creation -> Questions -> Answers -> Evaluation -> Result -> Analytics`

## Latest Project Updates

- Added new schema modules:
  - `testseries` scheduling metadata (`start_date_time`, `ts_title`, `sub_title`, `duration_in_min`, `total_questions`, `status`)
  - `notifications`
  - `user_sessions`
  - `certificates`
- Added foreign key support for `test_results.testseries_id -> testseries.id`
- Expanded constraints and indexes for better integrity and performance
- Updated procedures, triggers, and views for exam automation and result consistency
- Added analytics query packs:
  - `Queries/dashboard_queries.sql`
  - `Queries/result_queries.sql`
  - `Queries/upcoming_test_queries.sql`
- Added bulk seed scripts:
  - `seed_data/questions_data.sql`
  - `seed_data/question_options.sql`

## Features

### Core Features

- User management for students and teachers
- Exam -> Subject -> Unit -> Question hierarchy
- Test session creation and question allocation
- MCQ answer capture and correctness evaluation
- Marks calculation with pass/fail outcome

### Platform Features

- TestSeries scheduling and upcoming/open test filtering
- User session tracking (device, IP, login/logout, token)
- Notification model for user alerts
- Certificate tracking for completed outcomes
- User question history tracking to reduce repeat questions

### Automation Features

- Auto test creation and submission flow (`auto_submit_test`)
- Auto answer selection helper (`auto_select_answer`)
- Result generation/update procedure (`test_result_update`)
- Auto `updated_at` trigger on tables that support it
- Name formatting and test total-marks validation triggers

## Database Schema

Primary tables:

- `users`
- `exams`
- `subjects`
- `units`
- `questions`
- `question_options`
- `testseries`
- `tests`
- `test_questions`
- `student_answers`
- `test_results`
- `user_question_history`
- `notifications`
- `user_sessions`
- `certificates`

## Query Packs

- `Queries/dashboard_queries.sql` - dashboard KPIs (completed tests, average score, certificates, recent results)
- `Queries/result_queries.sql` - attempts, pass ratio, percentage views, pass/fail result breakdown
- `Queries/upcoming_test_queries.sql` - all/open/scheduled/date-wise testseries lookups

## Data Integrity and Performance

- Foreign key constraints across exam/test/result hierarchy
- Unique constraints to prevent duplicate options/units/answers
- Check constraints for controlled enum-like values (role, status, difficulty, etc.)
- Conflict-safe history inserts using `ON CONFLICT DO NOTHING`
- Targeted indexes for joins and high-frequency filters

## Repository Structure

- `schema/` - table definitions
- `constraints/` - foreign key, unique, check, and default constraints
- `indexes/` - index definitions
- `views/` - reusable reporting/query views
- `functions/` - SQL functions
- `procedures/` - workflow procedures
- `triggers/` - trigger functions and trigger creation scripts
- `security/` - row-level security and access-related scripts
- `seed_data/` - sample/bulk data scripts
- `Queries/` - dashboard, result, and operational query sets
- `testing/` - validation/testing scripts
- `migrations/` - migration scripts
- `scripts/` - utility scripts
- `docs/` - project documentation
- `Full Database/` - complete bundled schema

## Tech Stack

- **Database:** PostgreSQL
- **Language:** SQL / PLpgSQL
- **Key Concepts:** Joins, CTEs, constraints, indexing, triggers, procedures

## Author

Yash Dhankar
