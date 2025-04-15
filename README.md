# Funbox: Payment Data Analysis and Fraud Detection

This project focuses on analyzing payment data to detect patterns, concentrations, and duplicates, with the goal of identifying repeated flags relevant to fraud detection. The repository includes code, SQL queries, and data visualizations to support these objectives.

---

## Features

- **Pattern Matching**: Identify recurring patterns in payment data.
- **Concentration Analysis**: Detect clusters of transactions that may indicate fraudulent activity.
- **Duplicate Matching**: Find duplicate transactions to flag potential fraud.
- **Fraud Detection Metrics**: Measure repeated flags to assess fraud risk.

---

## Code Examples

### Python: Detecting Duplicate Transactions
```python
# filepath: /workspaces/funbox/src/detect_duplicates.py
import pandas as pd

def detect_duplicates(dataframe):
    duplicates = dataframe[dataframe.duplicated(subset=['transaction_id', 'amount', 'timestamp'], keep=False)]
    return duplicates

# Example usage
# df = pd.read_csv('payment_data.csv')
# duplicates = detect_duplicates(df)
# print(duplicates)
