# Synthetic_Opioid_Deaths
Thinkful Capstone 1 investigating how synthetic opioids have affected death rates per state.
Data from Centers for Medicare and Medicaid Services 2014.

After initial exploration in SQL, there appears to be a slight correlation between the percentage of synthetic opioids prescribed and deaths as a proportion of a state's population. For example, North Dakota had the highest percentage of synthetic opioids and the lowest death rate.

Because of this apparent correlation, it is important to know if the synthetic proportions are different across the country. Regions with lower prescribing proportions may want to urge their doctors to favor synthetic opioids over natural ones.

I used the U.S. Census regions of Midwest, North East, South, and West for this project.

Using pairwise Kruskal-Wallis test, I determined that there is a statistically significant difference between all regions except between the Midwest and the North East. While the differences between these regions is significant, the effect size is less than 50% for each pairing.

Doctors may be interested to know that prescribing synthetic opioids does not seem to be related to increased deaths. If a prescriber determines that a synthetic opioid is the best choice for a patient, the prescriber should not be afraid to recommend it.

It cannot be said with certainty that prescribing a higher percentage of synthetic opioids has any effect on deaths. The Midwest and North East do not have significantly different synthetic percentages, but do have greatly different death rates. At the same time, the South and the West do have significantly different prescribing rates, but do not have different death rates. It is possible that the overdose death rates are related to regional differences in illicit use of opioids, income, and support programs offered.

It is also important to note that the "Deaths" column in the tables refers to the total number of deaths in each state due to any opioid overdose, not just synthetics. Breaking these deaths into subcategories based on the type of opioid that caused the death may prove insightful.

Since all the prescriptions in this dataset come from Medicare, it may be interesting to see how synthetic percentages differ across insurance companies. Each company has its own formulary (a list of drugs it will cover), and regions where a certain company is dominant may have even larger differences.

Additonaly, if further data was collected, recording deaths on a per-doctor basis rather than per-state would allow for better statistics due to larger sample sizes.
