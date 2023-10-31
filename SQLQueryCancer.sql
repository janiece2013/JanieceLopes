-- This dataset was pulled from data.world. The information in the dataset shows the cancer rate by U.S. states in 1999-2013. 
--The rates represents the number out of 100,000 people who developed or died from cancer each year.
-- Incidence table represents the number of people who got Cancer.

-- Joining the death and Incidence tables together 
SELECT *
FROM dbo.uscs_map_death_all AS DEATHS
JOIN dbo.uscs_map_incidence_all AS INCIDENCE
ON DEATHS.state = INCIDENCE.state
ORDER BY DEATHS.rate DESC;

-- Which state has the highest rate of Cancer Incidences? The answer is Kentucky with a rate of 513.7
Select *
FROM dbo.uscs_map_incidence_all
WHERE rate =(select MAX(rate) FROM dbo.uscs_map_incidence_all);

-- Which state has the highest rate of deaths? The answer is Kentucky with a rate of 199.3
SELECT *
FROM dbo.uscs_map_death_all
WHERE rate = (select MAX(rate) FROM dbo.uscs_map_death_all);

-- Which state has the least amount of Cancer Incidences? The answer is New Mexico with a rate of 369.9
SELECT*
FROM dbo.uscs_map_incidence_all
WHERE rate = (select MIN(rate) from dbo.uscs_map_incidence_all);

--Which state has the least amount of deaths? The answer is Utah with a rate of 127.9
SELECT *
FROM dbo.uscs_map_death_all
WHERE rate = (select MIN(rate) FROM dbo.uscs_map_death_all);

-- Which is the average death rate amoung all states? The average death rate is 165.09
SELECT ROUND(AVG(rate),2) AS 'AVG Death Rate'
FROM dbo.uscs_map_death_all;

--Total number of Incidence VS Deaths
--Total deaths are 8419 VS total Incidences are 22462
SELECT ROUND(SUM(DEATHS.rate),0) AS DEATHS, ROUND(SUM(INCIDENCE.rate),0) AS INCIDENCE
FROM dbo.uscs_map_death_all AS DEATHS
JOIN dbo.uscs_map_incidence_all AS INCIDENCE
ON DEATHS.state = INCIDENCE.state

--What is the percentage of deaths per state
SELECT state, ROUND(rate*100/(select SUM(rate) FROM dbo.uscs_map_death_all),2) AS 'Percentage of deaths'
FROM dbo.uscs_map_death_all AS DEATHS
order by state;

