---
title: "CodeBook used for script run_analysis.R"
author: "Bill Woods"
date: "March 6, 2016"
output: html_document
---

The run_analysis.R script is all that is needed after downloading the **HAR Data.zip** file from the 
web site [url( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI HAR Dataset.zip)
and unzipping it into the same folder that you have run_analysis.R script.

After unzipping you will see a folder called **UCI HAR Dataset** .
Copy the files and the test and train folders to the folder containing the run_analysis.R script.

Finally copy the contents of the test and train folder to the same folder.

When completed you should have the following files in the same directory as the run_analysis.R script.

* activity_labels.txt
* features.txt
* features_info.txt
* README.txt
* run_analysis.R
* subject_test.txt
* subject_train.txt
* X_test.txt
* X_train.txt
* y_test.txt
* y_train.txt


An analysis of the data within the above referenced file are as follow.

features.txt contains 561 rows with each indicating a column/heading of that measurment,
such as row-1 tBodyAcc-mean()-X, row-2 tBodyAcc-mean()-Y .... This will be renamed to simpler names such as tBodyAcc-mean-X
Each measuerment or feature is represented in the X_test.txt and X_train.txt data. This means that each row will have
561 measurements. 


X_test.txt data file has 2,947 rows which containg the 561 columns of measurements described as features
in the features file. Each row represents. By the same observation the x_train.txt contain 7,352 rows 

The subject_test & subject_train file data indicate the subject number monitored
in the train and test trials respectiviely.
The Subject Test data has 24 subjects with 2,947 rows while
Subject Train data shows 30 different subects for a total of 7,352 rows
Most of these are the same subject ID's contained in the test data file.
The 2,947 subject test data are are assumed to represent the subjects who's
data apper in the records of the x_test data file, ie. subject ID #N appearing in
row N of the subject test data file corresponds to record N in the x_test data file. The same is
assumed for the subject train and x_train data. 




The activity_labels.txt in the first column contains an indicator number representing the activity performed shown in 
the second column. The indicator column along with their description are shown here,

* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING 

Activities for each test correspond to the values shown in the y_test and y_trial data files.
The values map to the indicators found int the activity_labels data file.
y_test has 2,947 rows and y_train contains 7,352. Thes correspond to the data rows found in the x_test and
x_train data file rows respective. Therefore row N of y_test containing row M will correspond to 
the data found in x_test row M which each match in number of rows to each companion 
Y filerespectively.

Y_test and Y_Train data indicate the activity performed for the repective data held in
the x_text and x_train tables the first columns are indicators of the activity. For that
reason these tables deserver a special name such as y_activity_* test or train.


The attempt to create a Tidy data table to express only the AVg and STD  vaules will result in
a long file since it will be by Activity, Subject, Avg ....STD values as columns which would be for
30 possible subjects and 6 different activities, being up to 180 rows and columns accross consistiing of
the below  6 feature columns including a subjectID column for a total of 8 columns

* 1 tBodyAcc-mean()-X
* 2 tBodyAcc-mean()-Y
* 3 tBodyAcc-mean()-Z
* 4 tBodyAcc-std()-X
* 5 tBodyAcc-std()-Y
* 6 tBodyAcc-std()-Z

For conveniance the final tidy dataset is a .CSV file
called 

* week4_tidy_DS.csv

