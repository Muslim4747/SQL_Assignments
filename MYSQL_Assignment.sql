create database Assignment;
use Assignment;

CREATE TABLE Company(
	CompanyID int,
    CompanyName varchar(45),
    Sreet varchar(45),
    City varchar(45),
    State varchar(2),
    Zip varchar(10)
);

#  1) Statement to create the Contact table 

CREATE TABLE Contact (
    ContactID int,
    CompanyID int,
    FirstName varchar(45),
    LastName varchar(45),
    Street varchar(45),
    City varchar(45),
    State varchar(2),
    Zip varchar(10),
    IsMain boolean,
    Email varchar(45),
    Phone varchar(12)
);

# 2) Statement to create the Employee table 

CREATE TABLE Employee (
	EmployeeID int,
	FirstName varchar(45),
    LastName varchar(45),
    Salary decimal(10,2),
    HireDate date,
    JobTitle varchar(25),
    Email varchar(45),
    Phone varchar(12)
);

# 3) Statement to create the ContactEmployee table
CREATE TABLE ContactEmployee (
	ContactEmployeeID int,
    ContactID int,
    EmployeeID int,
    ContactDate date,
    Description varchar(100)
);

select * from Employee;
INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary, HireDate, JobTitle, Email, Phone)
VALUES (1, 'Lesley', 'Bland', 75000.00, '2022-05-15', 'Sales Manager', 'lesley.bland@example.com', '215-555-1234');

/* 4) In the Employee table, the statement that changes Lesley Bland’s phone number
to 215-555-8800 */

UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';

/* 5) In the Company table, the statement that changes the name of “Urban
Outfitters, Inc.” to “Urban Outfitters” . */

select * from company;
UPDATE company 
SET CompanyName = 'Urban Outfitters, Inc.'
WHERE CompanyName = 'Urban Outfitters';

/* 6) In ContactEmployee table, the statement that removes Dianne Connor’s contact
event with Jack Lee (one statement). */
DELETE FROM ContactEmployee
WHERE ContactID = (SELECT ContactID FROM Contact WHERE FirstName = 'Dianne' AND LastName = 'Connor')
AND EmployeeID = (SELECT EmployeeID FROM Employee WHERE FirstName = 'Jack' AND LastName = 'Lee');

/* 7) Write the SQL SELECT query that displays the names of the employees that
have contacted Toll Brothers (one statement). Run the SQL SELECT query in
MySQL Workbench. Copy the results below as well.*/ 

SELECT e.FirstName, e.LastName
FROM Employee e
JOIN ContactEmployee ce ON e.EmployeeID = ce.EmployeeID
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Company co ON c.CompanyID = co.CompanyID
WHERE co.CompanyName = 'Toll Brothers';

/* 8) What is the significance of “%” and “_” operators in the LIKE statement? */

The `%` and `_` operators in the `LIKE` statement are wildcard characters used for pattern matching:

- `%` represents zero, one, or multiple characters.
- `_` represents a single character.

These allow flexible search patterns in queries.
 For example, `LIKE 'a%'` finds any string starting with "a," and `LIKE '_a%'` finds any string with "a" as the second character.

/* 9) Explain normalization in the context of databases. */

Normalization in databases is the process of organizing data to reduce redundancy and improve efficiency. 
It involves breaking down large tables into smaller, related ones and ensuring that each table focuses on a single topic.
This helps avoid duplicate data and makes it easier to maintain the database.
The goal is to make sure the data is stored logically, reducing storage space and the chances of errors.

# 10) What does a join in MySQL mean? 

A join in MySQL is a way to combine data from two or more tables based on a related column between them. 
It helps you retrieve information from different tables in a single query. 
For example, if you have one table with customer details and 
another with orders, you can use a join to get a list of customers along with their orders.

#  11) What do you understand about DDL, DCL, and DML in MySQL?

In MySQL, DDL, DCL, and DML are different types of SQL commands:
- DDL (Data Definition Language): 
Deals with the structure of the database. 
It includes commands like `CREATE`, `ALTER`, and `DROP` to create, modify, or delete tables and databases.
  
- DCL (Data Control Language): 
Manages access and permissions to the database. 
It includes commands like `GRANT` and `REVOKE`, used to control user rights and permissions.

- DML (Data Manipulation Language): Deals with the manipulation of data within tables. 
It includes commands like `SELECT`, `INSERT`, `UPDATE`, and `DELETE` to retrieve, add, modify, or remove data.

/* 12) What is the role of the MySQL JOIN clause in a query, and what are some
common types of joins? */ 

The JOIN clause in MySQL is used to combine data from two or more tables based on a related column, 
allowing you to retrieve information that is spread across multiple tables.

Some common types of joins are:
1. INNER JOIN: Returns only the rows where there is a match in both tables.
2. LEFT JOIN (or LEFT OUTER JOIN): Returns all rows from the left table and the matching rows from the right table.
    If there's no match, it returns `NULL` for the right table’s columns.
3. RIGHT JOIN (or RIGHT OUTER JOIN): Similar to LEFT JOIN, 
    but returns all rows from the right table and matching rows from the left table.
4. FULL JOIN (or FULL OUTER JOIN): Returns all rows when there is a match in one of the tables, 
    and `NULL` where there is no match (not fully supported in MySQL but can be simulated).












































select * from Employee;

insert into Company values (1, 'Urban Outfitters', '5000 Broad St', 'Philadelphia', 'PA', '19130');
insert into Company values (2, 'Krishna ', '10000 Broad St', 'Ahmedabad', 'ST', '19550');
insert into Company values (3, 'Urban Outfitters, Inc.', '30000 Broad St', 'Surat', 'PA', '19130');

select * from Company;

UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = '“Urban Outfitters, Inc.';

select * from Company;



