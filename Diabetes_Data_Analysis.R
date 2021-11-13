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

