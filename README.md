## **HR Data Analytics Project - (PostgreSQL And Power BI)**

### **Project Overview**

#### The core aim of this project is to conduct an in-depth data analysis on the HR dataset.This project entails managing and analyzing HR-related data within a PostgreSQL database. The primary objectives are to:

### 1. Data Organization: 
	Established a dedicated schema ("hr_schema") within the PostgreSQL database to systematically structure HR-related data. Adjust the search path to subsequent queries.
### 2. Data Import: 
	Imported HR data from a designated Excel file into the PostgreSQL database, ensuring seamless compatibility with the predefined schema and table structure.
### 3. Data Analysis: 
	Utilized SQL queries to conduct a comprehensive analysis of HR data. Explore key metrics such as employee attrition rates, job roles distribution, and other pertinent HR insights.
### 4. Attrition Analysis: 
	Delve into the factors influencing employee attrition. Investigate variables like business travel, job roles, education, and Job Satisfaction to identify patterns and potential contributors to attrition.
### 5. Tenure Analysis: 
	Determined the average tenure of departing employees across different departments and gender categories. This analysis sheds light on retention challenges and allows for targeted interventions.
### 6. Employee Satisfaction Analysis: 
	Explore demographic differences in employee satisfaction levels. Understand how factors like age, gender, or department affiliation may impact job satisfaction, providing valuable insights for HR strategies.
### 7. Years at Company and Job Level Analysis: 
	Investigate the correlation between years spent at the company and job levels among current employees. This analysis offers insights into career progression, employee retention, and potential areas for improvement.
### 8. Job Role Distribution: 
	Examine the distribution of employees across various job roles within the organization. This analysis helps in understanding the workforce composition, identifying any imbalances, and informing HR planning.


### Insights

#### ✒ Q1: What is the total number of employees ?

```sql
SELECT 
	TO_CHAR(COUNT('emp no'), 'FM999,999') AS Num_of_Employees
FROM Employees
```
<details>
<summary>
Click here to see the snapshot of output
</summary>
	<p align="center">
	<img src="https://github.com/Shuhaib73/HR_DataAnalysis_PostgreSQL/blob/main/Images/Q1.PNG" />
	</p>
</details>

#### ✒ Q2: How many employees have left the company ?

```sql
SELECT 
	COUNT(Attrition) AS Left_employee
FROM Employees
WHERE Attrition = 'Yes'
```
<details>
<summary>
Click here to see the snapshot of output
</summary>
	<p align="center">
	<img src="https://github.com/Shuhaib73/HR_DataAnalysis_PostgreSQL/blob/main/Images/Q2.PNG" />
	</p>
</details>

#### ✒ Q3: How does job satisfaction vary across different departments?

```sql
SELECT 
	Department,
	ROUND(AVG("Job Satisfaction"),2) AS AVG_Satisfaction
FROM Employees
GROUP BY Department
```
<details>
<summary>
Click here to see the snapshot of output
</summary>
	<p align="center">
	<img src="https://github.com/Shuhaib73/HR_DataAnalysis_PostgreSQL/blob/main/Images/Q3.PNG" />
	</p>
</details>

#### ✒ Q4: What is the average monthly income for male and female employees?

```sql
SELECT 
	Gender,
	ROUND(AVG("Monthly Income"),2) AS Avg_Salary
FROM Employees
GROUP BY Gender
```
<details>
<summary>
Click here to see the snapshot of output
</summary>
	<p align="center">
	<img src="https://github.com/Shuhaib73/HR_DataAnalysis_PostgreSQL/blob/main/Images/Q4.PNG" />
	</p>
</details>

#### ✒ Q5: Which job role has the highest average monthly income?

```sql
SELECT 
	"Job Role",
	ROUND(AVG("Monthly Income"),2) AS Avg_Salary
FROM Employees
GROUP BY "Job Role"
ORDER BY Avg_Salary DESC LIMIT 3
```
<details>
<summary>
Click here to see the snapshot of output
</summary>
	<p align="center">
	<img src="https://github.com/Shuhaib73/HR_DataAnalysis_PostgreSQL/blob/main/Images/Q5.PNG" />
	</p>
</details>

#### ✒ Q6: How many employees work overtime?

```sql
SELECT 
	"Over Time",
	COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY "Over Time"
```
<details>
<summary>
Click here to see the snapshot of output
</summary>
	<p align="center">
	<img src="https://github.com/Shuhaib73/HR_DataAnalysis_PostgreSQL/blob/main/Images/Q6.PNG" />
	</p>
</details>

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
<details>
<summary>
Click here to see the snapshot of output
</summary>
	<p align="center">
	<img src="https://github.com/Shuhaib73/HR_DataAnalysis_PostgreSQL/blob/main/Images/Q7.PNG" />
	</p>
</details>

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
<details>
<summary>
Click here to see the snapshot of output
</summary>
	<p align="center">
	<img src="https://github.com/Shuhaib73/HR_DataAnalysis_PostgreSQL/blob/main/Images/Q8.PNG" />
	</p>
</details>

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
<details>
<summary>
Click here to see the snapshot of output
</summary>
	<p align="center">
	<img src="https://github.com/Shuhaib73/HR_DataAnalysis_PostgreSQL/blob/main/Images/Q9.PNG" />
	</p>
</details>


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
<details>
<summary>
Click here to see the snapshot of output
</summary>
	<p align="center">
	<img src="https://github.com/Shuhaib73/HR_DataAnalysis_PostgreSQL/blob/main/Images/Q10.PNG" />
	</p>
</details>

#### ✒ Q11: Attrition Rate by Gender - It provides insights into gender-based attrition rates within the organization ?

```sql
SELECT 
	Gender,
	ROUND(COUNT(*)::Decimal / (SELECT COUNT(*) FROM Employees WHERE Attrition = 'Yes'),2)*100 AS Attrition_Rate 
FROM Employees
WHERE Attrition = 'Yes'
GROUP BY Gender
```
<details>
<summary>
Click here to see the snapshot of output
</summary>
	<p align="center">
	<img src="https://github.com/Shuhaib73/HR_DataAnalysis_PostgreSQL/blob/main/Images/Q11.PNG" />
	</p>
</details>

#### ✒ Q12: What is the impact of education level on monthly income ?

```sql
SELECT 
	"Education",
	TO_CHAR(AVG("Monthly Income"), 'FM999,999') AS Avg_Monthly_Salary
FROM Employees
GROUP BY "Education"
ORDER BY Avg_Monthly_Salary DESC
```

<details>
<summary>
Click here to see the snapshot of output
</summary>
	<p align="center">
	<img src="https://github.com/Shuhaib73/HR_DataAnalysis_PostgreSQL/blob/main/Images/Q12.PNG" />
	</p>
</details>

#### ✒ Q13: What is the total number of employees?

```sql
SELECT 
	Gender,
	"Marital Status",
	ROUND(AVG("Job Satisfaction"),2) AS Avg_Job_Satisfaction
FROM Employees
GROUP BY Gender, "Marital Status"
```

<details>
<summary>
Click here to see the snapshot of output
</summary>
	<p align="center">
	<img src="https://github.com/Shuhaib73/HR_DataAnalysis_PostgreSQL/blob/main/Images/Q13.PNG" />
	</p>
</details>

#### ✒ Q14: Can you identify any correlation between years at the company and job level for current employees?

```sql
SELECT 
	"Job Level",
	ROUND(AVG("Years At Company"),2) AS Avg_Years_AtCompany
FROM Employees
GROUP BY "Job Level"
ORDER BY "Job Level" 
```

<details>
<summary>
Click here to see the snapshot of output
</summary>
	<p align="center">
	<img src="https://github.com/Shuhaib73/HR_DataAnalysis_PostgreSQL/blob/main/Images/Q14.PNG" />
	</p>
</details>

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
<details>
<summary>
Click here to see the snapshot of output
</summary>
	<p align="center">
	<img src="https://github.com/Shuhaib73/HR_DataAnalysis_PostgreSQL/blob/main/Images/Q15.PNG" />
	</p>
</details>

#### ✒ Q16: What does the distribution of employees across various job roles in the organization look like, and which job role has the highest number of employees?

```sql
SELECT 
	"Job Role",
	COUNT(*) AS Num_of_Employees
FROM Employees
GROUP BY "Job Role"
ORDER BY Num_of_Employees DESC
```

<details>
<summary>
Click here to see the snapshot of output
</summary>
	<p align="center">
	<img src="https://github.com/Shuhaib73/HR_DataAnalysis_PostgreSQL/blob/main/Images/Q16.PNG" />
	</p>
</details>

### These analyses offer in-depth insights into various aspects of employee dynamics, including retention patterns, demographic profiles, distribution across job roles, and key factors influencing attrition. By leveraging this data-driven approach, organizations can make informed decisions and formulate strategic HR initiatives to enhance employee engagement and address factors affecting retention.






