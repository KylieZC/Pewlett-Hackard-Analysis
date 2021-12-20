-- List of department info
SELECT	ce.first_name,
		ce.last_name,
		ce.emp_no,
		d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

SELECT *
FROM dept_info