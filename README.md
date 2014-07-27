# ReadMe

## Overview
This repository includes a single script, run_analysis.R, that merges data from the Human Activity Recognition Using Smartphones Data Set project at the UCI Machine Learning Repository to produce averages values per user per activity for the dataset's mean and standard deviation features. 
Refer to the included codeBook.md for more information. 

## Make a tidy data set

The run_analysis.R code will clean the data set by executing the script as follows:
 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Usage
Change the working directory to the folder containing the activity recognition dataset by modifing setwd() code line in run_analysis.R.
Run the script run_analysis.R. The script produces a single output file, tidy-data.csv, that contains the merged and transformed data.