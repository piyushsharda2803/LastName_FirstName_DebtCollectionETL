-- Database: analysis_queries

-- DROP DATABASE IF EXISTS analysis_queries;

CREATE DATABASE analysis_queries
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

select * from borrowers

-- a. What is the average loan amount for borrowers who are more than 5 days past due?
SELECT AVG("Loan Amount") AS Average_Loan_Amount
FROM borrowers
WHERE "Days Left to Pay Current EMI" < 5;

-- b. Who are the top 10 borrowers with the highest outstanding balance?
SELECT "Name", "Loan Amount" - "EMI" * "Loan Term" AS Outstanding_Balance
FROM borrowers
ORDER BY Outstanding_Balance ASC
LIMIT 10;

-- c. List of all borrowers with good repayment history
SELECT "Name", "Email Address"
FROM borrowers
WHERE "Delayed Payment" = 'No';

-- d. Brief analysis with respect to loan type
SELECT "Loan Purpose", COUNT(*) AS Number_of_Borrowers, AVG("Loan Amount") AS Average_Loan_Amount
FROM borrowers
GROUP BY "Loan Purpose";