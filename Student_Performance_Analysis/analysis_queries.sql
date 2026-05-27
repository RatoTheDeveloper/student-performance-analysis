--Display the tables.
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

--Display full names (first and last name combined) and ages of all students.
SELECT first_name + ' ' + last_name AS full_name, age FROM Students;

--Display students older than 20 years old.
SELECT * FROM Students WHERE Age > 20;

--Write an UPDATE command to change the grade of the enrollment where enrollment_id is 5 to 'A+' then display the updated Enrollments table.
UPDATE Enrollments SET grade = 'A+' WHERE enrollment_id = 5;
SELECT * FROM Enrollments;

--Write a DELETE command to remove the enrollment where enrollment_id is 9.
DELETE FROM Enrollments WHERE enrollment_id = 9;
SELECT * FROM Enrollments;

--Retrieve all students whose last name starts with 'J' or 'D'.
SELECT * FROM Students WHERE last_name LIKE 'J%' OR last_name LIKE 'D%';

--Show all course information for modules with credits greater than 2.
SELECT * FROM Courses WHERE credits > 2;

--Write a query to show the total number of enrollments, the average age of all students and the maximum credits among all courses.
SELECT COUNT(*) AS total_enrollments FROM Enrollments;
SELECT AVG(age) AS average_age FROM Students;
SELECT MAX(credits) AS max_credits FROM Courses;

--Add a new student to the Students table with Student_id 6, first name 'David', last name 'Wilson',gender 'Male', age 24 and display the updated Students table.
INSERT INTO Students (first_name, last_name, age, gender) VALUES
('David', 'Wilson', 24, 'Male');
SELECT * FROM Students;

--For each student who has enrolled in a course, display their full name, the course name, and the grade they received Sort the results by student name.
SELECT s.first_name + ' ' + s.last_name AS full_name, c.course_name, e.grade
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id
ORDER BY s.first_name, s.last_name;

--From each course, display the course name and the number of students enrolled in that course. Include courses with zero enrollments and sort the results by course name.
SELECT c.course_name, COUNT(e.enrollment_id) AS student_Count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY c.course_name;

--Display first_name, last_name and course_name for students who are enrolled in courses with more than or equal to 5 credits.
SELECT s.first_name, s.last_name, c.course_name, c.credits
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id
WHERE c.credits >= 5;

--Retrieve all students who are not enrolled in any courses.
SELECT s.first_name, s.last_name, s.gender, s.age
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

--Find the top 2 courses with the highest credits and display their course name and credits.
SELECT TOP 2 course_name, credits
FROM Courses
ORDER BY credits DESC;

--For each student, show the student's full name (first and last name combined) and the total number of courses they are enrolled in. Include students who have never enrolled in any courses (show total as 0) and sort the results by the total number of courses in descending order.
SELECT s.first_name + ' ' + s.last_name AS full_name, COALESCE(COUNT(e.enrollment_id), 0) AS total_courses
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.first_name, s.last_name
ORDER BY total_courses DESC;

--Create a stored procedure that takes a student's first name and last name as input parameters and returns the courses they are enrolled in along with their grades.
CREATE PROCEDURE GetStudentCourses
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50)
AS
BEGIN
    SELECT s.first_name + ' ' + s.last_name AS full_name, c.course_name, e.grade
    FROM Students s
    INNER JOIN Enrollments e ON s.student_id = e.student_id
    INNER JOIN Courses c ON e.course_id = c.course_id
    WHERE s.first_name = @FirstName AND s.last_name = @LastName;
END;
EXEC GetStudentCourses 'John', 'Doe';