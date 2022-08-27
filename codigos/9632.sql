/*
Host Popularity Rental Prices

Difficulty: Hard

You’re given a table of rental property searches by users. The table consists of search results and outputs host information for searchers. Find the minimum, average, maximum rental prices for each host’s popularity rating. The host’s popularity rating is defined as below:
0 reviews: New
1 to 5 reviews: Rising
6 to 15 reviews: Trending Up
16 to 40 reviews: Popular
more than 40 reviews: Hot

Tip: The id column in the table refers to the search ID. You'll need to create your own host_id by concating price, room_type, host_since, zipcode, and number_of_reviews.

Output host popularity rating and their minimum, average and maximum rental prices.
*/

select popularity_rate, min(price) as min_price, avg(price) as avg_price, max(price) as max_price from(   
    select 
        concat(price, room_type, host_since, zipcode, number_of_reviews) as cod_id, price,
            case 
                when number_of_reviews = 0 then 'New'
                when number_of_reviews between 1 and 5 then 'Rising'
                when number_of_reviews between 6 and 15 then 'Trending Up'
                when number_of_reviews between 16 and 40 then 'Popular'
                when number_of_reviews  > 40 then 'Hot'
            end as popularity_rate
    from airbnb_host_searches
    group by cod_id) as tb1
group by popularity_rate;
