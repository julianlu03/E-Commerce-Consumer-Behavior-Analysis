## Final Project Script


#load necessary libraries
library(tidyverse)

##set your working directory to the location of your data file


##read in your data file (easiest to load if it is saved as a csv file)

sales <- readr::read_csv("C:\\Users\\julia\\OneDrive\\Documents\\Datasets\\shopping_behavior_updated.csv")
View(sales)

#tidy your data as needed (join, reshape, etc.)

# Rename the given column names in a better format
sales <- sales %>%
  rename(
    id = `Customer ID`,
    age = Age,
    gender = Gender,
    item_purchased = `Item Purchased`,
    category = Category,
    purchase_amount = `Purchase Amount (USD)`,
    location = Location,
    size = Size,
    color = Color,
    season = Season,
    review_rating = `Review Rating`,
    subscription = `Subscription Status`,
    shipping_type = `Shipping Type`,
    discount = `Discount Applied`,
    promo_code = `Promo Code Used`,
    num_previous_purchases = `Previous Purchases`,
    payment_method = `Payment Method`,
    frequency_purchases = `Frequency of Purchases`
  )

# Creating a CLTV (Customer Lifetime Value) column
# CLTV = Purchase Amount * Previous Purchases * Frequency of Purchases (turned numerical)

# Since Frequency of Purchases is categorical (ie. Annually, Weekly, etc.), we must turn it numerical first to work in our CLTV equation
# Step 1: Map the categorical features to numerical features for Frequency of Purchases column 
frequency_mapping <- c(
  "Annually" = 1,
  "Fortnightly" = 26,
  "Bi-Weekly" = 104,
  "Every 3 Months" = 4,
  "Monthly" = 12,
  "Quarterly" = 3,
  "Weekly" = 52
)

# Apply mapping to new column called num_frequency_purchases
sales$num_frequency_purchases <- frequency_mapping[sales$frequency_purchases]

#Make CLTV column
sales <- sales %>%
  mutate(CLTV = purchase_amount * num_previous_purchases * num_frequency_purchases)



##Categorical Data Cleaning####

# Categorical variable 1: category

#convert to factor variable
sales <- sales %>%
  mutate(category = as.factor(category))

#report the current number of levels
category_levels <- sales %>%
  summarise(cat_levels = nlevels(category)) # 4 levels

#list the current levels 
sales %>%
  distinct(category) # Clothing, Footwear, Outerwear, Accessories

# no need to collapse levels and not ordinal

# Frequency table for category
count_category <- sales %>%
  count(category) %>%
  arrange(desc(n))

#create a bar plot (ordered by frequency if the categorical variable is not ordinal)
ggplot(data = count_category,
       mapping = aes(x=reorder(category, -n), y=n)) +
  geom_col(aes(fill = category))+
  labs(
    x= "Category",
    y="Frequency"
  )

# Categorical variable 2: size

#convert to factor variable
sales <- sales %>%
  mutate(size = as.factor(size))

#report the current number of levels
size_levels <- sales %>%
  summarise(sizing_levels = nlevels(size)) # 4 levels

#list the current levels 
sales %>%
  distinct(size) #S, M, L, XL

# No need to collapse levels
# Not ordinal

#create a frequency table (dyplr)
sales_count <- sales %>%
  count(size) %>%
  arrange(desc(n))

#create a bar plot (ordered by frequency if the categorical variable is not ordinal)
ggplot(data=sales_count,
       mapping = aes(x=reorder(size, -n), y=n)) +
  geom_col(aes(fill=size)) +
  labs(
    x="Size",
    y="Frequency"
  )

# Categorical variable 3: gender

#convert to factor variable
sales <- sales %>%
  mutate(gender = as.factor(gender))

#report the current number of levels
gender_levels <- sales %>%
  summarise(gender_levels = nlevels(gender)) # 2 levels

#list the current levels 
sales %>%
  distinct(gender) # Male, Female

# No need to collapse levels
# Not ordinal

#create a frequency table (dyplr)
gender_count <- sales %>%
  count(gender) %>%
  arrange(desc(n))

#create a bar plot (ordered by frequency if the categorical variable is not ordinal)
ggplot(data=gender_count,
       mapping = aes(x=reorder(gender, -n), y=n)) +
  geom_col(aes(fill=gender))+
  labs(
    x="Gender",
    y="Frequency"
  )

# Categorical variable 4 : season

#convert to factor variable
sales <- sales %>%
  mutate(season = as.factor(season))

#report the current number of levels
season_levels <- sales %>%
  summarise(seas_levels = nlevels(season)) # 4 levels

#list the current levels 
sales %>%
  distinct(season) # Winter, Spring, Summer, Fall

# No need to collapse levels
# Not ordinal

#create a frequency table (dyplr)
season_count <- sales %>%
  count(season) %>%
  arrange(desc(n))

#create a bar plot (ordered by frequency if the categorical variable is not ordinal)
ggplot(data=season_count,
       mapping = aes(x=reorder(season, -n), y=n)) +
  geom_col(aes(fill=season))+
  labs(
    x="Season",
    y="Frequency"
  )

# Categorical variable 5 : discount

#convert to factor variable
sales <- sales %>%
  mutate(discount = as.factor(discount))

#report the current number of levels
discount_levels <- sales %>%
  summarise(discount_levels = nlevels(discount)) # 2 levels

#list the current levels 
sales %>%
  distinct(discount) # Yes, No

# No need to collapse levels
# Not ordinal

#create a frequency table (dyplr)
discount_count <- sales %>%
  count(discount) %>%
  arrange(desc(n))

#create a bar plot (ordered by frequency if the categorical variable is not ordinal)
ggplot(data=discount_count,
       mapping = aes(x=reorder(discount, -n), y=n)) +
  geom_col(aes(fill=discount))+
  labs(
    x="discount",
    y="Frequency"
  )


##Quantitative Data Cleaning####

#quantitative variable 1: age

#check how it's stored (character, numeric, etc.) and convert as needed
class(sales$age) # Stored as numeric

#create a summary table with n, min, mean, median, and max (dplyr)
age_summary <- sales %>%
  summarise(
    n = n(),
    min = min(age, na.rm = TRUE),
    mean = mean(age, na.rm = TRUE),
    median = median(age, na.rm = TRUE),
    max = max(age, na.rm = TRUE)
  )

#create a density plot or histogram
ggplot(data = sales,
       mapping = aes(x=age)) +
  geom_density(adjust = 2)


#quantitative variable 2: purchase_amount

#check how it's stored (character, numeric, etc.) and convert as needed
class(sales$purchase_amount) # Stored as numeric

#create a summary table with n, min, mean, median, and max (dplyr)
purchase_amount_summary <- sales %>%
  summarise(
    n = n(),
    min = min(purchase_amount, na.rm = TRUE),
    mean = mean(purchase_amount, na.rm = TRUE),
    median = median(purchase_amount, na.rm = TRUE),
    max = max(purchase_amount, na.rm = TRUE)
  )

#create a density plot or histogram
ggplot(data = sales,
       mapping = aes(x=purchase_amount)) +
  geom_density(adjust = 2)


#quantitative variable 3: num_previous_purchases

#check how it's stored (character, numeric, etc.) and convert as needed
class(sales$num_previous_purchases) # Stored as numeric

#create a summary table with n, min, mean, median, and max (dplyr)
previous_purchases_summary <- sales %>%
  summarise(
    n = n(),
    min = min(num_previous_purchases, na.rm = TRUE),
    mean = mean(num_previous_purchases, na.rm = TRUE),
    median = median(num_previous_purchases, na.rm = TRUE),
    max = max(num_previous_purchases, na.rm = TRUE)
  )

#create a density plot or histogram
ggplot(data = sales,
       mapping = aes(x=num_previous_purchases)) +
  geom_density(adjust = 2)

#quantitative variable 4: CLTV (Customer Lifetime Value)

#check how it's stored (character, numeric, etc.) and convert as needed
class(sales$CLTV) # Stored as numeric

#create a summary table with n, min, mean, median, and max (dplyr)
CLTV_summary <- sales %>%
  summarise(
    n = n(),
    min = min(CLTV, na.rm = TRUE),
    mean = mean(CLTV, na.rm = TRUE),
    median = median(CLTV, na.rm = TRUE),
    max = max(CLTV, na.rm = TRUE)
  )

#create a density plot or histogram
ggplot(data = sales,
       mapping = aes(x=CLTV)) +
  geom_density(adjust = 4)

#quantitative variable 5: review_rating

#check how it's stored (character, numeric, etc.) and convert as needed
class(sales$review_rating) # Stored as numeric

#create a summary table with n, min, mean, median, and max (dplyr)
review_rating_summary <- sales %>%
  summarise(
    n = n(),
    min = min(review_rating, na.rm = TRUE),
    mean = mean(review_rating, na.rm = TRUE),
    median = median(review_rating, na.rm = TRUE),
    max = max(review_rating, na.rm = TRUE)
  )


#Five visualizations (includes the following elements)
#minimum of two variables per visualization
#must use at least 6 out of your 8 variables

# Bar plot 
#density plot or histogram
#scatter plot or line graph 
#box plot 
#faceting 
#color mapping 

# Visualization 1: Bar plot for CLTV and age

#Create age ranges 18-30, 31-40, 41-50, 51-60, 61-70 

sales <- sales %>%
  mutate(age_range = cut(
    age,
    breaks = c(17, 30, 40, 50, 60, 70),
    labels = c("18-30", "31-40", "41-50", "51-60", "61-70"),
    right = TRUE))

age_CLTV <- sales %>%
  group_by(age_range) %>%
  summarise(avg_CLTV = mean(CLTV, na.rm = TRUE))

ggplot(data=age_CLTV,
       mapping = aes(x=age_range, y=avg_CLTV)) +
  geom_col(aes(fill = age_range), color = "black")+
  labs(title = "CLTV Dips at 31-40 After High at 18-30, Steadily Rising with Age",
       x = "Age Brackets",
       y= "Average Customer Lifetime Value",
       fill = "Age Bracket")+
  scale_fill_brewer(palette= "Set3")+
  theme_bw()

# Visualization 2: Density Plot for previous_purchases and gender

ggplot(data = sales, aes(x = num_previous_purchases)) +
  geom_density(alpha = 0.4, aes(fill = gender)) +
  labs(
    title = "Males Shown Having More Habitual Shopping Habits as Compared to Females",
    x = "Number of Previous Purchases",
    y = "Density",
    fill = "Gender")+
  theme_minimal()

# Visualization 3: Histogram for discount and CLTV (add promo code?)

# Turn discount into factor variable
sales <- sales %>%
  mutate(discount = as.factor(discount))

#Check for imbalance (2:3 ratio between discount and no discount sales)
count_discount <- sales %>%
  count(discount) %>%
  arrange(desc(n))

# Remove outliers in CLTV
sales_no_outliers <- sales %>%
  filter(CLTV < 150000) %>%
  mutate(discount = factor(discount, levels = c("Yes", "No")))

ggplot(data=sales_no_outliers,
       mapping = aes(x=CLTV))+
  geom_histogram(binwidth = 1000, aes(fill=discount))+
  facet_wrap(~ discount)+
  labs(title = "No Correlation Between CLTV and Discount Usage",
       x = "Customer Lifetime Value",
       y= "Number of Observations",
       fill = "Discount Used")+
  scale_fill_manual(values = c("Yes" = "darkblue", "No" = "darkred"))+
  theme_bw()

# Code Yes/No values to 1's and 0's
discount_number <- sales %>%
  mutate(discount_numeric = ifelse(discount == "Yes", 1, 0))

# Correlation Calculation Between CLTV and Discount
cor(discount_number$discount_numeric, discount_number$CLTV, use = "complete.obs") # 0.00314 very weak correlation


# Visualization 4: Box plot for season and purchase_amount

# Reorder Seasons
sales <- sales %>%
  mutate(season = factor(season, levels = c("Fall", "Winter", "Spring", "Summer")))

ggplot(data=sales,
       mapping = aes(x=season, y=purchase_amount))+
  geom_boxplot(aes(fill=season))+
  scale_fill_manual(values = c("Fall" = "lightpink", "Winter" = "skyblue", "Spring" = "palegreen", "Summer" = "lightyellow"))+
  labs(title = "Purchase Amount Steadily Declines Across Fall to Summer Seasons",
       x = "Season",
       y = "Purchase Amount",
       fill = "Season")+
  theme_bw()  

# Visualization 5: Scatter plot for num_previous_purchases and CLTV (review_rating as color)

ggplot(data = sales,
       mapping = aes(x=num_previous_purchases, y=CLTV))+
  labs(title = "CLTV Increases with Purchases, but Review Ratings Show No Clear Correlation",
       x = "Number of Previous Purchases",
       y= "Customer Lifetime Value",
       color = "Review Rating")+
  geom_point(aes(color=review_rating), alpha = 1)+
  scale_color_gradient(low="red", high="green")+
  theme_bw()

# Quick correlation analysis to see that 
cor(sales$review_rating, sales$CLTV, use = "complete.obs") #-0.00096 Very weak correlation

