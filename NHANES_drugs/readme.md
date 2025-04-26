**Final Report: Relationship between Mental health and the use of various Recreational Drugs**  
Hyeonwook Kim

**Background**  
It has long been known that alcohol, tobacco and other forms of recreational drugs exacerbate mental health problems, which can often further exacerbate dependency issues. We will explore these relationships within the US population, particularly age, gender, ethnicity and physical health. An important resource for investigating the relationship between mental health and substance use will be the National Health and Nutrition Examination Survey (NHANES), which will be used in the study.

**Methods**  
Two-sample T-tests were conducted to evaluate the differences in drug use between individuals with poor mental health. Logistic regression assessed the predictive power of mental health for smoking, marijuana, and hard drug use, while Mann–Whitney U tests confirmed the statistical significance of these behaviors. Correlation analyses, including Spearman and Point-Biserial tests, explored associations between mental health, substance use, and inter-drug relationships, finding weak to moderate correlations. Age and physical health were incorporated into subgroup analyses using linear and logistic regressions.

**Results**  
**1\. Statistical Significance**

**T-Test: Mental Health on Drugs**  
A 2-Sample T-Test was used to observe the difference of drug use between people who had poor mental health and those who did not. The CDC defines frequent mental distress as 14 or more days in the past 30 days when someone has reported poor mental health (*Mental Health | Chronic Disease Indicators*, 2024), so this was the cutoff point used to determine poor mental health in the sample. The results of the T-Tests are shown below in Table 1:

| Drug Type          | p-value | t-value | Degrees of Freedom | Mean (Normal Mental Health) | Mean (Poor Mental Health) |
| :----------------- | :------ | :------ | :----------------- | :-------------------------- | :------------------------- |
| **Alcohol**         | 0.2413  | -1.1724 | 1216               | 85.79232                    | 76.33168                   |
| **Smoking**         | 0.1168  | 1.5697  | 1216               | 0.5639764                   | 0.6237624                  |
| **Marijuana**       | 0.04383 | 2.0179  | 1216               | 0.7726378                   | 0.8366337                  |
| **Hard Drugs**      | 0.01964 | 2.3363  | 1216               | 0.3444882                   | 0.4306931                  |


*Table 1: Differences in Drug Use between Poor Mental Health and Normal Mental Health*

Alcohol is measured in the number of days that alcohol was consumed, while Smoking, Marijuana and Hard Drugs are binary variables. The tests showed no significant differences between Alcohol and Smoking between the two groups, but did find a difference in Marijuana and Hard Drugs usage with 95% confidence.

**T-Test: Drugs on Mental Health**  
A 2-Sample T-Test was also conducted between groups that used drugs and didn’t use drugs to see the difference in means between their mental health. Smoking, Marijuana and Hard Drugs were both binary variables but Alcohol was a continuous one, and so the data was stratified before the T-Test was conducted. The results are shown in Table 2\.

| Drug Type          | p-value | t-value | Degrees of Freedom | Mean (Non-Users) | Mean (Users) |
| :----------------- | :------ | :------ | :----------------- | :--------------- | :----------- |
| **Alcohol**         | 0.08963 | -1.6987 | 1216               | 5.208453          | 6.418079     |
| **Smoking**         | 0.005294 | -2.7936 | 1216              | 4.572254          | 5.987124     |
| **Marijuana**       | 0.003701 | -2.9082 | 1216              | 4.000000          | 5.767296     |
| **Hard Drugs**      | 0.003809 | -2.8991 | 1216              | 4.841229          | 6.354691     |


*Table 2: 2-Sample T-Test: Differences in Mental Health of Drug users and non-users*

The results of the T-Test found that there was no significant difference of mental health between alcohol consumers and non-consumers, but found a statistically significant difference between those who consumed Tobacco, Marijuana or Hard Drugs.

**Mental Health against Smoking, Marijuana and Hard Drugs**  
Logistic Regression was used to observe if Mental health is a meaningful predictor in Smoking, Marijuana or Hard Drugs use. The results from the logistic regression analysis suggest that mental health is a meaningful predictor for the likelihood of using smoking, marijuana, and hard drugs. Across all three substance-use categories, mental health positively correlates with an increased likelihood of usage with a high level of confidence (p\<0.01 in all cases). Likewise, Smoking, Marijuana and Hard Drugs were also used as predictors for mental health using the Mann–Whitney U test. Again, the behaviors of smoking, marijuana use, and hard drug use showed statistically significant differences between the groups, meaning that there is likely a meaningful difference in the distributions of the groups compared. This suggests that mental health issues might play a significant role in substance-use behaviors.

|  |  | Estimate | SE | Z-Value | P-Value |
| :---- | :---- | :---- | :---- | :---- | :---- |
| **Smoking** | Intercept | 0.197739 | 0.067814 | 2.916 | 0.00355 |
|  | Mental Health | 0.019073 | 0.006886 | 2.770 | 0.00560 |
| **Marijuana** | Intercept | 1.157863 | 0.080046 | 14.465 | \< 2e-16 |
|  | Mental Health | 0.026320 | 0.009179 | 2.867 | 0.00414 |
| **Hard Drugs** | Intercept | \-0.686844 | 0.070919 | \-9.685 | \< 2e-16 |
|  | Mental Health | 0.019101 | 0.006646 | 2.874 | 0.00405 |

*Table 3: Mental Health as a predictor of Smoking, Marijuana and Hard Drugs: Logistic Regression Summary*

|  | Smoking | Marijuana | Hard Drugs |
| :---- | :---- | :---- | :---- |
| w | 200587 | 144641 | 190188 |
| P Value | 0.0007359 | 7.83e-05 | 0.0003961 |

*Table 4: Summary of Wilcoxon rank sum test*

**Statistical Significance between Recreational Drugs**  
Table 5 shows the relationships between various substance use behaviors. Logistic Regression and Mann-Whitney U tests were once again used to judge the relationship between alcohol and other drugs, while the Fisher-True test was used for the binary variables (Smoking, Marijuana and Hard Drugs). Alcohol shows a strong association with Marijuana and Hard Drugs, as indicated by highly significant p-values, and a moderate association with Smoking (p \= 0.0367). Marijuana is significantly associated with both Alcohol and Hard Drugs, highlighting a strong connection between these substances. However, Smoking does not exhibit significant relationships with any other variables, suggesting it may be influenced by different factors. Similarly, Hard Drugs are significantly linked to Alcohol and Marijuana but show no significant association with Smoking.

|  | Alcohol | Smoking | Marijuana | Hard Drugs |
| :---- | :---- | :---- | :---- | :---- |
| **Alcohol** | \- | Logistic Regression *p \= 0.0367 95% Confidence* | Logistic Regression *p \= 1.57e-05
99.9% Conf.* | Logistic Regression *p \= 0.000383
99.9% Conf.* |
| **Smoking** | Mann-Whitney
*p \= 0.1095
Not Significant*  | \- | Fisher True *p \= 0.4402
Not Significant* | Fisher True *p \= 0.1474
Not Significant* |
| **Marijuana** | Mann-Whitney
*p \= 8.966e-08
99.9% Conf.*  | Fisher True *p \= 0.4402
Not Significant* | \- | Fisher True *p \< 2.2e-16
99.9% Conf.* |
| **Hard Drugs** | Mann-Whitney
*p \= 0.002631
99% Conf.*  | Fisher True *p \= 0.1474
Not Significant* | Fisher True *p \< 2.2e-16
99.9% Conf.* | \- |

*Table 5: Statistical Significance between Drugs*

**2\. Correlations**

**Correlation between Mental Health and Drugs**  
The range of Alcohol use varies from 0 \~ 365, while Mental Health varies from 0 \~ 30\. The data of both Alcohol use and Mental Health are both not distributed normally. Therefore, the Spearman test is used to test the correlation between the two variables. Meanwhile, the Point-Biserial method was used to measure the correlation between Mental Health and Smoking, Marijuana and Hard Drugs. Both tests found little correlation between Mental Health and Recreational Drugs, which may indicate that although the two variables might have statistical significance, they have little practical significance by themselves. 

| S | p-value | rho |
| :---- | :---- | :---- |
| 304413443 | 0.706 | \-0.01081925 |

*Table 6: Spearman Rank Correlation between Mental Health and Alcohol Use*

|  | Smoking | Marijuana | Hard Drugs |
| :---- | :---- | :---- | :---- |
| Point-Biserial | 0.080 | 0.083 | 0.083 |

*Table 7: Correlation Coefficients for Mental Health and various Substances*

**Correlation between Drugs**  
Table 8 compares the relationships between the use of Alcohol, Smoking, Marijuana, and Hard Drugs using Point-Biserial correlation and Phi Coefficient. Alcohol seems to show a weak positive correlation with Marijuana (0.126), and a slightly weaker positive correlation with Hard Drugs (0.102). Smoking has practically no correlations with both Marijuana (0.02) and Hard Drugs (0.04), suggesting little to no correlation. Marijuana and Hard Drugs exhibited a stronger positive relationship (Phi Coefficient: 0.33), indicating a moderate association between the use of these substances. Overall, the data suggests that Alcohol use is weakly associated with other substances, Smoking is minimally related, and Marijuana and Hard Drugs have a notable connection.

|  | Alcohol | Smoking | Marijuana | Hard Drugs |
| :---- | :---- | :---- | :---- | :---- |
| **Alcohol** |  | Point-Biserial
\-0.06 | Point-Biserial
0.126 | Point-Biserial
0.102 |
| **Smoking** |   |  | Phi Coefficient 0.02 | Phi Coefficient 0.04 |
| **Marijuana** |   |  |  | Phi Coefficient 0.33 |
| **Hard Drugs** |  |  |  |   |

*Table 8: Correlations between Drugs*

**3\. Subgroup Analysis**

**Age**  
The influence of age was tested on the relationship between Mental health and Drugs. Linear regression was used to determine the statistical significance of age and mental health on alcohol use, while logistic regression was used for smoking, marijuana and hard drugs. 

|  | Alcohol *Linear Reg.* | Smoking
*Logistic Reg.* | Marijuana *Logistic Reg.* | Hard Drugs *Logistic Reg.* |
| :---- | :---- | :---- | :---- | :---- |
| **Mental Health
Coefficient** | \-0.07348 | 0.017834 | 0.024842 | 0.019672 |
| **Mental Health
P-Value** | 0.82980 | 0.0104 | 0.0066 | 0.00315 |
| **Age
Coefficient** | 0.81837 | \-0.033706 | \-0.027003 | 0.010555 |
| **Age
P-Value** | 0.00189 | 1.69e-10 | 1.80e-05 | 0.04597 |

*Table 9: Linear & Logistic Regression Coefficients*

For all 4 drugs, age was found to be a statistically significant variable. Alcohol shows a positive coefficient for age, while smoking, marijuana and hard drugs all show a negative coefficient, which could indicate that alcohol is a coping mechanism for mental health among older people, while smoking, marijuana and hard drugs are more used by younger people.

**Physical Health**

|  | Alcohol *Linear Reg.* | Smoking
*Logistic Reg.* | Marijuana *Logistic Reg.* | Hard Drugs *Logistic Reg.* |
| :---- | :---- | :---- | :---- | :---- |
| **Mental Health
Coefficient** | 0.1680 | 0.016479 | 0.028813 | 0.016526 |
| **Mental Health
P-Value** | 0.6363 | 0.0208 | 0.00254 | 0.0169 |
| **Physical Health
Coefficient** | \-1.1052 | 0.010379 | \-0.008994 | 0.010105 |
| **Physical Health
P-Value** | 0.0036 | 0.1704 | 0.30563 | 0.1714 |

*Table 10: Subgroup Analysis for Physical Health*

Table 10 shows the relationships between mental and physical health with substance use behaviors (Alcohol, Smoking, Marijuana, and Hard Drugs) using regression analyses. Physical health is seemingly not associated with other substances (p \> 0.05) with the exception of alcohol which shows a negative coefficient. 

**Future Improvements**  
Future studies can enhance the generalizability and robustness of findings by expanding the sample size and ensuring greater demographic diversity. A larger and more representative sample would allow researchers to better understand how substance use and mental health vary across different populations, including underserved and minority groups. Additionally, adopting a longitudinal study design would help establish causal relationships between mental health and substance use, moving beyond the limitations of cross-sectional data. This approach would provide insights into how changes in mental health status over time influence substance use behaviors and vice versa, offering a clearer picture of the dynamics at play.

**Conclusion**  
Through statistical analyses, the study found statistically significant associations between mental health and the use of marijuana and hard drugs but not alcohol or smoking. Logistic regression revealed that poor mental health is a strong predictor of marijuana, smoking, and hard drug use. Subgroup analyses highlighted age and physical health as factors influencing these relationships, with younger individuals more likely to use certain drugs and older individuals leaning toward alcohol. While correlations between mental health and drug use were weak, marijuana and hard drugs exhibited a notable interrelationship. Future studies recommend expanding demographic diversity and adopting longitudinal designs to better understand causal dynamics between mental health and substance use.

**References**  
*Mental Health | Chronic Disease Indicators. (2024, June 3). CDC. Retrieved December 13, 2024, from [https://www.cdc.gov/cdi/indicator-definitions/mental-health.html](https://www.cdc.gov/cdi/indicator-definitions/mental-health.html)*

