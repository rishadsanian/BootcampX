const { Pool } = require("pg");

const pool = new Pool({
  user: "labber",
  password: "labber",
  host: "localhost",
  database: "bootcampx",
});

const queryString = `
SELECT students.id as id, students.name as name, cohorts.name as cohort
FROM students JOIN cohorts 
ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
LIMIT $2;
`;

const cohort = process.argv[2];
const limiter = process.argv[3] || 5;
const values = [`%${cohort}%`, limiter];

pool
  .query(queryString, values)
  .then((res) => {
    res.rows.forEach((student) => {
      console.log(
        `${student.name} has an id of ${student.id} and was in the ${student.cohort} cohort`
      );
    });
  })

  .catch((err) => console.error("query error", err.stack));
