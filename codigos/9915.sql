*/
Highest Cost Orders

Difficulty: Medium

Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. If customer had more than one order on a certain day, sum the order costs on daily basis. Output customer's first name, total cost of their items, and the date.
For simplicity, you can assume that every first name in the dataset is unique

customers
id: int
first_name: varchar
last_name: varchar
city: varchar
address: varchar
phone_number: varchar

orders
id: int
cust_id: int
order_date: datetime
order_details: varchar
total_order_cost: int

*/

select c.first_name, o.order_date, sum(o.total_order_cost) as total_cost from orders as o
left join customers as c on o.cust_id = c.id
where order_date between '2019-02-01' and '2019-05-01'
group by order_date, first_name
order by total_cost desc
limit 1;


