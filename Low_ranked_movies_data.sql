-- This dataset was pulled from Kaggle
-- The dataset is a collection of 100 movies that were the lowest rated movies according to IMDb website

--Pulling up the dataset
SELECT *
FROM dbo.lowest_ranked_movies_data;

--How many low rating movies has Forest Whitaker starred in?
SELECT *
FROM dbo.lowest_ranked_movies_data
WHERE stars LIKE '%Forest Whitaker%';

-- Name the PG-13 kid friendly movies 
SELECT name, certification
FROM dbo.lowest_ranked_movies_data
WHERE certification = 'PG-13' 
GROUP BY name, certification

-- What are the names of the movies with the lowest rating?
SELECT *
FROM dbo.lowest_ranked_movies_data
WHERE rating = (SELECT MIN(rating) FROM dbo.lowest_ranked_movies_data);

-- How many movies are in the comedy genre?
SELECT name
FROM dbo.lowest_ranked_movies_data
WHERE genre LIKE '%Comedy%'
GROUP BY name;

-- What are the names of the movies with the higest rating ?
SELECT *
FROM dbo.lowest_ranked_movies_data
WHERE rating = (SELECT MAX(rating) FROM dbo.lowest_ranked_movies_data);

-- What are the names of the movies that were released after the year 2000?
SELECT name, year
FROM dbo.lowest_ranked_movies_data
WHERE year > 2000
ORDER BY year;


