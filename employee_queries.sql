CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    start_date DATE,
    years FLOAT,
    department VARCHAR(100),
    country VARCHAR(100),
    center VARCHAR(100),
    monthly_salary DECIMAL(10,2),
    annual_salary DECIMAL(12,2),
    job_rate FLOAT,
    sick_leaves INT,
    unpaid_leaves INT,
    overtime_hours FLOAT
);
select * from employees

1.SUM OF TOTAL SALARY PAID TO ALL EMPLOYEES
SELECt SUM(annual_salary) from employees;

2.AVERAGE OF MONTHLY SALARY PAID TO EMPLOYEES
SELECT AVG(MONTHLY_SALARY) FROM EMPLOYEES

3.MAXIMUM SALARY PAID TO ANY EMPLOYEE
SELECT *
FROM employees
WHERE annual_salary = (SELECT MAX(annual_salary) FROM employees);

 4.the total number of employees in each department
 select department, count(id) from employees
 group by department;
 
 5.Employee with highest job rate
SELECT *
FROM employees e
WHERE job_rate = (
    SELECT MAX(job_rate)
    FROM employees
    WHERE department = e.department
)

6.the total overtime_hours worked by employees in each department
SELECT DEPARTMENT, SUM(OVERTIME_HOURS) FROM EMPLOYEES
GROUP BY DEPARTMENT

7.the employees who have a monthly_salary greater than 1000 and are in Egypt
select * from employees
where monthly_salary > 1000 and country = 'Egypt';

 8.the top 5 employees who took the most sick_leave
 select * from employees
 order by sick_leaves DESC
 limit 5;
 
 9.show departments with an average job_rate greater than 4.0.
 SELECT department, AVG(job_rate) AS avg_rating
FROM employees
GROUP BY department
HAVING AVG(job_rate) > 4.0;

 10.list all employees whose annual_salary is higher than the average annual_salary of all employees. 
 select * from employees
 where annual_salary > (select avg(annual_salary) from employees);
 
  11.the total unpaid_leaves taken in each country, and only show countries where the total is greater than 20.
 SELECT country, SUM(unpaid_leaves) AS total_unpaid_leaves
FROM employees
GROUP BY country
HAVING SUM(unpaid_leaves) > 20;

12.Create a VIEW that shows each employee’s id, first_name, last_name, department, and a calculated column for hourly_rate
 assuming they work 160 hours a month
 CREATE VIEW employee_hourly_rate AS
SELECT 
    id,
    first_name,
    last_name,
    department,
    monthly_salary / 160 AS hourly_rate
FROM employees;
SELECT * FROM EMPLOYEES

13.show the top 3 countries with the highest average annual_salary
SELECT country, AVG(annual_salary) AS avg_annual_salary
FROM employees
GROUP BY country
ORDER BY avg_annual_salary DESC
LIMIT 3;
