This repo contains data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip based on the project described here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

# Columns

* subject - The id of the subject. 30 people participated in the study. Sourced from /data/test[train]/subject_test[train].txt.

* activity - The activity. Can be one of 6 values. Sourced from /data/test[train]/y_test[train].txt.

    * walking (1)
    * walking upstairs (2)
    * walking downstairs (3)
    * sitting (4)
    * standing (5)
    * laying (6)

* tBodyAcc.mean...X
* tBodyAcc.mean...Y 
* tBodyAcc.mean...Z 
* tBodyAcc.std...X 
* tBodyAcc.std...Y 
* tBodyAcc.std...Z 
* tGravityAcc.mean...X 
* tGravityAcc.mean...Y 
* tGravityAcc.mean...Z 
* tGravityAcc.std...X 
* tGravityAcc.std...Y 
* tGravityAcc.std...Z 
* tBodyAccJerk.mean...X 
* tBodyAccJerk.mean...Y 
* tBodyAccJerk.mean...Z 
* tBodyAccJerk.std...X 
* tBodyAccJerk.std...Y 
* tBodyAccJerk.std...Z
* tBodyGyro.mean...X 
* tBodyGyro.mean...Y 
* tBodyGyro.mean...Z 
* tBodyGyro.std...X 
* tBodyGyro.std...Y 
* tBodyGyro.std...Z 
* tBodyGyroJerk.mean...X 
* tBodyGyroJerk.mean...Y 
* tBodyGyroJerk.mean...Z 
* tBodyGyroJerk.std...X 
* tBodyGyroJerk.std...Y 
* tBodyGyroJerk.std...Z 
* tBodyAccMag.mean.. 
* tBodyAccMag.std.. 
* tGravityAccMag.mean.. 
* tGravityAccMag.std.. 
* tBodyAccJerkMag.mean.. 
* tBodyAccJerkMag.std.. 
* tBodyGyroMag.mean.. 
* tBodyGyroMag.std.. 
* tBodyGyroJerkMag.mean.. 
* tBodyGyroJerkMag.std.. 
* fBodyAcc.mean...X 
* fBodyAcc.mean...Y 
* fBodyAcc.mean...Z 
* fBodyAcc.std...X 
* fBodyAcc.std...Y 
* fBodyAcc.std...Z 
* fBodyAcc.meanFreq...X 
* fBodyAcc.meanFreq...Y 
* fBodyAcc.meanFreq...Z 
* fBodyAccJerk.mean...X 
* fBodyAccJerk.mean...Y 
* fBodyAccJerk.mean...Z 
* fBodyAccJerk.std...X 
* fBodyAccJerk.std...Y 
* fBodyAccJerk.std...Z 
* fBodyAccJerk.meanFreq...X 
* fBodyAccJerk.meanFreq...Y 
* fBodyAccJerk.meanFreq...Z 
* fBodyGyro.mean...X 
* fBodyGyro.mean...Y 
* fBodyGyro.mean...Z 
* fBodyGyro.std...X 
* fBodyGyro.std...Y 
* fBodyGyro.std...Z 
* fBodyGyro.meanFreq...X 
* fBodyGyro.meanFreq...Y 
* fBodyGyro.meanFreq...Z 
* fBodyAccMag.mean.. 
* fBodyAccMag.std.. 
* fBodyAccMag.meanFreq.. 
* fBodyBodyAccJerkMag.mean.. 
* fBodyBodyAccJerkMag.std.. 
* fBodyBodyAccJerkMag.meanFreq.. 
* fBodyBodyGyroMag.mean.. 
* fBodyBodyGyroMag.std.. 
* fBodyBodyGyroMag.meanFreq.. 
* fBodyBodyGyroJerkMag.mean.. 
* fBodyBodyGyroJerkMag.std.. 
* fBodyBodyGyroJerkMag.meanFreq..

Besides subject and activity, the rest of the columns are the mean and standard deviation of measurements.

# Steps

1. Packages and a script dependency are first loaded in the script.
2. Column names are retrieved from the file “features.txt”.
3. Column names are pivoted from a single column of multiple rows, to a single row with multiple columns.
4. The test data are read from /Data/test/X_test.txt.
5. The subjects are read from /Data/test/subject_test.txt.
6. The activities are read from /Data/test/y_test.txt.
7. The activities are transformed from a numeric value to a character label.
8. The subjects and activity are added to the data frame.
9. The same steps are repeated for the training data.
10. The test and training data are combined using bind_rows.
11. Only the columns that have the text “mean”, “std”, “activity”, or “subject” are retained.
12. The data is grouped by subject, then activity.
13. The data is summarized and output to output.txt

