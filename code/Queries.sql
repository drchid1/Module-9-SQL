-- QUESTION 1: List the employee number, last name, first name, sex, and salary of each employee.
-- All the information for this query can be found from the employees table and the salaries table

SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees AS employees
JOIN salaries AS salaries
ON salaries.emp_no = employees.emp_no;

-- QUESTION 2: List the first name, last name, and hire date for the employees who were hired in 1986.
-- All the information for this query is available in the employees table

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- QUESTION 3: List the manager of each department along with their department number, department name,
-- employee number, last name, and first name.
-- The information required for this query can be found in employees, dept_manager and departments table.

SELECT employees.emp_no AS "Employee Number",
	employees.first_name || ' ' || employees.last_name AS "Manager Name",
	departments.dept_name AS "Deparment Name",
	departments.dept_no AS "Department Number"
FROM employees as employees
JOIN dept_manager
ON dept_manager.emp_no = employees.emp_no
	JOIN departments AS departments
	ON departments.dept_no = dept_manager.dept_no;
	
-- QUESTION 4: List the department number for each employee along with that employee’s employee number, last name,
-- first name, and department name.
-- The information for this query will come from employees, dept_emp and departments table.
-- On review of the output there was staff working in more than one department. To 

-- Creation of a VIEW called 'employee_department'
CREATE VIEW employee_department AS
SELECT employees.emp_no AS "Employee Number",
	employees.first_name AS "Employee First Name",
	employees.last_name AS "Employee Last Name",
	departments.dept_no AS "Department Number",
	departments.dept_name AS "Department Name"
FROM employees AS employees
JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
	JOIN departments
	ON departments.dept_no = dept_emp.dept_no;

-- Running the query for all employees from View
SELECT * FROM employee_department;

-- Running query to find duplicates from View
-- ie: how many staff work in more than 1 department

SELECT "Employee Number", COUNT(*) AS "Number of departments working for"
FROM employee_department
GROUP BY "Employee Number"
HAVING COUNT(*) > 1
ORDER BY "Number of departments working for" DESC;

-- QUESTION 5: List first name, last name, and sex of each employee whose first name is Hercules
-- and whose last name begins with the letter B.
-- For this query all the information is available in the employees table

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- QUESTION 6: List each employee in the Sales department, including their employee number, last name, and first name.
-- We can use the department name 'Sales' or the department number 'd007'. In this query we will use the department name.

SELECT *
FROM employee_department
WHERE "Department Name" = 'Sales';

-- QUESTION 7: List each employee in the Sales and Development departments, including their employee number, last name,
-- first name, and department name.
-- For an change we will use the department number which is the primary key to make this query. Using the primary key can
-- potentially make the query faster. The Sales department has the number 'd007' and Development department has the number 'd005'

SELECT *
FROM employee_department
WHERE "Department Number" = 'd007' OR "Department Number" = 'd005'; 

-- QUESTION 8: List the frequency counts, in descending order, of all the employee
-- last names (that is, how many employees share each last name).

SELECT last_name AS "Surname", COUNT(last_name) AS "Number of Staff with the same Surname"
FROM employees
GROUP BY last_name
ORDER BY "Number of Staff with the same Surname" DESC;