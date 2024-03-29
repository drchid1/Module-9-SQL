-- Deleteing tables and its association with other tables
DROP TABLE titles CASCADE;
DROP TABLE employees CASCADE;
DROP TABLE departments CASCADE;
DROP TABLE dept_manager CASCADE;
DROP TABLE dept_emp CASCADE;
DROP TABLE salaries CASCADE;

-- Creating of all the neccessary tables and its associated keys to other tables
CREATE TABLE "departments" (
  "dept_no" char(4),
  "dept_name" varchar(20) NOT NULL,
  PRIMARY KEY (dept_no)
);

CREATE TABLE "titles" (
  "title_id" char(5),
  "title" varchar(30) NOT NULL,
  PRIMARY KEY (title_id)
);

CREATE TABLE "employees" (
  	"emp_no" integer NOT NULL,
  	"emp_title_id" char(5) NOT NULL,
  	"birth_date" date NOT NULL,
  	"first_name" varchar(30) NOT NULL,
  	"last_name" varchar(30) NOT NULL,
  	"sex" char(1),
  	"hire_date" date NOT NULL,
  	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id) -- Links employees table with titles table
);

CREATE TABLE "dept_manager" (
	"dept_no" char(4),
	"emp_no" integer,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no), 	-- Links dept_manager table to departments table
	FOREIGN KEY (emp_no)  REFERENCES employees(emp_no)		-- Links dept_manager table to employees table	
);

CREATE TABLE "dept_emp" (
	"emp_no" integer,
  	"dept_no" char(4),
  	FOREIGN KEY (emp_no)  REFERENCES employees(emp_no),		-- Junction table, ultimately links employees table with departments table
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE "salaries" (
	"emp_no" integer,
  	"salary" decimal(10,2) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)	-- Links salaries table to employees table
);

-- Display of all records from each table
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM salaries;

