# Data and Transformations

All the required transformations are performed in the run_analysis.R file.

The script downloads and unzips data at C:\Users\XXXXX\Desktop\Getting and Cleaning Data\rawdata\UCI HAR Dataset file.
We then define the working directory and load the training data and the test data (3 files each; one x data set, one y data set and the subject data).

We then performed required transformation as defined by the exercise:

1. Merges the training and the test sets to create one data set.
At the first step we merged the x train and the x test using the rbind function.
The same was performed for the y data and the subject data.
We finally combined all the data to a single data set using the cbind function.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
At the second step we load the features data set and filter for only the column names that provide mean or standard deviation using the grep function.

3. Uses descriptive activity names to name the activities in the data set
At the third step we load the activity labels to provide mappings of activity names to the activity IDs at the y data set by joining the two data sets with the merge function.

4. Appropriately labels the data set with descriptive variable names. 
At the fourth step we add a column name for the subject data. We then combine all the data sets that we transformed in previous steps in a single data set using cbind.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Finally we perform the mean calculation at the transformed data set using the aggregate function.
The resulted data set is saved at C:\Users\XXXXX\Desktop\Getting and Cleaning Data\Meanbyactivityandsubject.csv.

# Variables

The data set provide 561 metrics.
These are min,max,mean and other calculations for the following metric names

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