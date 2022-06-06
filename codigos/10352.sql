/*
Users By Average Session Time

Difficulty: Medium

Calculate each user's average session time. A session is defined as the time difference between a page_load and page_exit. 
For simplicity, assume a user has only 1 session per day and if there are multiple of the same events on that day, 
consider only the latest page_load and earliest page_exit. Output the user_id and their average session time.

Table:
user_id: int
timestamp: datetime
action: varchar
*/

select user_id, avg(session_time) as average_session_time 
    from(
        select user_id, d, timestampdiff(second,latest_page_load, eartliest_page_exit) as session_time 
            from (
                select user_id, date(timestamp) as d, max(case when action = 'page_load' then timestamp else null end) 
                as latest_page_load, min(case when action = 'page_exit' then timestamp else null end) as eartliest_page_exit 
                from facebook_web_log group by user_id, d) as dd
    where timestampdiff(second,latest_page_load, eartliest_page_exit) is not null
    group by user_id, d) as date_times
group by user_id
