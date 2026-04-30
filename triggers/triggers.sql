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
	NEW.full_name := INITCAP(NEW.full_name);
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER user_full_name_format_trg
BEFORE INSERT OR UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION user_full_name_format();

-------------------------------------------------------------------------------------------------


SELECT * FROM users WHERE id = 2;
UPDATE users
SET dob = '2003-12-16' WHERE id = 2;

----------------------------------------------------------------------------------------------------