CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
	IF TG_OP = 'UPDATE' AND NEW IS DISTINCT FROM OLD THEN
		BEGIN
			NEW.updated_at = NOW();
		EXCEPTION WHEN undefined_column THEN
		END;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DO $$
DECLARE
	tbl TEXT;
BEGIN
	FOR tbl IN
		SELECT table_name
		FROM information_schema.columns
		WHERE column_name = 'updated_at'
		AND table_schema = 'public'
	LOOP
		EXECUTE format('
			CREATE TRIGGER %I_updated_at_trg
			BEFORE UPDATE ON %I
			FOR EACH ROW
			WHEN (OLD IS DISTINCT FROM NEW)
			EXECUTE FUNCTION update_updated_at();
		', tbl, tbl);
	END LOOP;
END;
$$;
-------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION user_full_name_format()
RETURNS TRIGGER AS $$
BEGIN
	NEW.first_name := INITCAP(NEW.first_name);
	NEW.last_name := INITCAP(NEW.last_name);
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER user_full_name_format_trg
BEFORE INSERT OR UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION user_full_name_format();

-------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION check_total_marks()
RETURNS TRIGGER AS $$
DECLARE
	total INT;
	test_total INT;
BEGIN
	SELECT COALESCE(SUM(q.marks),0)
	INTO total
	FROM test_questions tq
	JOIN questions q ON tq.question_id = q.id
	WHERE tq.test_id = NEW.test_id;

	SELECT total_marks INTO test_total
	FROM tests
	WHERE id = NEW.test_id;

	IF total > test_total THEN
		RAISE EXCEPTION 'Total questions marks exceed test total marks';
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_total_marks
AFTER INSERT OR UPDATE ON test_questions
FOR EACH ROW
EXECUTE FUNCTION check_total_marks();

----------------------------------------------------------------------------------------------------