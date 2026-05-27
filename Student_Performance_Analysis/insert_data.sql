INSERT INTO Students (first_name, last_name, gender, age) VALUES 
('John', 'Doe', 'Male', 20),
('Pearl', 'Smith', 'Female', 22),
('Emily', 'Johnson', 'Female', 21),
('Michael', 'Brown', 'Male', 19),
('Sarah', 'Davis', 'Female', 20);

INSERT INTO Courses (course_name, course_code, credits) VALUES 
('Mathematics', 'MATH101', 3),
('Physics', 'PHYS102', 4),
('Chemistry', 'CHEM103', 5),
('Biology', 'BIOL104', 6),
('Computer Science', 'COMP105', 7),
('History', 'HIST106', 2);

INSERT INTO Enrollments (student_id, course_id, grade) VALUES 
(1, 101, 'A'),
(3, 105, 'A+'),
(1, 102, 'B'),
(2, 101, 'A'),
(3, 104, 'B+'),
(4, 102, 'C'),
(4, 106, 'B+'),
(2, 103, 'A'),
(5, 105, 'A+');

