# pewlett-hackard-analysis

# Overview:
The purpose of this project is to analyze how many employees working for Pewlett-Hackard may be retiring soon, and which job positions and departments they are from. Because the Baby Boomer generation is approaching retirement age, Pewlett-Hackard wishes to make adequate preparations for any sudden changes in its personnel due to the upcoming wave of retirement, otherwise known as the "silver tsunami".


# Results:

- ## Data Provided

The data provided about the employees as Pewlett_Hackard included three tables that contained information about the employees as outined below:

[[employees.csv]](Data/employees.csv) -- employee #, birth date, first name, last name, gender, hire date

[[titles.csv]](Data/titles.csv) -- employee #, title, hire from date, hire to date

[[dept_emp.csv]](Data/dept_emp.csv) -- employee #, department #, hire from date, hire to date

- ## Finding Employees at Retirement Age

The first task was to get a table of all the employees currently at retirement age. This was done by joining the employees.csv and the titles.csv tables into a new table called "retiring_titles" that only included employees born between Jan. 01, 1952 and Dec. 31, 1955. The new table included information the employees' names, ID numbers, titles, and hire dates.

- ## Filtering out Duplicate Information for Employees at Retirement Age

Because some employees had switch departments and/or titles during their time working at Pewlett-Hackard, their names showed up multiple times in the new "retiring_titles" table. Duplicate entries were filtered out and compiled into a final table called "unique_titles" which is linked below.

[[Table of Employees at Retirement Age]](Data/unique_titles.csv)

- ## Number of Potential Retirees by Title

In order to gain better insight into which positions may soon be vacated by the prospective retirees, all employees eligible for retirement were grouped together and tallied up by their job title. The following table shows a breakdown of the number of potential retiring employees by their title.

[[Number of Potential Retirees by Title]](Data/retiring_titles.csv)

- ## Employees Eligible for the Mentorship Program

Based on number of potential retiring employees by job title, it appears that there may soon be a great loss of workers in higher level positions such as Senior Engineer and Senior Staff. Therefore, a table was generated of older employees who would be eligible to become a mentor in Pewlett-Hackard's mentorship program and train the younger employees to fill in the vacating positions. Eligible mentors are those who were born between Jan. 01, 1965 and Dec. 31, 1965.

[[Employees Eligible for the Mentorship Program]](Data/mentorship_eligibilty.csv)


# Summary & Conclusions:

- ### How many roles will need to be filled as the "silver tsunami" begins to make an impact?

A total of 90,398 positions will eventually be vacated once the "silver tsunami" begins.

- ### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

Unfortunately, those  who were identified as eligible for the mentorship program only numbered up to 1549 [[Link to Table]](Data/mentor_count.csv), a small fraction of the 90,398 who may become part of the "silver tsunami". It may be recommended to expand the criteria for mentorship eligibility to include all those who were born on Dec. 31, 1965 and earlier. The upcoming retirees themselves may prove to be good mentors to their younger coworkers before they depart.
