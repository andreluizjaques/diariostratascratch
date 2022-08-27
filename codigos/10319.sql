/*
Monthly Percentage Difference

Difficulty: Hard

Given a table of purchases by date, calculate the month-over-month percentage change in revenue. The output should include the year-month date (YYYY-MM) and percentage change, rounded to the 2nd decimal point, and sorted from the beginning of the year to the end of the year.
The percentage change column will be populated from the 2nd month forward and can be calculated as ((this month's revenue - last month's revenue) / last month's revenue)*100.

sf_transactions
id: int
created_at: datetime
value: int
purchase_id: int

*/

select 
    date_format(created_at, '%Y-%m') as date, 
    round ((sum(value) - lag(sum(value)) over()) / lag(sum(value)) over () * 100,2) as w
from sf_transactions
group by date
order by date
