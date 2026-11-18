-- VUA-SEN307 Week 6 Practical: Lab 4 (DML)
-- Name: Eribo Nateinmibebi Franklin   Matric: 12416
USE sen307_12416;

-- Part 1: departments and courses (provided)
INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
 'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3,
 'Architectural styles, design patterns, microservices and how to structure large software systems.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3,
 'Processes, threads, CPU scheduling, memory management and file systems.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,
 'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,
 'Intelligent agents, search algorithms, knowledge representation and reasoning.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,
 'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
 'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
 'Exploratory data analysis, charts, dashboards and telling stories with data.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
 'Distributed storage and processing of very large datasets with Hadoop and Spark.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
 'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

SELECT dept_id, dept_name FROM Department;
SELECT course_id, course_code FROM Course;

-- Part 2, Step 1: lecturers (10)
INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', 1),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', 1),
('VUA/ST/103', 'Mrs Funke Eze', 'f.eze@vua.edu.ng', 2),
('VUA/ST/104', 'Prof Ibrahim Danjuma', 'i.danjuma@vua.edu.ng', 2),
('VUA/ST/105', 'Dr Ngozi Nwosu', 'n.nwosu@vua.edu.ng', 3),
('VUA/ST/106', 'Dr Chinedu Obi', 'c.obi@vua.edu.ng', 3),
('VUA/ST/107', 'Dr Halima Yusuf', 'h.yusuf@vua.edu.ng', 4),
('VUA/ST/108', 'Mr Tunde Balogun', 't.balogun@vua.edu.ng', 4),
('VUA/ST/109', 'Dr Emeka Eze', 'e.eze@vua.edu.ng', 5),
('VUA/ST/110', 'Dr Zainab Lawal', 'z.lawal@vua.edu.ng', 5);

-- Part 2, Step 2: students (20, including my own record)
INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('12416', 'Eribo Nateinmibebi Franklin', NULL, NULL, 1),
('12401', 'Chiamaka Nwankwo', 'F', '2004-05-12', 1),
('12402', 'Abubakar Sadiq', 'M', '2003-09-21', 1),
('12403', 'Blessing Adeyemi', 'F', '2005-02-17', 3),
('12404', 'Emmanuel Okon', 'M', '2004-11-30', 2),
('12405', 'Fatima Garba', 'F', '2005-08-09', 3),
('12406', 'Ifeanyi Okeke', 'M', '2006-01-25', 1),
('12407', 'Hauwa Ibrahim', 'F', '2004-07-03', 4),
('12408', 'Tobi Adebayo', 'M', '2003-12-14', 2),
('12409', 'Ngozi Eze', 'F', '2005-04-28', 5),
('12410', 'Samuel Danladi', 'M', '2006-10-06', 1),
('12411', 'Yetunde Ajayi', 'F', '2007-03-19', 4),
('12412', 'Chukwuemeka Obi', 'M', '2004-06-22', 2),
('12413', 'Aisha Mohammed', 'F', '2005-12-01', 3),
('12414', 'Peter Ogundele', 'M', '2003-02-08', 5),
('12415', 'Rita Udoh', 'F', '2006-09-15', 1),
('12417', 'Musa Tanko', 'M', '2004-01-11', 3),
('12418', 'Joy Akpan', 'F', '2005-10-27', 2),
('12419', 'Daniel Yakubu', 'M', '2006-05-05', 4),
('12420', 'Esther Bako', 'F', '2004-03-30', 5);

SELECT student_id, matric_no, full_name FROM Student;
SELECT lecturer_id, full_name FROM Lecturer;

-- Part 2, Step 3: enrolments (40) and course allocations (11)
-- Students 19 and 20 have no enrolments; course 1 has two lecturers.
INSERT INTO Enrolment (student_id, course_id) VALUES
(1,1),(1,2),(1,5),(2,1),(2,3),(3,1),(3,4),(3,6),(4,1),(4,2),
(5,1),(5,5),(5,7),(6,1),(6,8),(7,2),(7,3),(8,1),(8,9),(8,10),
(9,3),(9,4),(10,5),(10,6),(11,1),(11,7),(12,8),(12,9),(13,2),(13,10),
(14,3),(14,6),(15,4),(15,5),(16,7),(16,8),(17,9),(17,10),(18,1),(18,2);

INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(1,1),(1,2),(2,2),(3,3),(4,4),(5,5),(6,6),(7,5),(8,7),(9,8),(10,9);

-- Part 3: UPDATE a record (move my student record to Computer Science)
SET SQL_SAFE_UPDATES = 0;

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '12416';
UPDATE Student SET dept_id = 2 WHERE matric_no = '12416';
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '12416';

SET SQL_SAFE_UPDATES = 1;

-- Part 4: referential integrity
-- Step 1: create a department with a student in it
INSERT INTO Department (dept_name) VALUES ('Library and Information Science');

INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('20239999', 'Transfer Student',
(SELECT dept_id FROM Department WHERE dept_name = 'Library and Information Science'));

-- Step 2: this fails with Error 1451 because a student still points to the department
SET SQL_SAFE_UPDATES = 0;

DELETE FROM Department WHERE dept_name = 'Library and Information Science';

-- Step 3: reassign the dependent student first, then the delete succeeds
UPDATE Student
SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')
WHERE matric_no = '20239999';

DELETE FROM Department WHERE dept_name = 'Library and Information Science';

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM Department;

-- Final counts
SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;