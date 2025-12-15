CREATE DATABASE UniversityDB;
USE UniversityDB;
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) not null,
    Faculty VARCHAR(100) not null
);
INSERT INTO Departments (DepartmentID, DepartmentName, Faculty) VALUES
(1, 'Computer Science', 'Engineering'),
(2, 'Mechanical', 'Engineering'),
(3, 'Computer Science', 'Engineering'),
(4, 'History', 'Arts'),
(5, 'History', 'Arts'),
(6, 'Physics', 'Science');
select*from departments;
SELECT DISTINCT DepartmentName
FROM Departments;
SELECT DISTINCT DepartmentName
FROM Departments
WHERE Faculty = 'Engineering';

-- students table--
Create table students(
student_id int,
studentname varchar(100),
email varchar(100)
);

INSERT INTO Students (Student_ID, StudentName, Email) VALUES
(1, 'Alice', 'alice@uni.edu'),
(2, 'Bob', NULL),
(3, 'Clara', 'clara@uni.edu'),
(4, 'David', NULL),
(5, 'Emma', 'emma@uni.edu');
select*from students;

select student_Id,studentname,email
from students
where email is null;
select student_id,studentname,email
from students
where email is not null;
alter table students
ADD GPA DECIMAL(3,2),
ADD Course VARCHAR(100);
INSERT INTO Students (Student_ID, StudentName, Email, GPA, Course)
VALUES (6, 'Alice', 'alice@uni.edu', 3.8, 'Computer Science');
select*from students;
SELECT Student_ID, StudentName, Course
FROM Students
WHERE Course IN ('Computer Science', 'Physics');
select student_id,studentname,gpa
from students
where gpa between 3.0 and 4.0;
select student_id,studentname,gpa
from students
where gpa not between 3.0 and 4.0;