*/
Number Of Units Per Nationality

Difficulty: Medium

Find the number of apartments per nationality that are owned by people under 30 years old.
Output the nationality along with the number of apartments.
Sort records by the apartments count in descending order.

airbnb_hosts
host_id: int
nationality: varchar
gender: varchar
age: int

airbnb_units
host_id: int
unit_id: varchar
unit_type: varchar
n_beds: int
n_bedrooms: int
country: varchar
city: varchar
*/
select A.nationality, count(*) from (select distinct host_id,nationality,age from airbnb_hosts) A join airbnb_units B on A.host_id=B.host_id where A.age<30 and B.unit_type='Apartment' group by A.nationality
