CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(255)
);

SELECT *
FROM departments;

CREATE TABLE titles(
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(255)
);

SELECT *
FROM titles; 

DROP TABLE employees;

CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(5), 
	birth_date VARCHAR(10),
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex CHAR(1),
	hire_date VARCHAR(10),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT *
FROM employees;

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(4),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT *
FROM dept_emp;

CREATE TABLE dept_manager(
	dept_no VARCHAR(4),
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT *
FROM dept_manager;

CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT *
FROM salaries;
