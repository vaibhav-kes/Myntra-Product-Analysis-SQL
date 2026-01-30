USE myntra;

-- Select all columns and sort by price in descending order to get the highest first
select * from products order by discounted_price desc;


-- Sort by price in ascending order to see the cheapest products at the top
select * from products order by discounted_price asc;


-- Use LIMIT 5 to restrict the results to only the top five highest-priced items
select * from products order by discounted_price desc limit 5;


-- Create a calculated column 'comb_rating' to represent overall popularity and sort by it
select product_name, rating, rating_count,
       round(rating * rating_count) as comb_rating
from products
order by comb_rating desc limit 5;


-- Filter for 'tshirts' and sort by the product of rating and count
select * from products
where product_tag = 'tshirts'
order by rating * rating_count desc;


-- Use OFFSET (limit 1,1) to skip the first row and take the second one
select product_name, rating, rating_count, discounted_price
from products
order by discounted_price desc limit 1,1;


-- Skip the cheapest product to find the one immediately above it in price
select product_name, rating, rating_count, discounted_price
from products
order by discounted_price asc limit 1,1;


-- Skips the first 9 products and returns the 10th
select product_name, rating, rating_count, discounted_price
from products
order by discounted_price desc limit 9,1;


-- Filter by brand 'nike' and sort by popularity score in ascending order
select product_name, rating, rating_count,
       round(rating * rating_count) as comb_rating
from products
where brand_tag = 'nike'
order by comb_rating asc limit 5;


-- Add a condition to exclude products that haven't been rated yet (rating != 0)
select product_name, rating, rating_count,
       round(rating * rating_count) as comb_rating
from products
where brand_tag = 'nike' and rating != 0
order by comb_rating asc limit 5;


-- Use IN to filter multiple brands and combine with product_tag filter
select product_name, rating, rating_count, brand_tag, discounted_price,
       round(rating * rating_count) as comb_rating
from products
where brand_tag in ('nike','adidas') and product_tag = 'tshirts'
order by comb_rating desc limit 10;


-- Ensure statistical significance by filtering for products with more than 100 reviews
select product_name, rating, rating_count, brand_tag, product_tag,
       discounted_price, product_link
from products
where rating_count > 100
order by rating asc limit 20;


-- Filter specifically for tshirts while maintaining the minimum rating count threshold
select product_name, rating, rating_count, brand_tag, discounted_price,
       product_link
from products
where product_tag = 'tshirts' and rating_count > 100
order by rating asc limit 20;

 
-- To get the LAST 10, you would usually order by product_name DESC limit 10.
select * from products
order by product_name asc limit 10;


-- Use BETWEEN for price ranges and multi-column sorting (brand first, then price)
select product_name, rating, rating_count, brand_tag, discounted_price
from products
where brand_tag in ('nike','adidas')
  and product_tag = 'tshirts'
  and discounted_price between 1000 and 1200
order by brand_tag asc, discounted_price asc;


-- Similar to Q15, but priority is given to sorting by price first
select product_name, rating, rating_count, brand_tag, discounted_price
from products
where brand_tag in ('nike','adidas')
  and product_tag = 'tshirts'
  and discounted_price between 1000 and 2000
order by discounted_price asc, brand_tag asc;






