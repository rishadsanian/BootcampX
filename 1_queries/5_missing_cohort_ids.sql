SELECT * FROM students
WHERE cohort_id IS NULL;


BEGIN TRANSACTION;

UPDATE students 
SET cohort_id = 11
WHERE start_date = '2018-11-19' AND cohort_id IS NULL;

UPDATE students 
SET cohort_id = 12
WHERE start_date = '2018-12-17' AND cohort_id IS NULL;

COMMIT;


