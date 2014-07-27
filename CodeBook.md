Coursera_Getting_and_Cleaning_Data
==================================

# Data source
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which wascollected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Data Description
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

The reasoning behind my selection of features is that the assignment explicitly states "Extracts only the measurements on the mean and standard deviation for each measurement." To be complete, I included all variables having to do with mean or standard deviation.

In short, for this derived dataset, these signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

# Variables
The set of variables that were estimated (and kept for this assignment) from these signals are:
mean(): Mean value
std(): Standard deviation

# Transformed script for cleaning up the data
*1.Merges the training and the test sets to create one data set.
The analysis addresses the training and test data separately, first combining the feature vector with outcome variables and subject identifiers (e.g. X_train.txt, Y_train.txt, subject_train.txt), and then merges the training and test data into a single, larger dataset.

*2.Extracts only the measurements on the mean and standard deviation for each measurement. 
The analysis then subsets the data so that only mean and standard devation measurements from the original data are included. This includes all measurements identified by -mean() or -std() labels.

*3.Uses descriptive activity names to name the activities in the data set
Merge data subset with the activityType table to cinlude the descriptive activity names

*4.Appropriately labels the data set with descriptive variable names. 
Replace the non-descriptive labels to clean up the data set

*5.Creates a second, independent tidy data set with the average of each variable for each activity and each subj
Merging the tidydt with activityLables again to get the activityType column and output the data set



