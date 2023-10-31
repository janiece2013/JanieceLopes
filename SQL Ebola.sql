-- This dataset was pulled from data.world and uploaded to SSMS
--This dataset represents ebola cases reported from AUGUST 2014 TO MARCH 2016
--I will be answering questions regarding the information in the dataset

-- Pulling up the data in the table 
SELECT *
FROM dbo.ebola_data_db_format
ORDER BY date DESC

-- List of the countries affected by Ebola
Select Country
From dbo.ebola_data_db_format
GROUP BY Country
ORDER BY Country;

-- What is the total number of Ebola cases reported? There was a total of 16,808,763 cases reported between 8/2014 and 03/2016.
SELECT ROUND(SUM(value),0)
FROM dbo.ebola_data_db_format;


--What is the country with the largest number of Ebola cases? Sierra Leone had the largest amount of Ebola Cases.
--14,122 cases were reported. 
SELECT Country, MAX(value) As 'Number of cases'
FROM dbo.ebola_data_db_format
GROUP BY Country
ORDER by 'Number of cases' DESC;

--How many cases have been reported in the United States? There were 1,932 cases reported in the United States.
SELECT COUNT(value) AS 'Number of cases', Country
From dbo.ebola_data_db_format
WHERE Country LIKE '%United States%'
GROUP BY Country;

--Number of Ebola related deaths in 2014? There were 1,014 deaths reported in 2014.
SELECT COUNT(value) AS 'Number of Deaths'
FROM dbo.ebola_data_db_format
WHERE Indicator LIKE '%deaths%' AND date BETWEEN '2014-01-01' AND '2014-12-31';
