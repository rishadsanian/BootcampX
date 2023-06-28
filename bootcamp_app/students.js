const { Pool } = require("pg");

const pool = new Pool({
  user: "labber",
  password: "labber",
  host: "localhost",
  database: "bootcampx",
});

pool
  .query(
    `
    SELECT students.id, students.name, cohorts.name as cohort
    FROM students JOIN cohorts 
    ON students.cohort_id = cohorts.id
    WHERE cohorts.name LIKE'${process.argv[2]}%'
    LIMIT ${process.argv[3]};
`
  )
  .then((res) => {
    res.rows.forEach((student) => {
      console.log(
        `${student.name} has an id of ${student.id} and was in the ${student.cohort} cohort`
      );
    });
  })

  .catch((err) => console.error("query error", err.stack));
