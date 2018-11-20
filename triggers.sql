-- 1. populate part number with incremented value upon insertion of
-- the new row into part nyc. After that your insert statements
-- should not include value for part number and will look like this:

-- Insert into part nyc(supplier ,color ,on hand,descr) Values (0,0,20,’Desc’);
CREATE SEQUENCE partnumber START 50000;

-- 2.Create a procedure that will return next value of the
-- aforementioned sequence. Use function nextval(’part number seq’) to get the next value from the sequence.
-- Use the following syntax to create your procedure:
CREATE LANGUAGE plpgsql ;
CREATE OR REPLACE FUNCTION func add_partnumber()
RETURNS trigger AS
$BODY$
BEGIN
Insert into part_nyc(supplier,color,on_hand,descr) Values (0,0,20,’Desc’);
RETURN END;
$BODY$
LANGUAGE 'plpgsql';

-- 3.Use the following syntax to create a trigger calling the procedure
-- upon insertion of the new record:
CREATE TRIGGER partnumber
BEFORE  INSERT
ON part_nyc
FOR EACH STATEMENT
EXECUTE PROCEDURE add_partnumber();