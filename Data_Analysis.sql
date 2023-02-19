--------------------------------------------------------------------------------------------------------------------------------
--Number 1) List the employee number, last name, first name, sex, and salary of each employee.
Select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
From employees
Inner Join salaries ON employees.emp_no=salaries.emp_no

--------------------------------------------------------------------------------------------------------------------------------
--Number 2) List the first name, last name, and hire date for the employees who were hired in 1986.
Select first_name, last_name, hire_date
From employees
Where hire_date >= '1986-1-1' AND hire_date < '1987-1-1'

--------------------------------------------------------------------------------------------------------------------------------
--Number 3) List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
From dept_manager As dm
Inner Join employees As e ON dm.emp_no=e.emp_no
Inner Join departments AS d ON dm.dept_no=d.dept_no

--------------------------------------------------------------------------------------------------------------------------------
--Number 4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
From dept_emp AS de
Inner Join employees As e ON de.emp_no=e.emp_no
Inner Join departments AS d ON de.dept_no=d.dept_no

--------------------------------------------------------------------------------------------------------------------------------
--Number 5)List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
Select first_name, last_name, sex
From employees
Where first_name = 'Hercules' and last_name like 'B%'

--------------------------------------------------------------------------------------------------------------------------------
--Number 6)List each employee in the Sales department, including their employee number, last name, and first name.
Select e.emp_no, e.last_name, e.first_name
From employees AS e
Where e.emp_no IN (
	Select emp_no
	From dept_emp
	Where dept_no IN 
(
	SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales'
)
)
--------------------------------------------------------------------------------------------------------------------------------
--Number 7)List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select e.emp_no, e.last_name, e.first_name, d.dept_name
From employees AS e
Inner Join dept_emp AS de ON e.emp_no=de.emp_no
Inner Join departments AS d ON de.dept_no=d.dept_no
Where d.dept_name = 'Sales' or d.dept_name = 'Development'

--------------------------------------------------------------------------------------------------------------------------------
--Number 8)List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
Select last_name, count(last_name)
From employees
Group BY last_name
Order BY last_name DESC
