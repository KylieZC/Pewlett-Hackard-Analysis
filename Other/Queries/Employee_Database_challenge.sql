-- Use Dictinct with Orderby to remove duplicate rows
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	te.title, 
	te.from_date, 
	te.to_date
INTO zhiyitable
FROM employees as e 
INNER JOIN titles as te
ON e.emp_no = te.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC, to_date DESC;

--unique_titles.csv
-- Remove duplicates and keep only the most recent title of each employee
SELECT emp_no, first_name, last_name, title
INTO unique_titles
FROM zhiyitable
DISTINCT ON emp_no
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

-- retiring_titles.csv
-- retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;