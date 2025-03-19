-- Verify the data in your table
SELECT COUNT(*) FROM `_01_District_wise_crimes_committed_IPC_2001_2012`;
SELECT * FROM `_01_District_wise_crimes_committed_IPC_2001_2012` LIMIT 5;

-- Q1: Annual Crime Trends
SELECT YEAR, SUM(`TOTAL IPC CRIMES`) AS total_crime_count
FROM `_01_District_wise_crimes_committed_IPC_2001_2012`
GROUP BY YEAR
ORDER BY YEAR ASC;

-- Q2: State-Wise Crime Analysis
SELECT `STATE/UT`, 
       SUM(`TOTAL IPC CRIMES`) AS state_crime_total 
FROM `_01_District_wise_crimes_committed_IPC_2001_2012` 
GROUP BY `STATE/UT` 
ORDER BY state_crime_total DESC;

-- Q3: City-Wise Crime Distribution
SELECT `STATE/UT`, DISTRICT, SUM(`TOTAL IPC CRIMES`) AS district_crime_count
FROM `_01_District_wise_crimes_committed_IPC_2001_2012`
GROUP BY `STATE/UT`, DISTRICT
ORDER BY `STATE/UT`, district_crime_count DESC;

-- Q4: Highest Crime Rate States
SELECT `STATE/UT`, SUM(`TOTAL IPC CRIMES`) AS crime_count_total
FROM `_01_District_wise_crimes_committed_IPC_2001_2012`
GROUP BY `STATE/UT`
ORDER BY crime_count_total DESC
LIMIT 5;

-- Q5: Crimes Against Women
SELECT DISTRICT, 
       SUM(RAPE) AS rape_incidents,
       SUM(`ASSAULT ON WOMEN WITH INTENT TO OUTRAGE HER MODESTY`) AS assault_incidents,
       SUM(`INSULT TO MODESTY OF WOMEN`) AS harassment_incidents,
       SUM(`CRUELTY BY HUSBAND OR HIS RELATIVES`) AS domestic_abuse_incidents,
       (SUM(RAPE) + 
        SUM(`ASSAULT ON WOMEN WITH INTENT TO OUTRAGE HER MODESTY`) + 
        SUM(`INSULT TO MODESTY OF WOMEN`) + 
        SUM(`CRUELTY BY HUSBAND OR HIS RELATIVES`)) AS women_targeted_crimes
FROM `_01_District_wise_crimes_committed_IPC_2001_2012`
GROUP BY DISTRICT
ORDER BY women_targeted_crimes DESC
LIMIT 5;

-- Q6: Reasons Behind Violent Crimes
SELECT `STATE/UT`, YEAR, 
       SUM(MURDER) AS murder_incidents, 
       SUM(`KIDNAPPING & ABDUCTION`) AS abduction_incidents
FROM `_01_District_wise_crimes_committed_IPC_2001_2012`
GROUP BY `STATE/UT`, YEAR
ORDER BY murder_incidents DESC, abduction_incidents DESC;

-- Q7: Crime Pair Analysis
SELECT `STATE/UT`, YEAR,
       SUM(MURDER) AS homicide_count,
       SUM(RAPE) AS sexual_assault_count,
       SUM(`KIDNAPPING & ABDUCTION`) AS abduction_count,
       SUM(`DOWRY DEATHS`) AS dowry_related_deaths,
       SUM(`ASSAULT ON WOMEN WITH INTENT TO OUTRAGE HER MODESTY`) AS assault_incidents
FROM `_01_District_wise_crimes_committed_IPC_2001_2012`
GROUP BY `STATE/UT`, YEAR
ORDER BY homicide_count DESC, sexual_assault_count DESC
LIMIT 10;

-- Q8: Safest States for Women
SELECT `STATE/UT`, 
       SUM(RAPE) + SUM(`ASSAULT ON WOMEN WITH INTENT TO OUTRAGE HER MODESTY`) + 
       SUM(`INSULT TO MODESTY OF WOMEN`) + SUM(`CRUELTY BY HUSBAND OR HIS RELATIVES`) AS women_safety_incidents
FROM `_01_District_wise_crimes_committed_IPC_2001_2012`
GROUP BY `STATE/UT`
ORDER BY women_safety_incidents ASC
LIMIT 5;

-- Q9: Safest Cities for Women
SELECT DISTRICT, 
       SUM(RAPE) + SUM(`ASSAULT ON WOMEN WITH INTENT TO OUTRAGE HER MODESTY`) + 
       SUM(`INSULT TO MODESTY OF WOMEN`) + SUM(`CRUELTY BY HUSBAND OR HIS RELATIVES`) AS women_safety_metric
FROM `_01_District_wise_crimes_committed_IPC_2001_2012`
GROUP BY DISTRICT
ORDER BY women_safety_metric ASC
LIMIT 5;

-- Q10: Profile of Rape Offenders
SELECT `STATE/UT`, 
       SUM(RAPE) AS rape_case_count
FROM `_01_District_wise_crimes_committed_IPC_2001_2012`
GROUP BY `STATE/UT`
ORDER BY rape_case_count DESC
LIMIT 3;

-- Q11: Economic & Literacy Crime Correlation
SELECT `STATE/UT`, 
       SUM(THEFT) + SUM(ROBBERY) + SUM(BURGLARY) AS economic_crime_incidents,
       SUM(CHEATING) + SUM(COUNTERFIETING) AS fraud_related_offenses
FROM `_01_District_wise_crimes_committed_IPC_2001_2012`
GROUP BY `STATE/UT`
ORDER BY economic_crime_incidents DESC;

-- Q12: Juvenile Crime Analysis
SELECT `STATE/UT`, 
       SUM(THEFT) + SUM(BURGLARY) + SUM(MURDER) + SUM(`DOWRY DEATHS`) + SUM(RAPE) AS youth_crime_incidents
FROM `_01_District_wise_crimes_committed_IPC_2001_2012`
GROUP BY `STATE/UT`
ORDER BY youth_crime_incidents DESC
LIMIT 10;

-- Q13: Crime Rate Trends Over Time
SELECT `STATE/UT`, YEAR, SUM(`TOTAL IPC CRIMES`) AS total_crimes
FROM `_01_District_wise_crimes_committed_IPC_2001_2012`
GROUP BY `STATE/UT`, YEAR
ORDER BY `STATE/UT`, YEAR;

-- Q14: Crime Distribution by State
SELECT `STATE/UT`, SUM(MURDER) AS murder_cases, SUM(RAPE) AS rape_cases, SUM(THEFT) AS theft_cases, SUM(`TOTAL IPC CRIMES`) AS total_crimes
FROM `_01_District_wise_crimes_committed_IPC_2001_2012`
GROUP BY `STATE/UT`
ORDER BY total_crimes DESC;
