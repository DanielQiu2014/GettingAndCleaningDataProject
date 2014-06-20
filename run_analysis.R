
##############################################################
#        Getting and Cleaning Data Course Project            #
##############################################################

### 1. Obtain data set

## 1.1 set working directory

setwd("~/Desktop/Getting and Cleaning Data/project")
# getwd()
# dir()

## 1.2 dowload dataset

if(!file.exists("./getdata_projectfiles_UCI HAR Dataset")){dir.create("./getdata_projectfiles_UCI HAR Dataset")}
# Mac
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./getdata_projectfiles_UCI HAR Dataset/Dataset.zip")

# Windows
# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD"
# download.file(fileUrl,destfile="./getdata_projectfiles_UCI HAR Dataset/Dataset.zip")

## 1.3 go to unzip the data file

##############################################################

### 2. Read data into R

## 2.1 read in train data

# 2.1.1 read in train data
train_data_file <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt"
train_data <- read.table(train_data_file, sep = "", fill = TRUE, stringsAsFactors = FALSE)
# dim(train_data)
# names(train_data)

# 2.1.2 read in activity label for train data
activity_train_file <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt"
activity_train <- read.table(activity_train_file, sep = "")
# class(activity_train)
# dim(activity_train)
# names(activity_train)
# length(activity_train$V1)

# 2.1.3 add avtivity label as the first column to train dataset
train_data <- cbind(activity_train$V1, train_data, stringsAsFactors = FALSE)
# dim(train_data)
# names(train_data)[1]                   # "activity_train$V1"
names(train_data)[1] <- "activity"       # change the column name to activity
# names(train_data)[1]                   # "activity"

# 2.1.4 read in subjects for train data
subject_train_file <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt"
subject_train <- read.table(subject_train_file, sep = "", fill = TRUE, stringsAsFactors = FALSE)
# class(subject_train)
# dim(subject_train)
# names(subject_train)
# length(subject_train$V1)

# 2.1.5 add subjects as the first column to train dataset
train_data <- cbind(subject_train$V1, train_data, stringsAsFactors = FALSE)
# dim(train_data)
# names(train_data)[1:2]             # "subject_train$V1"  "activity"
names(train_data)[1] <- "subject"    # change the column name to "subject"
# names(train_data)[1:2]             # "subject"  "activity"


## 2.2 read in test data

# 2.2.1 read in test data
test_data_file <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt"
test_data <- read.table(test_data_file, sep = "", fill = TRUE, stringsAsFactors = FALSE)
# dim(test_data)
# names(test_data)

# 2.2.2 read in activity label for test data
activity_test_file <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt"
activity_test <- read.table(activity_test_file, sep = "")
# class(activity_test)
# dim(activity_test)
# names(activity_test)
# length(activity_test$V1)

# 2.2.3 add avtivity label as the first column to test dataset
test_data <- cbind(activity_test$V1, test_data, stringsAsFactors = FALSE)
# dim(test_data)
# names(test_data)[1]                   # "activity_test$V1"
names(test_data)[1] <- "activity"       # change the column name to "activity"
# names(test_data)[1]                   # "activity"

# 2.2.4 read in subjects for test data
subject_test_file <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt"
subject_test <- read.table(subject_test_file, sep = "")
# class(subject_test)
# dim(subject_test)
# names(subject_test)
# length(subject_test$V1)

# 2.2.5 add subjects as the first column to train dataset
test_data <- cbind(subject_test$V1, test_data, stringsAsFactors = FALSE)
# dim(test_data)
# names(test_data)[1:2]             # "subject_test$V1" "activity"    
names(test_data)[1] <- "subject"    # change the column name to "activity"
# names(test_data)[1:2]             # "subject"  "activity" 

##############################################################
### 3. Task 1: Merges the training and the test sets to create one data set.

## 3.1  check if train_data and test_data are compatible for merge
# sum(names(train_data) %in% names(test_data)) # should be 563

## 3.2 merge train_data and test_data together
mergedData = merge(train_data, test_data, all=TRUE)
# dim(train_data)
# dim(test_data)
# dim(mergedData)
# head(mergedData[, 1:3], n = 10)
# write.csv(mergedData, "mergedData.csv", row.names = FALSE, col.names = TRUE)

##############################################################

### 4. Task 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

## 4.1 get 561 features
features <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", sep = "", fill = TRUE, stringsAsFactors = FALSE)
# class(features)
# dim(features)
# head(features)
# names(features)

## 4.2  get column names that contain either "mean" or "std"

# 4.2.1  get column names that contain either "mean" or "std"
name <- grep("mean|std", features$V2, value = TRUE)
# class(name)
# length(name)
# name
# name2 <- name

# 4.2.2 Change column names to descriptive variable names (Task 4)

name <- gsub("-", "_", name) # change dash ("-") to underscore (_)
# sum(grepl("-", name)) # all removed ?
name <- gsub("\\(\\)", "", name) # remove ()
# sum(grepl("\\(|\\)", name)) # all removed ?
name <- gsub("^[t]", "Average_Time_", name) # change starting "t" to "Average_Time"
# sum(grepl("^[t]", name)) # all removed ?
name <- gsub("^[f]", "Average_Frequency_", name) # change starting "f" to "Frequency_"
# sum(grepl("^[f]", name)) # all removed ?
name <- gsub("BodyAcc|BodyBodyAcc", "Body_Acceleration", name) # change ""BodyAcc" or "BodyBodyAcc" to "Body_Acceleration"
# sum(grepl("BodyAcc|BodyBodyAcc", name)) # all removed ?
name <- gsub("GravityAcc", "Gravity_Acceleration", name) # change "GravityAcc" to "Gravity_Acceleration"
# sum(grepl("GravityAcc", name)) # all removed ?
name <- gsub("BodyGyro|BodyBodyGyro", "Body_Gyroscopic", name) # change "BodyGyro" or BodyBodyGyro to "Body_Gyroscopic"
# sum(grepl("BodyGyro|BodyBodyGyro", name)) # all removed ?
name <- gsub("Jerk", "_Jerk", name) # change "Jerk" to "_Jerk" 
# need to check by eye
name <- gsub("std", "StdDev", name) # change "std" to "StdDev"
# sum(grepl("std", name)) # all removed ?
name <- gsub("Mag", "_Magnitude", name) # change "Mag" to "_MedAbsDev"
# sum(grepl("Mag", name)) # all removed ?
name <- gsub("meanFreq", "meanFrequency", name) # change "meanFreq" to "meanFrequency"
# need to check by eye
name <- gsub("[X]$", "X_axis", name) # change ending "X" to "X_axis"
# need to check by eye
name <- gsub("[Y]$", "Y_axis", name) # change ending "Y" to "Y_axis"
# check by eye
name <- gsub("[Z]$", "Z_axis", name) # change ending "Z" to "Z_axis"
# need to check by eye

# name       # check by eye that everything OK

## 4.3 get index of the column names that contain either "mean" or "std"
idx <- grep("mean|std", features$V2)
idx <- paste0("V", idx)
# class(idx)
# length(idx)

## 4.4 construct a dataframe containing only the mean and standard deviation data

# 4.4.1 construct a dataframe, and add subjects and activity labels data
summary_data <- data.frame(subject = mergedData$subject, activity = mergedData$activity)

# 4.4 2 Extracts only the measurements on the mean and standard deviation for each measurement and add to the new dataframe
l <- length(idx)
for(i in 1:l) {
    summary_data[name[i]] <- mergedData[, idx[i]] 
}

# dim(summary_data)
# names(summary_data)

## 4.5 Task 3: Uses descriptive activity names to name the activities in the data set

# 4.5.1 read in activity_labels data
activity_labels_file <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt"
activity_labels <- read.table(activity_labels_file, sep = "")

# class(activity_labels)
# dim(activity_labels)
# names(activity_labels)
# head(activity_labels)

# 4.5.2  change to low cases 
activity_labels$V2 <- tolower(activity_labels$V2) 
# activity_labels$V2   # check everyting OK

# 4.5.3 change activity_labels in the data set to descriptive names 

# table(summary_data$activity) # activity_labels before change

l <- length(activity_labels$V2)
for(i in 1:l){
    summary_data$activity <- gsub(i, activity_labels$V2[i], summary_data$activity)
}

# activity_labels
# table(summary_data$activity)  # activity_labels after change
# head(summary_data$activity)
# write.csv(summary_data, "summary_data.csv", row.names = FALSE, col.names = TRUE)

##############################################################
### 5 Task 5:  Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Note that Task 4: Appropriately labels the data set with descriptive variable names was done in # 4.2.2 

## 5.1 Creates a tidy data set with the average of each variable for each activity and each subject. 

library(plyr)

tidy_data <- ddply(summary_data, .(subject, activity), numcolwise(mean))
# dim(tidy_data)
# names(tidy_data)
# head(tidy_data, n=3)
# tidy_data[, 1]
# tidy_data[, 2]
# tidy_data[1:3, 1:5]

## 5.2  write data as text file to local hard drive
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

## 5.3  read in the written data and compare with original data

# tidy_data2 <- read.table("tidy_data.txt", header = TRUE, fill = TRUE, stringsAsFactors = FALSE)
# all.equal(tidy_data2, tidy_data)
# class(tidy_data2)
# dim(tidy_data2)
# names(tidy_data2)
# head(tidy_data2, n=3)
# tidy_data2[, 1]
# tidy_data2[, 2]
# tidy_data2[1:3, 1:5]




