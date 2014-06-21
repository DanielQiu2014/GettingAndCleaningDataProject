Project of Coursera course Getting and Cleaning Data 
=============================

File list
-----------------

README.md:         this file.

run_analysis.R:    R script used to process data and generate.

tidy_data.txt:     tidy dataset produced by the run_analysis.R.

CodeBook.md:       describe all variable names and their meaning.

To run run_analysis.R, put the script into your working directory containing the dataset at the subdirectory ("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/) and then run source("run_analysis.R"). You will get the tidy_data.txt file at the end.

Introduction
-----------------

The purpose of this project is to demonstrate an ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The original data set was downloaded from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Data are collected human movement measured by the accelerometers within the Samsung Galaxy S smartphone beared by the subjects. The procedure of data processing in the run_analysis.R can be divided into following 5 main parts

1. Obtain data set
2. Read data into R
3. Merges the training and the test sets to create one data set (requested Task 1).
4. Extracts only the measurements on the mean and standard deviation for each measurement (requested Task 2),  
   Appropriately labels the data set with descriptive variable names (requested Task 4). 
   Uses descriptive activity names to name the activities in the data set (requested Task 3)
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject (requested Task 5). Write this tidy data set into a text file for submitting for evaluation. 

Description
-----------------

Each parts are detailed below:

1  Obtain data set

the script first changes the current working directory to the project's directory, and download the the original data set from

	d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

using http protocol without specifying method = "curl" instead of https protocol with method = "curl" specified, the latter does not work on my Mac computer.

The dataset is then unzipped manually in the currect working directory into a directory called 
	getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/



2  Read data into R

The train data and text data are read into R separately using read.table() with fill = TRUE, stringsAsFactors = FALSE argument so as to prevent data corruption during the process. This procedure generates a dataframe with 7352 rows x 561 columns for train data, and a dataframe with 2947 rows x 561 columns for test data.

Next the activity labels for the train data and text data are read into R separately using the same method as above, and concate with train data and text data, respectively, as the first column in the combined dataframe.

The subjects data for the train data and text data are then read into R separately using the same method as above, and concate with combined dataframe for train data and text data, respectively, as the first column in the resulted dataframe (the activity labels now become the second columns)

The resulted dataframes have 7352 rows x 563 columns for train data, and 2947 rows x 563 columns for test data.


3  Merges the resulted training and the test sets from the Part 2 to create one data set (requested Task 1)

Resulted training and the test dataframes from the Part 2 are merged into one dataframe called mergedData, which has 10299 rows and 563 columns as expected.


4  Extracts only the measurements on the mean and standard deviation for each measurement (requested Task 2). In the same time, activity labels ( numbered 1 - 6) are replaced with descriptive names (requested Task 3), and column names are changed to more human-readable variable names (requested Task 4).

First, the column names (features) are read into R. The actual strings of those features that contain either "mean" or "std" are identified by grep() (79) and put into a name vectors. The columns names in the name vector are then modified to more human-readable forms by gsub(). Specifically, the following changes are made one by one:

Change dash ("-") to underscore (_)

Remove ()

Change starting "t" to "Average_Time"

Change starting "f" to "Average_Frequency_"

Change ""BodyAcc" or "BodyBodyAcc" to "Body_Acceleration"

Change "GravityAcc" to "Gravity_Acceleration"

Change "BodyGyro" or BodyBodyGyro to "Body_Gyroscopic"

Change "Jerk" to "_Jerk" 

Change "std" to "StdDev"

Change "Mag" to "_Magnitude"

Change "meanFreq" to "meanFrequency"

Change ending "X" to "X_axis"

Change ending "Y" to "Y_axis"

Change ending "Z" to "Z_axis"


The resulting column names are described in the CodeBook.md file. These names are long, and might not be very efficient for storage and processing, but more human readable as requested by the project specification.

The index of those features that contain either "mean" or "std" are also identified by grep() and put into a separated idx vectors.

Next the desired data are extracted and put into a new dataframe, first the subject and activity data, and then those data idetified above, with new, modified column names.

Finally, to replace the activity labels (numbered 1 - 6) with descriptive names (requested Task 3), the activity strings are read into R, changed to lower case, and used to replaces of old, numbered activity labels.

The final data frame has 10299 rows and 81 columns.

5  Creates a second, independent tidy data set with the average of each variable for each activity and each subject (requested Task 5). 

The average of each variable (there are 79) for each activity (walking, walking_upstairs, walking_downstairs, sitting, standing, laying) and each subject (numbered 1 - 30) are calculated using the data frame for Part 4 above and ddply() from plyr package. The resulted data frame have 180 rows (for 6 activities per subject x 30 subjects), and 81 columns. This data set is tidy because averages for each measurements are put in one column, each different observations are in the one row, and column names as well as subject and activity are clearly labelled in a human understandable manner.

Last, the tidy data set is written into a text file called "tidy_data.txt" for submitting for evaluation, with write.table(tidy_data, "tidy_data.txt", row.names = FALSE). The "tidy_data.txt" can be read into R with  

tidy_data <- read.table("tidy_data.txt", header = TRUE, fill = TRUE, stringsAsFactors = FALSE)
 
-----------------
End of file
