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

# Visualizations and Insights
<p align = "center">
  <img src="https://github.com/julianlu03/E-Commerce-Consumer-Behavior-Analysis/blob/8587c5e8bd181be8d8b0bf46980e36198f07e25f/images/age_cltv.png"/ width=900 height=600>
  
<p align = "center">
  <img src="https://github.com/julianlu03/E-Commerce-Consumer-Behavior-Analysis/blob/85e66291c95a1974d62d78ab18ecffd369873794/images/season_purch.png"/ width=900 height=600>

<p align = "center">
  <img src="https://github.com/julianlu03/E-Commerce-Consumer-Behavior-Analysis/blob/85e66291c95a1974d62d78ab18ecffd369873794/images/purch_gender.png"/ width=900 height=600>

<p align = "center">
  <img src="https://github.com/julianlu03/E-Commerce-Consumer-Behavior-Analysis/blob/8587c5e8bd181be8d8b0bf46980e36198f07e25f/images/rating_CLTV.png"/ width=900 height=600>

<p align = "center">
  <img src="https://github.com/julianlu03/E-Commerce-Consumer-Behavior-Analysis/blob/502f2b9a4d98a20e3d6ad02b40c06d58a578c6ef/images/CLTV_discount.png"/ width=900 height=600>

# Recommendations:

Based on the insights uncovered during analysis and the results of our model, the following recommendations have been provided:
- Work with the marketing team to tailor advertisements and lower rates towards potential customers with more driving experience and newer vehicles. This will increase customer rentention through lower rates and benefit the company with low risk policyholders
- Consider offering varied rates for driving safety (assessed via telematics) targetted at policyholders with lower driving experience
  - This does two things:
    - Rewards safer drivers with lower premiums, benefiting both the driver and the company by retaining low risk policyholders
    - Leverages overconfidence (cognitive bias) in less safe drivers, allowing the company to justify higher premiums for those with lower driving experience, ultimately reducing the risk of taking on these high-risk clients
- Work with underwriters to implement the model for the purposes of automating the screening process
  - Implementing this model can automatically screen out high-risk candidates before they reach an underwriter, which not only enhances productivity but also reduces labor costs for the company by streamlining the workflow
