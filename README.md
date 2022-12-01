# Pewlett-Hackard-Analysis

## Overview

The purpose of this analysis was to determine the number of retiring employees per title and to identify employees who are eligible to participate in a mentorship program.

## Results

-Our first table "retirement_titles" gives us a list of all the titles of employees who were born between January 1, 1952 and December 31, 1955. Unfortunately, this list includes multiple titles per employee and also includes individuals who are no longer with the company.

-Our second table "unique_titles" gives us a list which contains the most recent title of each employee. It also has the number of retirement-age employees by most recent job title and includes only current employees.

-Our third table "mentorship_eligibility" gives us a list of current employees who were born between January 1, 1965 and December 31, 1965.

-Our fourth table "retiring_titles" gives us a headcount of potential retirees by title.

![image](https://user-images.githubusercontent.com/115741212/204955591-70b9df28-53ce-4eb3-80bf-4a038ccaa79e.png)

## Summary

### How many roles will need to be filled as the "silver tsunami" begins to make an impact?
72,458 roles will need to be filled - the majority of these are senior engineer and senior staff positions.

### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
There are 1,549 elible mentors, which results in ~1 per 47 employees. This doesn't seem like enough.

### Suggestion #1
The below query provides insight into the payroll information of these potential retirees:

```
SELECT unique_titles.emp_no,
	   salaries.emp_no,
	   salaries.salary
FROM salaries
RIGHT JOIN unique_titles
ON unique_titles.emp_no = salaries.emp_no
```

### Suggestion #2
The below query checks which of the potential retirees are managers and gives us the department they manage:

```
SELECT unique_titles.emp_no,
	   dept_manager.emp_no,
	   dept_manager.dept_no
FROM dept_manager
RIGHT JOIN unique_titles
ON unique_titles.emp_no = dept_manager.emp_no
```

