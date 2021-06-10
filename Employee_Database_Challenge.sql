SELECT * FROM employees;
SELECT * FROM titles;

-- DELIVERABLE 1 ------------------------------------------------

DROP TABLE retirement_titles;

-- Create retirement_titles table
-- all employees born between 1952 and 1955
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, t.from_date DESC;

SELECT * FROM retirement_titles;

----------------------------------------------------------------
DROP TABLE unique_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, from_date DESC;

SELECT * FROM unique_titles;

----------------------------------------------------------------

DROP TABLE retiring_titles;

-- Get retiring employees count by job title
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

SELECT * FROM retiring_titles;


-- DELIVERABLE 2 ------------------------------------------------

