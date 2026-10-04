# 120-Year-Of-Olympic-History-History-End-to-End-Analytics-Project
End To End Project (SQL+ Python+ Power-BI)
##    Data Cleaning
​Noise Removal: 
Cleaned dataset by identifying and removing 383 duplicate records.
​Imputation: 
Handled 60,000+ missing values by filling 'Medal' with 'No Medal' and Age/Height/Weight with Medians.
​Data Integration:
Merged athlete and region datasets using a Left Join on 'NOC' for geographic accuracy.
​Standardization: 
Mapped legacy codes (e.g., ROT, SGP) to full country names like Singapore and Refugee Team.
​Export Ready:
Validated the final dataframe to ensure zero null values before transferring to SQL.
## Key Project Insights (Decision Making)

​Participation vs. Success:
The analysis reveals that high participation doesn't always equal high success. 
While thousands participate, only 13.84% convert into medalists, highlighting the elite nature of the competition.
​Regional Dominance:

The USA maintains a significant lead with 15% of all medals, followed by Russia and Germany.
This suggests a strong historical sports infrastructure in these regions.

​Athlete Benchmarks: 
The data identifies specific physical profiles (Avg Height: 175cm, Avg Weight: 71kg) common among medalists,
which can be used to study the correlation between physique and specific sports.

​Historical Impact: 
The timeline shows clear dips in participation and medal counts during the World War eras,
proving how global geopolitical events directly affect international Sports
