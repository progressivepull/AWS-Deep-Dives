import os
import numpy as np
import pandas as pd

from sklearn.impute import SimpleImputer

# CSV Headers:
# LoanApproved,Age,EducationLevel,Income

if __name__ == "__main__":
    base_dir = "/opt/ml/processing"

    df = pd.read_csv(
        f"{base_dir}/input/dirty.csv"
    )

    # Create imputer for empty values
    imp_mean = SimpleImputer(missing_values=np.nan, strategy='mean')
    imp_mean.fit(df)
    out = imp_mean.transform(df)

    # split into training and validation datasets
    train, validation = np.split(out, [int(0.7 * len(out))])
    
    # Convert to integer before saving to CSV
    pd.DataFrame(train).astype(int).to_csv(f"{base_dir}/train/train.csv", header=False, index=False)
    pd.DataFrame(validation).astype(int).to_csv(f"{base_dir}/validation/validation.csv", header=False, index=False)
    