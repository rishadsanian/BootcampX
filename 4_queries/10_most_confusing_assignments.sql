SELECT assignments.id,day, name, chapter, count(assistance_requests.*) as total_requests
FROM assignments JOIN assistance_requests
ON (assignments.id = assistance_requests.assignment_id)
GROUP BY assignments.id
ORDER by total_requests DESC;