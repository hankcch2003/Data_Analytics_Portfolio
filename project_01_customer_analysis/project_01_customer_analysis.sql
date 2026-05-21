-- Create database
CREATE DATABASE banking_customer_analysis;
GO

-- Use database
USE banking_customer_analysis;
GO

-- Create Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    join_date DATE,
    customer_segment VARCHAR(20)
);

-- Create Accounts table
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(50),
    balance DECIMAL(12,2),
    account_status VARCHAR(20),
    open_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create Transactions table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_date DATE,
    transaction_type VARCHAR(50),
    transaction_amount DECIMAL(12,2),
    merchant_category VARCHAR(50),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- Insert sample customer data
INSERT INTO customers
VALUES
(1, 'John Chen', 'Male', 30, 'Taipei', '2023-01-15', 'Gold'),
(2, 'Amy Lin', 'Female', 27, 'Taichung', '2023-03-20', 'Silver'),
(3, 'David Wang', 'Male', 40, 'Kaohsiung', '2022-11-08', 'Platinum');

-- Insert sample account data
INSERT INTO accounts
VALUES
(101, 1, 'Savings', 50000, 'Active', '2023-01-20'),
(102, 2, 'Checking', 12000, 'Active', '2023-03-25'),
(103, 3, 'Investment', 200000, 'Active', '2022-11-10');

-- Insert sample transaction data
INSERT INTO transactions
VALUES
(1001, 101, '2024-01-01', 'Shopping', 2500, 'Retail'),
(1002, 102, '2024-01-05', 'Dining', 800, 'Food'),
(1003, 103, '2024-01-08', 'Investment', 15000, 'Finance');

-- Update account status to Inactive if balance < 20000
UPDATE accounts
SET account_status = 'Inactive'
WHERE balance < 20000;

-- KPI: Customer segmentation count
SELECT customer_segment,
       COUNT(*) AS total_customers
FROM customers
GROUP BY customer_segment;

-- KPI: Total spending per customer
SELECT c.customer_name,
       SUM(t.transaction_amount) AS total_spent
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
GROUP BY c.customer_name;

-- Create view for customer summary
CREATE VIEW vw_customer_summary AS
SELECT c.customer_id,
       c.customer_name,
       SUM(t.transaction_amount) AS total_spent
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id, c.customer_name;

-- CTE: Customer spending analysis
WITH customer_cte AS (
    SELECT c.customer_id,
           SUM(t.transaction_amount) AS total_spent
    FROM customers c
    JOIN accounts a ON c.customer_id = a.customer_id
    JOIN transactions t ON a.account_id = t.account_id
    GROUP BY c.customer_id
)
SELECT * FROM customer_cte;

-- Window function: Rank customers by spending
SELECT customer_id,
       total_spent,
       RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
FROM vw_customer_summary;

-- Export dataset for analysis
SELECT c.customer_id,
       c.customer_name,
       c.customer_segment,
       a.account_type,
       a.balance,
       t.transaction_amount
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id;
