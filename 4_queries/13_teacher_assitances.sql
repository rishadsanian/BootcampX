SELECT DISTINCT a.name as teacher,cohorts.name as cohort, 
(SELECT count(assistance_requests.*) as total_assistances
FROM assistance_requests JOIN teachers b ON assistance_requests.teacher_id = b.id JOIN students ON students.id = assistance_requests.student_id JOIN cohorts ON students.cohort_id = cohorts.id WHERE a.name = b.name AND cohorts.name = 'JUL02' )
FROM teachers a
JOIN assistance_requests ON a.id = assistance_requests.teacher_id
JOIN students ON assistance_requests.student_id=students.id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY a.name, cohorts.name
ORDER BY a.name;

-- SELECT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests) as total_assistances
-- FROM teachers
-- JOIN assistance_requests ON teacher_id = teachers.id
-- JOIN students ON student_id = students.id
-- JOIN cohorts ON cohort_id = cohorts.id
-- WHERE cohorts.name = 'JUL02'
-- GROUP BY teachers.name, cohorts.name
-- ORDER BY teacher;