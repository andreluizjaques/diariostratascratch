/*
Marketing Campaign Success [Advanced]

Difficulty: Hard

You have a table of in-app purchases by user. Users that make their first in-app purchase are placed in a marketing campaign where they see call-to-actions for more in-app purchases. Find the number of users that made additional in-app purchases due to the success of the marketing campaign.

The marketing campaign doesn't start until one day after the initial in-app purchase so users that only made one or multiple purchases on the first day do not count, nor do we count users that over time purchase only the products they purchased on the first day.

marketing_campaign
user_id: int
created_at: datetime
product_id: int
quantity: int
price: int
*/

select count(distinct user_id) as total_users from(
    select user_id, created_at,
            dense_rank() over(partition by user_id order by created_at) as date_ranking,
            dense_rank() over(partition by user_id, product_id order by created_at) as product_ranking 
    from marketing_campaign) as ranking
where date_ranking > 1 and product_ranking=1;
