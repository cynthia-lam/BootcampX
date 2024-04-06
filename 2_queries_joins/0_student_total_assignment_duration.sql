-- Get the total amount of time that a student has spent on all assignments.

-- This should work for any student but use 'Ibrahim Schimmel' for now.
-- Select only the total amount of time as a single column.

SELECT SUM(duration) AS total_duration
FROM students JOIN assignment_submissions ON assignment_submissions.student_id = students.id
WHERE students.name = 'Ibrahim Schimmel';

-- below is the answer provided by compass:

-- SELECT sum(assignment_submissions.duration) as total_duration
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- WHERE students.name = 'Ibrahim Schimmel';

-- note: should specify where duration is coming from, in case there's a duration
-- column in more than one table