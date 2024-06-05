SELECT name,salary from employee order by salary desc limit 1 offset 2;

SELECT * FROM gapminder;

CREATE TABLE gapminder (
    country VARCHAR(255),
    year INT,
    population INT,
    continent VARCHAR(255),
    life_exp FLOAT,
    gdp_cap FLOAT
);


COPY gapminder (country , year, population , continent, life_exp,gdp_cap)
FROM 'C:\Users\anshi\Desktop\DataSets\PowerBI-Datasets-main\gapminder.csv'
DELIMITER ','
CSV HEADER;

SELECT continent,count(country) as total_country from gapminder group by continent order by total_country;

SELECT country,year,gdp_cap from gapminder where continent = 'Asia';

SELECT distinct country from gapminder order by country;

SELECT 
	country,year
    population,
    ROUND(CAST(gdp_cap AS NUMERIC), 2) AS gdp_cap_rounded
FROM 
    gapminder where country='India';

select country,Round(CAST(avg(gdp_cap) as NUMERIC),2) as avg_gdp 
	from gapminder where continent = 'Asia'
	group by country
	having avg(life_exp) > 49;

SHOW TIMEZONE
SELECT NOW()
SELECT TIMEOFDAY()
SELECT CURRENT_TIME
SELECT CURRENT_DATE














