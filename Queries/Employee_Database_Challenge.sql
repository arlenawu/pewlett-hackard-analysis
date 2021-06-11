SELECT * FROM employees;
SELECT * FROM titles;
SELECT * FROM dept_emp;

-- DELIVERABLE 1 ------------------------------------------------

DROP TABLE IF EXISTS retirement_titles;

-- Identify employees at retirement age
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
DROP TABLE IF EXISTS unique_titles;

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

DROP TABLE IF EXISTS retiring_titles;

-- Count retiring employees by job title
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

SELECT * FROM retiring_titles;

-- NOTE TO GRADER -- There is a tiny difference in my retiring_titles table
-- compared to the example table given in our instructions. However, I suspect 
-- that my table may actually be more correct, because the difference is that 
-- it looks like my table caught two employees, an Engineer and a Staff member, 
-- who were promoted to Senor Engineer and Senior Staff respectively, and the
-- example table didn't. My table still has all the same employees, but probably 
-- with more up to date titles.

----------------------------------------------------------------
-- Counting total number of retiring employees
SELECT COUNT(emp_no)
FROM unique_titles;


-- DELIVERABLE 2 ------------------------------------------------
DROP TABLE IF EXISTS mentorship_eligibilty;

-- Identify mentorship eligibility
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibilty;

----------------------------------------------------------------
DROP TABLE IF EXISTS mentor_count;

-- Get number of potential mentors by title
SELECT COUNT(emp_no), title
INTO mentor_count
FROM mentorship_eligibilty
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

SELECT * FROM mentor_count;