# HR Data Analytics Project - PostgreSQL

### Project Overview

#### The core aim of this project is to conduct an in-depth data analysis on the HR dataset.This project entails managing and analyzing HR-related data within a PostgreSQL database. The primary objectives are to:

##### 1. Data Organization: Create a dedicated schema ("hr_schema") to structure HR-related data and set the search path accordingly.
##### 2. Data Import: Import HR data from an Excel file into the PostgreSQL database, ensuring compatibility with the schema and table structure.
##### 3. Data Analysis: Execute SQL queries to gain insights into employee attrition, job roles, and other relevant HR metrics.
##### 4. Attrition Analysis: Investigate factors contributing to employee attrition, such as business travel, job roles, education, and Job Satisfaction.
##### 5. Tenure Analysis: Determine the average tenure of departing employees in different departments and gender categories.
##### 6. Employee Satisfaction Analysis: Investigate demographic differences in employee satisfaction levels.
##### 7. Years at Company and Job Level Analysis: Identify any correlation between years at the company and job level for current employees, providing insights into career progression and retention.
##### 8. Job Role Distribution: Examine the distribution of employees across various job roles within the organization.


### Insights

#### ✒ Q1: What is the total number of employees ?

```sql
SELECT 
	TO_CHAR(COUNT('emp no'), 'FM999,999') AS Num_of_Employees
FROM Employees
```

#### ✒ Q2: How many employees have left the company ?

```sql
SELECT 
	COUNT(Attrition) AS Left_employee
FROM Employees
WHERE Attrition = 'Yes'
```

#### ✒ Q3: How does job satisfaction vary across different departments?

```sql
SELECT 
	Department,
	ROUND(AVG("Job Satisfaction"),2) AS AVG_Satisfaction
FROM Employees
GROUP BY Department
```


#### ✒ Q4: What is the average monthly income for male and female employees?

```sql
SELECT 
	Gender,
	ROUND(AVG("Monthly Income"),2) AS Avg_Salary
FROM Employees
GROUP BY Gender
```

#### ✒ Q5: Which job role has the highest average monthly income?

```sql
SELECT 
	"Job Role",
	ROUND(AVG("Monthly Income"),2) AS Avg_Salary
FROM Employees
GROUP BY "Job Role"
ORDER BY Avg_Salary DESC LIMIT 3
```


#### ✒ Q6: How many employees work overtime?

```sql
SELECT 
	"Over Time",
	COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY "Over Time"
```


#### ✒ Q7: identify any correlation between Distance and Attrition? - This can provide insights into the attrition rate based on the distance from home for departing employees ?

```sql
SELECT 	
	"Distance Status",
	Count(*) AS Left_emp_count
FROM Employees
WHERE Attrition = 'Yes'
GROUP BY "Distance Status"
ORDER BY Left_emp_count DESC
```

#### ✒ Q8: identify any correlation between Business Travel and Attrition? This can provide insights into whether business travel impacts employee attrition rates ?

```sql
SELECT 	
	"Business Travel",
	Count(*) AS Left_emp_count
FROM Employees
WHERE Attrition = 'Yes'
GROUP BY "Business Travel"
ORDER BY Left_emp_count DESC
```

#### ✒ Q9: Attrition by Job Role? The results are displayed in descending order by the total attrition count, allowing us to understand which job roles experience the highest attrition rates

```sql
SELECT 
	"Job Role",
	COUNT(*) AS Total_Attrition
FROM Employees
WHERE Attrition = 'Yes'
GROUP BY "Job Role"
ORDER BY Total_Attrition DESC
```


#### ✒ Q10: Attrition by Qualification - providing insights into how attrition varies across different educational backgrounds.

```sql
SELECT 
	"Education",
	COUNT(*) AS Total_Attrition
FROM Employees
WHERE Attrition = 'Yes'
GROUP BY "Education"
ORDER BY Total_Attrition DESC
```

#### ✒ Q11: Attrition Rate by Gender - It provides insights into gender-based attrition rates within the organization ?

```sql
SELECT 
	Gender,
	ROUND(COUNT(*)::Decimal / (SELECT COUNT(*) FROM Employees WHERE Attrition = 'Yes'),2)*100 AS Attrition_Rate 
FROM Employees
WHERE Attrition = 'Yes'
GROUP BY Gender
```

#### ✒ Q12: What is the impact of education level on monthly income ?

```sql
SELECT 
	"Education",
	TO_CHAR(AVG("Monthly Income"), 'FM999,999') AS Avg_Monthly_Salary
FROM Employees
GROUP BY "Education"
ORDER BY Avg_Monthly_Salary DESC
```

#### ✒ Q13: What is the total number of employees?

```sql
SELECT 
	Gender,
	"Marital Status",
	ROUND(AVG("Job Satisfaction"),2) AS Avg_Job_Satisfaction
FROM Employees
GROUP BY Gender, "Marital Status"
```

#### ✒ Q14: Can you identify any correlation between years at the company and job level for current employees?

```sql
SELECT 
	"Job Level",
	ROUND(AVG("Years At Company"),2) AS Avg_Years_AtCompany
FROM Employees
GROUP BY "Job Level"
ORDER BY "Job Level" 
```

#### ✒ Q15: How does the average length of employment for departing employees vary by department and gender in the organization?

```sql
SELECT 
	Department,
	Gender,
	ROUND(AVG("Years At Company"),2) AS Avg_len_Employeement
FROM Employees
WHERE Attrition = 'Yes'
GROUP BY Department, Gender
ORDER BY Department
```

#### ✒ Q16: What does the distribution of employees across various job roles in the organization look like, and which job role has the highest number of employees?

```sql
SELECT 
	"Job Role",
	COUNT(*) AS Num_of_Employees
FROM Employees
GROUP BY "Job Role"
ORDER BY Num_of_Employees DESC
```


### These analyses offer in-depth insights into various aspects of employee dynamics, including retention patterns, demographic profiles, distribution across job roles, and key factors influencing attrition. By leveraging this data-driven approach, organizations can make informed decisions and formulate strategic HR initiatives to enhance employee engagement and address factors affecting retention.






