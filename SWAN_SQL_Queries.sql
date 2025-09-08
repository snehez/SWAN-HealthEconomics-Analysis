-- Create and select database
CREATE DATABASE swan_db;
USE swan_db;

-- =========================================
-- 1. Average age at baseline
-- =========================================
SELECT AVG(AGE0) AS avg_age FROM swan_baseline;

-- =========================================
-- 2. Distribution of race
-- =========================================
SELECT RACE, COUNT(*) AS n FROM swan_baseline GROUP BY RACE;

-- =========================================
-- 3. Prevalence of bone density issue
-- =========================================
SELECT 
  SUM(CASE WHEN BMDFLG0 = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100 AS prevalence_pct
FROM swan_baseline;

-- =========================================
-- 4. Annual cost burden ($3500 per case)
-- =========================================
SELECT 
  SUM(CASE WHEN BMDFLG0 = 1 THEN 3500 ELSE 0 END) AS total_annual_cost
FROM swan_baseline;

-- =========================================
-- 5. Lifetime cost estimation (20 years)
-- =========================================
SELECT 
  SUM(CASE WHEN BMDFLG0 = 1 THEN 3500*20 ELSE 0 END) AS total_lifetime_cost
FROM swan_baseline;

-- =========================================
-- 6. Hormone therapy vs. bone density flag
-- =========================================
SELECT 
  HORMONETHERAPY, 
  SUM(CASE WHEN BMDFLG0=1 THEN 1 ELSE 0 END) AS cases,
  COUNT(*) AS total,
  SUM(CASE WHEN BMDFLG0=1 THEN 1 ELSE 0 END) / COUNT(*) * 100 AS prevalence_pct
FROM swan_baseline
GROUP BY HORMONETHERAPY;

-- =========================================
-- 7. Age group prevalence of bone density issue
-- =========================================
SELECT 
  CASE 
    WHEN AGE0 < 40 THEN '<40'
    WHEN AGE0 BETWEEN 40 AND 50 THEN '40-50'
    WHEN AGE0 BETWEEN 51 AND 60 THEN '51-60'
    ELSE '>60' END AS age_group,
  SUM(CASE WHEN BMDFLG0=1 THEN 1 ELSE 0 END) AS cases,
  COUNT(*) AS total,
  SUM(CASE WHEN BMDFLG0=1 THEN 1 ELSE 0 END)/COUNT(*)*100 AS prevalence_pct
FROM swan_baseline
GROUP BY age_group;

-- =========================================
-- 8. Identify high-risk patients
-- Criteria: Age > 50, BMDFLG0=1, HPBMDT0 < 0.90
-- =========================================
SELECT 
    SWANID, AGE0, BMDFLG0, HPBMDT0
FROM
    swan_baseline
WHERE
    AGE0 > 50 AND BMDFLG0 = 1
        AND HPBMDT0 < 0.90
ORDER BY HPBMDT0 ASC
LIMIT 1000;

-- =========================================
-- Q9. Intervention cost analysis
-- $500/year intervention reduces risk by 30%
-- =========================================
SELECT 
    COUNT(*) * 500 AS intervention_cost,
    SUM(CASE WHEN BMDFLG0 = 1 THEN 3500*0.3 ELSE 0 END) AS expected_savings,
    (COUNT(*) * 500) - SUM(CASE WHEN BMDFLG0 = 1 THEN 3500*0.3 ELSE 0 END) AS net_cost
FROM swan_baseline;

-- =========================================
-- Q10. ICER (Incremental Cost-Effectiveness Ratio)
-- Assume 0.1 QALY gain per treated patient
-- =========================================
SELECT 
    (COUNT(*) * 500) / (COUNT(*) * 0.1) AS ICER_cost_per_QALY
FROM swan_baseline;