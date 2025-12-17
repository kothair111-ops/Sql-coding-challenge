CREATE DATABASE UniversityDB;
USE UniversityDB;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(100)
);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100)
);
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Students (StudentName) VALUES
('Alice'),
('Bob'),
('Clara'),
('David');
INSERT INTO Courses (CourseName) VALUES
('Computer Science'),
('Mechanical Engineering'),
('Physics'),
('History');
INSERT INTO Enrollments (StudentID, CourseID) VALUES
(1, 1), -- Alice → Computer Science
(2, 2), -- Bob → Mechanical Engineering
(3, 3), -- Clara → Physics
(4, 4); -- David → History

select*from students;
select*from courses;
select *from enrollments;
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

CREATE TABLE PastEmployees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100),
    DepartmentName VARCHAR(100)
);
INSERT INTO CurrentEmployees (EmployeeName, DepartmentName) VALUES
('Alice', 'Computer Science'),
('Bob', 'Mechanical'),
('Clara', 'Physics'),
('David', 'History');
INSERT INTO PastEmployees (EmployeeName, DepartmentName) VALUES
('Emma', 'Mathematics'),
('Bob', 'Mechanical'),   -- Bob appears in both tables
('Frank', 'Computer Science');
SELECT EmployeeName, DepartmentName
FROM CurrentEmployees
UNION
SELECT EmployeeName, DepartmentName
FROM PastEmployees;
SELECT EmployeeName, DepartmentName
FROM CurrentEmployees
UNION ALL
SELECT EmployeeName, DepartmentName
FROM PastEmployees;


-- functions--
-- Upper,lower,substring,concat--
select employeename, upper(employeename) as uppercase
from currentemployees;
select employeename,lower(employeename) as lowercase
from currentemployees;
select employeename,substring(employeename,1,2) as substringcase
from currentemployees;
select concat(employeename,'-',departmentname) as employeereport
from currentemployees;
-- date function--

ALTER TABLE CurrentEmployees
ADD HireDate DATE;
UPDATE CurrentEmployees
SET HireDate = '2018-06-15'
WHERE EmployeeID = 1;
UPDATE CurrentEmployees
SET HireDate = '2020-01-10'
WHERE EmployeeID = 2;
UPDATE CurrentEmployees
SET HireDate = '2019-09-05'
WHERE EmployeeID = 3;
UPDATE CurrentEmployees
SET HireDate = '2021-03-20'
WHERE EmployeeID = 4;
select *from currentemployees;
select employeename, year(hiredate) as hireyear
from currentemployees;
select departmentname, date(hiredate) as hiredate
from currentemployees;
SELECT EmployeeName, DATEDIFF(NOW(), HireDate) AS DaysWorked
FROM CurrentEmployees;
SELECT EmployeeName,
       HireDate,
       ROUND(DATEDIFF(NOW(), HireDate) / 365, 1) AS TenureYears
       from currentemployees;

-- user defined function--
ALTER TABLE Students
ADD FirstName VARCHAR(50),
ADD LastName VARCHAR(50);
select*from students;

DELIMITER //

CREATE FUNCTION GetFullName(fName VARCHAR(50), lName VARCHAR(50))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(100);
    
    SET result = CONCAT(fName, ' ', lName);
    
    RETURN result;
END //
DELIMITER ;
SELECT StudentID, FirstName, LastName, GetFullName(FirstName, LastName) AS FullName
FROM Students;