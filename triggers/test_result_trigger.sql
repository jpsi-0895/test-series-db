CREATE OR REPLACE FUNCTION update_result_status()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.obtained_marks >= (NEW.total_marks * 0.33) THEN
		NEW.status := 'P';
	ELSE
		NEW.status := 'F';
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER result_status_update_trg
BEFORE INSERT OR UPDATE
ON test_results
FOR EACH ROW
EXECUTE FUNCTION update_result_status();