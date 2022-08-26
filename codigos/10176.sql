*/
Bikes Last Used

Difficulty: Easy

Find the last time each bike was in use. Output both the bike number and the date-timestamp of the bike's last use (i.e., the date-time the bike was returned). Order the results by bikes that were most recently used.

dc_bikeshare_q1_2012
duration: varchar
duration_seconds: int
start_time: datetime
start_station: varchar
start_terminal: int
end_time: datetime
end_station: varchar
end_terminal: int
bike_number: varchar
rider_type: varchar
id: int
*/

select bike_number, max(end_time) as last_time
from dc_bikeshare_q1_2012
group by bike_number
order by end_time DESC;
