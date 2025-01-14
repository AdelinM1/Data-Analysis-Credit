-- 1. What is the approval rate by education type?
SELECT Education_type, 
       COUNT(*) AS Total_Applicants,
       AVG(CASE WHEN Target = 1 THEN 1 ELSE 0 END) * 100 AS Approval_Rate
FROM credit
GROUP BY Education_type
ORDER BY Approval_Rate DESC;

-- 2. How does employment status impact credit approval?
SELECT Unemployed, 
       COUNT(*) AS Total_Applicants, 
       SUM(CASE WHEN Target = 1 THEN 1 ELSE 0 END) AS Approved,
       AVG(CASE WHEN Target = 1 THEN 1 ELSE 0 END) * 100 AS Approval_Rate
FROM credit
GROUP BY Unemployed;

-- 3. What is the approval rate by housing type?
SELECT Housing_type, 
       COUNT(*) AS Total_Applicants, 
       SUM(CASE WHEN Target = 1 THEN 1 ELSE 0 END) AS Approved,
       AVG(CASE WHEN Target = 1 THEN 1 ELSE 0 END) * 100 AS Approval_Rate
FROM credit
GROUP BY Housing_type
ORDER BY Approval_Rate DESC;

-- 4. How does occupation and income impact approval rate?
SELECT Occupation_type, 
       AVG(Total_income) AS Avg_Income, 
       COUNT(*) AS Total_Applicants,
       AVG(CASE WHEN Target = 1 THEN 1 ELSE 0 END) * 100 AS Approval_Rate
FROM credit
GROUP BY Occupation_type
ORDER BY Avg_Income DESC;

-- 5. How does income impact approval rate?
SELECT CASE 
           WHEN Total_income < 20000 THEN 'Under 20K'
           WHEN Total_income BETWEEN 20000 AND 50000 THEN '20K-50K'
           WHEN Total_income BETWEEN 50001 AND 100000 THEN '50K-100K'
           ELSE 'Over 100K'
       END AS Income_Range, 
       COUNT(*) AS Total_Applicants, 
       AVG(CASE WHEN Target = 1 THEN 1 ELSE 0 END) * 100 AS Approval_Rate
FROM credit
GROUP BY Income_Range
ORDER BY Income_Range;

-- 6. How does account length impact approval rate?
SELECT CASE 
           WHEN Account_length < 1 THEN 'Less than 1 year'
           WHEN Account_length BETWEEN 1 AND 3 THEN '1-3 years'
           WHEN Account_length BETWEEN 4 AND 7 THEN '4-7 years'
           ELSE 'More than 7 years'
       END AS Account_Length_Group, 
       COUNT(*) AS Total_Applicants, 
       AVG(CASE WHEN Target = 1 THEN 1 ELSE 0 END) * 100 AS Approval_Rate
FROM credit
GROUP BY Account_Length_Group
ORDER BY Account_Length_Group;

-- 7. Who are the most qualified applicants?
SELECT ID, Total_income, Years_employed, Age, Target
FROM credit
WHERE Total_income > 75000 AND Years_employed > 10 AND Target = 1
ORDER BY Total_income DESC;

-- 8. What is the average income by family status?
SELECT Family_status, 
       AVG(Total_income) AS Avg_Income
FROM credit
GROUP BY Family_status
ORDER BY Avg_Income DESC;