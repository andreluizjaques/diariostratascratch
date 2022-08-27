/*
Premium vs Freemium

Difficulty: Hard

Find the total number of downloads for paying and non-paying users by date. Include only records where non-paying customers have more downloads than paying customers. The output should be sorted by earliest date first and contain 3 columns date, non-paying downloads, paying downloads.

ms_user_dimension
user_id: int
acc_id: int

ms_acc_dimension
acc_id: int
paying_customer: varchar

ms_download_facts
date: datetime
user_id: int
downloads: int
*/

select date, non_paying, paying
from
    (select 
        date, 
        sum(case when paying_customer = 'no' then downloads end) as non_paying,
        sum(case when paying_customer = 'yes' then downloads end)as paying
    from 
        ms_download_facts as d
    left join 
        ms_user_dimension as users 
        on d.user_id = users.user_id
    left join
        ms_acc_dimension as acc
        on users.acc_id = acc.acc_id
    group by date
    order by date asc) as tb1
where (non_paying - paying) > 0;
