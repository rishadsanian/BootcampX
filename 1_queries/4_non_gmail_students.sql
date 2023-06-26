-- Recently we've been having trouble emailing students without a gmail account. To make sure that we can reliably contact all students, we'll need to make sure that student's without a gmail account have a phone number.

-- Instruction
-- Get all of the students without a gmail.com account and a phone number.

SELECT name, email, id, cohort_id
FROM students
WHERE email NOT LIKE '%gmail%' 
AND phone IS NULL;