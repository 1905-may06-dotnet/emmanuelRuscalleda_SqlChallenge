

-- Section: Create tables

CREATE TABLE Employee 
(
	ID varchar(3) not null, 
	FirstName varchar(20) not null, 
	LastName varchar(20) not null, 
	SSN varchar(15) not null, 
	DeptID varchar(5) not null
)
GO
ALTER TABLE Employee ADD CONSTRAINT PK_Employee PRIMARY KEY (ID); 
GO 

CREATE TABLE EmpDetails 
(
	ID varchar(20) not null, 
	EmployeeID varchar(3) not null, 
	Salary money not null, 
	Address1 varchar(20) not null, 
	Address2 varchar(20) null, 
	City varchar(20) not null, 
	State varchar(2) not null, 
	Country varchar(4) not null
)
GO
ALTER TABLE EmpDetails ADD CONSTRAINT PK_EmpDetails PRIMARY KEY (ID); 
GO 

CREATE TABLE Department 
(
	ID varchar(5) not null, 
	Name varchar(20) not null, 
	Locaiton varchar(20) not null 
)
GO
ALTER TABLE Department ADD CONSTRAINT PK_Deparment PRIMARY KEY (ID); 
GO 



-- **************************** 
-- **************************** 
-- **************************** 
-- **************************** 



-- Section: Add data to tables 

INSERT INTO Department 
VALUES 
('D1', 'IT', 'Houston'), 
('D2', 'Marketing', 'Dallas'), 
('D3', 'Supply Chain', 'Denver'); 
GO 
 
INSERT INTO Employee 
VALUES 
('ABC','Tina','Smith','T123','D1'),
('DEF','Mark','Cesare','M123','D2'),
('MNL','Susan','Paris','S123','D2'),
('XYZ','Chris','Key','C123','D3'); 
GO 

INSERT INTO EmpDetails (ID, EmployeeID, Salary, Address1, Address2, City, State, Country)
VALUES
('1', 'ABC', 114000, 'A1', 'A2', 'Houston', 'TX', 'US'),
('2', 'DEF', 103000, 'A1', 'A2', 'Dallas', 'TX', 'US'),
('3', 'MNL', 112000, 'A1', 'A2', 'Dallas', 'TX', 'US'),
('4', 'XYZ', 100000, 'A1', 'A2', 'Denver', 'CO', 'US'); 
GO 



-- **************************** 
-- **************************** 
-- **************************** 
-- ****************************



-- Section: Add foreign keys  

ALTER TABLE Employee ADD CONSTRAINT FK_Employee FOREIGN KEY (DeptID) REFERENCES Department(ID); 
GO 

ALTER TABLE EmpDetails ADD CONSTRAINT FK_EmpDetails FOREIGN KEY (EmployeeID) REFERENCES Employee(ID); 
GO 
 


-- **************************** 
-- **************************** 
-- **************************** 
-- ****************************




-- Section: Queries 


SELECT *
FROM Employee 
INNER JOIN Department 
ON Employee.DeptID = Department.ID 
INNER JOIN EmpDetails
ON Employee.ID = EmpDetails.EmployeeID
WHERE Department.Name = 'Marketing'
GO 


SELECT Department.Name AS [Department Name], sum(EmpDetails.Salary) AS [Total Salary]
FROM Employee 
INNER JOIN Department 
ON Employee.DeptID = Department.ID 
INNER JOIN EmpDetails
ON Employee.ID = EmpDetails.EmployeeID
WHERE Department.Name = 'Marketing'
Group BY Department.Name
GO 


SELECT Department.Name AS [Department Name], count(Employee.FirstName) AS[Total Employees]
FROM Employee 
INNER JOIN Department 
ON Employee.DeptID = Department.ID 
INNER JOIN EmpDetails
ON Employee.ID = EmpDetails.EmployeeID
WHERE Department.Name = 'Marketing'
Group BY Department.Name
GO 

UPDATE EmpDetails 
SET Salary = Salary + 90000 
WHERE EmployeeID = 'ABC' 
GO 



