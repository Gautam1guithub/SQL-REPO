-- Correlated subquery

use employees;
show tables;
select * from employees;
select * from salaries;
select * from dept_emp;
select * from departments;

-- get the emp_no and first_nAame and departmnet_no for the employees from the employee table and department_emp;

select e.emp_no, e.first_name , d.dept_no from employees as e join dept_emp as d on e.emp_no = d.emp_no;


select avg(salary), emp_no from salaries where emp_no=10001 ;

select * from salaries as sal where salary > (select avg(salary) from salaries as s
where sal.emp_no= s.emp_no);

create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);



select * from employees;

select * from employees as emp where salary>(select avg(salary) from employees as emp2
 where emp.deptid=emp2.deptid); 

select * from departments;
-- list department where at least one employee earns more than 60000?

select deptid, deptname from departments as d
where exists (select deptid from employees as e where d.deptid= e.deptid and e.salary>60000);

-- find employees who have 
select max(salary), deptid from employees group by deptid;
select * from employees as emp where salary >= (select max(salary) from employees as emp2
 where emp.deptid=emp2.deptid); 
 
 
 use regex1;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Students (StudentID, StudentName, Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'Diana', 'Mathematics'),
(5, 'Eve', 'Physics');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Algorithms', 'Computer Science'),
(201, 'Calculus', 'Mathematics'),
(202, 'Linear Algebra', 'Mathematics'),
(301, 'Quantum Mechanics', 'Physics');

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);

select * from Students;
select *  from Courses;
select * from enrollments;
 
 -- get the student name and the stundet id and the coruse name for each student;
 select s.studentname,s.studentid,c.coursename from students as s join 
 courses as c on c.department= s.department;
 
 
 -- find students who scored above the average in any course they enrolled in?
 
 select avg(grade), studentid from enrollments group by studentid;
 select * from enrollments as e where grade> (select avg(grade) from enrollments as  e1 where e.studentid= e1.studentid);

-- list all students who have the highest grade in at least one course
select max(grade) from  enrollments ;
 select * from enrollments  as s where  grade >= (select max(grade) from  enrollments as e
 where e.studentid =s.studentid );

 select * from enrollments  as s join students as S1 on s.studentid= s1.studentid  where  grade >= (select max(grade) from  enrollments as e
 where e.studentid =s.studentid );