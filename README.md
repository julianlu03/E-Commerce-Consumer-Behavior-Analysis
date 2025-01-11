# Project Background and Overview
This project explores a comprehensive dataset detailing consumer behavior and shopping habits, focusing on key variables such as demographics, purchasing patterns, and customer lifetime value (CLTV). 
The project aims help businesses focus on traits that drive the highest customer value and refine approaches to customer retention and acquisition.

Kaggle dataset found [here](https://www.kaggle.com/datasets/zeesolver/consumer-behavior-and-shopping-habits-dataset) 

This project focuses on improving business strategies in the following areas:

- **CLTV drivers**
- **Customer Retention**
- **Optimized Marketing Campaigns**


# Data Structure

There are **3,900 instances** in the dataset

There is a focus on **CLTV (Customer Lifetime Value)** as the primary metric used to evaluate customer profitability and long-term engagement

The dataset consists of 20 features in the following categories:

**Demographic Information:** Age, gender, location, etc.

**Purchase Details:** purchase amount, shipping type, etc.

**Engagement Metrics:** CLTV, discount usage, subscription, etc.

# Executive Summary

### Overview of Findings:

**Age** proved to be the most important contributing factor to **CLTV**, with ages **51-60** having noticeably higher CLTV compared to those in the age range of 31-40 and 41-50. 

**Male** customers may benefit more from loyalty programs or subscriptions, whereas **females** may benefit more from discounts and sales.

**Discounts** seem to have no effect on engagement metrics, indicating a need for improvement in its implementation. 

**Review ratings** revealed that customer satisfaction is not a good indicator of measuring shopping habits

# Visualizations and Recommendations
### Age Groups and CLTV
<p align = "center">
  <img src="https://github.com/julianlu03/E-Commerce-Consumer-Behavior-Analysis/blob/8587c5e8bd181be8d8b0bf46980e36198f07e25f/images/age_cltv.png"/ width=900 height=600>

**Observation:** The highest average Customer Lifetime Value (CLTV) is observed among customers aged 51-60, followed by 18-30 and 61-70, while the lowest is in the 31-40 age bracket.

**Insight:** A noticeable drop in average CLTV occurs in the 31-40 age group, potentially due to peak financial responsibilities, followed by a gradual increase in older age groups as financial stability improves.

**Recommendation:** Optimize marketing strategies by targeting customers in early adulthood (18-30) and those over 50, as these groups yield the highest CLTV. Simultaneously, adopt broad-reaching campaigns to maintain engagement across all age ranges due to comparable average CLTVs.

### Season and Purchase Amounts
<p align = "center">
  <img src="https://github.com/julianlu03/E-Commerce-Consumer-Behavior-Analysis/blob/f311f5cbb8a5e56a90bd7597036b797f6a84e95d/images/season_purch.png"/ width=900 height=600>

**Observation:** Fall has the highest purchase amounts across its distribution, followed by Winter, Spring, and Summer, indicating a seasonal trend in consumer spending.

**Insight:** Higher purchase amounts in Fall and Winter align with the seasonal demand for more expensive items like coats and sweaters, compared to lighter clothing in Spring and Summer.

**Recommendation:** Focus on releasing higher-priced products during Fall and Winter, when customers are less price-sensitive. Pair these product launches with strategic marketing and advertising campaigns to maximize profits during these high-spending periods.

### Gender and Number of Previous Purchases
<p align = "center">
  <img src="https://github.com/julianlu03/E-Commerce-Consumer-Behavior-Analysis/blob/85e66291c95a1974d62d78ab18ecffd369873794/images/purch_gender.png"/ width=900 height=600>

**Observation:** Males tend to make more repeat purchases, with a higher concentration in the 20-50 purchase range, while females have more observations in the 0-19 purchase range.

**Insight:** Male shoppers demonstrate stronger brand loyalty, while female shoppers are more likely to explore new brands or stores.

**Recommendation:**

- **For Males:** Introduce loyalty programs or subscriptions tailored to encourage repeat purchases and enhance long-term engagement
- **For Females:** Focus on targeted discounts, sales, and promotions to incentivize retention and attract new customers who are less brand-attached

### Review Ratings and CLTV
<p align = "center">
  <img src="https://github.com/julianlu03/E-Commerce-Consumer-Behavior-Analysis/blob/8587c5e8bd181be8d8b0bf46980e36198f07e25f/images/rating_CLTV.png"/ width=900 height=600>

**Observation:** The number of previous purchases is positively correlated with CLTV, as expected, but review ratings show no significant correlation with either variable.

**Insight:** A correlation coefficient of ≈-0.0096 indicates an extremely weak relationship between review ratings and spending behavior, suggesting review ratings are not effective predictors of CLTV or repeat purchases.

**Recommendation:**

- Avoid over-reliance on review ratings as an indicator of customer profitability or purchasing frequency
- Instead, focus on variables such as purchasing trends and CLTV for better insights into maximizing profitability and customer value
  
### Discounts and CLTV
<p align = "center">
  <img src="https://github.com/julianlu03/E-Commerce-Consumer-Behavior-Analysis/blob/502f2b9a4d98a20e3d6ad02b40c06d58a578c6ef/images/CLTV_discount.png"/ width=900 height=600>

**Observation:** Discounts show an extremely weak positive correlation (≈0.00315) with CLTV, indicating minimal impact on customer value.

**Insight:** A 2:3 class imbalance exists between purchases with and without discounts, with both groups exhibiting similarly low CLTV values, suggesting discounts are ineffective for influencing purchases among low-value customers and redundant for high-value customers.

**Recommendation:**

- Revise discount strategies to target low CLTV customers, encouraging increased spending
- Avoid offering discounts to high CLTV customers, as their purchasing behavior is unaffected, reducing unnecessary revenue loss
- Explore other factors like discount depth and brand perception to optimize promotional effectiveness





