##############################################################################################
#    - Merge the training and the test sets to create one data set.
#    - Extract only the measurements on the mean and standard deviation for each measurement.
#    - Use descriptive activity names to name the activities in the data set
#    - Appropriately labels the data set with descriptive variable names.
#    - From the data set in step 4, create a second, independent tidy data set with 
#      the average of each variable for each activity and each subject.
##############################################################################################

#NOTE: This script must be in the same directory with all the data files
#The working directory will be set there
setwd(".")


###############################################
#Read in all the X_test and x_train data as space delimited columns into data frames
#Since we are only looking at the mean and STD, we only need the first 6 columns
x_test <- read.table("X_test.txt")[,1:6]
x_train <- read.table("X_train.txt")[,1:6]


###############################################
#Read in the subject test and trail data as a data frame
subject_test <- read.table("subject_test.txt")
subject_train <- read.table("subject_train.txt")

###############################################
#Since we only need the first 6 feature rows that are either the Mean or STD only, 
#read these space delimited records into a features data frame, get rid of the rest
features <- read.table("features.txt")[1:6,]

#For asthetics, remove the parenthesis and leading digit for these 6 names
#Should have been able to do this in one step but seems to take two
features[,2] <- gsub("[  +\\(\\)]", "",features[,2])
features[,2] <- gsub("^\\d+", "", features[,2])

#Read the activity labels data file into a data frame, the first col represents
#the activity indicator for that lable
activity_labels <- read.table("activity_labels.txt")


#Y_test and Y_Train data indicate the activity performed for the repective data held in
#the x_text and x_train tables the first columns are indicators of the activity. For that
#reason these tables deserver a special name such as y_activity_* test or train.
y_activity_test <- read.table("y_test.txt")
y_activity_train <- read.table("y_train.txt")
#While we're at it lets replace the activity indicators with their proper 
#activity label names
y_activity_test[,2] <- activity_labels[y_activity_test[,1],2]
y_activity_train[,2] <- activity_labels[y_activity_train[,1],2]


#Combine the subjectID, activity and test data into two new temporary DF's.
#These will be combined, used and properly labeled to be the final tidy DS 
#To write our into the tidy data file for submission
xtest_temp <- cbind(subject_test,y_activity_test[,2], x_test) 
xtrain_temp <- cbind(subject_train,y_activity_train[,2], x_train) 

#Before combining rows for test and train column headings must be the same
#The first 2 columns are set separetly since they are combined to the orional DF's
#Columns 3 - 8 can be set from the features DF. Do the same 
names(xtest_temp)[1] <- "SubjectID"
names(xtest_temp)[2] <- "Activity"
names(xtest_temp)[3:8] <- features[1:6,2]
#----------------------------------------
names(xtrain_temp)[1] <- "SubjectID"
names(xtrain_temp)[2] <- "Activity"
names(xtrain_temp)[3:8] <- features[1:6,2]

#Time to combine the test and train data
x_combined_temp <- rbind(xtest_temp, xtrain_temp)

#Finally write the tiday DF our to a CSV file
write.csv(x_combined_temp,file="week4_tidy_DS.csv")


