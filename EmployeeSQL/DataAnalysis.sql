--  1. Employee Details and Salary

SELECT e.emp_no, e.last_name, e.first_name, e.gender , s.salary
FROM employees e
LEFT JOIN salaries s ON s.emp_no = e.emp_no;

--  2. Employees hired in 1986

SELECT first_name, last_name, hire_date
FROM employees
WHERE SUBSTRING(hire_date,1,4) = '1986';

--  3. Department Managers Information

SELECT dm.dept_no, d.dept_name, dm.emp_no, emp.last_name, emp.first_name,
	   dm.from_date, dm.to_date
FROM dept_manager dm
LEFT JOIN departments d ON d.dept_no = dm.dept_no
LEFT JOIN employees emp ON emp.emp_no = dm.emp_no
ORDER BY dm.dept_no, dm.from_date, dm.to_date;

--  4. Employee Department Inforamtion and dates within the department.

SELECT e.emp_no, e.last_name, e.first_name,  d.dept_name, de.from_date, de.to_date
FROM employees e
LEFT JOIN dept_emp de ON de.emp_no = e.emp_no
LEFT JOIN departments d ON d.dept_no = de.dept_no
WHERE e.emp_no IN
	(
		SELECT DISTINCT emp_no
		FROM dept_emp
	)
ORDER BY e.emp_no;

--  5. Employee with first name is "Hercules" and last name begins with a "B"

SELECT last_name, first_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name like 'B%';

--  6. Employee in Sales Department

SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_emp de ON de.dept_no = d.dept_no
JOIN employees e on de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales'
ORDER BY de.emp_no;

--  7. Employees in Sales and Development departments

SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_emp de ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no
WHERE d.dept_name IN('Sales', 'Development')
ORDER BY d.dept_name, de.emp_no;

--  8. Counts of employees that share a last name, show in decending order

SELECT last_name, COUNT(*) AS "NameCount"
FROM employees
GROUP BY last_name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;




















