Getting and Cleaning Data (Coursera). Course Project Codebook
==============================================================

## Original Data

There original data comes from the smartphone accelerometer and gyroscope 3-axial raw signals, 
which have been processed using various signal processing techniques to measurement vector consisting
of 561 features. For detailed description of the original dataset, please see `features_info.txt` in
the zipped dataset file.

- [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


## Data sets

### Raw data set

The raw dataset was created using the following regular expression to filter out required
features, eg. the measurements on the mean and standard deviation for each measurement from the original feature vector set as well as the Activity column

"mean\\(|std\\(|Activity"

This regular expression selects 66 features from the original data set.
Combined with subject identifiers `subject` and activity labels `label`, this makes up the
68 variables of the processed raw data set.

The training and test subsets of the original dataset were combined to produce final raw dataset.

### Tidy data set

The tidy data set contains the average of all feature standard deviation and mean values of the raw dataset. 
Original variable names were modified in the follonwing way:

 1. Replaced "-mean" with "Mean"
 2. Replaced "-std" with "Std"
 3. Removed parenthesis "()"
 4. Replaced "-" with ""
 5. Replaced "t" with "Time"
 6. Replaced "f" with "Frequency"

#### Sample of renamed variables

TimeBodyAccMeanMean_X
TimeBodyAccMeanMean_Y
TimeBodyAccMeanMean_Z
TimeBodyAccStdMean_X
TimeBodyAccStdMean_Y
TimeBodyAccStdMean_Z
TimeGravityAccMeanMean_X
TimeGravityAccMeanMean_Y

