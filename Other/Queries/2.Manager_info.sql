-- List of managers pep department
SELECT	dm.dept_no,
		d.dept_name,
		dm.emp_no,
		dm.from_date,
		dm.to_date,
		ce.first_name,
		ce.last_name
INTO manager_info
FROM dept_manager AS dm
INNER JOIN departments AS d 
	ON (d.dept_no = dm.dept_no)
INNER JOIN current_emp AS ce
	ON (ce.emp_no = dm.emp_no)
