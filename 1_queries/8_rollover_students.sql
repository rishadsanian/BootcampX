SELECT students.name AS student_name, students.start_date AS student_start_date, cohorts.name AS cohort_name, cohorts.start_date AS cohorts_start_date
FROM students JOIN cohorts ON (students.cohort_id = cohorts.id)
WHERE students.start_date != cohorts.start_date
ORDER BY cohorts_startdate;