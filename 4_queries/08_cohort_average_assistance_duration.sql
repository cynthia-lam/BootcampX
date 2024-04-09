-- Calculate the average total duration of assistance requests for each cohort.

-- Use the previous query as a sub query to determine the duration per cohort.
-- Return a single row average_total_duration

WITH cohort_duration AS (
    SELECT cohorts.name AS cohort_name, SUM(completed_at - started_at) AS total_duration
    FROM assistance_requests
    JOIN students ON student_id = students.id
    JOIN cohorts ON cohort_id = cohorts.id
    GROUP BY cohorts.name
)
SELECT AVG(total_duration) AS average_total_duration
FROM cohort_duration;

-- From COMPASS, another method to doing subqueries:

-- SELECT avg (total_duration) as average_total_duration
-- FROM (
--   SELECT cohorts.name as cohort, sum(completed_at-started_at) as total_duration
--   FROM assistance_requests
--   JOIN students ON students.id = student_id
--   JOIN cohorts on cohorts.id = cohort_id
--   GROUP BY cohorts.name
--   ORDER BY total_duration
-- ) as total_durations;