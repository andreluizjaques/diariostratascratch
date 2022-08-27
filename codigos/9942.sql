/*
Largest Olympics

Difficulty: Medium

Find the Olympics with the highest number of athletes. The Olympics game is a combination of the year and the season, and is found in the 'games' column. Output the Olympics along with the corresponding number of athletes

olympics_athletes_events
id:	int
name:	varchar
sex:	varchar
age:	float
height:	float
weight:	datetime
team:	varchar
noc:	varchar
games:	varchar
year:	int
season:	varchar
city:	varchar
sport:	varchar
event:	varchar
medal:	varchar
non_team: datetime
*/

select games, count(distinct id) as athletes_count from olympics_athletes_events
group by games
order by athletes_count desc limit 1;
