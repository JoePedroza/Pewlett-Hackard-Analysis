--Employee_Database_challenge.sql

SELECT e.emp_no,e.first_name, e.last_name,t.title,t.from_date,t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT 
	DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name, 
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Retiring employee titles 
SELECT 
	COUNT(title) as count,
	title	
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC

