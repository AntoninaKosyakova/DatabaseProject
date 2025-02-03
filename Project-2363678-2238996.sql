Create database EducationalSystem;
Use EducationalSystem;

-- Table: Student
CREATE TABLE Student (
    StudentID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL
);

-- Table: Classroom
CREATE TABLE Classroom (
    ClassroomID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    Capacity INT NOT NULL CHECK (Capacity > 0),
    RoomType VARCHAR(50) NOT NULL,
    BuildingName VARCHAR(50) NOT NULL
);

-- Table: Instructor
CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Table: Course
CREATE TABLE Course (
    CourseID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    CourseName VARCHAR(100) NOT NULL,
    CourseDescription VARCHAR(200) NULL,
    Credits TINYINT NOT NULL CHECK (Credits > 0),
	ClassroomID INT NOT NULL,
	FOREIGN KEY (ClassroomID) REFERENCES Classroom(ClassroomID)
);

-- Table: Assignment
CREATE TABLE Assignment (
    AssignmentID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    Title VARCHAR(100) NOT NULL,
    MaxScore DECIMAL(6,2) NULL DEFAULT 0.0,
    DueDate DATE NOT NULL,
    CourseID INT NOT NULL,
	FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Many-to-Many Relationship: Student-Course (StudentCourse table)
CREATE TABLE StudentCourse (
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE AssignmentStudent (
    StudentID INT NOT NULL,
    AssignmentID INT NOT NULL,
    Score DECIMAL(5,2)  NULL DEFAULT 0.0,
    PRIMARY KEY (StudentID, AssignmentID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (AssignmentID) REFERENCES Assignment(AssignmentID)
);

-- Many-to-Many Relationship: Instructor-Classroom (InstructorsTeachInClassroom table)
CREATE TABLE InstructorsTeachInClassroom (
    InstructorID INT NOT NULL,
    ClassroomID INT NOT NULL,
    PRIMARY KEY (InstructorID, ClassroomID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID),
    FOREIGN KEY (ClassroomID) REFERENCES Classroom(ClassroomID)
);

-- Many-to-Many Relationship: Student-Classroom (StudentGoesToClassroom table)
CREATE TABLE StudentGoesToClassroom (
    StudentID INT NOT NULL,
    ClassroomID INT NOT NULL,
    PRIMARY KEY (StudentID, ClassroomID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ClassroomID) REFERENCES Classroom(ClassroomID)
);


-- Populate Tables with a Minimum of 20 Rows Each



INSERT INTO Student (FirstName, LastName, DateOfBirth)
SELECT FirstName, LastName, DateOfBirth 
FROM Student;


-- Populate Student Table
INSERT INTO Student (FirstName, LastName, DateOfBirth) VALUES
('Alice', 'Smith', '2001-01-15'),
('Bob', 'Johnson', '2000-06-20'),
('Charlie', 'Williams', '1999-08-11'),
('Diana', 'Jones', '1998-09-12'),
('Edward', 'Brown', '2001-03-05'),
('Fiona', 'Davis', '2002-12-22'),
('George', 'Miller', '2000-10-10'),
('Hannah', 'Wilson', '2003-07-07'),
('Ian', 'Moore', '1999-04-18'),
('Jasmine', 'Taylor', '2002-11-25'),
('Kevin', 'Anderson', '1998-05-15'),
('Laura', 'Thomas', '2001-01-19'),
('Mike', 'Jackson', '1999-06-30'),
('Nina', 'White', '2000-09-09'),
('Oscar', 'Martin', '2001-02-14'),
('Paul', 'Lee', '2000-03-18'),
('Quinn', 'Harris', '1998-08-23'),
('Rachel', 'Clark', '2001-12-01'),
('Steve', 'Walker', '1999-10-29'),
('Tina', 'Hall', '2000-11-13');

INSERT INTO Classroom (Capacity, RoomType, BuildingName)
SELECT Capacity, RoomType, BuildingName
FROM Classroom;


-- Populate Classroom Table
INSERT INTO Classroom (Capacity, RoomType, BuildingName) VALUES
(30, 'Lecture Hall', 'Science Building'),
(25, 'Lab', 'Engineering Building'),
(40, 'Seminar Room', 'Humanities Building'),
(20, 'Computer Lab', 'Tech Center'),
(50, 'Auditorium', 'Main Hall'),
(35, 'Lecture Hall', 'Business School'),
(45, 'Seminar Room', 'Law School'),
(30, 'Lab', 'Medical Center'),
(20, 'Seminar Room', 'Library'),
(60, 'Lecture Hall', 'Art Center'),
(40, 'Lab', 'Science Building'),
(25, 'Seminar Room', 'Engineering Building'),
(35, 'Lecture Hall', 'Humanities Building'),
(30, 'Computer Lab', 'Tech Center'),
(50, 'Auditorium', 'Main Hall'),
(45, 'Seminar Room', 'Business School'),
(40, 'Lab', 'Medical Center'),
(20, 'Seminar Room', 'Library'),
(55, 'Lecture Hall', 'Art Center'),
(30, 'Lab', 'Science Building');

-- Populate Instructor Table
INSERT INTO Instructor (FirstName, LastName, DepartmentName) VALUES
('John', 'Smith', 'Mathematics'),
('Emily', 'Johnson', 'Physics'),
('Michael', 'Brown', 'Biology'),
('Sarah', 'Davis', 'Chemistry'),
('David', 'Williams', 'Computer Science'),
('Jessica', 'Wilson', 'History'),
('Chris', 'Miller', 'Economics'),
('Emma', 'Taylor', 'Psychology'),
('James', 'Moore', 'Philosophy'),
('Sophia', 'Anderson', 'Political Science'),
('Daniel', 'Clark', 'Music'),
('Olivia', 'Jackson', 'Theatre'),
('Liam', 'Thomas', 'Anthropology'),
('Isabella', 'Martin', 'Statistics'),
('Noah', 'Lee', 'Astronomy'),
('Ava', 'Harris', 'Marketing'),
('William', 'Walker', 'Accounting'),
('Mia', 'White', 'Social Studies'),
('Elijah', 'Hall', 'Art History'),
('Charlotte', 'Harris', 'Ethics');




-- Populate Course Table
INSERT INTO Course (CourseName, CourseDescription, Credits, ClassroomID) VALUES
('Algebra', 'Introduction to Algebra', 3, 1),
('Geometry', 'Foundations of Geometry', 3, 2),
('Biology 101', 'Introductory Biology', 4, 3),
('Chemistry 101', 'Introductory Chemistry', 4, 4),
('Physics 101', 'Introductory Physics', 4, 5),
('World History', 'Overview of World History', 3, 6),
('Programming 101', 'Basics of Programming', 3, 7),
('Economics 101', 'Principles of Economics', 3, 8),
('Art History', 'History of Art', 2, 9),
('Psychology 101', 'Foundations of Psychology', 3, 10),
('Ethics', 'Philosophy of Ethics', 3, 11),
('Social Studies', 'Understanding Social Dynamics', 3, 12),
('Financial Accounting', 'Introduction to Accounting', 3, 13),
('Marketing Principles', 'Basics of Marketing', 3, 14),
('Statistics 101', 'Introductory Statistics', 3, 15),
('Astronomy 101', 'Exploration of Space', 3, 16),
('Music Theory', 'Basics of Music Theory', 2, 17),
('Theatre Arts', 'Introduction to Theatre', 2, 18),
('Political Science 101', 'Basics of Political Science', 3, 19),
('Cultural Anthropology', 'Intro to Cultural Anthropology', 3, 20);

INSERT INTO Course (CourseName, CourseDescription, Credits, ClassroomID)
SELECT  CourseName, CourseDescription, Credits, ClassroomID
FROM Course;
INSERT INTO  Assignment (Title, MaxScore, DueDate, CourseID)
SELECT  Title, MaxScore, DueDate, CourseID
FROM Assignment;


-- Populate Assignment Table
INSERT INTO Assignment (Title, MaxScore, DueDate, CourseID) VALUES
('Algebra Homework 1', 100.00, '2024-01-15', 1),
('Geometry Quiz', 50.00, '2024-01-20', 2),
('Biology Lab Report', 100.00, '2024-01-25', 3),
('Chemistry Homework 1', 100.00, '2024-01-30', 4),
('Physics Midterm', 200.00, '2024-02-05', 5),
('History Essay', 100.00, '2024-02-10', 6),
('Programming Project', 150.00, '2024-02-15', 7),
('Economics Case Study', 100.00, '2024-02-20', 8),
('Art Presentation', 50.00, '2024-02-25', 9),
('Psychology Experiment', 150.00, '2024-03-01', 10),
('Ethics Debate', 100.00, '2024-03-05', 11),
('Social Studies Quiz', 50.00, '2024-03-10', 12),
('Accounting Exam', 150.00, '2024-03-15', 13),
('Marketing Plan', 100.00, '2024-03-20', 14),
('Statistics Analysis', 150.00, '2024-03-25', 15),
('Astronomy Project', 100.00, '2024-03-30', 16),
('Music Composition', 100.00, '2024-04-05', 17),
('Theatre Performance', 200.00, '2024-04-10', 18),
('Political Science Essay', 100.00, '2024-04-15', 19),
('Anthropology Presentation', 100.00, '2024-04-20', 20);

-- Populate StudentCourse Table
INSERT INTO StudentCourse (StudentID, CourseID) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
(16, 16), (17, 17), (18, 18), (19, 19), (20, 20);


-- Populate AssignmentStudent Table
INSERT INTO AssignmentStudent (StudentID, AssignmentID, Score) VALUES
(1, 1, 85.50), (2, 2, 90.00), (3, 3, 78.25), (4, 4, 88.00), (5, 5, 92.75),
(6, 6, 85.00), (7, 7, 79.50), (8, 8, 91.25), (9, 9, 84.00), (10, 10, 88.50),
(11, 11, 87.00), (12, 12, 85.25), (13, 13, 93.75), (14, 14, 80.00), (15, 15, 89.50),
(16, 16, 78.00), (17, 17, 90.25), (18, 18, 88.00), (19, 19, 85.00), (20, 20, 92.50);



-- Populate InstructorsTeachInClassroom Table
INSERT INTO InstructorsTeachInClassroom (InstructorID, ClassroomID) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
(16, 16), (17, 17), (18, 18), (19, 19), (20, 20);

-- Populate StudentGoesToClassroom Table
INSERT INTO StudentGoesToClassroom (StudentID, ClassroomID) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
(16, 16), (17, 17), (18, 18), (19, 19), (20, 20);


--part 4

--Users + Roles:

-- Create login accounts and users for every member of your team:

-- Logins
-- Drop logins if they already exist
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'admin_login')
    DROP LOGIN admin_login;

IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'instructor_login')
    DROP LOGIN instructor_login;

IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'student_login')
    DROP LOGIN student_login;

-- Create new logins
CREATE LOGIN admin_login WITH PASSWORD = 'StrongPassword123';
CREATE LOGIN instructor_login WITH PASSWORD = 'InstructorPassword123';
CREATE LOGIN student_login WITH PASSWORD = 'StudentPassword123';



-- Users for each login
CREATE USER admin_user FOR LOGIN admin_login;
CREATE USER instructor_user FOR LOGIN instructor_login;
CREATE USER student_user FOR LOGIN student_login;


---three different roles: Administrator, instructor, students
-- Create roles
CREATE ROLE Administrator;
CREATE ROLE Instructor;
CREATE ROLE Student;

-- Assign users to roles
ALTER ROLE Administrator ADD MEMBER admin_user;
ALTER ROLE Instructor ADD MEMBER instructor_user;
ALTER ROLE Student ADD MEMBER student_user;

-- Grant permissions to Administrator role (Administrator should be able to access everything, said in the instructions)
GRANT CONTROL ON DATABASE::EducationalSystem TO Administrator;


--cannot delete or insert another course from the database
GRANT SELECT, UPDATE ON Course TO Instructor;

--can view information about the assignments, add a new assignment, update the requirement/content(description, MaxScore), and delete the assignment because they have the authority in the educational system
GRANT SELECT, INSERT, UPDATE, DELETE ON Assignment TO Instructor;
GRANT SELECT, INSERT, UPDATE, DELETE ON AssignmentStudent TO Instructor;
--read data from student
GRANT SELECT ON Student TO Instructor;
--see information about the classroom
GRANT SELECT ON Classroom TO Instructor;


--Students are granted read-only access to Assignment on requirements and their submission.
-- Students are not allowed to view any other table’s information because the privacy is restricted in the school’s rules
GRANT SELECT ON Assignment TO Student;



--Views

--View_AssignmentDetails: Displays assignment information without exposing sensitive fields –(accessible to students and instructors).
CREATE VIEW View_AssignmentDetails AS
SELECT Title, DueDate, MaxScore, CourseName 
FROM Assignment, Course
WHERE Assignment.CourseId = Course.CourseID;

--This view shows all courses a student is enrolled in:
--The ClassesWithSameStudentCount view calculates the number of students in each class and groups the classes that have the same student count, returning the total number of classes
CREATE VIEW ClassesWithSameStudentCount AS
SELECT 
    COUNT(sa.StudentID) AS StudentCount,   -- Number of students in each class
    COUNT(DISTINCT c.CourseID) AS ClassCount  -- Number of classes with that student count
FROM Course c
JOIN AssignmentStudent sa ON c.CourseID = sa.AssignmentID
GROUP BY c.CourseID
HAVING COUNT(sa.StudentID) > 0;

-- Drop the existing view if it exists
IF OBJECT_ID('ClassesWithSameStudentCount', 'V') IS NOT NULL
    DROP VIEW ClassesWithSameStudentCount;
GO
 
-- Create the updated view
CREATE VIEW ClassesWithSameStudentCount AS
SELECT 
    StudentCount,
    COUNT(*) AS ClassCount
FROM (
    SELECT 
        sc.CourseID,
        COUNT(sc.StudentID) AS StudentCount
    FROM 
        StudentCourse sc
    GROUP BY 
        sc.CourseID
) AS StudentClassCounts
GROUP BY 
    StudentCount
HAVING 
    StudentCount > 0;

-- Grant view specific permissions
--Allows Students, Instructors, and Administrators to view assignment details without modifying them
GRANT SELECT ON View_AssignmentDetails TO Student, Instructor, Administrator;

--Allows Students and Administrators to view student enrollment and course information.
GRANT SELECT ON StudentCoursesView TO Student, Administrator;
GRANT SELECT ON ClassesWithSameStudentCount TO Instructor, Administrator;


--part 5

Set statistics Time, IO on
DBCC FreeProcCache 
DBCC DropCleanBuffers 

--information about students and their assignments, along with the details of the courses and the classrooms in which those courses are taught
--filters for assignments with a due date between 2024-01-01 and 2024-03-01.
--The query only includes classrooms with a capacity greater than 30.

SELECT s.StudentID, s.FirstName, s.LastName, a.Title, a.DueDate, c.CourseName, cl.BuildingName
FROM Student s
JOIN Assignment a ON s.StudentID = a.CourseID
JOIN Course c ON a.CourseID = c.CourseID
JOIN Classroom cl ON c.ClassroomID = cl.ClassroomID
WHERE a.DueDate BETWEEN '2024-01-01' AND '2024-03-01'
  AND cl.Capacity > 30;


-- Create a non-clustered index on Classroom.Capacity and Classroom.BuildingName
CREATE NONCLUSTERED INDEX IX_Classroom_Capacity_BuildingName
ON Classroom (Capacity, BuildingName);

--if you want to drop an index: (for demo)
--DROP INDEX IF EXISTS IX_Classroom_Capacity_BuildingName ON Classroom;

--before and after is in excel

--This query retrieves a list of students, their assignments, the courses they are enrolled in, and 
--the associated instructors, filtered by courses that have 3 or more credits, and orders the 
--results by assignment due date and student last name.

Set statistics Time, IO on
 DBCC FreeProcCache 
DBCC DropCleanBuffers 
SELECT 
    s.StudentID,
    s.FirstName AS StudentFirstName,
    s.LastName AS StudentLastName,
    a.Title AS AssignmentTitle,
    a.DueDate,
    c.CourseName,
    c.Credits,
    i.FirstName AS InstructorFirstName,
    i.LastName AS InstructorLastName,
    i.DepartmentName
FROM Student s
JOIN Assignment a ON s.StudentID = a.CourseID
JOIN Course c ON a.CourseID = c.CourseID
JOIN Instructor i ON c.CourseID = i.InstructorID
WHERE c.Credits >= 3
ORDER BY a.DueDate, s.LastName;

CREATE NONCLUSTERED INDEX IX_Student_StudentID_LastName
ON Student (StudentID)
INCLUDE (FirstName, LastName); -- Include columns from SELECT clause

CREATE NONCLUSTERED INDEX IX_Assignment_CourseID_DueDate
ON Assignment (CourseID, DueDate)
INCLUDE (Title); -- Include only necessary columns


CREATE NONCLUSTERED INDEX IX_Course_Credits_CourseID_Ordered
ON Course (Credits ASC, CourseID) -- ASC for efficient filtering
INCLUDE (CourseName);            -- Include columns for SELECT clause

CREATE NONCLUSTERED INDEX IX_Instructor_CourseID
ON Instructor (InstructorID) -- Primary join key
INCLUDE (FirstName, LastName, DepartmentName); -- Columns from SELECT clause


--part 6

--Stored Procedure 1: Get the Total Number of Students Enrolled in a Course
--This stored procedure will return the total number of students enrolled in a particular course based on the course ID.
CREATE PROCEDURE GetTotalStudentsInCourse
    @CourseID VARCHAR(10),  -- Input parameter for CourseID
    @TotalStudents INT OUTPUT  -- Output parameter to return the number of students
AS
BEGIN
    -- Count the number of students enrolled in the course
    SELECT @TotalStudents = COUNT(*) 
    FROM StudentCourse
    WHERE CourseID = @CourseID;
    
    -- Return the total number of students
    RETURN @TotalStudents;
END;

--Input Parameter: @CourseID specifies the course for which the total number of students is calculated.
--Output Parameter: @TotalStudents stores the result, the count of students in the specified course.
--Return Value: The stored procedure returns the number of students enrolled in the course as an integer value.

--Usage Example:
DECLARE @Total INT;

-- Execute the procedure to get the total number of students in course '12'
EXEC GetTotalStudentsInCourse '12', @Total OUTPUT;

-- Print the result 
PRINT 'Total Students: ' + CAST(@Total AS VARCHAR);


--Stored Procedure 2: Get Average Assignment Score for a Student
--This stored procedure calculates and returns the average score of all assignments submitted by a specific student.

CREATE PROCEDURE GetAverageScoreForStudent
    @StudentID INT,              -- Input parameter for StudentID
    @AverageScore DECIMAL(5,2) OUTPUT -- Output parameter for average score
AS
BEGIN
    -- Calculate the average score of assignments for the student
    SELECT @AverageScore = AVG(Score)
    FROM AssignmentStudent
    WHERE StudentID = @StudentID;

    -- Return the average score
    RETURN @AverageScore;
END;

--Example Usage:
-- Declare a variable to store the output value
DECLARE @AvgScore DECIMAL(5,2);

-- Execute the stored procedure to get the average score for student 1
EXEC GetAverageScoreForStudent @StudentID = 1, @AverageScore = @AvgScore OUTPUT;

-- Print the result 
PRINT 'Average Score for Student: ' + CAST(@AvgScore AS VARCHAR(10));

--Input Parameter: @StudentID specifies the student whose average score is calculated.
--Output Parameter: @AverageScore holds the calculated average score.
--Return Value: Returns the average score as a decimal.






--part 7

--before delete
-- Drop the DeletedRecords table if it exists
IF OBJECT_ID('dbo.DeletedRecords', 'U') IS NOT NULL
    DROP TABLE DeletedRecords;

-- Create an audit table to store deleted records
CREATE TABLE DeletedRecords (
    RecordID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    DeletedAt DATETIME DEFAULT GETDATE()
);

-- Drop the trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'trg_BeforeDeleteStudentCourse')
    DROP TRIGGER trg_BeforeDeleteStudentCourse;

--This trigger ensures that before deleting records from the StudentCourse table, the deleted data is logged in the DeletedRecords audit table while handling potential errors gracefully.
-- Create the trigger
CREATE TRIGGER trg_BeforeDeleteStudentCourse
ON StudentCourse
INSTEAD OF DELETE
AS
BEGIN
    -- Declare variables to store values from DELETED rows
    DECLARE @StudentID INT;
    DECLARE @CourseID INT;

    -- Use a cursor to loop through the DELETED table
    DECLARE deleteCursor CURSOR FOR
    SELECT StudentID, CourseID
    FROM DELETED;

    BEGIN TRY
        -- Open the cursor
        OPEN deleteCursor;

        -- Fetch the first row from the cursor
        FETCH NEXT FROM deleteCursor INTO @StudentID, @CourseID;

        -- Loop through each row in the cursor
        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Insert the deleted record into the DeletedRecords table
            INSERT INTO DeletedRecords (StudentID, CourseID)
            VALUES (@StudentID, @CourseID);

            -- Perform the actual delete operation
            DELETE FROM StudentCourse
            WHERE StudentID = @StudentID
              AND CourseID = @CourseID;

            -- Fetch the next row from the cursor
            FETCH NEXT FROM deleteCursor INTO @StudentID, @CourseID;
        END

        -- Close and deallocate the cursor
        CLOSE deleteCursor;
        DEALLOCATE deleteCursor;

    END TRY
    BEGIN CATCH
        -- Handle errors and print a simple message
        PRINT 'An error occurred: ' + ERROR_MESSAGE();
        -- Ensure the cursor is cleaned up in case of an error
        IF CURSOR_STATUS('GLOBAL', 'deleteCursor') >= 0
        BEGIN
            CLOSE deleteCursor;
            DEALLOCATE deleteCursor;
        END
    END CATCH
END;


-- Insert sample data into Student table with required DateOfBirth
INSERT INTO Student (FirstName, LastName, DateOfBirth) 
VALUES ('John', 'Doe', '2000-01-01');

-- Insert sample data into Classroom table to reference a valid ClassroomID
INSERT INTO Classroom (BuildingName, Capacity, RoomType) 
VALUES ('Main Building', 50, 'Lecture Hall');

-- Insert sample data into Course table with required ClassroomID and Credits (modify CourseName to avoid duplicate)
INSERT INTO Course (CourseName, ClassroomID, Credits) 
VALUES ('Math 104', 1, 3);  -- Use a unique course name, e.g., 'Math 101'

-- Insert sample data into StudentCourse table
INSERT INTO StudentCourse (StudentID, CourseID) 
VALUES (1, 3);

-- Delete a record from StudentCourse to trigger the trigger
DELETE FROM StudentCourse WHERE StudentID = 1 AND CourseID = 3;

-- Check the DeletedRecords table for logged data
SELECT * FROM DeletedRecords;



--after update

--This trigger will execute after an update to the AssignmentStudent table. After a student's score is updated, it will call the GetAverageScoreForStudent procedure to calculate the student's new average score.
-- Drop the trigger if it already exists
IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'AfterUpdateAssignmentScore' AND parent_class_desc = 'OBJECT_OR_COLUMN')
    DROP TRIGGER AfterUpdateAssignmentScore;

-- Create the trigger
CREATE TRIGGER AfterUpdateAssignmentScore
ON AssignmentStudent
FOR UPDATE
AS
BEGIN
    DECLARE @StudentID INT, @AvgScore DECIMAL(5,2);
    
    -- Get the StudentID of the updated record
    SELECT @StudentID = StudentID FROM inserted;

    -- Call the GetAverageScoreForStudent procedure to get the updated average score
    EXEC GetAverageScoreForStudent @StudentID, @AvgScore OUTPUT;

    -- Print the updated average score for the student
    PRINT 'Updated Average Score for Student ' + CAST(@StudentID AS VARCHAR) + ': ' + CAST(@AvgScore AS VARCHAR);
END;


--The trigger is activated after an UPDATE operation on the AssignmentStudent table.
--It uses the inserted pseudo-table to fetch the StudentID of the record being updated.
--The trigger then calls the GetAverageScoreForStudent stored procedure to calculate the new average score for the student.
--It prints the updated average score. 

--testing
UPDATE AssignmentStudent
SET Score = 95
WHERE StudentID = 1 AND AssignmentID = 1;
