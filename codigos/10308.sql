*/
Salaries Differences

Difficulty: Easy

Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. Output just the absolute difference in salaries.

db_employee
id: int
first_name: varchar
last_name: varchar
salary: int
department_id: int
email: datetime

db_dept
id: int
department: varchar
*/

select max(case when dd.department = 'marketing' then emp.salary else null end) - max(case when dd.department = 'engineering' then emp.salary else null end) from db_employee as emp
left join db_dept as dd on emp.department_id = dd.id ;
