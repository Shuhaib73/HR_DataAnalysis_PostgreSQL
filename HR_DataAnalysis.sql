-- Creating a new 'HR_Database' to Store our HR-related data.
CREATE DATABASE HR_Database

-- Establishing a 'hr_schema' within the database to structure and organize the HR-specific tables and objects
CREATE SCHEMA hr_schema

-- Setting the search path to 'hr_schema' ensures that PostgreSQL will look in this schema first when resolving object names, making it easier to work with HR data
SET search_path to hr_schema

-- Creating a new 'Employees' table in the database, which store various attributes related to employee information.
CREATE TABLE Employees(
	Attrition VARCHAR(10),
	"Business Travel" VARCHAR(40),
	Department VARCHAR(40),
	"Education Field" VARCHAR(40),
	"emp no" VARCHAR(40),
	Gender VARCHAR(10),
	"Job Role" VARCHAR(40),
	"Marital Status" VARCHAR(20),
	"Over Time" VARCHAR(10),
	"Training Times Last Year" INT,
	Age BIGINT,
	"Age Group" VARCHAR(20),
	"Current Employee" INT,
	"Daily Rate" DECIMAL,
	"Distance From Home" DECIMAL,
	"Distance Status" VARCHAR(20),
	"Education" VARCHAR(30),
	"Environment Satisfaction" INT,
	"Hourly Rate" DECIMAL,
	"Job Involvement" INT,
	"Job Level" INT,
	"Job Satisfaction" INT,
	"Job Satisfaction Status" VARCHAR(30),
	"Monthly Income" DECIMAL,
	"Monthly Rate" DECIMAL,
	"Num Companies Worked" INT,
	"Percent Salary Hike" INT,
	"Performance Rating" INT,
	"Performance Status" VARCHAR(30),
	"Relationship Satisfaction" INT,
	"Stock Option Level" INT,
	"Total Working Years" INT,
	"Experience Status" VARCHAR(30),
	"Work Life Balance" INT,
	"Years At Company" INT,
	"Years In Current Role" INT,
	"Years Since Last Promotion" INT,
	"Years With Curr Manager" INT
)


-- 1. What is the total number of employees in the Dataset
SELECT 
	TO_CHAR(COUNT('emp no'), 'FM999,999') AS Num_of_Employees
FROM Employees

-- 2.How many employees have left the company ?
SELECT 
	COUNT(Attrition) AS Left_employee
FROM Employees
WHERE Attrition = 'Yes'

-- 3. How does job satisfaction vary across different departments?
SELECT 
	Department,
	ROUND(AVG("Job Satisfaction"),2) AS AVG_Satisfaction
FROM Employees
GROUP BY Department
	
-- 4.What is the average monthly income for male and female employees?
SELECT 
	Gender,
	ROUND(AVG("Monthly Income"),2) AS Avg_Salary
FROM Employees
GROUP BY Gender


-- 5.Which job role has the highest average monthly income?
SELECT 
	"Job Role",
	ROUND(AVG("Monthly Income"),2) AS Avg_Salary
FROM Employees
GROUP BY "Job Role"
ORDER BY Avg_Salary DESC LIMIT 3

-- 6.How many employees work overtime?
SELECT 
	"Over Time",
	COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY "Over Time"

-- 7. identify any correlation between Distance and Attrition? - This can provide insights into the attrition rate based on the distance from home for departing employees.
SELECT 	
	"Distance Status",
	Count(*) AS Left_emp_count
FROM Employees
WHERE Attrition = 'Yes'
GROUP BY "Distance Status"
ORDER BY Left_emp_count DESC

-- 7. identify any correlation between Business Travel and Attrition? This can provide insights into whether business travel impacts employee attrition rates.
SELECT 	
	"Business Travel",
	Count(*) AS Left_emp_count
FROM Employees
WHERE Attrition = 'Yes'
GROUP BY "Business Travel"
ORDER BY Left_emp_count DESC


-- 8. Attrition by Job Role?
-- The results are displayed in descending order by the total attrition count, allowing us to understand which job roles experience the highest attrition rates
SELECT 
	"Job Role",
	COUNT(*) AS Total_Attrition
FROM Employees
WHERE Attrition = 'Yes'
GROUP BY "Job Role"
ORDER BY Total_Attrition DESC

-- 9. Attrition by Qualification - providing insights into how attrition varies across different educational backgrounds.
SELECT 
	"Education",
	COUNT(*) AS Total_Attrition
FROM Employees
WHERE Attrition = 'Yes'
GROUP BY "Education"
ORDER BY Total_Attrition DESC

-- 10. Attrition Rate by Gender - It provides insights into gender-based attrition rates within the organization.

SELECT 
	Gender,
	ROUND(COUNT(*)::Decimal / (SELECT COUNT(*) FROM Employees WHERE Attrition = 'Yes'),2)*100 AS Attrition_Rate 
FROM Employees
WHERE Attrition = 'Yes'
GROUP BY Gender

-- 11. What is the impact of education level on monthly income?
SELECT 
	"Education",
	TO_CHAR(AVG("Monthly Income"), 'FM999,999') AS Avg_Monthly_Salary
FROM Employees
GROUP BY "Education"
ORDER BY Avg_Monthly_Salary DESC

-- 12. Are there any demographic differences in employee satisfaction levels?
SELECT 
	Gender,
	"Marital Status",
	ROUND(AVG("Job Satisfaction"),2) AS Avg_Job_Satisfaction
FROM Employees
GROUP BY Gender, "Marital Status"

-- 13. Can you identify any correlation between years at the company and job level for current employees?
SELECT 
	"Job Level",
	ROUND(AVG("Years At Company"),2) AS Avg_Years_AtCompany
FROM Employees
GROUP BY "Job Level"
ORDER BY "Job Level" 

-- 14. How does the average length of employment for departing employees vary by department and gender in the organization?
SELECT 
	Department,
	Gender,
	ROUND(AVG("Years At Company"),2) AS Avg_len_Employeement
FROM Employees
WHERE Attrition = 'Yes'
GROUP BY Department, Gender
ORDER BY Department
	
-- 15. What does the distribution of employees across various job roles in the organization look like, and which job role has the highest number of employees?
SELECT 
	"Job Role",
	COUNT(*) AS Num_of_Employees
FROM Employees
GROUP BY "Job Role"
ORDER BY Num_of_Employees DESC







