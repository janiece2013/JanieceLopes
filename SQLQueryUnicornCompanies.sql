-- Unicorn companies are private companies with a valuation over $1 billion 
-- I will be answering a few questions regarding the Unicorn companies listed in the dataset


--The dataset was pulled from Maven Analytics and uploaded to SSMS 
SELECT *
FROM dbo.Unicorn_Companies

--What investors have funded the most Unicorns? The top three companies are Sequoia Capital
--Shunwei Capital Partners, China Media Group, Guangzhou Huiyin Aofeng Equity Investment Fund SoftBank Group
SELECT COUNT(Funding), [Select Investors]
FROM dbo.Unicorn_Companies
Group BY [Select Investors]
ORDER BY COUNT(Funding)DESC;

--Which unicorn companies have had the biggest return on investment? Bytedance has had the biggest return.
SELECT Company, Valuation, Funding, [Select Investors]
FROM dbo.Unicorn_Companies;

--Which countries have the most unicorns? The top 3 Contries with the most unicorns is The United States, China, and India.
SELECT Country
FROM dbo.Unicorn_Companies
WHERE Valuation > '$1B'
GROUP BY Country
ORDER BY COUNT(Company) DESC;


--What city in the United states has the Higest Valuation? The city with the higest valuation is Hawthorne.
SELECT Valuation, City, Country
FROM dbo.Unicorn_Companies
WHERE Country = 'United States'






