-- Assignment 2 (SQL)
-- Load the provided dataset into your database
CREATE DATABASE StudentsDB;

USE StudentsDB;

---------------------------------------------------------------
-- (A) Basic Questions
-- 1. Query the total number of records.
SELECT COUNT(*) AS [Total Records]
FROM   student_grades;

-- 2. Query the average grade of all students.
SELECT AVG(Grade) AS [Average Grades]
FROM   student_grades;

-- 3. Query the highest grade obtained.
SELECT MAX(Grade) AS [Highest Grade]
FROM   student_grades;

-- 4. Query the lowest grade obtained.
SELECT MIN(Grade) AS [Lowest Grade]
FROM   student_grades;

-- 5. Query the number of distinct students.
SELECT COUNT(DISTINCT StudentID) AS [Total students]
FROM   student_grades;

-- 6. Query the average grade for each course.
SELECT   CourseID,
         AVG(Grade) AS [Average Grades]
FROM     student_grades
GROUP BY CourseID;

-- 7. Query the number of students in each department.
SELECT   Department,
         COUNT(DISTINCT StudentID) AS [Total students]
FROM     student_grades
GROUP BY Department;

-- 8. Query the maximum grade for each course.
SELECT   CourseID,
         MAX(Grade) AS [Maximum Grade]
FROM     student_grades
GROUP BY CourseID;

-- 9. Query the minimum grade for each department.
SELECT   Department,
         MIN(Grade) AS [Minimum Grade]
FROM     student_grades
GROUP BY Department;

-- 10. Query the number of courses taken by each student.
SELECT   StudentID,
         COUNT(CourseID) AS [Total courses]
FROM     student_grades
GROUP BY StudentID;

---------------------------------------------------------------
-- (B) Intermediate Questions
-- 11. Query courses where the average grade is greater than 75.
SELECT   CourseID,
         AVG(Grade) AS [Average Grades]
FROM     student_grades
GROUP BY CourseID
HAVING   AVG(Grade) > 75;

-- 12. Query students who have taken more than 3 courses.
SELECT   StudentID,
         COUNT(CourseID) AS [Total Courses]
FROM     student_grades
GROUP BY StudentID
HAVING   COUNT(CourseID) > 3;

-- 13. Query departments where the average grade is less than 65.
SELECT   Department,
         AVG(Grade) AS [Average Grades]
FROM     student_grades
GROUP BY Department
HAVING   AVG(Grade) < 65;

-- 14. Query students whose maximum grade is 100.
SELECT   StudentID,
         MAX(Grade) AS [Maximum Grade]
FROM     student_grades
GROUP BY StudentID
HAVING   MAX(Grade) = 100;

-- 15. Query courses that have been taken by at least 20 students.
SELECT   CourseID,
         COUNT(StudentID) AS [Total Students]
FROM     student_grades
GROUP BY CourseID
HAVING   COUNT(*) >= 20;

---------------------------------------------------------------
-- (C) Advanced Questions
-- 16. Query students who have taken at least 4 courses and whose average grade is greater than 80.
SELECT   StudentID,
         COUNT(CourseID) AS [Total Courses],
         AVG(Grade) AS [Average Grades]
FROM     student_grades
GROUP BY StudentID
HAVING   COUNT(CourseID) >= 4
         AND AVG(Grade) > 80;

-- 17. Query departments where the maximum grade is at least twice the average grade.
SELECT   Department,
         MAX(Grade) AS [Maximum Grade],
         AVG(Grade) AS [Average Grades]
FROM     student_grades
GROUP BY Department
HAVING   MAX(Grade) >= 2 * AVG(Grade);

-- 18. Query courses whose average grade is higher than the overall average grade.
SELECT   CourseID,
         AVG(Grade) AS [Average Grades]
FROM     student_grades
GROUP BY CourseID
HAVING   AVG(Grade) > (SELECT AVG(Grade)
                       FROM   student_grades);

-- 19 - 20. Query students whose lowest grade is greater than 70.
SELECT   StudentID,
         MIN(Grade) AS [Lowest Grade]
FROM     student_grades
GROUP BY StudentID
HAVING   MIN(Grade) > 70;

