CREATE TABLE EmployeeDetails (
    EmpId INT PRIMARY KEY,
    FullName VARCHAR(255),
    ManagerId INT,
    DateOfJoining DATE,
    City VARCHAR(100)
);

CREATE TABLE EmployeeSalary (
    EmpId INT PRIMARY KEY,
    Project VARCHAR(255),
    Salary DECIMAL(10, 2),
    Variable DECIMAL(10, 2)
);
1.Fetch records that are present in one table but not in another table:
SELECT * FROM EmployeeDetails
WHERE EmpId NOT IN (SELECT EmpId FROM EmployeeSalary);
2.Fetch all employees who are not working on any project:
SELECT * FROM EmployeeDetails
WHERE EmpId NOT IN (SELECT EmpId FROM EmployeeSalary);
3.Fetch all the employees who joined in the Year 2020:
SELECT * FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;
4.Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary:
sql
SELECT ed.*
FROM EmployeeDetails ed
INNER JOIN EmployeeSalary es ON ed.EmpId = es.EmpId;
5.Write an SQL query to fetch a project-wise count of employees:
SELECT Project, COUNT(*) AS EmployeeCount
FROM EmployeeSalary
GROUP BY Project;
6.Fetch employee names and salaries even if the salary value is not present for the employee:
SELECT ed.FullName, COALESCE(es.Salary, 0) AS Salary
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.EmpId = es.EmpId;
7.Write an SQL query to fetch all the Employees who are also managers
SELECT ed.*
FROM EmployeeDetails ed
WHERE ed.EmpId IN (SELECT ManagerId FROM EmployeeDetails);
8.Write an SQL query to fetch duplicate records from EmployeeDetails
SELECT EmpId, COUNT(*)
FROM EmployeeDetails
GROUP BY EmpId
HAVING COUNT(*) > 1;
9.Write an SQL query to fetch only odd rows from the table:
SELECT *
FROM EmployeeDetails
WHERE EmpId % 2 <> 0;
10.Write a query to find the 3rd highest salary from a table without top or limit keyword:
SELECT DISTINCT Salary
FROM EmployeeSalary e1
WHERE 3 = (
    SELECT COUNT(DISTINCT Salary)
    FROM EmployeeSalary e2
    WHERE e1.Salary <= e2.Salary
);
