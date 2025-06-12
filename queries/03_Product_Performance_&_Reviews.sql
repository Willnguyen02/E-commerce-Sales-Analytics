/*
=============================================================
Product Performance & Reviews
=============================================================

Objective:
    - Identify the product with the highest average review score
    - Analyze how total annual sales vary across products based on their associated customer review scores
    - Determine which
    - Determine which products have a review score of below 3.0 
    - Calculate the average reveiw count for each product category
    - Identify the product with the highest review count but lowest sales
*/


-- Higest average review score product
SELECT
	product_name,
    AVG(review_score) AS average_review_score
FROM sales
GROUP BY product_name
ORDER BY average_review_score DESC;


-- Analyze how total annual sales vary across products based on their associated customer review scores
SELECT 
	product_name,
    review_score,
    SUM((
		COALESCE(sales_month_1, 0) +
        COALESCE(sales_month_2, 0) +
        COALESCE(sales_month_3, 0) +
        COALESCE(sales_month_4, 0) +
        COALESCE(sales_month_5, 0) +
        COALESCE(sales_month_6, 0) +
        COALESCE(sales_month_7, 0) +
        COALESCE(sales_month_8, 0) +
        COALESCE(sales_month_9, 0) +
        COALESCE(sales_month_10, 0) +
        COALESCE(sales_month_11, 0) +
        COALESCE(sales_month_12, 0) 
	)) AS total_sales
FROM sales
GROUP BY product_name, review_score
ORDER BY total_sales DESC;
    

-- Determine which products have a review score of below 3.0 
SELECT 
	product_name,
    review_score,
	SUM((
		COALESCE(sales_month_1, 0) +
        COALESCE(sales_month_2, 0) +
        COALESCE(sales_month_3, 0) +
        COALESCE(sales_month_4, 0) +
        COALESCE(sales_month_5, 0) +
        COALESCE(sales_month_6, 0) +
        COALESCE(sales_month_7, 0) +
        COALESCE(sales_month_8, 0) +
        COALESCE(sales_month_9, 0) +
        COALESCE(sales_month_10, 0) +
        COALESCE(sales_month_11, 0) +
        COALESCE(sales_month_12, 0) 
	)) AS total_sales
FROM sales
WHERE review_score < 3
GROUP BY product_name, review_score
ORDER BY review_score DESC;


-- Calculate the average reveiw count for each product category
SELECT
	category,
    AVG(review_score)
FROM sales
GROUP BY category;


-- Identify the product with the highest review count but lowest sales
SELECT 
	product_name,
    review_score,
    SUM((
		COALESCE(sales_month_1, 0) +
        COALESCE(sales_month_2, 0) +
        COALESCE(sales_month_3, 0) +
        COALESCE(sales_month_4, 0) +
        COALESCE(sales_month_5, 0) +
        COALESCE(sales_month_6, 0) +
        COALESCE(sales_month_7, 0) +
        COALESCE(sales_month_8, 0) +
        COALESCE(sales_month_9, 0) +
        COALESCE(sales_month_10, 0) +
        COALESCE(sales_month_11, 0) +
        COALESCE(sales_month_12, 0) 
	)) AS total_sales
FROM sales
GROUP BY product_name, review_score
ORDER BY review_score DESC, total_sales ASC
LIMIT 1;