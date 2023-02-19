-- Create departments table
CREATE TABLE departments (
    dept_no VARCHAR(30),
    dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);
--------------------------------------------------------------------------------------------------------------------------------
-- Create Employees table
CREATE TABLE employees (
    emp_no int NOT NULL,
    emp_title_id VARCHAR(30) NOT NULL,
	birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);
--------------------------------------------------------------------------------------------------------------------------------
-- Create Salaries table
CREATE TABLE salaries (
    emp_no Int,
    salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
--------------------------------------------------------------------------------------------------------------------------------
-- Create departments table
CREATE TABLE titles (
    title_id VARCHAR(30),
    dept_name VARCHAR(30) NOT NULL
);
--------------------------------------------------------------------------------------------------------------------------------
-- Create employee-department table
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(30),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
--------------------------------------------------------------------------------------------------------------------------------
-- Create department managers table
CREATE TABLE dept_manager(
    dept_no VARCHAR(30),
    emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);