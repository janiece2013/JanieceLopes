--This dataset was pulled from Kaggle.
--The dataset is an analysis of a company's ideal customer.
--This information helps a business to better understand its customers and modify products based on its target audience.

--Pulling up the dataset
SELECT *
FROM dbo.Ideal_customer;

-- What is the average birth year of a customer? The average birth year is 1969.
SELECT ROUND(AVG(Year_Birth),0)
FROM dbo.Ideal_customer;


--What is the Average income of the customers? The average income is 52,247.
Select ROUND(AVG([ Income ]),0)
FROM dbo.Ideal_customer


--What type of education and Income did the the average customer have? Graduation: 52,720; PhD:56,145; Master:52,918; Basic:20,306
SELECT Education, ROUND(AVG([ Income ]),0) AS Avg_Income
FROM dbo.Ideal_customer
GROUP BY Education;


--What is the marital status and income of the company's average customer? Single:50,995; Divorced:52,834; Married:51,725
SELECT Marital_Status, ROUND(AVG([ Income ]),0) AS AVG_Income
FROM dbo.Ideal_customer
WHERE Marital_Status = 'Single'OR Marital_Status = 'Divorced'OR Marital_Status = 'Married'
GROUP BY Marital_Status;


--What is the income of the higest paid customer? The higest paid customer makes $666,666.
SELECT *
FROM dbo.Ideal_customer
WHERE [ Income ] = (SELECT MAX([ income ]) FROM dbo.Ideal_customer);


--How many customers live in the United States? 623,457 of the company's customers live in the United States.
SELECT SUM(ID) AS '# of USA customers'
FROM dbo.Ideal_customer
WHERE Country = 'USA';

--What is the average amount of small children do married couples have? Married couples have an average of 0 small children.
SELECT Marital_Status, ROUND(AVG(Kidhome),0) 'Avg # of kids in each married home'
FROM dbo.Ideal_customer
WHERE Marital_Status = 'Married'
GROUP BY Marital_Status;


--What is the average amount of teens do married couples have? Married couples have an average of 1 teen in their home. 
SELECT Marital_Status, ROUND(AVG(Teenhome),0) 'Avg # of Teens in each married home'
FROM dbo.Ideal_customer
WHERE Marital_Status = 'Married'
GROUP BY Marital_Status;