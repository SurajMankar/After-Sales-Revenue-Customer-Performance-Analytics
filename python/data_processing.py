import pandas as pd
from sqlalchemy import create_engine

#Connect to SQL Database
engine = create_engine(
    "mysql+pymysql://suraj:MySecretPass1234@localhost:3306/company_analytics"
)

#Read SQL View
query = "SELECT * FROM vw_sales_analytics"
df = pd.read_sql(query, engine)

#Cleaning
df = df.drop_duplicates()
df['service_date'] = pd.to_datetime(df['service_date'])
df['profit'] = df['revenue_amount'] - df['service_cost']

df['customer_segment'] = pd.qcut(
    df['revenue_amount'],
    q=3,
    labels=['Low', 'Medium', 'High']
)

segment_summary = df.groupby('customer_segment').agg(
    total_revenue=('revenue_amount', 'sum'),
    total_profit=('profit', 'sum'),
    customer_count=('customer_id', 'nunique')
).reset_index()

#Export CSVs for Power BI
df.to_csv("final_sales_data.csv", index=False)
segment_summary.to_csv("customer_segment_summary.csv", index=False)

print("Data processing completed successfully.")
