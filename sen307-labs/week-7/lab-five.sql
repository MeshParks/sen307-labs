USE sen307_12416;

SELECT s.full_name, d.dept_name
FROM Student s
JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;

SELECT c.course_code, c.course_title, l.full_name AS lecturer
FROM Course c
INNER JOIN CourseAllocation ca ON c.course_id = ca.course_id
INNER JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_code;

SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
ORDER BY s.full_name;

SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name;

SELECT full_name, gender, dept_id, date_of_birth
FROM Student
WHERE gender = 'F'
  AND dept_id IN (1, 3)
  AND date_of_birth BETWEEN '2004-01-01' AND '2005-12-31';

SELECT * FROM Enrolment ORDER BY enrolment_id LIMIT 10 OFFSET 0;

SELECT * FROM Enrolment ORDER BY enrolment_id LIMIT 10 OFFSET 10;

SELECT s.full_name, c.course_title
FROM Course c
RIGHT JOIN Enrolment e ON c.course_id = e.course_id
RIGHT JOIN Student s ON e.student_id = s.student_id
WHERE c.course_title IS NULL
ORDER BY s.full_name;