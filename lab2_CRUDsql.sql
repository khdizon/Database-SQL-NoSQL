# LAB2 14th March 2023
# USER: Ken Dizon 

# Given this Schema:
-- Employee(eid, ename, age, salary, residentState)
-- Department(did, dname, supplyBudget, stateLocated)
-- worksFor(eid, did, startDate)
-- Manages(eid, did, managesStartDate)
# Create tables for the relations Employee, Department, worksFor and Manages. 
# Use the load command to load these tables with the attached data files.

CREATE DATABASE lab2CRUD;
USE lab2CRUD;

-- set up tables and dtypes
CREATE TABLE Employee (
    eid INT PRIMARY KEY,
    ename VARCHAR(25) NOT NULL,
    age INT,
    salary DECIMAL(8,2),
    state VARCHAR(50)
);

CREATE TABLE Department (
    did INT PRIMARY KEY,
    dname VARCHAR(50) NOT NULL,
    supplyBudget DECIMAL(6,2),
    stateLocated VARCHAR(50)
);

CREATE TABLE worksFor (
    eid INT,
    did INT,
    startDate DATE,
    PRIMARY KEY (eid, did),
    FOREIGN KEY (eid) REFERENCES Employee(eid),
    FOREIGN KEY (did) REFERENCES Department(did)
);

CREATE TABLE Manages (
    eid INT,
    did INT,
    managesStartDate DATE,
    PRIMARY KEY (eid, did),
    FOREIGN KEY (eid) REFERENCES Employee(eid),
    FOREIGN KEY (did) REFERENCES Department(did)
);

-- Loading
-- Input data from a text file into created tables
LOAD DATA LOCAL INFILE '/Users/Kenny/Downloads/MSDS/MSDE_SQL/Lab2-files/EmployeeData.txt'
INTO TABLE Employee
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/Users/Kenny/Downloads/MSDS/MSDE_SQL/Lab2-files/DepartmentData.txt'
INTO TABLE Department
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/Users/Kenny/Downloads/MSDS/MSDE_SQL/Lab2-files/WorksForData.txt'
INTO TABLE worksFor
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/Users/Kenny/Downloads/MSDS/MSDE_SQL/Lab2-files/ManagesData.txt'
INTO TABLE Manages
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

# Deliverable
# UPLOAD a file containing the queries and their results from the following: 
-- 1) Find the name of the employee who works for "department101" department. 
SELECT ename
FROM Employee
JOIN worksFor ON Employee.eid = worksFor.eid
WHERE worksFor.did = 101;

	-- Output: ename [[Aiman, Sara, Omar, Hailana]]

-- 2) Find the name of employees who manage department 101.
SELECT Employee.ename
FROM Employee
JOIN Manages ON Employee.eid = Manages.eid
WHERE Manages.did = 101;

	-- Output: ename "Aiman"

-- 3) Find employees that work for departments 101 and 103.
SELECT Employee.ename
FROM Employee
JOIN worksFor d101 ON Employee.eid = d101.eid
JOIN worksFor d103 ON Employee.eid = d103.eid
WHERE d101.did = 101
  AND d103.did = 101;
  
	-- Output: ename [[Aiman, Sara, Omar, Hailana]]
