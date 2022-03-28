# Pewlett-Hackard-Analysis

## Software
- pgAdmin 4 Desktop Version 6.4
- Visual Studio Code Version 1.65.2

## Analysis Overview
The initial purpose of the analysis was to identify how many employees from Pewlett-Hackard would be retiring in the near future. Due to the immense size of the results, we were then tasked with filter the date down and categorizing it by manager/department. The primary data point used to filter the data to determine the desired results was the employees’ birthdates. Selecting a specific range we were able to narrow down all the potential future retirees. In addition, we used birthdates to identify employees who could be utilized as part time mentors prior to their retiring.

More specifically, for the first deliverable  we created a table that holds all of the employees that were born between 1952 and 1955, filtering out employees who were no longer employed, and displayed the resulting employees with their most recent job title.

For deliverable 2, we created a table that held all current employees who were born in 1965 who would be eligible to mentor future employees.
## Results
Query used for Deliverable 1:

![Screenshot]( https://github.com/gonzalesbarrett/Pewlett-Hackard-Analysis/blob/main/Deliverable_1_Query.png)

Employee number, first name, and last name were selected from the Employee table. Title, from date, and to date was selected from the Titles table. We created a new table called retiring_employees. We then used an inner Join to combine the two tables on the employee number primary key. We filtered the birth dates to be between 1952 and 1955 and then ordered by employee number. 
For the second part, we selected the distinct employee number entries from the table we just created along with first name, last name and title. We created a new table called unique_titles and ensured the to date was the placeholder number for current employees. Finally, we ordered by employee number ascending and to date descending. 

![Screenshot]( https://github.com/gonzalesbarrett/Pewlett-Hackard-Analysis/blob/main/Deliverable_1_Output.png)

![Screenshot]( https://github.com/gonzalesbarrett/Pewlett-Hackard-Analysis/blob/main/Deliverable_1_Output_2.png)

Above you can see the final table outputs.

![Screenshot]( https://github.com/gonzalesbarrett/Pewlett-Hackard-Analysis/blob/main/Deliverable_2_Query.png)

For this query we selected employee number, first name, last name and birth date from the employee table. We also selected the from date and to date from the Dept_Emp table along with title from the Titles table. Inner joined all three tables on the employee number and filtered the birth date to 1965. Finally we ordered by ascending.

![Screenshot]( https://github.com/gonzalesbarrett/Pewlett-Hackard-Analysis/blob/main/Deliverable_2_Output.png)

Final output above.
## Summary
### How many roles will need to be filled as the "silver tsunami" begins to make an impact?
-	72,458 roles would need to be filled for the upcoming "silver tsunami". In addition, there are an additional 306,686 employees that may be retiring in the following ten years after the initial group. 
The below query was used to identify employees who may be retiring in the subsequent ten years.
SELECT e.emp_no,
	 e.first_name,
	 e.last_name,
	 ti.title,
	 ti.from_date,
	 ti.to_date
INTO future_retiring_employees
FROM employees AS e
	 	INNER JOIN titles AS ti
		ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1956-01-01' AND '1964-12-31')
ORDER BY e.emp_no;

SELECT COUNT (emp_no) FROM future_retiring_employees;
### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees? 
-	There are 3,125 eligible employees that could mentor the next generation. 1,376 of those employees have ‘Senior’ in their title which would indicate a healthy selection of already identified leaders could act as mentors. 
The below query was used to identify count of mentor eligible employees by job title.
SELECT COUNT (me.emp_no), 
	 me.title 
	 FROM mentorship_info AS me  
	 GROUP BY me.title;
