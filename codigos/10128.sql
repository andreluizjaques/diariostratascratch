/*
Count the number of movies that Abigail Breslin nominated for oscar

Difficulty: Easy

Count the number of movies that Abigail Breslin was nominated for an oscar.

Table:
year: int
category: varchar
nominee: varchar
movie: varchar
winner: bool
id: int
*/

select count(id) from oscar_nominees
where nominee = 'Abigail Breslin'
