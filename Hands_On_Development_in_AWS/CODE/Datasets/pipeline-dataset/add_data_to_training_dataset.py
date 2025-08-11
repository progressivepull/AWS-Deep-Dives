#!/usr/bin/python3

import pandas as pd
import random

# Function to generate loan approval probability based on features
def approve_loan(age, income, education_level):
    """
    Simulates loan approval probability based on basic factors:
    - Higher education and income increase approval chances.
    - Older customers with stable income are more likely to be approved.
    """
    base_prob = 0.2  # Base approval probability

    # Increase probability based on income
    if income > 100000:
        base_prob += 0.4
    elif income > 75000:
        base_prob += 0.3
    elif income > 50000:
        base_prob += 0.2

    # Education factor
    if education_level == 0:
        base_prob += 0.2
    elif education_level == 1:
        base_prob += 0.15
    elif education_level == 2:
        base_prob += 0.1
    elif education_level == 3:
        base_prob += 0.05

    # Age factor (older customers with stable income are more reliable)
    if 30 <= age <= 60:
        base_prob += 0.1

    # Ensure probability is between 0 and 1
    base_prob = min(max(base_prob, 0), 1)

    return random.random() < base_prob  # Return True if approved, False otherwise

# Generate dataset
with open("train.csv", "a") as file:
  for _ in range(5000):
    age = random.randint(18, 80)
    education_level = random.randint(0, 5)
    income = random.randint(20000, 150000)
    loan_approved = approve_loan(age, income, education_level)
    file.write("{},{},{},{}\n".format(int(loan_approved), age, education_level, income))

file.close()



