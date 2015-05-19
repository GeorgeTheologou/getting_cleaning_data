library(plyr)

# Download and unzip the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="C:/Users/Desktop/Getting and Cleaning Data/rawdata/Dataset.zip")
unzip(zipfile="C:/Users/Desktop/Getting and Cleaning Data/rawdata/Dataset.zip", exdir="C:/Users/Desktop/Getting and Cleaning Data/rawdata")

# set working directory
setwd("C:/Users/Desktop/Getting and Cleaning Data")

# load training data
x_train <- read.table("rawdata/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("rawdata/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("rawdata/UCI HAR Dataset/train/subject_train.txt")

# load test data
x_test <- read.table("rawdata/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("rawdata/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("rawdata/UCI HAR Dataset/test/subject_test.txt")

# 1. Merge the training and test sets to create one data set

# create a single x data set
x_data <- rbind(x_train, x_test)

# create a single y data set
y_data <- rbind(y_train, y_test)

# create a single subject data set
subject_data <- rbind(subject_train, subject_test)

# load features data and add them as column names for x data set
names(x_data) <- read.table("rawdata/UCI HAR Dataset/features.txt")[, 2]

# create one data set
df_combined <- cbind(x_data, y_data, subject_data)

# 2.Extract only the measurements on the mean and standard deviation for each measurement

# filter for the columns that provide mean and std
x_data_filtered <- x_data[, grep("-(mean|std)\\(\\)",names(x_data))]

# 3: Use descriptive activity names to name the activities in the data set

# load activity labels
activities <- read.table("rawdata/UCI HAR Dataset/activity_labels.txt")

# join the data sets to introduce descriptive names
y_data_transformed <- merge(activities,y_data)

# rename column names
names(y_data_transformed)<-c("activityID", "activityname")

# 4:Appropriately label the data set with descriptive variable names

# rename column name for subject data
names(subject_data) <- "subjectID"

# create again a one data set but this time with the transformed columns
df_combined <- cbind(x_data_filtered, y_data_transformed, subject_data)

# 5:Create a second, independent tidy data set with the average of each variable for each activity and each subject

resultdf <- aggregate(df_combined[,1:66], by=list(df_combined$subjectID,df_combined$activityname), FUN=mean)

write.table(resultdf, "Meanbyactivityandsubject.txt", row.name=FALSE)