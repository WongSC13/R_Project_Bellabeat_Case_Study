# %% [code]
---
title: 'Bellabeat Case Study'
author: "Carol Wong"
date: "1/30/2022"
output:
  html_document:
    toc: true
    fig_width: 8
    fig_height: 5
    theme: cosmo
    highlight: tango
    code_folding: hide
---

## **Google Data Analytics Capstone Case Study Project:**
#### **Bellabeat - How Can a Wellness Technology Company Play It Smart?**

As part of the last course of the Google Data Analytics Certification course, we are given the opportunity to complete a capstone project to consolidate the skills that we have learned from the earlier course using real-life case study. To answer the key business questions, we will follow the steps of the data analysis process: **ask, prepare, process, analyze, share, and act**.

In this case study, I will be taking on the role of a junior data analyst working on the marketing analyst team at Bellabeat, a high-tech manufacturer of health-focused products for woman.

Urška Sršen and Sando Mur founded Bellabeat, a high-tech company that manufactures health-focused smart products. Collecting data on activity, sleep, stress, and reproductive health has allowed Bellabeat to empower women with knowledge about their own health and habits. Since it was founded in 2013, Bellabeat has grown rapidly and quickly positioned itself as a tech-driven wellness company for women.

By 2016, Bellabeat had opened offices around the world and launched multiple products. Bellabeat products became available through a growing number of online retailers in addition to their own e-commerce channel on their [website](https://bellabeat.com/). 

**Bellabeat’s main products:**

-	**Bellabeat app**: The Bellabeat app provides users with health data related to their activity, sleep, stress, menstrual cycle, and mindfulness habits. This data can help users better understand their current habits and make healthy decisions. The Bellabeat app connects to their line of smart wellness products.

-	**Leaf**: Bellabeat’s classic wellness tracker can be worn as a bracelet, necklace, or clip. The Leaf tracker connects to the Bellabeat app to track activity, sleep, and stress.

-	**Time**: This wellness watch combines the timeless look of a classic timepiece with smart technology to track user activity, sleep, and stress. The Time watch connects to the Bellabeat app to provide you with insights into your daily wellness.

-	**Spring**: This is a water bottle that tracks daily water intake using smart technology to ensure that you are appropriately hydrated throughout the day. The Spring bottle connects to the Bellabeat app to track your hydration levels.

-	**Bellabeat membership**: Bellabeat also offers a subscription-based membership program for users. Membership gives users 24/7 access to fully personalized guidance on nutrition, activity, sleep, health and beauty, and mindfulness based on their lifestyle and goals.

Sršen knows that an analysis of Bellabeat’s available consumer data would reveal more growth opportunities. Sršen is asking me, the junior data analyst, to analyze smart device usage data to gain insight into how consumers use non-Bellabeat smart devices to identify opportunities for Bellabeat and to guide future marketing strategies for Bellabeat’s products. 

#### <span style="text-decoration:underline">**Ask:**</span>
##### **Business Tasks:**

To gain insight into trends on how consumers are using non-Bellabeat smart devices to reveal more opportunity of growth and to help guide marketing strategy for Bellabeat’s products.  

Questions asked for the analysis:

1.	What are some trends in smart device usage?

2.	How could these trends apply to Bellabeat customers?

3.	How could these trends help inﬂuence Bellabeat marketing strategy?

**Who are the Key Stakeholders?**

-	**Urška Sršen**: Bellabeat’s cofounder and Chief Creative Oﬃcer
-	**Sando Mur**: Mathematician and Bellabeat’s cofounder; key member of the Bellabeat executive team
-	**Bellabeat marketing analytics team**: A team of data analysts responsible for collecting, analyzing, and reporting data that helps guide Bellabeat’s marketing strategy

#### <span style="text-decoration:underline">**Prepare**:</span>
We will be using the competitor’s Fitbit dataset which is a public data set dataset made available through [Mobius](https://www.kaggle.com/arashnic) on [Kaggle](https://www.kaggle.com/arashnic/fitbit)  to explore smart device users’ daily habits. This Kaggle data set is made up of 18 files containing personal ﬁtness tracker from thirty Fitbit users. Thirty eligible Fitbit users consented to the submission of personal tracker data, including minute-level output for physical activity, heart rate, and sleep monitoring. It includes information about daily activity, steps, and heart rate that can be used to explore users’ habits. The data is for the period of 1 months from 12th April to 12th May 2016. Dataset is downloaded and stored in local drive for further analysis.

Although the data description stated that the data comes from 30 eligible fitbit users, but there are actually 33 unique ID in the data set. The limitation of the dataset is the sample size is only 33 users and may not be an accurate representation of the Fitbit device users. The dataset is from 2016, as so many years has passed, the consumer habits may have changed since then. The data also lacks the demographic information such as the gender, age, and location of the users which can provide further insights into the data.

#### Exploring dataset:

The following tables will be used for the analysis:

-	Daily Activity
-	Daily Calories
-	Daily Intensities
-	Daily Steps
-	Daily Sleep
-	Weight Log

Before importing the data files into RStudio Cloud, the following packages were installed and loaded:

```{r 1, message=FALSE, warning=FALSE}
#install.packages ("tidyverse")
#install.packages('dplyr')
library ("tidyverse")
library ("ggplot2")
library ("tidyr")
library ("dplyr")
library ("lubridate")
```
The datasets were imported into RStudio Cloud and tables were named as follows:

```{r 2}
dailyactivity <- read.csv("../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv")
calories <- read.csv("../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailyCalories_merged.csv")
intensities <- read.csv("../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailyIntensities_merged.csv")
steps <- read.csv("../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailySteps_merged.csv")
sleep <- read.csv("../input/fitbit/Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv")
weight <- read.csv("../input/fitbit/Fitabase Data 4.12.16-5.12.16/weightLogInfo_merged.csv")
```

**Viewing the Data Frames:**

After importing the data, names () and glimpse() functions were ran to ensure that the data was imported correctly and to view the common column headers in the data frames:

<span style="text-decoration:underline">Daily Activity</span>: 

```{r 3}
names(dailyactivity)
glimpse(dailyactivity)
```
#### <span style="text-decoration:underline">Daily Calories</span>: 

```{r 4}
names(calories)
glimpse(calories)
```

#### <span style="text-decoration:underline">Daily Intensities</span>: 

```{r 5}
names(intensities)
glimpse(intensities)
```

#### <span style="text-decoration:underline">Daily Steps</span>: 

```{r 6}
names(steps)
glimpse(steps)
```

#### <span style="text-decoration:underline">Daily Sleep</span>: 

```{r 7}
names(sleep)
glimpse(sleep)
```
#### <span style="text-decoration:underline">Weight Log</span>: 

```{r 8}
names(weight)
glimpse(weight)
```
All the data frame contains the column “Id”, which will be able to connect the different tables if the need arises. 
A count was run to find out how many distinct "Id" is in each table.

```{r 9}
n_distinct(dailyactivity$Id)
n_distinct(calories$Id)
n_distinct(intensities$Id)
n_distinct(steps$Id)
n_distinct(sleep$Id)
n_distinct(weight$Id)
```

The counts show that there are 33 unique users who has submitted their data for this study. Only 24 unique users have captured their sleep data as they probably did not wear their Fitbit device when sleeping, and 8 users has entered their weight into the log, so this would not be a good representation of the overall users’ weight.

After comparing the column header in the different data frames, most of the information are summarized into the table “Daily Activity”, so I will be focusing on this table, and the “Sleep” table to analyse to see if there is any correlation between Active Minutes and the sleep.

#### <span style="text-decoration:underline">**Process**:</span>
##### <span style="text-decoration:underline">Checking the data</span>:

##### Convert data type of date column from Char to Date format:

```{r 10}
dailyactivity <- dailyactivity %>% 
  mutate(ActivityDate = mdy(ActivityDate))
```

```{r 11}
glimpse(dailyactivity)
```

```{r reimport_sleep}
daily_sleep <- read.csv("../input/fitbit/Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv", stringsAsFactors = FALSE)
glimpse(daily_sleep)
```

```{r 12}
daily_sleep <- daily_sleep %>% 
  rename(ActivityDate = SleepDay ) %>% 
  mutate(ActivityDate = mdy_hms(ActivityDate))
```

```{r 13}
glimpse(daily_sleep)
```
##### Check for number of rows in each data frame:

```{r 14}
nrow(dailyactivity)
nrow(daily_sleep)
```
##### Check for missing values:
```{r 15}
sum(is.na(dailyactivity))
sum(is.na(daily_sleep))
```
##### Check for duplicate entries:
```{r 16}
sum(duplicated(dailyactivity))
sum(duplicated(daily_sleep))
```
This shows that there are 3 duplicated entries in the “daily_sleep” dataframe. 

##### To remove the duplicate:
```{r 17}
daily_sleep <- daily_sleep %>% 
  distinct() %>% 
  drop_na()
```
##### To check if duplicate records are removed:
```{r 18}
sum(duplicated(daily_sleep))
nrow(daily_sleep)
```
There are now 410 records instead of 413 records after the duplicated entries has been removed.

#### <span style="text-decoration:underline">**Analyze**:</span>
<span style="text-decoration:underline">**Summary statistics of the data frame**:</span>

##### Daily Activity:
```{r 19}
dailyactivity %>%  
  select(TotalSteps,
         TotalDistance,
         SedentaryMinutes) %>%
  summary()
```
##### Daily Active Minutes:
```{r 20}
dailyactivity %>%  
  select(SedentaryMinutes,
         LightlyActiveMinutes,
         FairlyActiveMinutes,
         VeryActiveMinutes) %>%
  summary()
```

The statistics shows that the average daily steps taken by the participants are 7,638 steps, this is below the CDC daily recommended steps of 10,000. The recommended number of steps may increase or decrease, depending on the age group, current fitness level and health goals. However, this information is not available in the datasets.  

The data frame does not specify if the Total distance captured is in kilometre or miles, however, according to the report, 10,000 steps is equivalent to 8 kilometres for most people, so the average 7,638 steps should come up to 6.1 kilometres, and this is quite close to the average distance covered by the participant at 5.49 kilometres. This distance covered fall short of the 8 kilometres per day as recommended by CDC.

The average sedentary minute clocked at 991.2 minutes or 16.52 hrs. This means that after deducting the 7 hours of sleep recommended by CDC, the average person is spending another 9.52 hrs per day being sedentary. Based on Mayo Clinic report, it is recommended that a person should aim for at least 30 mins of moderate physical activity every day. The summary shows that the average person gets 13.56 mins/day of fairly active minutes and 21.16 mins/day of very active minutes, so this is within the range of the recommended range. However, if the goal of the person is to lose weight or meet specific fitness goals, more exercise is needed to achieve these targets.

#### <span style="text-decoration:underline">**Share:**</span>
#Using ggplot2 to create visualization to show the relationship and patterns of data and trends in the data frames. 

#### <span style="text-decoration:underline">**Plotting a few explorations:**</span>

```{r totalstepsVsSedentaryMinutes, echo=FALSE}
ggplot(data=dailyactivity, aes(x=TotalSteps, y=SedentaryMinutes)) + geom_point() + geom_smooth(formula = y ~ x,method='lm',se = FALSE) + labs(title = "Relationship between Total Steps and Sedentary Minutes")+
  theme(plot.title = element_text(size = 10))
```

There is a negative relationship between total steps taken and sedentary minutes.
The more steps taken, the lesser the sedentary minutes.

```{r totalstepsVsCalories, echo=FALSE }
ggplot(data=dailyactivity, aes(x=TotalSteps, y=Calories)) + geom_point() + geom_smooth(formula = y ~ x, method='lm', se = FALSE)+ labs(title = "Relationship between Total Steps and Calories Burned")+
  theme(plot.title = element_text(size = 12))

```

The visualization shows a positive relationship between the total steps taken and the calories burned.

#### <span style="text-decoration:underline">**Relationship between Active Minutes vs Calories burned**</span>

```{r 21}
#install.packages("cowplot")
library("cowplot")
```

```{r ActiveMinutesVsCalories,echo=FALSE }

Sedentary <- ggplot(data=dailyactivity, aes(x=Calories, y=SedentaryMinutes)) + geom_point(color="mediumorchid") + geom_smooth(formula = y ~ x, method='lm',se = FALSE) + labs(title = "Relationship between Sedentary Minutes and Calories Burned")+
  theme(plot.title = element_text(size = 6))

Lightly <- ggplot(data=dailyactivity, aes(x=Calories, y=LightlyActiveMinutes)) + geom_point(color="mediumorchid") + geom_smooth(formula = y ~ x, method='lm',se = FALSE) + labs(title = "Relationship between Lightly Active Minutes and Calories Burned")+
  theme(plot.title = element_text(size = 6))

Fairly <- ggplot(data=dailyactivity, aes(x=Calories, y=FairlyActiveMinutes)) + geom_point(color="mediumorchid") + geom_smooth(formula = y ~ x, method='lm',se = FALSE) + labs(title = "Relationship between Fairly Active Minutes, and Calories Burned")+
  theme(plot.title = element_text(size = 6))

Very <- ggplot(data=dailyactivity, aes(x=Calories, y=(VeryActiveMinutes))) + geom_point(color="mediumorchid") + geom_smooth(formula = y ~ x, method='lm',se = FALSE) + labs(title = "Relationship between Very Active Minutes and Calories Burned") +
  theme(plot.title = element_text(size = 6))

plot_grid(Sedentary, Lightly, Fairly, Very)

```

#### **Correlation Coefficient of Active Minutes against Calories burned**

```{r correlationActiveMinutes}
cor(dailyactivity$SedentaryMinutes, dailyactivity$Calories, use = "complete.obs")
cor(dailyactivity$LightlyActiveMinutes, dailyactivity$Calories, use = "complete.obs")
cor(dailyactivity$FairlyActiveMinutes, dailyactivity$Calories, use = "complete.obs")
cor(dailyactivity$VeryActiveMinutes, dailyactivity$Calories, use = "complete.obs")
```

Again, the plots and correlation coefficient shows that there is a positive relationship between the number of active minutes versus the number of calories burned. The more active minutes the participants are getting, the more calories burned.

#### Daily Sleep:

```{r 23}
daily_sleep %>%  
  select(TotalSleepRecords,
         TotalMinutesAsleep,
         TotalTimeInBed) %>%
  summary()
```

The average minutes asleep is 419.2 minutes or 7 hours, which is the amount of sleep recommended by CDC. It also shows that the participants take an average of 30 mins to fall asleep, this is longer than the recommended 10 to 20 mins to fall asleep. Taking longer to fall asleep may indicate that something is affecting your sleep, such as a underlying sleep disorder, a health issue or something that was consumed that affected falling asleep.

#### <span style="text-decoration:underline">**Relationship between Total Minutes Asleep vs Total Time In Bed**</span>

```{r 24}
ggplot(data=daily_sleep, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + geom_point(color="maroon4") + geom_smooth(formula = y ~ x, method='lm',se = FALSE) + labs(title = "Relationship between Total Minutes Asleep vs Total Time In Bed") +
  theme(plot.title = element_text(size = 15))
```

The plot shows a positive relationship between the total time in bed and the total minutes asleep. The longer time the participant spends in bed, the longer the participant is asleep. 

#### **Combine Daily Activities and Daily Sleep data frame as new data frame "combined data":**

```{r 25}
combined_data <- merge(dailyactivity, daily_sleep, by = c("Id", "ActivityDate"), all = TRUE)

glimpse(combined_data)
```

#### Create new column to calculate how much time participant require to fall asleep and remove NA rows

```{r 26}
combined_data <- combined_data %>% 
  mutate(TimeFallAsleep = TotalTimeInBed-TotalMinutesAsleep) %>% 
  drop_na()

glimpse(combined_data)
```

#### <span style="text-decoration:underline">**Relationship between Active Minutes and Time Needed to Fall Asleep**</span>

```{r ActiveMinutesVsTimeFallAsleep,echo=FALSE }

Sedentary1 <- ggplot(data=combined_data, aes(x=TimeFallAsleep, y=SedentaryMinutes)) + geom_point(color="steelblue4") + geom_smooth(formula = y ~ x, method='lm',se = FALSE) + labs(title = "Relationship between Sedentary Minutes vs Time Needed to Fall Asleep") +
  theme(plot.title = element_text(size = 8))

Lightly1 <- ggplot(data=combined_data, aes(x=TimeFallAsleep, y=LightlyActiveMinutes)) + geom_point(color="steelblue4") + geom_smooth(formula = y ~ x, method='lm',se = FALSE) + labs(title = "Relationship between Lightly Active Minutes vs Time Needed to Fall Asleep") +
  theme(plot.title = element_text(size = 8))


Fairly1 <- ggplot(data=combined_data, aes(x=TimeFallAsleep, y=FairlyActiveMinutes)) + geom_point(color="steelblue4") + geom_smooth(formula = y ~ x, method='lm',se = FALSE) + labs(title = "Relationship between Fairly Active Minutes vs Time Needed to Fall Asleep") +
  theme(plot.title = element_text(size = 8))


Very1 <- ggplot(data=combined_data, aes(x=TimeFallAsleep, y=VeryActiveMinutes)) + geom_point(color="steelblue4") + geom_smooth(formula = y ~ x, method='lm',se = FALSE) + labs(title = "Relationship between Very Active Minutes vs Time Needed to Fall Asleep") +
  theme(plot.title = element_text(size = 8))


plot_grid(Sedentary1, Lightly1, Fairly1, Very1)
```

```{r correlation_TimeFallAsleep}
cor(combined_data$TimeFallAsleep, combined_data$SedentaryMinutes, use = "complete.obs")
cor(combined_data$TimeFallAsleep, combined_data$LightlyActiveMinutes, use = "complete.obs")
cor(combined_data$TimeFallAsleep, combined_data$FairlyActiveMinutes, use = "complete.obs")
cor(combined_data$TimeFallAsleep, combined_data$VeryActiveMinutes, use = "complete.obs")
```

This show that there is no strong coefficient correlation to show that being more active will help the participants fall asleep faster.

#### <span style="text-decoration:underline">**Act:**</span>
##### <span style="text-decoration:underline">**Conclusion:**</span>

Based on the analysis, it shows that:
    
1)	The more active a person is, the more calories the person will burn.
2)	Not all participants are wearing their health device to bed to help track their sleep.
3)	50% of participants are getting the recommended number of hours of daily sleep, but this also shows that 50% are not getting enough sleep.
4)	Not many people are using the app to track their weight since there are only 8 participants capture their weight using the app.

##### <span style="text-decoration:underline">**Recommendations:**</span>

Bellabeat manufactures a wide range of health-focused products for women, including fitness trackers (Leaf and Time) and Spring water bottles that tracks the amount of water consumed each day. All these information can be tracked through Bellabeat app which also offers a subscription-based membership program for users to access to fully personalized guidance on nutrition, activity, sleep, health, beauty, and mindfulness based on their lifestyle and goals.

To capitalize on all the products available, I would recommend the following:

##### <span style="text-decoration:underline">**Improve the app:**</span>

1)	In the app, build in alerts function to remind the users to get active during certain period of the day as determine by the user when the app track that the user has been sedentary for too long a period. 
2)	Other alerts to encourage them to achieve 10,000 steps a day, and to try to achieve at least 7 hours a sleep per night can be included in the app.
3)	Beside capturing the number of sleep hours, captures the quality of sleep as well. This may be able to show how something the participants has done during the day, may have affected the quality of sleep for that night.
4)	A daily report can be captured to show how many steps they are taking, how much calories they have burned each day to motivate them to aim for a higher target the next day.
5)	Encourage users to track their weight and input target weight and recommend the numbers of steps users should achieve to burn the calories to achieve their target weight.

##### <span style="text-decoration:underline">**Marketing strategy:**</span>

6)	Create a social media page for users to share how they are using Bellabeat product and other tips to achieve a healthier lifestyle. 
7)	Enable user to add friends so that they can motivate each other to achieve higher goals through friendly competition.
8)	Since water intake is another important aspect of a healthy lifestyle, the marketing strategy can encourage customer to buy the tracker and the water bottle as a discounted bundle, or an existing user can purchase the water bottle at a discounted price. Alerts in the app to encourage user to drink more water when the app track that the user is not drinking enough water.
9)	Encourage users to wear the tracker to bed, so that the app can track and provide better sleep analysis for users for an all-rounded app to promote a healthier lifestyle.
10)	When a customer purchases a product, a free trial membership can be provided for a period of 1 month to let the user try out the app before deciding whether to continue with the paid membership. 
11)	Beside highlighting the functionality of the products in helping to achieve a healthier lifestyle, also showcase on the aesthetic and design of the products and using them as a fashion piece or accessories as well. 

Citation:

1.	https://www.medicalnewstoday.com/articles/how-many-steps-should-you-take-a-day

2.	https://www.cdc.gov/sleep/about_sleep/how_much_sleep.html

3.	https://www.sleep.org/sleep-questions/how-long-to-fall-asleep/

4.	https://www.mayoclinic.org/healthy-lifestyle/fitness/expert-answers/exercise/faq-20057916#

5.	https://www.healthline.com/nutrition/7-health-benefits-of-water

6.	https://www.cdc.gov/healthyweight/healthy_eating/water-and-healthier-drinks.html

