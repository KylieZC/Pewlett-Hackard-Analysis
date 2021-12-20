-- Deliverable 1.1 retirement_titles.csv
-- Use Dictinct with Orderby to remove duplicate rows
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	te.title, 
	te.from_date, 
	te.to_date
INTO retirement_birth
FROM employees as e 
INNER JOIN titles as te
ON e.emp_no = te.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC, to_date DESC;

--Deliverable 1.2 unique_titles.csv
-- Remove duplicates and keep only the most recent title of each employee
SELECT DISTINCT ON (emp_no)
	 emp_no, 
	 first_name, 
	 last_name, 
	 title
INTO unique_titles
FROM retirement_birth
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

-- Deliverable 1.3 retiring_titles.csv
-- retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(title) DESC;


-- Deliverable 2 mentorship_eligibilty.csv
SELECT DISTINCT ON (emp_no) 
	e.emp_no, 
	e.first_name, 
	e.last_name,
	e.birth_date
	de.from_date,
	de.to_date,
	tl.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as tl
ON de.emp_no = tl.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = ('9999-01-01'))
ORDER BY emp_no ASC;



