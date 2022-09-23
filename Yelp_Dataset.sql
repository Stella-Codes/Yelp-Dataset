# Part I: Yelp Dataset Profiling and Understanding:

## 1. Profile the data by finding the total number of records for each of the tables below:

i. Attribute table = 10,000
ii. Business table = 10,000
iii. Category table = 10,000
iv. Checkin table = 10,000
v. elite_years table = 10,000
vi. friend table = 10,000
vii. hours table = 10,000
viii. photo table = 10,000
ix. review table = 10,000
x. tip table = 10,000
xi. user table = 10,000

## SQL Code:

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

i. Business = 10,000
ii. Hours = 1562
iii. Category = 2643
iv. Attribute = 1115
v. Review = 10,000
vi. Checkin = 493
vii. Photo = 6493
viii. Tip = 3979
ix. User = 10,000
x. Friend = 11
xi. Elite_years = 2780

## SQL Code:

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
-- No.

## SQL Code:

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

i. Table: Review, Column: Stars
	
		min:	1	max:	5	avg: 3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min:	1	max:	5	avg: 3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min:	0	max:	2	avg: 0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min:	1	max:	53	avg:  1.9414
		
	
	v. Table: User, Column: Review_count
	
		min:	0	max:	2,000	avg: 24.2995
        
## SQL Code:

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

## OUTPUT:

city            | TotalReviews |
+-----------------+--------------+
| Las Vegas       |         1561 |
| Phoenix         |         1001 |
| Toronto         |          985 |
| Scottsdale      |          497 |
| Charlotte       |          468 |
| Pittsburgh      |          353 |
| Montréal        |          337 |
| Mesa            |          304 |
| Henderson       |          274 |
| Tempe           |          261 |
| Edinburgh       |          239 |
| Chandler        |          232 |
| Cleveland       |          189 |
| Gilbert         |          188 |
| Glendale        |          188 |
| Madison         |          176 |
| Mississauga     |          150 |
| Stuttgart       |          141 |
| Peoria          |          105 |
| Markham         |           80 |
| Champaign       |           71 |
| North Las Vegas |           70 |
| North York      |           64 |
| Surprise        |           60 |
| Richmond Hill   |           54 |
+-----------------+--------------+
(Output limit exceeded, 25 of 362 total rows shown)

## 6. Find the distribution of star ratings to the business in the following cities:

SELECT city, stars, COUNT(id) AS TotalBusinesses
FROM Business
WHERE city = 'Avon'
GROUP BY stars

## OUTPUT:

+------+-------+-----------------+
| city | stars | TotalBusinesses |
+------+-------+-----------------+
| Avon |   1.5 |               1 |
| Avon |   2.5 |               2 |
| Avon |   3.5 |               3 |
| Avon |   4.0 |               2 |
| Avon |   4.5 |               1 |
| Avon |   5.0 |               1 |
+------+-------+-----------------+

SELECT city, stars, COUNT(id) AS TotalBusinesses
FROM Business
WHERE city = 'Beachwood'
GROUP BY stars

## OUTPUT:

+-----------+-------+-----------------+
| city      | stars | TotalBusinesses |
+-----------+-------+-----------------+
| Beachwood |   2.0 |               1 |
| Beachwood |   2.5 |               1 |
| Beachwood |   3.0 |               2 |
| Beachwood |   3.5 |               2 |
| Beachwood |   4.0 |               1 |
| Beachwood |   4.5 |               2 |
| Beachwood |   5.0 |               5 |
+-----------+-------+-----------------+

## 7. Find the top 3 users based on their total number of reviews:

SELECT id, name, SUM(review_count) as TotalReviews
FROM User 
GROUP BY id
ORDER BY review_count DESC limit 3

## OUTPUT:

+------------------------+--------+--------------+
| id                     | name   | TotalReviews |
+------------------------+--------+--------------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
+------------------------+--------+--------------+

## 8. Does posting more reviews correlate with more fans?
-- No:

SELECT id, review_count, fans
FROM User
ORDER BY review_count DESC

## OUTPUT:

+------------------------+--------------+------+
| id                     | review_count | fans |
+------------------------+--------------+------+
| -G7Zkl1wIWBBmD0KRy_sCw |         2000 |  253 |
| -3s52C4zL_DHRK0ULG6qtg |         1629 |   50 |
| -8lbUNlXVSoXqaRRiHiSNg |         1339 |   76 |
| -K2Tcgh2EKX6e6HqqIrBIQ |         1246 |  101 |
| -FZBTkAZEXoP7CYvRV2ZwQ |         1215 |  126 |
| --2vR0DIsmQ6WfcSzKWigw |         1153 |  311 |
| -gokwePdbXjfS0iF7NsUGA |         1116 |   16 |
| -DFCC64NXgqrxlO8aLU5rg |         1039 |  104 |
| -8EnCioUmDygAbsYZmTeRQ |          968 |  497 |
| -0IiMAZI2SsQ7VmyzJjokQ |          930 |  173 |
| -fUARDNuXAfrOn4WLSZLgA |          904 |   38 |
| -hKniZN2OdshWLHYuj21jQ |          864 |   43 |
| -9da1xk7zgnnfO1uTVYGkA |          862 |  124 |
| -B-QEUESGWHPE_889WJaeg |          861 |  115 |
| -kLVfaJytOJY2-QdQoCcNQ |          842 |   85 |
| -kO6984fXByyZm3_6z2JYg |          836 |   37 |
| -lh59ko3dxChBSZ9U7LfUw |          834 |  120 |
| -g3XIcCb2b-BD0QBCcq2Sw |          813 |  159 |
| -l9giG8TSDBG1jnUBUXp5w |          775 |   61 |
| -dw8f7FLaUmWR7bfJ_Yf0w |          754 |   78 |
| -AaBjWJYiQxXkCMDlXfPGw |          702 |   35 |
| -jt1ACMiZljnBFvS6RRvnA |          696 |   10 |
| -IgKkE8JvYNWeGu8ze4P8Q |          694 |  101 |
| -hxUwfo3cMnLTv-CAaP69A |          676 |   25 |
| -H6cTbVxeIRYR-atxdielQ |          675 |   45 |
+------------------------+--------------+------+

## 9. Are there more reviews with the word "love" or with the word "hate" in them?
 -- There are more reviews with the word "Love" than "Hate":
 
SELECT COUNT(*) AS LoveWordCount
FROM Review
WHERE text like '%love%'

## OUTPUT:

+---------------+
| LoveWordCount |
+---------------+
|          1780 |
+---------------+

SELECT COUNT(*) AS HateWordCount
FROM Review
WHERE text like '%hate%'

## OUTPUT:

+---------------+
| HateWordCount |
+---------------+
|           232 |
+---------------+

## 10. Find the top 10 users with the most fans:

SELECT id, name, fans
FROM User
ORDER BY fans DESC limit 10

## OUTPUT:

+------------------------+-----------+------+
| id                     | name      | fans |
+------------------------+-----------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
+------------------------+-----------+------+

# Part II: Inferences and Analysis:

### Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions:
## 1. Do the two groups you chose to analyze have a different distribution of hours?


-- City: Las Vegas      Category: Shopping
	
## i. Do the two groups you chose to analyze have a different distribution of hours? Yes.


## ii. Do the two groups you chose to analyze have a different number of reviews? Yes.
         
         
## iii. Are you able to infer anything from the location data provided between these two groups? Explain.

-- From the 4 locations provided it seems that 'Desert Medical Equipment' with a Monday 8:00-17:00 schedule is most popular with 5 stars, however it only has 4 reviews. 
-- The next best on the other hand 'Red Rock Canyon Visitor Center' has 4.5 stars, 32 reviews and a schedule of Saturday 8:00-16:30.
-- In my opinion the 'Red Rock Canyon Visitor Center' location with a better sample size is more trust-worthy when it comes to ratings.
-- Grouping by 2-3 stars and 4-5 stars hinders the analysis as it doesn't take into account locations with 3.5 stars which are labeled 'Other'.

## SQL code used for analysis:

SELECT
CASE WHEN b.stars = 2 THEN "2-3 stars"
     WHEN b.stars = 2.5 THEN "2-3 stars"
     WHEN b.stars = 3 THEN "2-3 stars" 
     WHEN b.stars = 4 THEN "4-5 stars"
     WHEN b.stars = 4.5 THEN "4-5 stars"
     WHEN b.stars = 5 THEN "4-5 stars"
     ELSE "Other"
     END star_rating,
b.city, b.postal_code, b.name, b.stars, b.review_count, c.category, h.hours
FROM((Business b INNER JOIN Category c ON b.id = c.business_id)
    INNER JOIN Hours h ON h.business_id = c.business_id)
WHERE City = 'Las Vegas' AND Category = 'Shopping'
GROUP BY stars
ORDER BY star_rating ASC

## OUTPUT:

+-------------+-----------+-------------+--------------------------------+-------+--------------+----------+----------------------+
| star_rating | city      | postal_code | name                           | stars | review_count | category | hours                |
+-------------+-----------+-------------+--------------------------------+-------+--------------+----------+----------------------+
| 2-3 stars   | Las Vegas | 89121       | Walgreens                      |   2.5 |            6 | Shopping | Saturday|8:00-22:00  |
| 4-5 stars   | Las Vegas | 89161       | Red Rock Canyon Visitor Center |   4.5 |           32 | Shopping | Saturday|8:00-16:30  |
| 4-5 stars   | Las Vegas | 89118       | Desert Medical Equipment       |   5.0 |            4 | Shopping | Monday|8:00-17:00    |
| Other       | Las Vegas | 89121       | Wooly Wonders                  |   3.5 |           11 | Shopping | Saturday|10:00-16:00 |
+-------------+-----------+-------------+--------------------------------+-------+--------------+----------+----------------------+

## 2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences.

## i. Difference 1: Open businesses have way more reviews than the ones that are closed.
         
         
## ii. Difference 2: Open businesses average more stars than closed businesses.

## SQL Code used for analysis:

SELECT  
CASE  WHEN is_open = 1 THEN "Open"
	  WHEN is_open = 0 THEN "Closed"
	  END BusinessStatus, 
         COUNT(id) AS TotalIDs, 
         AVG(review_count) AS AverageReviewCount,
         AVG(stars) AS AverageStars,
         SUM(review_count) AS TotalReviews
FROM business
GROUP BY BusinessStatus
ORDER BY BusinessStatus DESC

## OUTPUT:

+----------------+----------+--------------------+---------------+--------------+
| BusinessStatus | TotalIDs | AverageReviewCount |  AverageStars | TotalReviews |
+----------------+----------+--------------------+---------------+--------------+
| Open           |     8480 |      31.7570754717 | 3.67900943396 |       269300 |
| Closed         |     1520 |      23.1980263158 | 3.52039473684 |        35261 |
+----------------+----------+--------------------+---------------+--------------+

## 3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

## Provide answers, in-line, to all of the following:
	
## i. Indicate the type of analysis you chose to do:
         
-- I chose Sentiment Analysis: I aim to find out which business categories are most popular and why.
-- This analysis could be used by consumers to know where to shop or by a brand new business trying to stablish themselves and have a successful launch based on what is already popular.  
		
## ii. Write a brief paragraph on the type of data you will need for your analysis and why you chose that data:
                        
-- This analysis is broken down in 2 parts. First, what categories are most popular? Second, what makes these categories stand out?
-- For this analysis I will need the data from the Business, Category, and Review tables.
-- I chose this data so I can classify business categories before diving into the analysis. These tables will also help me define what is considered popular.
-- Once I can visualize items such as average stars or review count I will be able to dig deeper in the reviews to find out why some businesses are more successful than others.
-- For the purpose of this analysis 'successful' is defined as a balance of having the most stars but also the most reviews.
                  
## iii. Joining the Business and Category tables, grouping by categories and ordering by stars greater or equal to 3.5 to limit results:

SELECT c.category,
       b.city,
       b.name,
       ROUND(AVG(b.stars),1) AS AverageStars,
       b.review_count,
       h.hours
FROM((Business b INNER JOIN Category c ON b.id = c.business_id)
    INNER JOIN Hours h ON h.business_id = c.business_id)
WHERE b.stars >= 3.5
GROUP BY c.category
ORDER BY AverageStars DESC

## OUTPUT:

+---------------------------------+------------+--------------------------------------+--------------+--------------+----------------------+
| category                        | city       | name                                 | AverageStars | review_count | hours                |
+---------------------------------+------------+--------------------------------------+--------------+--------------+----------------------+
| Arabian                         | Mesa       | Green Corner Restaurant              |          5.0 |          267 | Saturday|10:30-22:00 |
| Auto Detailing                  | Phoenix    | Race Day Mobile Detailing            |          5.0 |           40 | Saturday|7:30-19:30  |
| Bike Repair/Maintenance         | Pittsburgh | PRO BIKE+RUN                         |          5.0 |            8 | Saturday|10:00-18:00 |
| Bikes                           | Pittsburgh | PRO BIKE+RUN                         |          5.0 |            8 | Saturday|10:00-18:00 |
| Blow Dry/Out Services           | Henderson  | Brandi Gilstrap                      |          5.0 |            5 | Saturday|9:00-16:00  |
| Car Wash                        | Phoenix    | Race Day Mobile Detailing            |          5.0 |           40 | Saturday|7:30-19:30  |
| Carpet Installation             | Charlotte  | Journey's Dry Carpet Cleaning        |          5.0 |            3 | Saturday|8:00-20:00  |
| Child Care & Day Care           | Chandler   | Adobe Montessori                     |          5.0 |            5 | Monday|7:00-16:00    |
| Chiropractors                   | Phoenix    | Back-Health Chiropractic             |          5.0 |           19 | Monday|14:30-17:00   |
| Colonics                        | Tempe      | Clean Colonic                        |          5.0 |            5 | Saturday|10:00-16:00 |
| Department Stores               | Chandler   | Dollar Mania                         |          5.0 |            4 | Saturday|9:00-20:00  |
| Discount Store                  | Chandler   | Dollar Mania                         |          5.0 |            4 | Saturday|9:00-20:00  |
| Dog Walkers                     | Surprise   | Kelsey's Pet Sitting & Dog Walking   |          5.0 |            3 | Saturday|7:00-20:00  |
| Door Sales/Installation         | Chandler   | Springmaster Garage Door Service     |          5.0 |            7 | Saturday|5:00-0:00   |
| Electronics Repair              | Sun City   | PC Savants                           |          5.0 |           11 | Saturday|11:00-18:00 |
| Elementary Schools              | Chandler   | Adobe Montessori                     |          5.0 |            5 | Monday|7:00-16:00    |
| Fitness & Instruction           | Tempe      | Lifestyles Fitness Personal Training |          5.0 |           17 | Saturday|5:00-21:00  |
| Garage Door Services            | Chandler   | Springmaster Garage Door Service     |          5.0 |            7 | Saturday|5:00-0:00   |
| Greek                           | Charlotte  | Big City Grill                       |          5.0 |            4 | Saturday|11:00-20:00 |
| Gyms                            | Tempe      | Lifestyles Fitness Personal Training |          5.0 |           17 | Saturday|5:00-21:00  |
| Hair Extensions                 | Henderson  | Brandi Gilstrap                      |          5.0 |            5 | Saturday|9:00-16:00  |
| Hair Removal                    | Henderson  | Brandi Gilstrap                      |          5.0 |            5 | Saturday|9:00-16:00  |
| Hair Stylists                   | Henderson  | Brandi Gilstrap                      |          5.0 |            5 | Saturday|9:00-16:00  |
| Halal                           | Mesa       | Green Corner Restaurant              |          5.0 |          267 | Saturday|10:30-22:00 |
| Heating & Air Conditioning/HVAC | Las Vegas  | Motors & More                        |          5.0 |            7 | Saturday|8:00-12:00  |
+---------------------------------+------------+--------------------------------------+--------------+--------------+----------------------+
(Output limit exceeded, 25 of 197 total rows shown)

-- From this output I can now look up reviews for these business categories and understand why they have such high ratings.
-- I could go deeper into the text column from the review table and perform key word searches such as 'Love and 'Hate' like earlier in the profiling portion of this worksheet.


## iv. Joining the Business and Category tables to establish the best balance of total businesses (at least 5), stars (at least 3.5) and reviews (at least 55):

SELECT c.category,
       COUNT(b.id) AS TotalBusinesses,
       ROUND(AVG(b.stars),1) AS AverageStars,
       SUM(b.review_count) AS TotalReviews
FROM Category c INNER JOIN Business b ON c.business_id = b.id
GROUP BY Category
HAVING TotalBusinesses >=5 AND AverageStars >=3.5 AND TotalReviews >=50
ORDER BY AverageStars DESC LIMIT 10

## OUTPUT:

+----------------------+-----------------+--------------+--------------+
| category             | TotalBusinesses | AverageStars | TotalReviews |
+----------------------+-----------------+--------------+--------------+
| Automotive           |               9 |          4.5 |          198 |
| Active Life          |              10 |          4.2 |          131 |
| Doctors              |               5 |          4.2 |           55 |
| Local Services       |              12 |          4.2 |          100 |
| Bakeries             |               5 |          4.1 |          239 |
| Hair Salons          |               6 |          4.1 |           65 |
| Health & Medical     |              17 |          4.1 |          203 |
| Arts & Entertainment |               7 |          4.0 |          388 |
| Home Services        |              16 |          4.0 |           94 |
| Shopping             |              30 |          4.0 |          977 |
+----------------------+-----------------+--------------+--------------+

-- From this final table I can see the most popular businesses with a good average of stars and total reviews.
-- As a consumer this would help me shop and as someone trying to open a business this would help me see what is working best for established businesses.
-- Looking ahead, from further analysis I could find out what areas are lacking certain businesses categories.


