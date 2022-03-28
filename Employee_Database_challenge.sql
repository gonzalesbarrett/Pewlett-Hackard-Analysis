-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;

SELECT e.emp_no,
	 e.first_name,
	 e.last_name,
	 ti.title,
	 ti.from_date,
	 ti.to_date
INTO retiring_employees
FROM employees AS e
	 	INNER JOIN titles AS ti
		ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT DISTINCT ON (re.emp_no) re.emp_no,
	 re.first_name,
	 re.last_name,
	 re.title
INTO unique_titles
FROM retiring_employees AS re
	 WHERE (re.to_date = '9999-01-01')
	 ORDER BY re.emp_no ASC, re.to_date DESC;


     
SELECT COUNT(ut.emp_no), 
	 ut.title
INTO retiring_titles
FROM unique_titles AS ut
	 GROUP BY ut.title
	 ORDER BY COUNT DESC;