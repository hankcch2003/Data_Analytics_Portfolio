-- Create database
CREATE DATABASE customer_segmentation;
GO

-- Use database
USE customer_segmentation;
GO

-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    join_date DATE
);

-- Create transactions table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    transaction_date DATE,
    transaction_amount DECIMAL(10,2),
    transaction_type VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create rfm_result table
CREATE TABLE rfm_result (
    customer_id INT PRIMARY KEY,
    recency INT,
    frequency INT,
    monetary DECIMAL(10,2),
    rfm_score DECIMAL(10,2),
    segment_label VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert customers table
INSERT INTO customers VALUES
(1, 'Alex Chen', 'Male', 28, 'Taipei', '2023-01-10'),
(2, 'Jenny Lin', 'Female', 35, 'Taichung', '2022-11-15'),
(3, 'Kevin Wu', 'Male', 41, 'Kaohsiung', '2021-08-20'),
(4, 'Cindy Huang', 'Female', 30, 'Taipei', '2023-05-01'),
(5, 'David Tsai', 'Male', 26, 'Tainan', '2024-01-12');

-- Insert transactions table
INSERT INTO transactions VALUES
(1001, 1, '2024-05-01', 5000, 'Shopping'),
(1002, 1, '2024-05-03', 2200, 'Food'),
(1003, 2, '2024-05-04', 1800, 'Dining'),
(1004, 3, '2024-05-06', 12000, 'Investment'),
(1005, 4, '2024-05-08', 4500, 'Transfer'),
(1006, 5, '2024-05-10', 1500, 'Shopping');

-- Update customers table
UPDATE customers
SET city = 'New Taipei'
WHERE customer_id = 1;

-- Update transactions table
UPDATE transactions
SET transaction_amount = 2500
WHERE transaction_id = 1002;

-- Join analysis
SELECT
    c.customer_name,
    c.city,
    t.transaction_date,
    t.transaction_amount
FROM customers c
INNER JOIN transactions t
    ON c.customer_id = t.customer_id;

-- KPI analysis
SELECT
    c.customer_name,
    SUM(t.transaction_amount) AS total_spending
FROM customers c
INNER JOIN transactions t
    ON c.customer_id = t.customer_id
GROUP BY c.customer_name;

-- Subquery analysis
SELECT
    customer_name,
    city
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM transactions
    GROUP BY customer_id
    HAVING SUM(transaction_amount) > 5000
);

-- Create customer summary view
CREATE VIEW customer_summary AS
SELECT
    c.customer_id,
    c.customer_name,
    SUM(t.transaction_amount) AS total_spending
FROM customers c
INNER JOIN transactions t
    ON c.customer_id = t.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;

-- View query
SELECT *
FROM customer_summary;

-- CTE for RFM calculation
WITH rfm_base AS (
    SELECT
        customer_id,
        DATEDIFF(
            DAY,
            MAX(transaction_date),
            GETDATE()
        ) AS recency,
        COUNT(*) AS frequency,
        SUM(transaction_amount) AS monetary
    FROM transactions
    GROUP BY customer_id
)

INSERT INTO rfm_result (
    customer_id,
    recency,
    frequency,
    monetary,
    rfm_score,
    segment_label
)
SELECT
    customer_id,
    recency,
    frequency,
    monetary,
    frequency + (monetary / 1000.0),
    CASE
        WHEN frequency + (monetary / 1000.0) >= 10
            THEN 'High Value'
        WHEN frequency + (monetary / 1000.0) >= 5
            THEN 'Mid Value'
        ELSE 'Low Value'
    END
FROM rfm_base;

-- RFM result query
SELECT *
FROM rfm_result;

-- Update rfm_result table
UPDATE rfm_result
SET segment_label = 'High Value'
WHERE customer_id = 2;

-- Window function analysis
SELECT
    c.customer_name,
    SUM(t.transaction_amount) AS total_spending,
    RANK() OVER (
        ORDER BY SUM(t.transaction_amount) DESC
    ) AS spending_rank
FROM customers c
INNER JOIN transactions t
    ON c.customer_id = t.customer_id
GROUP BY c.customer_name;

-- CSV Export Query
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    t.transaction_date,
    t.transaction_amount,
    r.segment_label
FROM customers c
INNER JOIN transactions t
    ON c.customer_id = t.customer_id
LEFT JOIN rfm_result r
    ON c.customer_id = r.customer_id;