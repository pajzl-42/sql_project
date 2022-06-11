-- FINAL PRIMARY TABLE

CREATE TABLE IF NOT EXISTS t_JAN_TASLER_project_SQL_primary
SELECT
	YEAR(date_to) AS year_of_interest,
	AVG(cp.value) AS avg_price, 
	cp.category_code AS category_code,
	cpc.name AS category_name,
	AVG(cp2.value) AS avg_payroll,
	cp2.industry_branch_code AS industry_branch_code,
	cpib.name AS industry_branch_name
FROM czechia_price cp 
JOIN czechia_payroll cp2 
	ON YEAR(cp.date_to) = cp2.payroll_year 
JOIN czechia_price_category cpc 
	ON cp.category_code = cpc.code
JOIN czechia_payroll_industry_branch cpib 
	ON cp2.industry_branch_code = cpib.code 
WHERE cp.value IS NOT NULL 
	AND cp2.industry_branch_code IS NOT NULL 
	AND cp2.value_type_code = 5958
	AND cp2.calculation_code = 200
GROUP BY cp2.payroll_year, cp.category_code, cp2.industry_branch_code  


CREATE TABLE IF NOT EXISTS t_JAN_TASLER_project_SQL_primary_final
SELECT 
	t.*,
	e.GDP 
FROM t_JAN_TASLER_project_SQL_primary t
JOIN economies e 
	ON e.`year` = year_of_interest
WHERE e.country = 'Czech Republic'

SELECT 
	*
FROM t_JAN_TASLER_project_SQL_primary_final 

-- DROP TABLE IF EXISTS t_JAN_TASLER_project_SQL_primary_final


-- UKOL 1


SELECT
	tab.industry_branch_name AS industry_branch_name,
	tab.industry_branch_code AS industry_branch_code,
	MIN(tab.difference_from_last_year) AS smallest_year_difference
FROM(  
	SELECT 
		avg_payroll AS average_payroll_given_year,
		year_of_interest AS given_year,
		industry_branch_code AS industry_branch_code,
		industry_branch_name AS industry_branch_name,
		avg_payroll - LAG(avg_payroll) OVER (PARTITION BY industry_branch_code ORDER BY year_of_interest) AS difference_from_last_year 
	FROM t_JAN_TASLER_project_SQL_primary_final
	GROUP BY given_year, industry_branch_code
	) AS tab 
GROUP BY tab.industry_branch_code
HAVING MIN(tab.difference_from_last_year) > 0


-- UKOL 2


SELECT 
	year_of_interest AS year_of_interest,
	ROUND(AVG(avg_price),1) AS avg_price,
	category_code AS category_code,
	category_name AS category_name, 
	ROUND(AVG(avg_payroll),0) AS avg_payroll,
	AVG(avg_payroll)/AVG(avg_price) AS nr_of_units
FROM t_JAN_TASLER_project_SQL_primary_final
WHERE 	(category_code = 114201 OR category_code = 111301)
GROUP BY year_of_interest, category_code
ORDER BY year_of_interest


-- UKOL 3


SELECT
tab.category_name,
tab.category_code,
AVG(tab.perc_difference_from_last_year) as avg_difference 
FROM (SELECT 
	category_name, 
	category_code,
	year_of_interest,
	avg_price,
	(avg_price/LAG(avg_price) OVER (PARTITION BY category_code ORDER BY year_of_interest) - 1) * 100 AS perc_difference_from_last_year
	FROM t_JAN_TASLER_project_SQL_primary_final
	GROUP BY year_of_interest, category_code) AS tab
GROUP BY tab.category_code
ORDER BY avg_difference


-- UKOL 4


SELECT 
*,
tab.perc_payroll_diff - tab.perc_price_diff AS total_diff
FROM ( 
	SELECT 
		year_of_interest,
		(AVG(avg_price)/LAG(AVG(avg_price)) OVER (ORDER BY year_of_interest) -1) * 100 AS perc_price_diff,
		(AVG(avg_payroll)/LAG(AVG(avg_payroll)) OVER (ORDER BY year_of_interest) -1) * 100 AS perc_payroll_diff
	FROM t_JAN_TASLER_project_SQL_primary_final
	GROUP BY year_of_interest
	) AS tab
ORDER BY total_diff 
	-- ASC 
	DESC


-- UKOL 5

SELECT
	year_of_interest,
	(AVG(avg_price)/LAG(AVG(avg_price)) OVER (ORDER BY year_of_interest) -1) * 100 AS perc_price_diff,
	(AVG(avg_payroll)/LAG(AVG(avg_payroll)) OVER (ORDER BY year_of_interest) -1) * 100 AS perc_payroll_diff,
	(AVG(GDP)/LAG(AVG(GDP)) OVER (ORDER BY year_of_interest) -1) * 100 AS perc_GDP_diff
FROM t_JAN_TASLER_project_SQL_primary_final t
GROUP BY year_of_interest 


-- SECONDARY TABLE


CREATE TABLE IF NOT EXISTS t_JAN_TASLER_project_SQL_secondary_final AS
SELECT 
	country,
	`year`,
	GDP,
	gini,
	population 
FROM economies e 
WHERE country IN
	( 
		SELECT 
		country
		FROM countries c 
		WHERE region_in_world LIKE '%Europe%'
	)
	AND `year` BETWEEN 2006 AND 2018;

SELECT 
	*
FROM t_JAN_TASLER_project_SQL_secondary_final 




