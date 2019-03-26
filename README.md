# Getting-and-Cleaning-Data-Week4

This repo is created to complete the final peer-graded assignment for week 4 of Getting and Cleaning Data course on Coursera.

Steps to follow:
1. First, download and unzip the data file into your R working directory.
2. Second, download the R source code into your R working directory.
3. Finally, execute R source code to generate tidy data file. A sample of the tidy data set has been uploaded as well.

# Data description
The variables in the data X are sensor signals measured with waist-mounted smartphone by 30 individuals. The variable in the data Y indicates activity type the subjects performed during recording like walking, walking_upstairs, walking_downstairs,sitting, standing and laying.

# Explaination of the Code
The code merged training dataset and test dataset, and extracted partial variables from the same. Another dataset is created where mean of each extracted variable is calculated for each activity.

# New dataset
The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all individuals.

# The code was written based on the instruction of this assignment
Read training and test dataset into R environment. Read variable names into R envrionment. Read subject index into R environment.

Merges the training and the test sets to create one data set. Use command rbind to combine training and test set
Extracts only the measurements on the mean and standard deviation for each measurement. Use grep command to get column indexes for variable name contains "mean()" or "std()"
Uses descriptive activity names to name the activities in the data set Convert activity labels to characters and add a new column as factor
Appropriately labels the data set with descriptive variable names. Give the selected descriptive names to variable columns
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package
