*/ 
Workers With The Highest Salaries

Difficulty: Medium

Find the titles of workers that earn the highest salary. Output the highest-paid title or multiple titles that share the highest salary.

worker
worker_id: int
first_name: varchar
last_name: varchar
salary: int
joining_date: datetime
department: varchar

title
worker_ref_id: int
worker_title: varchar
affected_from: datetime
*/

select tt.worker_title from worker as wk
left join title as tt on wk.worker_id = tt.worker_ref_id
where salary in (select max(salary) from worker);
