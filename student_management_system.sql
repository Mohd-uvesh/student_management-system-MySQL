-- Student Management System (MySQL Project)

-- Create Database
CREATE DATABASE StudentDB;

-- Use Database
USE StudentDB;

-- Students Table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE,
    Phone VARCHAR(20),
    EnrollmentDate DATE DEFAULT (CURRENT_DATE)
);

-- Courses Table
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL
);

-- Enrollments Table (Relationship between Students and Courses)
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollDate DATE DEFAULT (CURRENT_DATE),
    Grade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert Students
INSERT INTO Students (FirstName, LastName, Email, Phone) VALUES
('Amit', 'Sharma', 'amit@example.com', '9991112222'),
('Priya', 'Verma', 'priya@example.com', '8882223333'),
('Rahul', 'Khan', 'rahul@example.com', '7773334444');

-- Insert Courses
INSERT INTO Courses (CourseName, Credits) VALUES
('Database Systems', 4),
('Web Development', 3),
('Data Structures', 4);

-- Insert Enrollments
INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 1, 'A'),
(1, 2, 'B'),
(2, 1, 'A'),
(3, 3, 'C');

-- Queries

-- List all Students
SELECT * FROM Students;

-- List all Courses
SELECT * FROM Courses;

-- Show Students with their Courses and Grades
SELECT s.FirstName, s.LastName, c.CourseName, e.Grade
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;

-- Show Course history of a Student (StudentID = 1)
SELECT c.CourseName, e.Grade
FROM Enrollments e
JOIN Courses c ON e.CourseID = c.CourseID
WHERE e.StudentID = 1;
