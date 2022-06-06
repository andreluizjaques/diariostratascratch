select user_id, avg(session_time) as average_session_time from(
    select user_id, d, timestampdiff(second,latest_page_load, eartliest_page_exit) as session_time from (
            select user_id, date(timestamp) as d, max(case when action = 'page_load' then timestamp else null end) as latest_page_load, min(case when action = 'page_exit' then timestamp else null end) as eartliest_page_exit from facebook_web_log group by user_id, d) as dd
    where timestampdiff(second,latest_page_load, eartliest_page_exit) is not null
    group by user_id, d) as date_times
group by user_id
