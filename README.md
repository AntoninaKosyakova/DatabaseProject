# Educational System Database Project

A comprehensive SQL Server database system designed to manage educational institutions, including students, courses, instructors, classrooms, and assignments.

## 📋 Overview

This project implements a fully functional database for managing an educational system with role-based access control, optimized queries, stored procedures, and triggers to maintain data integrity and automate workflows.

## 🗄️ Database Schema

The database consists of the following main tables:

### Core Tables
- **Student**: Stores student information (ID, name, date of birth)
- **Instructor**: Manages instructor details and department affiliations
- **Course**: Contains course information, descriptions, and credit hours
- **Classroom**:  Tracks classroom capacity, type, and building location
- **Assignment**: Stores assignment details including due dates and maximum scores

### Relationship Tables
- **StudentCourse**: Many-to-many relationship between students and courses
- **AssignmentStudent**:  Tracks student assignment submissions and scores
- **InstructorsTeachInClassroom**: Links instructors to classrooms
- **StudentGoesToClassroom**: Maps students to their classrooms

## 🔐 Security & Access Control

### User Roles
The system implements three distinct roles with different permission levels: 

1. **Administrator**
   - Full control over the entire database
   - Can perform all CRUD operations on all tables

2. **Instructor**
   - Can view and update course information (cannot delete or insert courses)
   - Full access to assignments (SELECT, INSERT, UPDATE, DELETE)
   - Read-only access to student and classroom information
   - Can manage student assignment scores

3. **Student**
   - Read-only access to assignment information
   - Restricted from viewing other tables to maintain privacy

### Login Credentials
- Admin: `admin_login` / `StrongPassword123`
- Instructor: `instructor_login` / `InstructorPassword123`
- Student: `student_login` / `StudentPassword123`

## 📊 Database Views

### View_AssignmentDetails
Displays assignment information without exposing sensitive fields, showing: 
- Assignment title and due date
- Maximum score
- Associated course name

### ClassesWithSameStudentCount
Analyzes enrollment patterns by calculating the number of students in each class and grouping classes with the same student count.

## ⚡ Performance Optimization

The database includes several non-clustered indexes to optimize query performance: 

- `IX_Classroom_Capacity_BuildingName`: Optimizes classroom capacity filtering
- `IX_Student_StudentID_LastName`: Improves student lookup performance
- `IX_Assignment_CourseID_DueDate`: Enhances assignment queries
- `IX_Course_Credits_CourseID_Ordered`: Optimizes course credit filtering
- `IX_Instructor_CourseID`: Improves instructor-course joins

## 🔧 Stored Procedures

### GetTotalStudentsInCourse
Calculates the total number of students enrolled in a specific course. 

**Parameters:**
- `@CourseID` (INPUT): Course identifier
- `@TotalStudents` (OUTPUT): Count of enrolled students

**Usage:**
```sql
DECLARE @Total INT;
EXEC GetTotalStudentsInCourse '12', @Total OUTPUT;
PRINT 'Total Students:  ' + CAST(@Total AS VARCHAR);
```

### GetAverageScoreForStudent
Computes the average score across all assignments for a specific student.

**Parameters:**
- `@StudentID` (INPUT): Student identifier
- `@AverageScore` (OUTPUT): Average assignment score

**Usage:**
```sql
DECLARE @AvgScore DECIMAL(5,2);
EXEC GetAverageScoreForStudent @StudentID = 1, @AverageScore = @AvgScore OUTPUT;
PRINT 'Average Score: ' + CAST(@AvgScore AS VARCHAR(10));
```

## 🎯 Triggers

### trg_BeforeDeleteStudentCourse (INSTEAD OF DELETE)
Maintains an audit trail by logging all deletions from the StudentCourse table to the DeletedRecords table before performing the actual delete operation.

**Features:**
- Automatic backup of deleted records
- Error handling with TRY-CATCH blocks
- Timestamp tracking for deletions

### AfterUpdateAssignmentScore (AFTER UPDATE)
Automatically recalculates and displays a student's average score whenever an assignment score is updated.

**Functionality:**
- Triggers on AssignmentStudent updates
- Calls GetAverageScoreForStudent procedure
- Provides immediate feedback on score changes

## 📁 Project Files

- `Project-2363678-2238996.sql`: Main SQL script with complete database implementation
- `Project-2363678-2238996. drawio`: Database schema diagram
- `part_5_indexes-2363678-2238996.xlsx`: Performance analysis and index comparison

## 🚀 Getting Started

1. **Create the database:**
   ```sql
   Create database EducationalSystem;
   Use EducationalSystem;
   ```

2. **Run the SQL script:**
   Execute `Project-2363678-2238996.sql` to create all tables, relationships, and populate sample data

3. **Configure users and roles:**
   The script automatically creates login accounts and assigns appropriate permissions

4. **Test the system:**
   Use the provided sample data (20+ records per table) to test queries and procedures

## 📈 Sample Queries

The project includes optimized queries for: 
- Retrieving student assignments filtered by due date and classroom capacity
- Listing students with their courses, assignments, and instructors
- Filtering courses by credit hours
- Analyzing enrollment patterns

## 🛠️ Technologies Used

- **Database**:  Microsoft SQL Server (T-SQL)
- **Tools**: SQL Server Management Studio (SSMS)
- **Documentation**: Draw.io for ER diagrams

## 👥 Contributors

I worked on this project with my classmate - Alaa Kirdi
Both of us touched every aspect of this project

## 📝 License

This is an educational project for database management coursework. 
