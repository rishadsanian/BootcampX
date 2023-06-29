const { Pool } = require("pg");

const pool = new Pool({
  user: "labber",
  password: "labber",
  host: "localhost",
  database: "bootcampx",
});

const queryString = `
SELECT DISTINCT teachers.name as name, cohorts.name as cohort
FROM teachers 
JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
JOIN students ON assistance_requests.student_id=students.id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = $1
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
`;

const cohort = [process.argv[2] || 5];

pool
  .query(queryString,cohort)
  .then((res) => {
    res.rows.forEach((teacher) => {
      console.log(`${teacher.cohort}: ${teacher.name}`);
    });
  })

  .catch((err) => console.error("query error", err.stack));
