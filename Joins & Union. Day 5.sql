CREATE DATABASE University;
USE University;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(100)
    );
    
INSERT INTO Students (StudentName) VALUES
('Alice'),
('Bob'),
('Clara'),
('David');
Select*from students;
    
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100)
);

INSERT INTO Courses (CourseName) VALUES
('Computer Science'),
('Mechanical Engineering'),
('Physics'),
('History');

select *from courses;

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
INSERT INTO Enrollments (StudentID, CourseID) VALUES
(1, 1), -- Alice → Computer Science
(2, 2), -- Bob → Mechanical Engineering
(3, 3), -- Clara → Physics
(4, 4); -- David → History
select *from enrollments;


-- Joins & Union --
SELECT s.StudentName, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;
SELECT s.StudentName, c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID;

CREATE TABLE CurrentEmployees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100),
    DepartmentName VARCHAR(100)
);

INSERT INTO CurrentEmployees (EmployeeName, DepartmentName) VALUES
('Alice', 'Computer Science'),
('Bob', 'Mechanical'),
('Clara', 'Physics'),
('David', 'History');
select * from currentemployees;

CREATE TABLE PastEmployees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100),
    DepartmentName VARCHAR(100)
);

INSERT INTO PastEmployees (EmployeeName, DepartmentName) VALUES
('Emma', 'Mathematics'),
('Bob', 'Mechanical'),   
('Frank', 'Computer Science');
select * from pastemployees;

-- union & union all--

SELECT EmployeeName, DepartmentName
FROM CurrentEmployees
UNION
SELECT EmployeeName, DepartmentName
FROM PastEmployees;

select employeename, departmentname
from currentemployees
union all
select employeename,departmentname
from pastemployees;