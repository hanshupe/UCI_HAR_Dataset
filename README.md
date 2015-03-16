Getting and Cleaning Data: Course Project
=========================================

Introduction
------------
In this file the raw data of the Coursera project "Getting and Cleaning data" is described, as well as the the data transformation script "run_analysis.R" and the output of it.
The course "Getting and Cleaning data" is part of the Data Science specialization.

Raw data
------------------
Test and training datasets are available with the following properties:
The features (561 of them) are unlabeled and can be found in the x_test.txt. 
The activity labels are in the y_test.txt file.
The test subjects are in the subject_test.txt file.

R data transformation script and tidy dataset
-------------------------------------
The R script run_analysis.R  will merge the test and training sets together.
Prerequisites for this script:

1. the UCI HAR Dataset must be extracted
2. the R working directory must be set to "...\UCI HAR Dataset"

After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.

Furthermore, the script will create a tidy data set containing the means of all the columns per test subject and per activity.
This tidy dataset will be written to a tab-delimited file called "tidy_dataset_mean.txt", which can also be found in this repository.

About the Code Book
-------------------
The CodeBook.md file explains the transformations performed and the resulting data and variables.
