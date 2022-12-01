-- Deliverable 1

-- Create the retirement_titles.csv table
SELECT employees.emp_no, 
	   employees.first_name, 
       employees.last_name,
	   titles.title,
	   titles.from_date,
	   titles.to_date
INTO retirement_titles
FROM titles
LEFT JOIN employees
ON employees.emp_no = titles.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no

-- Create the unique_titles.csv table
SELECT DISTINCT ON (emp_no) emp_no,
							first_name,
							last_name,
							title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;


-- Deliverable 2

-- Create the mentorship_eligibility.csv table
SELECT DISTINCT ON (emp_no) employees.emp_no, 
	   						employees.first_name, 
	   						employees.last_name, 
	   						employees.birth_date,
	   						dept_emp.from_date,
	   						dept_emp.to_date,
	   						titles.title
INTO mentorship_eligibility
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
WHERE (dept_emp.to_date = '9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no

-- Create the retiring_titles.csv table

SELECT COUNT(unique_titles.title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC
