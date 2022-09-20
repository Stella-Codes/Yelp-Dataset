# Part I: Yelp Dataset Profiling and Understanding:

## 1. Profile the data by finding the total number of records for each of the tables below:
	
SELECT COUNT(*) AS TotalRecords
FROM attribute

SELECT COUNT(*) AS TotalRecords
FROM business

SELECT COUNT(*) AS TotalRecords
FROM Category

SELECT COUNT(*) AS TotalRecords
FROM Checkin

SELECT COUNT(*) AS TotalRecords
FROM elite_years

SELECT COUNT(*) AS TotalRecords
FROM friend

SELECT COUNT(*) AS TotalRecords
FROM hours

SELECT COUNT(*) AS TotalRecords
FROM photo

SELECT COUNT(*) AS TotalRecords
FROM review

SELECT COUNT(*) AS TotalRecords
FROM tip

SELECT COUNT(*) AS TotalRecords
FROM user

## 2. Find the total distinct records using Primary or Foreign Keys:

SELECT COUNT (DISTINCT id) AS TotalDistinctRecords
FROM Business

SELECT COUNT (DISTINCT business_id) AS TotalDistinctRecords
FROM Hours

SELECT COUNT (DISTINCT business_id) AS TotalDistinctRecords
FROM Category

SELECT COUNT (DISTINCT business_id) AS TotalDistinctRecords
FROM Attribute

SELECT COUNT (DISTINCT id) AS TotalDistinctRecords
FROM Review

SELECT COUNT (DISTINCT business_id) AS TotalDistinctRecords
FROM Checkin

SELECT COUNT (DISTINCT business_id) AS TotalDistinctRecords
FROM Photo

SELECT COUNT (DISTINCT business_id) AS TotalDistinctRecords
FROM Tip

SELECT COUNT (DISTINCT id) AS TotalDistinctRecords
FROM User

SELECT COUNT (DISTINCT user_id) AS TotalDistinctRecords
FROM Friend

SELECT COUNT (DISTINCT user_id) AS TotalDistinctRecords
FROM Elite_years

## 3. Are there any columns with null values in the User table? Indicate "yes," or "no."
-- No:

SELECT *
FROM User
WHERE id IS NULL
OR name IS NULL
OR review_count IS NULL
OR yelping_since IS NULL
OR useful IS NULL
OR funny is NULL
OR cool IS NULL
OR fans IS NULL
OR average_stars IS NULL
OR compliment_hot IS NULL
OR compliment_more IS NULL
OR compliment_profile IS NULL
OR compliment_cute IS NULL
OR compliment_list IS NULL
OR compliment_note IS NULL
OR compliment_plain IS NULL
OR compliment_cool IS NULL
OR compliment_funny IS NULL
OR compliment_writer IS NULL
OR compliment_photos IS NULL;

## 4. display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

SELECT MIN(stars), MAX(stars), AVG(stars)
FROM Review
--
SELECT MIN(stars), MAX(stars), AVG(stars)
FROM Business
--
SELECT MIN(likes), MAX(likes), AVG(likes)
FROM Tip
--
SELECT MIN(Count), MAX(Count), AVG(Count)
FROM Checkin
--
SELECT MIN(Review_count), MAX(Review_count), AVG(Review_count)
FROM User

## 5. List the cities with the most reviews in descending order:

SELECT City, COUNT(review_count) AS TotalReviews
FROM Business
GROUP BY City
ORDER BY COUNT(review_count) DESC

## 6. Find the distribution of star ratings to the business in the following cities:

SELECT City, stars, COUNT(*) AS TotalReviews
FROM Business
WHERE City = 'Avon'
GROUP BY stars

SELECT City, stars, COUNT(*) AS TotalReviews
FROM Business
WHERE City = 'Beachwood'
GROUP BY stars

## 7. Find the top 3 users based on their total number of reviews:

SELECT id, name, SUM(review_count) as TotalReviews
FROM User 
GROUP BY id
ORDER BY review_count DESC limit 3

## 8. Does posting more reviews correlate with more fans?
-- No:

SELECT id, review_count, fans
FROM User
ORDER BY review_count DESC

## 9. Are there more reviews with the word "love" or with the word "hate" in them?
 -- There are more reviews with the word "Love" than "Hate":
 
SELECT COUNT(*) AS LoveWordCount
FROM Review
WHERE text like '%love%'

SELECT COUNT(*) AS HateWordCount
FROM Review
WHERE text like '%hate%'

## 10. Find the top 10 users with the most fans:

SELECT id, name, fans
FROM User
ORDER BY fans DESC limit 10

# Part II: Inferences and Analysis:

### Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions:
## 1. Do the two groups you chose to analyze have a different distribution of hours?


