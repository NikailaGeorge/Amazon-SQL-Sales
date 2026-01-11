-- Amazon Product SQL Analysis
-- Author: Nikaila George
-- Tool: SQlite (DB Browser)



-- Q1: Unique products
SELECT COUNT(DISTINCT product_id) AS unique_prod
FROM amazon;


-- Q2: total discounted values
SELECT ROUND(SUM(discounted_price), 2) AS total_discount
FROM amazon;


-- Q3: products with highest engagement
SELECT product_name, category, rating_count
FROM amazon
WHERE rating_count IS NOT NULL
ORDER BY rating_count DESC
LIMIT 10;


-- Q4 average of ratings and discounts by category
SELECT category, ROUND(AVG(rating), 2) AS avg_rating, ROUND(AVG(discount_percentage), 2) AS avg_discount_percent
FROM amazon
WHERE rating IS NOT NULL AND discount_percentage IS NOT NULL
GROUP BY category
ORDER BY avg_rating DESC;


-- Q5  Higher discounts correlation to ratings
SELECT  ROUND(AVG(rating), 2) AS avg_rating, COUNT(*) AS product_count, 
  CASE
	WHEN discount_percentage < 10 THEN  '0-9%'
	WHEN discount_percentage BETWEEN 10 AND 29 THEN  '10-29%'
	WHEN discount_percentage BETWEEN 30 AND 49 THEN '30-49%'
	ELSE '50%+'
  END AS discount_range
FROM amazon
WHERE discount_percentage IS NOT NULL AND rating IS NOT NULL
GROUP BY discount_range
ORDER BY discount_range;
