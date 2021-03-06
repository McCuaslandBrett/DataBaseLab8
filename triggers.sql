-- 1. populate part number with incremented value upon insertion of
-- the new row into part nyc. After that your insert statements
-- should not include value for part number and will look like this:

-- Insert into part nyc(supplier ,color ,on hand,descr) Values (0,0,20,’Desc’);
CREATE SEQUENCE part_number_seq START WITH 50000;

-- 2.Create a procedure that will return next value of the
-- aforementioned sequence. Use function nextval(’part number seq’)
-- to get the next value from the sequence.
-- Use the following syntax to create your procedure:
CREATE LANGUAGE plpgsql ;
CREATE OR REPLACE FUNCTION add_partnumber()
RETURNS "trigger" AS
$BODY$
BEGIN
  NEW.part_number := nextval('part_number_seq');
  return NEW;
  -- Values (partnumber);
 END
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

-- 3.Use the following syntax to create a trigger calling the procedure
-- upon insertion of the new record:
CREATE TRIGGER addpartnumber_pyc
  BEFORE INSERT
  ON part_nyc
  FOR EACH ROW
  EXECUTE PROCEDURE add_partnumber();
