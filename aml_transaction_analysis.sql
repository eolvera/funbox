-- SQL script to analyze cryptocurrency transactions for AML compliance
-- Simulates flagging high-risk transactions based on value, merchant risk, and patterns

CREATE TABLE crypto_transactions (
    transaction_id INT PRIMARY KEY,
    merchant_id VARCHAR(50),
    transaction_amount DECIMAL(15, 2),
    transaction_date DATE,
    merchant_risk_score INT, -- 1-100, higher indicates higher risk
    transaction_type VARCHAR(20) -- e.g., 'TRANSFER', 'EXCHANGE'
);

-- Sample data insertion (simulated for demo)
INSERT INTO crypto_transactions VALUES
(1, 'MERCH001', 15000.00, '2025-04-01', 85, 'TRANSFER'),
(2, 'MERCH002', 500.00, '2025-04-02', 20, 'EXCHANGE'),
(3, 'MERCH001', 20000.00, '2025-04-03', 85, 'TRANSFER'),
(4, 'MERCH003', 8000.00, '2025-04-03', 60, 'TRANSFER'),
(5, 'MERCH004', 300.00, '2025-04-04', 10, 'EXCHANGE');

-- Query to flag high-risk transactions
-- Criteria: amount > $10,000 or merchant risk score > 80
SELECT 
    transaction_id,
    merchant_id,
    transaction_amount,
    transaction_date,
    merchant_risk_score,
    transaction_type,
    CASE 
        WHEN transaction_amount > 10000 OR merchant_risk_score > 80 THEN 'High Risk'
        ELSE 'Low Risk'
    END AS risk_level
FROM crypto_transactions
WHERE transaction_amount > 10000 OR merchant_risk_score > 80
ORDER BY transaction_amount DESC;

-- Aggregate risk by merchant for visualization
SELECT 
    merchant_id,
    COUNT(*) AS transaction_count,
    SUM(CASE WHEN transaction_amount > 10000 OR merchant_risk_score > 80 THEN 1 ELSE 0 END) AS high_risk_count,
    AVG(transaction_amount) AS avg_transaction_amount
FROM crypto_transactions
GROUP BY merchant_id
ORDER BY high_risk_count DESC;