use bank_analytics;


-- kpi-1
-- year wise loan amount stats
SELECT YEAR(DATE_ADD('1899-12-30', INTERVAL issue_d DAY)) AS Year,
       SUM(loan_amnt) AS Loan_Amount
FROM finance_1_cleaned
GROUP BY Year
ORDER BY Year;

-- kpi-2
-- Grade and sub-grade wise revolv_balance
SELECT f1.grade,
       f1.sub_grade,
       SUM(f2.revol_bal) AS Revol_Balance
FROM finance_1_cleaned f1
JOIN finance_2_cleaned f2
ON f1.id = f2.id
GROUP BY f1.grade, f1.sub_grade
ORDER BY f1.grade, f1.sub_grade;

-- kpi-3
-- total payment for verified status vs total payment for non verified status
SELECT f1.verification_status,
       SUM(f2.total_pymnt) AS Total_Payment
FROM finance_1_cleaned f1
JOIN finance_2_cleaned f2
ON f1.id = f2.id
GROUP BY f1.verification_status;

-- kpi-4
-- State wise and month wise loan status
SELECT addr_state,
       last_credit_pull_d,
       loan_status,
       COUNT(*) AS Loan_Count
FROM finance_1_cleaned f1
JOIN finance_2_cleaned f2
ON f1.id = f2.id
GROUP BY addr_state, last_credit_pull_d, loan_status
ORDER BY addr_state, last_credit_pull_d;

-- kpi-5
-- home ownership vs last payment date state
SELECT home_ownership,
       last_pymnt_d,
       COUNT(*) AS Loan_Count
FROM finance_1_cleaned f1
JOIN finance_2_cleaned f2
ON f1.id = f2.id
GROUP BY home_ownership, last_pymnt_d
ORDER BY home_ownership, last_pymnt_d;