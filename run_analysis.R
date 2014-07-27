##########################################################################################################
# 1. Merge the training and the test sets to create one data set.
##########################################################################################################

#set working directory to the location where the UCI HAR Dataset was unzipped
setwd('/Users/timlin/Documents/UCI HAR Dataset/');

# Read in the data from files
features     = read.table('./features.txt',header=FALSE); #imports features.txt
activityLables = read.table('./activity_labels.txt',header=FALSE); #imports activity_labels.txt
subjectTrain = read.table('./train/subject_train.txt',header=FALSE); #imports subject_train.txt
xTrain       = read.table('./train/x_train.txt',header=FALSE); #imports x_train.txt
yTrain       = read.table('./train/y_train.txt',header=FALSE); #imports y_train.txt
subjectTest = read.table('./test/subject_test.txt',header=FALSE); #imports subject_test.txt
xTest       = read.table('./test/x_test.txt',header=FALSE); #imports x_test.txt
yTest       = read.table('./test/y_test.txt',header=FALSE); #imports y_test.txt

# Assigin column names
colnames(activityLables)  = c('activityId','activityType');
colnames(subjectTrain)  = "subjectId";
colnames(xTrain)        = features[,2]; 
colnames(yTrain)        = "activityId";
colnames(subjectTest)   = "subjectId";
colnames(xTest)         = features[,2]; 
colnames(yTest)         = "activityId";

# combime all data
dt = rbind(cbind(yTrain,subjectTrain,xTrain),cbind(yTest,subjectTest,xTest));

##########################################################################################################
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
##########################################################################################################

# Create a logicalVector that contains TRUE values for the ID, mean() & stddev() columns and FALSE for others
colNames  = colnames(dt); 
logicalVector = (grepl("activity..",colNames) | grepl("subject..",colNames) | grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | grepl("-std..",colNames) & !grepl("-std()..-",colNames));

# Subset dt table based on the logicalVector
dt = dt[logicalVector==TRUE];

##########################################################################################################
# 3. Use descriptive activity names to name the activities in the data set
##########################################################################################################

# Merge the dt set with the activityLables table to include descriptive activity names
# To gain the activityType new column
dt = merge(dt,activityLables,by='activityId',all.x=TRUE);

# Updating the colNames vector to include the new column names after merge
colNames  = colnames(dt); 

##########################################################################################################
# 4. Appropriately label the data set with descriptive activity names. 
##########################################################################################################

# Cleaning up the variable names
for (i in 1:length(colNames)) 
{
  colNames[i] = gsub("-std$","Std",colNames[i])
  colNames[i] = gsub("-mean","Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])
  colNames[i] = gsub("^(f)","freqency",colNames[i])
  colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
  colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
  colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
  colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
  colNames[i] = gsub("\\()","",colNames[i])
};

# Update the new descriptive column names
colnames(dt) = colNames;

##########################################################################################################
# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
##########################################################################################################

# Summarizing the dt2 table to include just the mean of each variable for each activity and each subject
tidydt = aggregate(dt[,names(dt) != c('activityId','subjectId','activityType')],by=list(activityId=dt$activityId, subjectId=dt$subjectId), mean);

# Merging the tidydt with activityLables again to get the activityType column
tidydt = merge(tidydt,activityLables,by='activityId',all.x=TRUE);
tidydt = tidydt[,c(1,2,ncol(tidydt),3:(ncol(tidydt)-1))]

##########################################################################################################
# Output the data set 
##########################################################################################################

# Export the tidydt set 
write.table(tidydt, './tidyData.txt',row.names=TRUE,sep='\t');