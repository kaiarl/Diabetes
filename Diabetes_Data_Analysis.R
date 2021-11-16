# STAT 6021: Project 2
# Topic: Diabetes
# Dataset Source: https://www.kaggle.com/kandij/diabetes-dataset?select=diabetes2.csv
# Group Number: 6
# Group Members: 
# - Uyen Nguyen (gmd8sq)
# - Kaia Lindberg (pkx2ec)
# - Lee Johnson (lj6gd)
# - Marin Lolic (ejz2sg)


# Import libraries
library(tidyverse)

# Load data
Data <- read.csv("diabetes2.csv", header=T)
print(head(Data))

# Check dimensions of data
print(dim(Data)) # 768 rows and 9 columns

# Display names of all columns
print(colnames(Data))

# Summary of columns
print(summary(Data))

# Check for missing values in each column
colSums(is.na(Data))

# Create diabetes factor column with labels from outcome column 
Data$Diabetes<-factor(Data$Outcome)
levels(Data$Diabetes) <- c("No", "Yes")

# Visualizations for project proposal
# For logistic regression
# Distribution of response variable
ggplot(Data, aes(x=Diabetes)) +
  geom_bar(fill="blue") +
  labs(x="Diabetes Outcome", y="Frequency", title="Distribution of Diabetes Outcome")

# Scatter plot of potential predictors (colored by response)
# bmi and blood pressure colored by diabetes
ggplot(Data, aes(x=BMI, y=BloodPressure, color=Diabetes)) +
  geom_point() + 
  labs(x="BMI", y="Blood Pressure", title="Scatterplot of BMI versus Blood Pressure by Diabetes")

# Side by side box plot for potential predictor by response
ggplot(Data, aes(x=Diabetes, y=Age))+
  geom_boxplot(color = "blue", outlier.color = "orange") +
  labs(title="Distribution of Age by Diabetes Outcome")

ggplot(Data, aes(x=Diabetes, y=Glucose))+
  geom_boxplot(color = "blue", outlier.color = "orange") +
  labs(title="Distribution of Glucose by Diabetes Outcome")


# For linear regression
# Scatter plot of potential regressor versus response (glucose)
# BMI
ggplot(Data, aes(x=BMI, y=Glucose)) +
  geom_point() + 
  geom_smooth(method="lm", se=F) +
  labs(x="BMI", y="Glucose", title="Scatterplot of BMI versus Glucose")

# Blood pressure
ggplot(Data, aes(x=BloodPressure, y=Glucose)) +
  geom_point() + 
  geom_smooth(method="lm", se=F) +
  labs(x="Blood Pressure", y="Glucose", title="Scatterplot of Blood Pressure versus Glucose")


# Insulin
ggplot(Data, aes(x=Insulin, y=Glucose)) +
  geom_point() + 
  geom_smooth(method="lm", se=F) +
  labs(x="Insulin", y="Glucose", title="Scatterplot of Insulin versus Glucose")

