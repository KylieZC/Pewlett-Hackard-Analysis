-- Create table for PH-Employees
CREATE TABLE departments(
 	dept_no VARCHAR(4) NOT NULL,
 	dept_name VARCHAR (40) NOT NULL,
 	PRIMARY KEY (dept_no),
 	UNIQUE (dept_name)
);

-- Create table for PH-Employees
CREATE TABLE employees(
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY(emp_no)
);

--Create table for PH-Employees
CREATE TABLE dept_manager(
    dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Create salaries table
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

-- Create titles table
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, title,from_date),
	FOREIGN KEY (emp_no) REFERENCES salaries,
	FOREIGN KEY (emp_no) REFERENCES employees
);

-- Create Deparment employment table 

DROP TABLE dept_emp
CASCADE

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees,
	FOREIGN KEY (dept_no) REFERENCES departments,
	FOREIGN KEY (emp_no) REFERENCES salaries
);

SELECT *
FROM departments

SELECT *
FROM employees

SELECT *
FROM dept_manager

SELECT *
FROM salaries

SELECT *
FROM titles

SELECT *
FROM dept_emp