-- List the employee number, last name, first name, sex, and salary of each employee

SELECT *
FROM employees;

SELECT *
FROM salaries;

CREATE VIEW employee_salaries AS
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986

CREATE VIEW employees_hired_1986 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name

SELECT *
FROM dept_manager;

SELECT *
FROM departments;

CREATE VIEW department_managers AS
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments
ON dept_manager.dept_no = departments.dept_no
JOIN employees
ON employees.emp_no = dept_manager.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT *
FROM dept_emp;

CREATE VIEW department_employees AS
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

CREATE VIEW employees_hercules_b AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name

CREATE VIEW sales_employees AS
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no IN(
	
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN(

	SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales'
	)
);

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

CREATE VIEW development_sales_employes AS 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

CREATE VIEW name_count AS 
SELECT last_name, COUNT(last_name) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;